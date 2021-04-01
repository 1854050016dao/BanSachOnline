using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

/// <summary>
/// Summary description for Cart
/// </summary>
public class Cart
{
    public static string chuoiketnoi = ConfigurationManager.ConnectionStrings["STRCONN"].ConnectionString;
    SqlConnection ketnoi = new SqlConnection(chuoiketnoi);
    public Cart()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    SqlDataAdapter da;
    DataTable dt = new DataTable();
    string namesp = "";
    double giaban;
    public SqlConnection taoketnoi()
    {
        return new SqlConnection(ConfigurationManager.ConnectionStrings["STRCONN"].ConnectionString);
    }
    public double LayGiaSP(int MaSach)
    {
        da = new SqlDataAdapter("select * from Sach Where MaSach='" + MaSach + "'", taoketnoi());
        da.Fill(dt);
        giaban = (double)dt.Rows[0]["GiaBan"];
        return giaban;
    }
    public string laytensach(string MaSach)
    {
        da = new SqlDataAdapter("select * from Sach Where ID='" + MaSach + "'", taoketnoi());
        da.Fill(dt);
        namesp = dt.Rows[0]["TenSach"].ToString();
        return namesp;
    }
    public double LayGiaSach1(string MaSach)
    {
        da = new SqlDataAdapter("select * from Sach Where ID='" + MaSach + "'", taoketnoi());
        da.Fill(dt);
        giaban = (double)dt.Rows[0]["GiaBan"];
        return giaban;
    }

    public DataTable LayDSSach()
    {
        DataTable bangtrave = new DataTable();
        MoKetNoi();
        SqlCommand command = new SqlCommand("Select * from Sach", ketnoi);
        SqlDataReader reader = command.ExecuteReader();
        bangtrave.Load(reader);
        DongKetNoi();
        return bangtrave;
    }

    public int ThemSach(SPinfor them)
    {
        MoKetNoi();
        SqlCommand objComm = new SqlCommand();
        objComm.Connection = ketnoi;
        objComm.CommandText = "ThemSach";//ten thu tuc
        objComm.CommandType = CommandType.StoredProcedure;//loai command
        SqlParameter[] parms = new SqlParameter[]{
            new SqlParameter("@MaSach",SqlDbType.Int),
            new SqlParameter("@MaLoai",SqlDbType.Int),
            new SqlParameter("@TenSach",SqlDbType.NVarChar),
            new SqlParameter("@KichThuoc",SqlDbType.NVarChar),
            new SqlParameter("@TacGia",SqlDbType.NVarChar),
            new SqlParameter("@MaNXB",SqlDbType.Int),
            new SqlParameter("@SoTrang",SqlDbType.Int),
            new SqlParameter("@SoLuong",SqlDbType.Int),
            new SqlParameter("@NgayNhap",SqlDbType.DateTime),
            new SqlParameter("@MoTa",SqlDbType.NVarChar),
              new SqlParameter("@GiaBan",SqlDbType.Int),
            new SqlParameter("@Hinhanhminhhoa",SqlDbType.Char),
    };
        parms[0].Value = them.masach;
        parms[1].Value = them.maloai;
        parms[2].Value = them.tensach;
        parms[3].Value = them.kichthuoc;
        parms[4].Value = them.tacgia;
        parms[5].Value = them.manhasanxuat;
        parms[6].Value = them.sotrang;
        parms[7].Value = them.soluong;
        parms[8].Value = them.ngaynhap;
        parms[9].Value = them.mota;
        parms[10].Value = them.giaban;
        parms[11].Value = them.hinhanh;
        objComm.Parameters.AddRange(parms);

        //b3:thuc thi cau lenh
        int i = objComm.ExecuteNonQuery();
        //b4:dong ket noi
        DongKetNoi();
        return i;
    }
    public bool Xoasach(int masach)
    {
        bool ok;
        MoKetNoi();
        SqlCommand command = new SqlCommand("delete Sach where MaSach=" + masach, ketnoi);
        try
        {
            command.ExecuteNonQuery();
            ok = true;
        }
        catch
        {
            ok = false;
        }
        DongKetNoi();
        return ok;
    }

    //public int SuaSach(SPinfor sua)
    //{
    //    MoKetNoi();
    //    SqlCommand objComm = new SqlCommand();
    //    objComm.Connection = ketnoi;
    //    objComm.CommandText = "SuaSach1";//ten thu tuc
    //    objComm.CommandType = CommandType.StoredProcedure;//loai command
    //    SqlParameter[] parms = new SqlParameter[]{
    //        new SqlParameter("@MaSach",SqlDbType.Int),
    //        new SqlParameter("@MaLoai",SqlDbType.Int),
    //        new SqlParameter("@TenSach",SqlDbType.NVarChar),
    //        new SqlParameter("@KichThuoc",SqlDbType.NVarChar),
    //        new SqlParameter("@TacGia",SqlDbType.NVarChar),
    //        new SqlParameter("@MaNXB",SqlDbType.Int),
    //        new SqlParameter("@SoTrang",SqlDbType.Int),
    //        new SqlParameter("@SoLuong",SqlDbType.Int),
    //        new SqlParameter("@NgayNhap",SqlDbType.DateTime),
    //        new SqlParameter("@MoTa",SqlDbType.NVarChar),
    //          new SqlParameter("@GiaBan",SqlDbType.Int),
    //        new SqlParameter("@Hinhanhminhhoa",SqlDbType.Char),
    //};
    //    parms[0].Value = sua.masach;
    //    parms[1].Value = sua.maloai;
    //    parms[2].Value = sua.tensach;
    //    parms[3].Value = sua.kichthuoc;
    //    parms[4].Value = sua.tacgia;
    //    parms[5].Value = sua.manhasanxuat;
    //    parms[6].Value = sua.sotrang;
    //    parms[7].Value = sua.soluong;
    //    parms[8].Value = sua.ngaynhap;
    //    parms[9].Value = sua.mota;
    //    parms[10].Value = sua.giaban;
    //    parms[11].Value = sua.hinhanh;
    //    objComm.Parameters.AddRange(parms);

    //    //b3:thuc thi cau lenh
    //    int i = objComm.ExecuteNonQuery();
    //    //b4:dong ket noi
    //    DongKetNoi();
    //    return i;
    //}
    public void MoKetNoi()
    {
        ketnoi = new SqlConnection(chuoiketnoi);
        ketnoi.Open();
    }
    public void DongKetNoi()
    {
        ketnoi.Close();
    }

  
}