using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for NguoiDungInfo
/// </summary>
public class NguoiDungInfo
{
    int MaNSD;
    string HoTen;
    string Username;
    string Pass;
    string Email;
    string DiaChi;
    int DienThoai;
    public NguoiDungInfo()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public int Manguoisudung
    {
        set { MaNSD = value; }
        get { return MaNSD; }
    }
    public string TaiKhoan
    {
        set { Username = value; }
        get { return Username; }
    }
    public string MatKhau
    {
        set { Pass = value; }
        get { return Pass; }
    }
    public string TenNguoiDung
    {
        set { HoTen = value; }
        get { return HoTen; }
    }
    public string EMail
    {
        set { Email = value; }
        get { return Email; }
    }
    public string Diachi
    {
        set { DiaChi = value; }
        get { return DiaChi; }
    }
    public int dienthoai
    {
        set { DienThoai = value; }
        get { return DienThoai; }
    }
}