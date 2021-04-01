using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class TrangChu : System.Web.UI.Page
{
    string chuoiketnoi = ConfigurationManager.ConnectionStrings["STRCONN"].ConnectionString;
    SqlConnection ketnoi;
    DataTable dtable1;
    SqlDataAdapter da1;
    DataService DB = new DataService();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string STR_CONN = "Server=OS-20130227VYDJ;uid=sa;pwd=123;database=BanSachOnline";
        SqlConnection objCon = new SqlConnection(STR_CONN);
        objCon.Open();
        Session["sqlseach"] = "select * from Sach Where MaSach=3 and MaLoai=2";
        
    }
   
}