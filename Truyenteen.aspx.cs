using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Truyenteen : System.Web.UI.Page
{
    public DataTable x, myCart;
    DataRow DR;
    public int i = 0;
    ASP.global_asax m;
    protected void Page_Load(object sender, EventArgs e)
    {
        m = new ASP.global_asax();
        if (!IsPostBack)
        {
            m.ConvertToDataTable("Xemtruyenteen", ref x);
            DataList2.DataSource = x;
            DataList2.DataBind();
            Session["DT"] = x;
            myCart = (DataTable)Session["Cart"];
            if (myCart == null) Session["Cart"] = m.MakeCart();
        }
    }
    protected void btnChonmua_Click(object sender, EventArgs e)
    {
        Button b = (Button)sender as Button;
        int k = int.Parse(b.CommandArgument);
        x = (DataTable)Session["DT"];
        myCart = (DataTable)Session["Cart"];
        m.AddToCart(ref myCart, x.Rows[k]["Tensach"].ToString(), (String)x.Rows[k]["Hinhanhminhhoa"], 1, Decimal.Parse(x.Rows[k]["GiaBan"].ToString()));
        Session["Cart"] = myCart;
        string url = "Cart.aspx";
        Response.Redirect(url);
    }
    protected void btnChitiet_Click(object sender, EventArgs e)
    {
        Button b = (Button)sender as Button;
        String boundItemId = b.CommandArgument;
        string url = "ProductDetail.aspx?" + "So=" + boundItemId;
        Response.Redirect(url); 
    }
}