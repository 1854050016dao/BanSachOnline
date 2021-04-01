using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;
using System.Security;
using System.Data;
using System.Data.OleDb;
using System.Web.UI;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.Web.Security;
using System.ComponentModel;


/// <summary>
/// Summary description for SupportDB
/// </summary>
public class SupportDB
{
    public SupportDB()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static void ExecuteProcdure(string p_sproc, params object[] p_obj)
    {
        string connection = "Server=OS-20130227VYDJ;uid=sa;pwd=123;database=BanSachOnline";
        SqlConnection sqlConnection = new SqlConnection();
        SqlCommand sqlCommand = new SqlCommand();
        sqlCommand.CommandText = getSql(p_sproc, p_obj);
        sqlCommand.CommandType = CommandType.Text;
        sqlConnection.ConnectionString = connection;
        sqlCommand.Connection = sqlConnection;
        sqlConnection.Open();
        sqlCommand.ExecuteNonQuery();
        sqlConnection.Close();
    }
    //trả về DataSet
    public static DataSet ReturnDataSet(string sp_sql, params object[] ds_thamso)
    {
        string connection = "Server=OS-20130227VYDJ;uid=sa;pwd=123;database=BanSachOnline";
        SqlConnection sqlConnection = new SqlConnection();
        sqlConnection.ConnectionString = connection;
        sqlConnection.Open();
        SqlDataAdapter sqlDadap = new SqlDataAdapter(getSql(sp_sql, ds_thamso), sqlConnection);
        DataSet ds = new DataSet();
        sqlDadap.Fill(ds);
        sqlConnection.Close();
        return ds;
    }
    //Hiển thị số thự tự lên datagrid
    public static DataSet GetToSTT(DataSet ds, int bangthu)
    {
        int j;
        DataSet dset;
        dset = ds;
        for (j = 1; j <= dset.Tables[bangthu].Rows.Count; j++)
        {
            if (j < 10)
            {
                dset.Tables[bangthu].Rows[j - 1][0] = "0" + j.ToString();
            }
            else
            {
                dset.Tables[bangthu].Rows[j - 1][0] = j.ToString();
            }
        }
        return dset;
    }
    public static DataSet GetToSTT(DataSet ds, int bangthu, string tencot)
    {
        int j;
        DataSet dset;
        dset = ds;
        for (j = 1; j <= dset.Tables[bangthu].Rows.Count; j++)
        {
            if (j < 10)
            {
                dset.Tables[bangthu].Rows[j - 1][tencot] = "0" + j.ToString();
            }
            else
            {
                dset.Tables[bangthu].Rows[j - 1][tencot] = j.ToString();
            }
        }
        return dset;
    }
    public static string ReturnDate()
    {
        string strDate;
        object[] thu = new object[7];
        thu[0] = "Chủ nhật";
        thu[1] = "Thứ hai";
        thu[2] = "Thứ ba";
        thu[3] = "Thứ tư";
        thu[4] = "Thứ năm";
        thu[5] = "Thứ sáu";
        thu[6] = "Thứ bảy";
        strDate = thu[Convert.ToInt16(DateTime.Today.DayOfWeek)].ToString() + " - " +
            (DateTime.Now.Day < 10 ? "0" + Convert.ToString(DateTime.Now.Day) : Convert.ToString(DateTime.Now.Day)) + "/" +
            (DateTime.Now.Month < 10 ? "0" + Convert.ToString(DateTime.Now.Month) : Convert.ToString(DateTime.Now.Month)) +
            "/" + Convert.ToString(DateTime.Now.Year) + ", " + DateTime.Now.ToShortTimeString();
        return strDate;

    }
    public string DateUpdate(string ChuoiNgay)
    {
        DateTime date;
        try
        {
            date = Convert.ToDateTime(ChuoiNgay);
            string ngay, thang, nam;
            ngay = (date.Day < 10 ? "0" + date.Day.ToString() : date.Day.ToString());
            thang = (date.Month < 10 ? "0" + date.Month.ToString() : date.Month.ToString());
            nam = (date.Year < 1000 ? "0" + (date.Year + 1000).ToString() : date.Year.ToString());
            return ngay + "." + thang + "." + nam;
        }
        catch
        {
            return "";
        }
    }
    public static void PositionItems(DropDownList drp, string valueItem)
    {
        int i, vitri = 0;
        for (i = 0; i < drp.Items.Count; i++)
            if (drp.Items[i].Value.Trim() == valueItem.Trim())
            {
                vitri = i;
                i += drp.Items.Count;
            }
        drp.SelectedIndex = vitri;
    }
    public string LayThamSo(string Url, int Vitri)
    {
        string XuLyThamSo = Url;

        if (XuLyThamSo.StartsWith("/"))
            XuLyThamSo = XuLyThamSo.Remove(0, 1);
        if (XuLyThamSo.EndsWith("/"))
            XuLyThamSo = XuLyThamSo.Remove(XuLyThamSo.Length - 1, 1);

        string[] CatChuoi = XuLyThamSo.Split('/');
        if (CatChuoi.Length > Vitri)
            return CatChuoi[Vitri].ToString();
        else
            return null;
    }
    public string TenThamSo(string sp_sql, string chuoixuly, string tentruong)
    {

        object[] thamso = new object[1];
        thamso[0] = chuoixuly;
        DataSet dset = ReturnDataSet(sp_sql, thamso);
        if (dset.Tables[0].Rows.Count <= 0)
            return null;
        else
        {
            return dset.Tables[0].Rows[0][tentruong].ToString().Trim();
        }

    }
    public static DataSet ReturnDataSet(string sp_sql, int page, int pagesize, params object[] ds_thamso)
    {
        string connection = "Server=OS-20130227VYDJ;uid=sa;pwd=123;database=BanSachOnline";
        SqlConnection sqlConnection = new SqlConnection();
        sqlConnection.ConnectionString = connection;
        sqlConnection.Open();
        SqlDataAdapter sqlDadap = new SqlDataAdapter(getSql(sp_sql, ds_thamso), sqlConnection);
        DataSet ds = new DataSet();
        sqlDadap.Fill(ds, page, pagesize, "tblReturn");
        sqlConnection.Close();
        return ds;
    }
    public static SqlDataReader ExcuteProDataReader(string p_sproc, params object[] p_obj)
    {
        string connection = "Server=OS-20130227VYDJ;uid=sa;pwd=123;database=BanSachOnline";
        SqlConnection sqlConnection = new SqlConnection();
        sqlConnection.ConnectionString = connection;

        SqlCommand sqlCmd = new SqlCommand();
        sqlCmd.Connection = sqlConnection;
        sqlConnection.Open();
        sqlCmd.CommandText = getSql(p_sproc, p_obj);

        SqlDataReader sqldread;
        try
        {
            sqldread = sqlCmd.ExecuteReader();
        }
        catch
        {
            sqldread = null;
        }
        sqlConnection.Close();
        return sqldread;

    }
    public string ChuoiCanLay(string sql, object[] thamso, string tentruong)
    {
        DataSet dset = ReturnDataSet(sql, thamso);
        if (dset.Tables[0].Rows.Count > 0)
            return dset.Tables[0].Rows[0][tentruong].ToString().Trim();
        else
            return null;
    }
    public static void BindFromDataSetToCombo(DataSet ds, DropDownList _drl, string _value, string _text)
    {
        foreach (DataRow dr in ds.Tables[0].Rows)
        {

            _drl.Items.Add(new ListItem(dr[_text].ToString(), dr[_value].ToString()));
        }

    }
    public bool IsNumber(string st)
    {
        if (st.Equals("")) return false;
        for (int i = 0; i < st.Length; i++)
            if (!Char.IsNumber(st, i))
                return false;
        return true;
    }

