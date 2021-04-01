using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ADM_Quanlisach : System.Web.UI.Page
{

    Cart DB = new Cart();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (IsPostBack)
        {
            Capnhatluoi();
        }
    }
    private void Capnhatluoi()
    {
        
        GridView1.DataBind();
    }
    



    protected void btnthem_Click(object sender, EventArgs e)
    {
        SPinfor kq = new SPinfor();

        kq.maloai = int.Parse(DropDownList1.Text);
        kq.tensach = TextBox3.Text;
        kq.kichthuoc = TextBox4.Text;
        kq.tacgia = TextBox5.Text;
        kq.manhasanxuat = int.Parse(DropDownList2.Text);
        kq.sotrang = int.Parse(TextBox7.Text);
        kq.soluong = int.Parse(TextBox8.Text);
        kq.ngaynhap = DateTime.Parse(TextBox9.Text);
        kq.mota = TextBox10.Text;
        kq.giaban = int.Parse(TextBox11.Text);
        string sTenfile = "~/image_sach/";
        FileUpload1.SaveAs(Server.MapPath("../image_sach/") + FileUpload1.FileName);

        kq.hinhanh = sTenfile + FileUpload1.FileName;

        Cart objthemsach = new Cart();
        int i = objthemsach.ThemSach(kq);
        if (i > 0)
        {
            lblthongbao.Text = "Thêm thành công";
            Capnhatluoi();
           
        }
        else
        {
            lblthongbao.Text = "Thêm không thành công";
        }
    }
}