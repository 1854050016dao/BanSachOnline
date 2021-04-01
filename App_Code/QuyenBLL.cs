using System;
using System.Collections.Generic;
using System.Linq;
using DAL;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class QuyenBLL
{
    public static string STR_CONN = ConfigurationManager.ConnectionStrings["STRCONN"].ToString();
    SqlConnection objConn = new SqlConnection(STR_CONN);
    DataService DB = new DataService();
    
    
    public int layQuyenSD(string Username)
    {
        int quyen = 1;
        string sql_getquyen = "Select MaQuyen From TaiKhoan Where Username=@Username";
        SqlCommand objComm = new SqlCommand();
        objComm.CommandText = sql_getquyen;
        objComm.Connection = objConn;
        SqlParameter[] parms = new SqlParameter[]{
        new SqlParameter("@Username", SqlDbType.NVarChar)};
        parms[0].Value = Username;
        objComm.Parameters.AddRange(parms);
        objConn.Open();
        quyen = (int)objComm.ExecuteScalar();
        objConn.Close();



        return quyen;
    }
    public void MoKetNoi()
    {
        objConn = new SqlConnection(STR_CONN);
        objConn.Open();
    }
    public void DongKetNoi()
    {
        objConn.Close();
    }
}
