using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using DAL;

public class DataService
{


    public static string chuoiketnoi = ConfigurationManager.ConnectionStrings["STRCONN"].ConnectionString;
    SqlConnection ketnoi = new SqlConnection(chuoiketnoi);
    public DataService()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    
    public bool Dangnhap(string Username, string Password)
    {
        bool ketqua = false;
        ketnoi.Open();//mo ket noi
        string sqlDangNhap = "Select * from Taikhoan Where Username=@Username and Pass=@Pass";
        SqlCommand objComm = new SqlCommand();
        objComm.Connection = ketnoi;
        objComm.CommandText = sqlDangNhap;
        SqlParameter[] parms = new SqlParameter[]{
            new SqlParameter("@Username",SqlDbType.NVarChar),
            new SqlParameter("@Pass",SqlDbType.NVarChar)};
        parms[0].Value = Username;
        parms[1].Value = Password;
        objComm.Parameters.AddRange(parms);
        SqlDataReader dr = objComm.ExecuteReader();
        if (dr.HasRows) ketqua = true;
        else ketqua = false;
        dr.Close();
        ketnoi.Close();
        return ketqua;
    }
    public bool KTDangNhap(string username, string pass)
    {
        MoKetNoi();
        SqlCommand command = new SqlCommand("select * from TaiKhoan where Username=@Username and Pass=@Pass", ketnoi);
        command.Parameters.Add("Username", username);
        command.Parameters.Add("Pass", pass);
        SqlDataReader reader = command.ExecuteReader();
        bool ok = false;
        if (reader.HasRows == true)
            ok = true;
        DongKetNoi();
        return ok;
    }

    public string LayHoten(string username)
    {
        MoKetNoi();
        SqlCommand command = new SqlCommand("Select HoTen from NguoiSuDung where  Username='" + username + "'", ketnoi);
        string hoten;
        hoten = command.ExecuteScalar().ToString();
        DongKetNoi();
        return hoten;
    }
    public int layQuyenSD(string Username)
    {
       int quyen = 2;
        string sql_getquyen = "Select MaQuyen From TaiKhoan Where Username=@Username";
        SqlCommand objComm = new SqlCommand();
        objComm.CommandText = sql_getquyen;
        objComm.Connection = ketnoi;
        SqlParameter[] parms = new SqlParameter[]{
        new SqlParameter("@Username", SqlDbType.NVarChar)};
        parms[0].Value = Username;
        objComm.Parameters.AddRange(parms);
        ketnoi.Open();
        quyen = (int)objComm.ExecuteScalar();
        ketnoi.Close();



        return quyen;
    }
  
    public int Quyen(int Maquyen)
    {
        MoKetNoi();
        SqlCommand command = new SqlCommand("Select TenQuyen from QuyenSuDung where MaQuyenSD='" + Maquyen + "'", ketnoi);
        int maquyen;
        maquyen = (int)command.ExecuteScalar();
        DongKetNoi();
        return maquyen;
    }
    public int LayMaQuyen(string username,string Maquyen)
    {
        MoKetNoi();
        SqlCommand command = new SqlCommand("Select MaQuyen from TaiKhoan where Username='" + username + "'", ketnoi);
        int maquyen;
        maquyen = (int)command.ExecuteScalar();
        DongKetNoi();
        return maquyen;
    }

    public DataTable LayDSquyen()
    {
        DataTable bangtrave = new DataTable();
        MoKetNoi();
        SqlCommand command = new SqlCommand("Select * from QuyenSuDung", ketnoi);   
        SqlDataReader reader = command.ExecuteReader();
        bangtrave.Load(reader);
        DongKetNoi();
        return bangtrave;
    }

