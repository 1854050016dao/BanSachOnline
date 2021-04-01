<%@ Application Language="C#" %>
<%@ Import Namespace="System.Data"%>
<%@ Import Namespace="System.Data.SqlClient"%>

<script runat="server">
    SqlDataSource ds = new SqlDataSource();
    DataTable Cart;
    DataRow DR;


    public void Edit_DataList(DataList x, string s)
    {
        ds.ConnectionString = ConfigurationManager.AppSettings["constr"];
        ds.SelectCommand = s;
        x.DataSource = ds;
        x.DataBind();
    }
    public void ConvertToDataTable(string s, ref DataTable dt)
    {
        ds.ConnectionString = ConfigurationManager.AppSettings["constr"];
        ds.SelectCommand = s;
        DataSourceSelectArguments args = new DataSourceSelectArguments();
        DataView view = (DataView)ds.Select(args);
        dt = view.ToTable();
    }
    public DataTable MakeCart()
    {
        DataTable myCart = new DataTable();
     
        myCart.Columns.Add("Quantity", System.Type.GetType("System.Int32"));
        myCart.Columns.Add("Product", System.Type.GetType("System.String"));
        myCart.Columns.Add("Image", System.Type.GetType("System.String"));
        myCart.Columns.Add("Cost", System.Type.GetType("System.Decimal"));
        myCart.Columns.Add("Sum", System.Type.GetType("System.Decimal"));
        return myCart;
    }
    public void AddToCart(ref DataTable myCart, String Product, String Image, int Quantity, Decimal Cost)
    {
        bool blnMatch = false;
        foreach (DataRow DR in myCart.Rows)
            if (DR["Product"].ToString() == Product && !blnMatch)
            {
                int t = (int)DR["Quantity"] + Quantity;
                DR["Quantity"] = t.ToString();
                DR["Sum"] = Cost * t;
                blnMatch = true;
            }
        if (!blnMatch)
        {
            DR = myCart.NewRow();
            DR["Quantity"] = Quantity;
            DR["Product"] = Product;
            DR["Image"] = Image;
            DR["Cost"] = Cost;
            DR["Sum"] = Cost * Quantity;
            myCart.Rows.Add(DR);
        }

    }

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

        int count_visit = 0;
        //Kiểm tra file count_visit.txt nếu không tồn  tại thì
        if (System.IO.File.Exists(Server.MapPath("~/count_visit.txt")) == false)
        {
            count_visit = 1;
        }
        // Ngược lại thì
        else
        {
            // Đọc dử liều từ file count_visit.txt
            System.IO.StreamReader read = new System.IO.StreamReader(Server.MapPath("~/count_visit.txt"));
            count_visit = int.Parse(read.ReadLine());
            read.Close();
            // Tăng biến count_visit thêm 1
            count_visit++;
        }
        // khóa website
        Application.Lock();
        // gán biến Application count_visit
        Application["count_visit"] = count_visit;
        // Mở khóa website
        Application.UnLock();
        // Lưu dử liệu vào file  count_visit.txt
        System.IO.StreamWriter writer = new System.IO.StreamWriter(Server.MapPath("~/count_visit.txt"));
        writer.WriteLine(count_visit);
        writer.Close();
        if (Session["online"] == null)
        {
            Session["online"] = 1;
        }
        else
        {
            Session["online"] = int.Parse(Session["online"].ToString()) + 1;
        }
    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.
        
    }
       
</script>
