using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Theloai : System.Web.UI.Page
{
    string chuoiketnoi = ConfigurationManager.ConnectionStrings["STRCONN"].ConnectionString;
    SqlConnection connec;
    DataTable dtable1;
    SqlDataAdapter da1;
    DataService DB = new DataService();
    int menuitem;
    protected void Page_Load(object sender, EventArgs e)
    {
        //menuitem = int.Parse(Request.QueryString["MaLoai"]);
        OpenConnec();
        string sql = "select * from Sach Where MaLoai = '" + menuitem + "'";
        viewData(sql);
        CloseConnec();
    }
    void OpenConnec()
    {

        connec = new SqlConnection(chuoiketnoi);
        connec.Open();
    }
    void CloseConnec()
    {
        connec.Close();
    }
    public void viewData(string sql)
    {
        OpenConnec();
        dtable1 = new DataTable();
        da1 = new SqlDataAdapter(sql, connec);
        da1.Fill(dtable1);
        CollectionPager1.PageSize = 12;
        CollectionPager1.DataSource = dtable1.DefaultView;
        CollectionPager1.BindToControl = DataList1;
        DataList1.DataSource = CollectionPager1.DataSourcePaged;
        CloseConnec();
    }
  
}