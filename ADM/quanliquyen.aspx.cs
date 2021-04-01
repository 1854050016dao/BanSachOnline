using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ADM_quanliquyen : System.Web.UI.Page
{
    DataService DB = new DataService();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
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
       bool kq= DB.ThemQuyen(int.Parse(TextBox1.Text), TextBox2.Text, TextBox3.Text);
       if (kq == true)
       {
           lblthongbao.Text = "Thêm thành công";
           Capnhatluoi();
       }
       else
           lblthongbao.Text = "Thêm không thành công";
    }

}