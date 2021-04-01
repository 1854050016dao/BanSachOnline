using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SPinfor
/// </summary>
public class SPinfor
{
    int MaSach;
    int MaLoai;
      string  TenSach;
      string  KichThuoc;
       string TacGia;
     int   MaNXB;
       int SoTrang;
       int SoLuong;
      DateTime  NgayNhap;
       string MoTa;
       int GiaBan;
       string Hinhanhminhhoa;
	public SPinfor()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public int masach
    {
        set { MaSach = value; }
        get { return MaSach; }
    }
    public int maloai
    {
        set { MaLoai = value; }
        get { return MaLoai; }
    }
    public string tensach
    {
        set { TenSach = value; }
        get { return TenSach; }
    }
    public string kichthuoc
    {
        set { KichThuoc = value; }
        get { return KichThuoc; }
    }
    public string tacgia
    {
        set { TacGia = value; }
        get { return TacGia; }
    }
    public int manhasanxuat
    {
        set { MaNXB = value; }
        get { return MaNXB; }
    }
    public int sotrang
    {
        set { SoTrang = value; }
        get { return SoTrang; }
    }
    public int soluong
    {
        set { SoLuong = value; }
        get { return SoLuong; }
    }
    public DateTime ngaynhap
    {
        set { NgayNhap = value; }
        get { return NgayNhap; }
    }
    public string mota
    {
        set { MoTa = value; }
        get { return MoTa; }
    }
    public int giaban
    {
        set { GiaBan = value; }
        get { return GiaBan; }
    }
    public string hinhanh
    {
        set { Hinhanhminhhoa = value; }
        get { return Hinhanhminhhoa; }
    }
}