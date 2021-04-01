using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class ProductDetail : System.Web.UI.Page
{
    public DataTable x, myCart;
    public int i;
    ASP.global_asax m;
    protected void Page_Load(object sender, EventArgs e)
    {
        m = new ASP.global_asax();
        if (!IsPostBack)
        {
            i = int.Parse(Request.QueryString["So"]);
            x = (DataTable)Session["DT"];
            imgminhhoa.ImageUrl = (String)x.Rows[i]["Hinhanhminhhoa"];
            lbl1.Text = (String)x.Rows[i]["TenSach"];
            lbl2.Text = x.Rows[i]["GiaBan"].ToString();
            lbl3.Text = x.Rows[i]["MoTa"].ToString();
            lbl4.Text = x.Rows[i]["TacGia"].ToString();
            lbl5.Text = x.Rows[i]["TenNXB"].ToString();
        }
    }
    protected void btnthemvaogiohang_Click(object sender, EventArgs e)
    {
        i = int.Parse(Request.QueryString["So"]);
        //Button b = (Button)sender as Button;
        //int k = int.Parse(b.CommandArgument);
        x = (DataTable)Session["DT"];
        myCart = (DataTable)Session["Cart"];
        //bool rs = true;
        //foreach (DataRow DR in myCart.Rows)
        //{
        //    if ((String)myCart.Rows[i]["Product"] == (String)x.Rows[k]["TenSach"])
        //    {
        //        myCart.Rows[i]["Quantity"] = (Int32)myCart.Rows[i]["Quantity"] + 1;
        //        myCart.Rows[i]["Sum"] = (Int32)myCart.Rows[i]["Quantity"] * Double.Parse(myCart.Rows[i]["Cost"].ToString());
        //        rs = false;
        //    }
        //}
        //if (rs == true)
        m.AddToCart(ref myCart, x.Rows[i]["TenSach"].ToString(), (String)x.Rows[i]["Hinhanhminhhoa"], int.Parse(txtsoluong.Text), Decimal.Parse(x.Rows[i]["GiaBan"].ToString()));
        Session["Cart"] = myCart;
        string url = "Cart.aspx";
        Response.Redirect(url);

    }
    protected void btntrolai_Click(object sender, EventArgs e)
    {
        Response.Redirect("ListProduct.aspx");
    }
}