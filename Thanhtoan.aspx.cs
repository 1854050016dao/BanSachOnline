using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class Thanhtoan : System.Web.UI.Page
{
    public int i = 1;
    DataTable dt;
    System.IO.StreamReader sr1;
    System.IO.StreamWriter sw1;
    string s;
    //DataTable myCart;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        }
  
        dt = (DataTable)Session["Cart"];
        laythongtin();
        if (Session["Username"] == null)
        {
            Response.Redirect("ThongBaoThanhToan.aspx");
        }
        else
        {
            lblhoten.Text = Session["HoTen"].ToString();
            lbldiachi.Text = Session["DiaChi"].ToString();
            string ngay = System.DateTime.Now.ToString();
            ngay = ngay.Substring(0, ngay.IndexOf(" "));
            lblngaydathang.Text = ngay;
            lblsdt.Text = Session["Dienthoai"].ToString();
            lblemail.Text = Session["Email"].ToString();
            dt = (DataTable)Session["Cart"];
           GridView1.DataSource = dt;
           GridView1.DataBind();
           lbltongtien.Text ="Tổng tiền:" + TongTien().ToString();
        }
    }
    void laythongtin()
    {
            string STR_CNN = "Server=DESKTOP-2OTRN14\\SQLEXPRESS;uid=sa;pwd=111;database=BanSachOnline";
            SqlConnection objconn = new SqlConnection(STR_CNN);
            objconn.Open();
            string laythongtin = "";
            if (Session["Username"] != null)
                laythongtin = "select * from TaiKhoan,NguoiSuDung where TaiKhoan.MaNSD=NguoiSuDung.MaNSD and Username='" + Session["Username"].ToString() + "'";
            SqlCommand objcomm = new SqlCommand();
            objcomm.Connection = objconn;
            objcomm.CommandText = laythongtin;
            objcomm.CommandType = CommandType.Text;
            SqlDataReader dr = objcomm.ExecuteReader();
            while (dr.Read())
            {
                Session["MaNSD"] = dr["MaNSD"].ToString();
                Session["Dienthoai"] = dr["Dienthoai"].ToString();
                Session["HoTen"] = dr["HoTen"].ToString();
                Session["DiaChi"] = dr["DiaChi"].ToString();
                Session["Email"] = dr["Email"].ToString();
            }
            objconn.Close();
            dr.Close();
        }
    Decimal TongTien()
        {
            Decimal S = 0;
            foreach (DataRow dr in dt.Rows)
                S += Decimal.Parse(dr["Sum"].ToString());
            return S;
        }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        string connectionstring = ConfigurationManager.ConnectionStrings["STRCONN"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionstring);
        conn.Open();
            sr1 = new System.IO.StreamReader(Server.MapPath("App_Code/txtMaHD.txt"));
            s = sr1.ReadLine();
            int t = int.Parse(s.ToString()) + 1;
            sr1.Close();
            string ngay = System.DateTime.Now.ToString();
            ngay = ngay.Substring(0, ngay.IndexOf(" "));
        Hoadon hd = new Hoadon();
              foreach (DataRow r in dt.Rows)
            {
                SqlCommand cmd2 = new SqlCommand("update Sach set SoLuong=SoLuong-" + (int)r["Quantity"] + "where TenSach='" + (string)r["Product"] + "'", conn);
                cmd2.ExecuteNonQuery();
        hd.machitietHD = int.Parse(t.ToString());
        hd.mahoadondathang = int.Parse(t.ToString());
        hd.tensach = r["Product"].ToString();
        hd.thanhtien = Convert.ToInt32(TongTien().ToString());
        hd.diachi = lbldiachi.Text;
        hd.email = lblemail.Text;
        hd.ghichu = txtYeucau.Text;
        hd.soluong = int.Parse(r["Quantity"].ToString());
        hd.mansd = int.Parse(Session["MaNSD"].ToString());
        hd.ngaydathang = ngay;
        hd.ngaygiaohang = txtthoigianvanchuyen.Text;
        hd.mapttt = int.Parse(drl_hinhthuc.Text);
        hd.mavanchuyen = int.Parse(drl_vanchuyen.Text);
              }
        sw1 = new System.IO.StreamWriter(Server.MapPath("App_Code/txtMaHD.txt"));
        sw1.Write(t.ToString());
        sw1.Close();
       
        HoadonBLL objhd = new HoadonBLL();
        int i = objhd.ThanhToan(hd);
        if (i > 0)
        {
            Response.Redirect("Dathangthanhcong.aspx");
            
        }
        else
        {
            lblthongbaothanhcong.Text = "Đăng kí thất bại - xin hãy thử lại";
        }


        conn.Close();

                 }
      

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        ((DataTable)Session["Cart"]).Clear();
        lblthongbaothanhcong.Text = "Huy thanh cong!";
        Response.Redirect("ListProduct.aspx");
    }
}
    