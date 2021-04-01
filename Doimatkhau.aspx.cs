using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Doimatkhau : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("ListProduct.aspx");
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataService DB = new DataService();
       if (DB.Dangnhap(Session["Username"].ToString(), txtmkcu.Text))
        {
            //xu ly doi mat khau
            int quyen =DB.layQuyenSD(Session["Username"].ToString());
            int i = DB.updateTaiKhoan(int.Parse(Session["MaNSD"].ToString()) , Session["Username"].ToString(), txtmkmoi.Text,quyen,false);
            if(i>0) lblthongbao.Text="Mat khau da duoc thay doi";
            else lblthongbao.Text="Co loi khi thay doi mat khau";
   
       lblthongbao.Text = "Mật khẩu đã được thay đổi";
   } 
        else
   {
      lblthongbao.Text = "Mật khẩu cũ không hợp lệ!";
       lblthongbao.Text="Thay đổi mật khẩu không thành công!";
   }
    }
}