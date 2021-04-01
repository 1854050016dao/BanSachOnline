using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Hoadon
/// </summary>
public class Hoadon
{
    int MaChiTietHD;
    int MaDonDatHang;
    string TenSach;
    int Thanhtien;
    string Diachi;
    string Email;
    string Ghichu;
    int SoLuong;
    int MaNSD;
    string NgayDatHang;
    string NgayGiaoHang;
    int MaPTTT;
    int MaVanChuyen;
	public Hoadon()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public int machitietHD
    {
        set { MaChiTietHD = value; }
        get { return MaChiTietHD; }
    }
    public string tensach
    {
        set { TenSach = value; }
        get { return TenSach; }
    }
    public int soluong
    {
        set { SoLuong = value; }
        get { return SoLuong; }
    }
    public int thanhtien
    {
        set { Thanhtien = value; }
        get { return Thanhtien; }
    }
    public string diachi
    {
        set { Diachi = value; }
        get { return Diachi; }
    }
    public string email
    {
        set { Email = value; }
        get { return Email; }
    }
    public string ghichu
    {
        set { Ghichu = value; }
        get { return Ghichu; }
    }
    public int mahoadondathang
    { 
        set{ MaDonDatHang = value;}
        get { return MaDonDatHang; }
    }
    public int mansd
    {
        set { MaNSD = value; }
        get { return MaNSD; }
    }
    public string ngaydathang
    {
        set { NgayDatHang = value; }
        get { return NgayDatHang; }
     }
    public string ngaygiaohang
    {
        set { NgayGiaoHang = value; }
        get { return NgayGiaoHang; }
    }
    public int mapttt
    {
        set { MaPTTT = value; }
        get { return MaPTTT; }
    }
    public int mavanchuyen
    {
        set { MaVanChuyen = value; }
        get { return MaVanChuyen; }
    }
    }