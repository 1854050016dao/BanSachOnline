using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class cart : System.Web.UI.Page
{
    public int i = 0;
    DataTable myCart;

    protected void Page_Load(object sender, EventArgs e)
    {  
        if (!IsPostBack)
        {
            myCart = (DataTable)Session["Cart"];
            GridView1.DataSource = myCart;
            GridView1.DataBind();
            Label5.Text = "Tổng tiền: " + TongTien(myCart).ToString();
            DataTable dt = new DataTable();
            dt = (DataTable)Session["cart"];
            if (dt.Rows.Count == 0)
            {
                btnthanhtoan.Visible = false;
                lblthongbao.Text = "Bạn chưa chọn mua sản phẩm nào! Nhấn 'Mua Tiếp' để xem sản phẩm.";
            }
            else
            {

                GridView1.DataSource = dt;
                GridView1.DataBind();

            }
        }

    }
   
  Decimal TongTien(DataTable DT)
  {
      Decimal S = 0;
     foreach (DataRow DR in DT.Rows)
         S += Decimal.Parse(DR["Sum"].ToString());
      return S;
   }
    protected void btnmuatiep_Click(object sender, EventArgs e)
    {
        Response.Redirect("ListProduct.aspx");
    }
    protected void btnthanhtoan_Click(object sender, EventArgs e)
    {
        if (Session["Username"] == null)
        {
            Response.Redirect("DangNhap.aspx");
        }
        else
        {
            Response.Redirect("Thanhtoan.aspx");
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int chiso = int.Parse(e.CommandArgument.ToString());
            try
            {
                DataTable dt = (DataTable)Session["Cart"];
                dt.Rows.RemoveAt(chiso);
                Session["Cart"] = dt;
                string url = "Cart.aspx";
                Response.Redirect(url);
            }
            catch
            {
                string url = "Cart.aspx";
                Response.Redirect(url);
            }
        }
    }
  
}
