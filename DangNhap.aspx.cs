using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class DangNhap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label9.Text = "";
    }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string STR_CONN = "Server=DELL;database=SQL_BanSachOnline";
        SqlConnection objCon = new SqlConnection(STR_CONN);
        objCon.Open();
        string SQL_Login = "Select * from TaiKhoan where Username=@Username and Pass=@Pass";
        SqlCommand command = new SqlCommand();
        command.Connection = objCon;
        command.CommandText = SQL_Login;
        command.CommandType = CommandType.Text;
        SqlParameter[] parms = new SqlParameter[]{
            new SqlParameter("@Username",SqlDbType.NVarChar),
            new SqlParameter("@Pass",SqlDbType.NVarChar)
        };
        parms[0].Value = TextBox1.Text;
        parms[1].Value = TextBox2.Text;
        command.Parameters.AddRange(parms);
        SqlDataReader dr = command.ExecuteReader();
        if (dr.HasRows)
        {
            if (dr.Read())
            {
                int MaNSD;
                MaNSD = dr.GetInt32(0);
                Session["DaDangNhap"] = true;
                Session["Username"] = TextBox1.Text;
                Session["MaNSD"] = MaNSD;
                Response.Redirect("Cart.aspx");
                objCon.Close();
            }
        }
            else
            {
                Label9.Text ="Tên đăng nhập hoặc mật khẩu không đúng.xin đăng nhập lại";
               dr.Close();
               objCon.Close();
            }

    }

        protected void Button3_Click(object sender, EventArgs e)
    {
            Response.Redirect("Dangki.aspx");
    }



}