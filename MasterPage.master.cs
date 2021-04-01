using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class MasterPage : System.Web.UI.MasterPage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["DaDangNhap"] != null)
        {

            lblxinchao.Text = "Xin chào!" + Session["Username"].ToString();
            HyperLink3.Visible = false;
            HyperLink7.Visible = false;
            ImageButton1.Visible = true;
           
            Quanly1.Visible = true;
        }
        else
        {
            HyperLink3.Visible = true;
            HyperLink7.Visible = true;
            ImageButton1.Visible = false;
            Quanly1.Visible = false;
          
        }
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Session.Clear();
        lblxinchao.Visible = false;
        HyperLink3.Visible = true;
        HyperLink7.Visible = true;
        ImageButton1.Visible = false;
       
        Quanly1.Visible = false;
        Response.Redirect("ListProduct.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Session.Clear();
        lblxinchao.Visible = false;
        HyperLink3.Visible = true;
        HyperLink7.Visible = true;
        ImageButton1.Visible = false;
        
        Quanly1.Visible = false;
        Response.Redirect("Dangki.aspx");
    }
}
