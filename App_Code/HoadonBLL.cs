using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for HoadonBLL
/// </summary>
public class HoadonBLL
{
    public static string STR_CONN = ConfigurationManager.ConnectionStrings["STRCONN"].ToString();
    SqlConnection objConn = new SqlConnection(STR_CONN);
    DataService DB = new DataService();
	public HoadonBLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public int ThanhToan(Hoadon dk)
    {  //b1:mo ket noi
        objConn.Open();
        //b2: tao doi tuong command
        SqlCommand objComm = new SqlCommand();
        objComm.Connection = objConn;
        objComm.CommandText = "Thanhtoan";//ten thu tuc
        objComm.CommandType = CommandType.StoredProcedure;//loai command

        SqlParameter[] parms = new SqlParameter[]{
            new SqlParameter("@MaChiTietHD",SqlDbType.Int),
            new SqlParameter("@MaDonDatHang",SqlDbType.Int),
            new SqlParameter("@TenSach",SqlDbType.NVarChar),
            new SqlParameter("@Thanhtien",SqlDbType.Int),
            new SqlParameter("@DiaChi",SqlDbType.NVarChar),
            new SqlParameter("@Email",SqlDbType.NVarChar),
            new SqlParameter("@Ghichu",SqlDbType.NVarChar),
            new SqlParameter("@SoLuong",SqlDbType.Int),
            new SqlParameter("@MaNSD",SqlDbType.Int),
            new SqlParameter("@NgayDatHang",SqlDbType.NVarChar),
            new SqlParameter("@NgayGiaoHang",SqlDbType.NVarChar),
            new SqlParameter("@MaPTTT",SqlDbType.Int),
            new SqlParameter("@MaVanChuyen",SqlDbType.Int),
            
    };
        parms[0].Value = dk.machitietHD;
        parms[1].Value = dk.mahoadondathang;
        parms[2].Value = dk.tensach;
        parms[3].Value = dk.thanhtien;
        parms[4].Value = dk.diachi;
        parms[5].Value = dk.email;
        parms[6].Value = dk.ghichu;
        parms[7].Value = dk.soluong;
        parms[8].Value = dk.mansd;
        parms[9].Value = dk.ngaydathang;
        parms[10].Value = dk.ngaygiaohang;
        parms[11].Value = dk.mapttt;
        parms[12].Value = dk.mavanchuyen;
        objComm.Parameters.AddRange(parms);

        //b3:thuc thi cau lenh
        int i = objComm.ExecuteNonQuery();
        //b4:dong ket noi
        objConn.Close();
        return i;
    }
}