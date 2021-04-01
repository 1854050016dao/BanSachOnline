using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class usecontrol_Quanly : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Username"] != null)
        {

            int quyen = 1;
            QuyenBLL tk = new QuyenBLL();
            quyen = tk.layQuyenSD(Session["Username"].ToString());

            if (quyen == 1)
            {
                Pnlchung.Visible = true;
                pnlAdmin.Visible = true;

            }
            else if (quyen == 2)
            {
                Pnlchung.Visible = true;
                pnlAdmin.Visible = false;
            }
        }
    }
}