    public string CatBoDuoiAspx(string ChuoiCanCat)
    {
        string ChuoiTam = null;
        ChuoiTam = ChuoiCanCat;
        if (ChuoiTam.EndsWith("/"))
            ChuoiTam = ChuoiTam.Substring(0, ChuoiTam.LastIndexOf('/'));
        if (ChuoiTam.EndsWith(".aspx"))
        {
            ChuoiTam = ChuoiTam.Substring(0, ChuoiTam.LastIndexOf('/') + 1);
        }
        return ChuoiTam;
    }
    public static void ExecuteProcdure2(string p_sproc, SqlParameter[] parms)
    {
        string connection = "Server=OS-20130227VYDJ;uid=sa;pwd=123;database=BanSachOnline";
        SqlConnection sqlConnection = new SqlConnection();

        SqlCommand sqlCommand = new SqlCommand();
        sqlCommand.CommandText = p_sproc;
        sqlCommand.CommandType = CommandType.StoredProcedure;
        sqlConnection.ConnectionString = connection;
        sqlCommand.Connection = sqlConnection;
        sqlCommand.Parameters.AddRange(parms);
        sqlConnection.Open();
        sqlCommand.ExecuteNonQuery();
        sqlConnection.Close();
    }
    public static string getSql(string p_sproc, params object[] p_obj)
    {
        string sSql = "";
        for (int i = 0; i < p_obj.Length; i++)
        {
            switch (p_obj[i].GetType().ToString())
            {
                case "System.String":
                    sSql = sSql + ",N'" + p_obj[i] + "'";
                    break;
                case "System.Int":
                    sSql = sSql + ",'" + p_obj[i] + "'";
                    break;
                case "System.DateTime":
                    sSql = sSql + ",'" + p_obj[i] + "'";
                    break;
                case "System.Boolean":
                    if ((bool)p_obj[i])
                        sSql = sSql + ",1";
                    else
                        sSql = sSql + ",0";
                    break;
                case "System.Int16":
                    sSql = sSql + "," + p_obj[i].ToString();
                    break;
                case "System.Int32":
                    sSql = sSql + "," + p_obj[i].ToString();
                    break;
                case "System.Int64":
                    sSql = sSql + "," + p_obj[i].ToString();
                    break;
                case "System.Double":
                    sSql = sSql + "," + p_obj[i].ToString();
                    break;
                case "System.Byte":
                    sSql = sSql + "," + p_obj[i].ToString();
                    break;
            }
        }

        if (sSql.Equals(""))
            sSql = p_sproc;
        else
            sSql = p_sproc + " " + sSql.Substring(1);
        return sSql;
    }
}