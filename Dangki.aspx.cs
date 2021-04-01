using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class Dangki : System.Web.UI.Page
{
    DataService DB = new DataService();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblThongBao.Text = "";
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (DB.KtTonTai(txtTenDN.Text) == true)
        {
            lblThongBao.Text = "Tên đăng nhập này đã tồn tại!";
            return;
        }
        NguoiDungInfo nd = new NguoiDungInfo();
        nd.TaiKhoan = txtTenDN.Text;
                nd.MatKhau = txtMatKhau1.Text;
                nd.TenNguoiDung = txtHoTen.Text;
                nd.EMail = txtEmail.Text;
                nd.Diachi = txtdiachi.Text;
                nd.dienthoai = int.Parse(txtdienthoai.Text);
                DataService objDangKy = new DataService();
                int i = objDangKy.DangKi(nd);
     if (i > 0)
                {
            Response.Redirect("DangKiThanhCong.aspx");
        }
    else
        {
            lblThongBao.Text = "Đăng kí thất bại - xin hãy thử lại";
        }
    
    }
}