    public bool ThemQuyen(int MaQuyenSD, string TenQuyen, string MoTa)
    {
        bool ok;
        MoKetNoi();

        SqlCommand command = new SqlCommand("Insert into QuyenSuDung values(" +MaQuyenSD + ",N'" + TenQuyen + "',N'" + MoTa +"')", ketnoi);
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
    public bool XoaQuyen(int MaQuyenSD)
    {
        bool ok;
        MoKetNoi();
        SqlCommand command = new SqlCommand("delete QuyenSuDung where MaQuyenSD=" + MaQuyenSD , ketnoi);
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

    public bool SuaQuyen1(int MaQuyenSD, string TenQuyen, string MoTa)
    {
        bool ok;
        MoKetNoi();
        SqlCommand command = new SqlCommand("update QuyenSuDung set TenQuyen=N'"+TenQuyen+"' ,MoTa=N'"+MoTa+"' where MaQuyenSD="+MaQuyenSD, ketnoi);
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

    public int DangKi(NguoiDungInfo dk)
    {  //b1:mo ket noi
        ketnoi.Open();
        //b2: tao doi tuong command
        SqlCommand objComm = new SqlCommand();
        objComm.Connection = ketnoi;
        objComm.CommandText = "DangKi";//ten thu tuc
        objComm.CommandType = CommandType.StoredProcedure;//loai command

        SqlParameter[] parms = new SqlParameter[]{
            new SqlParameter("@HoTen",SqlDbType.NVarChar),
            new SqlParameter("@Username",SqlDbType.NVarChar),
            new SqlParameter("@Pass",SqlDbType.NVarChar),
            new SqlParameter("@Email",SqlDbType.NVarChar),
            new SqlParameter("@DiaChi",SqlDbType.NVarChar),
            new SqlParameter("@DienThoai",SqlDbType.Int),
    };
        parms[0].Value = dk.TenNguoiDung;
        parms[1].Value = dk.TaiKhoan;
        parms[2].Value = dk.MatKhau;
        parms[3].Value = dk.EMail;
        parms[4].Value = dk.Diachi;
        parms[5].Value = dk.dienthoai;
        objComm.Parameters.AddRange(parms);
       
            //b3:thuc thi cau lenh
            int i= objComm.ExecuteNonQuery();
        //b4:dong ket noi
        ketnoi.Close();
        return i;
    }
    public int updateTaiKhoan(int MaNSD,string Username, string Pass, int MaQuyen,bool TrangThai)
    {
        //b1:mo ket noi
        ketnoi.Open();
        //b2: tao doi tuong command
        SqlCommand objComm = new SqlCommand();
        objComm.Connection = ketnoi;
        objComm.CommandText = "updateTaiKhoan";//ten thu tuc
        objComm.CommandType = CommandType.StoredProcedure;//loai command

        SqlParameter[] parms = new SqlParameter[]{
             new SqlParameter("MaNSD",SqlDbType.Int),
            new SqlParameter("@Username",SqlDbType.NVarChar),
            new SqlParameter("@Pass",SqlDbType.NVarChar),
            new SqlParameter("@MaQuyen",SqlDbType.Int),
            new SqlParameter("@Trangthai",SqlDbType.Bit),
            
    };
        parms[0].Value = MaNSD;
        parms[1].Value = Username;
        parms[2].Value = Pass;
        parms[3].Value = MaQuyen;
        parms[4].Value = TrangThai;

        objComm.Parameters.AddRange(parms);
        //b3:thuc thi cau lenh
        int i = objComm.ExecuteNonQuery();
        //b4:dong ket noi
        ketnoi.Close();
        return i;
    }
    public bool KtTonTai(string username)
    {
        bool ok;
        MoKetNoi();
        SqlCommand command = new SqlCommand("Select * from TaiKhoan where Username=@Username", ketnoi);
        command.Parameters.Add("Username", username);
        SqlDataReader reader = command.ExecuteReader();
        if (reader.HasRows)
        {
            ok = true;
        }
        else
            ok = false;
        DongKetNoi();
        return ok;
    }
    public string LayPass1(string Username)
    {
        string mk;
        MoKetNoi();
        SqlCommand command = new SqlCommand("Select * from TaiKhoan where Username=@Username", ketnoi);
        command.Parameters.Add("Username", Username);
        mk = command.ExecuteScalar().ToString();
        return mk;
        DongKetNoi();
    }
    public bool ThayDoiMatKhau(string tendangnhap, string matkhau)
    {
        bool ok;
        MoKetNoi();
        string sql = "update NguoiDung set MatKhau=@MatKhau where TenDangNhap=@Username";
        SqlCommand command = new SqlCommand(sql, ketnoi);
        command.Parameters.Add("Username", tendangnhap);
        command.Parameters.Add("MatKhau", matkhau);
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

    public string LayTenNhom(int IDnhom)
    {
        MoKetNoi();
        SqlCommand command = new SqlCommand("Select TenNhom from tbl_NhomSP where ID=@IDnhom", ketnoi);
        command.Parameters.Add("IDnhom", IDnhom);
        string ten;
        ten = command.ExecuteScalar().ToString();
        DongKetNoi();
        return ten;
    }
    public int soluongSP(int MaSach)
    {
        MoKetNoi();
        SqlCommand command = new SqlCommand("Select SoLuong from Sach where MaSach=@MaSach", ketnoi);
        command.Parameters.Add("MaSach", MaSach);
        int soluong;
        soluong = (int)command.ExecuteScalar();
        DongKetNoi();
        return soluong;
    }

    public void UpdateSoLuongSP(int masp, int soluong)
    {
        MoKetNoi();
        string sql = "update tbl_SanPham set ID=@masp where SoLuong=@soluong";
        SqlCommand command = new SqlCommand(sql, ketnoi);
        command.Parameters.Add("masp", masp);
        command.Parameters.Add("soluong", soluong);
        try
        {
            command.ExecuteNonQuery();
        }
        catch
        {
        }
        DongKetNoi();
    }
    public void Loaddatalist()
    {
        MoKetNoi();
        SqlCommand command = new SqlCommand("Select * from Sach");

        DongKetNoi();
    }
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
