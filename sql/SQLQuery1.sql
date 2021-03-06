create proc themtheloai(
 @MaLoai int,
 @TenLoai nvarchar(100)
 )
 as
 begin
 insert into TheLoai(MaLoai,TenLoai) values(@MaLoai,@TenLoai)
 end
 select * from TheLoai
 
 
 create proc laytensach
 as
 select * from Sach
 
  create proc LayGiaSach1
 as
 select MaSach,GiaBan from Sach
 
 create proc KTDangNhap
 as
 select Username,Pass from TaiKhoan
 
 create proc LayHoten
 as
 select HoTen from NguoiSuDung
 
 create proc LayMaQuyen
 as
 select MaNSD,MaQuyen from TaiKhoan,QuyenSuDung where TaiKhoan.MaQuyen=QuyenSuDung.MaQuyenSD
 
 create proc LayDSquyen
 as
 select * from QuyenSuDung
 
 create proc ThemQuyen(
 @MaQuyenSD int,
 @TenQuyen nvarchar(100),
 @MoTa nvarchar(500)
 )
 as
 begin
 insert into QuyenSuDung(MaQuyenSD,TenQuyen,MoTa) values(@MaQuyenSD,@TenQuyen,@MoTa)
 end
 
 
 create proc XoaQuyen(
@MaQuyenSD int,
 @TenQuyen nvarchar(100),
 @MoTa nvarchar(500)
 )
 as
 begin
 delete QuyenSuDung where MaQuyenSD=@MaQuyenSD and TenQuyen=@TenQuyen and MoTa=@MoTa
 end
 
 create proc SuaQuyen1(
 @MaQuyenSD int,
 @TenQuyen nvarchar(100),
 @MoTa nvarchar(500)
 )
 as
 begin
 if (exists(select * from QuyenSuDung Where MaQuyenSD=@MaQuyenSD and TenQuyen=@TenQuyen and MoTa=@MoTa))
 raiserror('Quyền này đã có trong Quyền Sử Dụng',16,1)
 else
 update QuyenSuDung set  MaQuyenSD=@MaQuyenSD, TenQuyen=@TenQuyen, MoTa=@MoTa where MaQuyenSD=@MaQuyenSD and TenQuyen=@TenQuyen
 end
 
 create proc DangKi(
 @MaNSD int,
 @HoTen nvarchar(100),
 @NgaySinh datetime,
 @DiaChi nvarchar(250),
 @DienThoai char(10),
 @Email nvarchar(250),
 @Username nvarchar(100),
 @Pass nvarchar(100)
 )
 as
 begin
 insert into NguoiSuDung(MaNSD,HoTen,NgaySinh,DiaChi,DienThoai,Email) values(@MaNSD,@HoTen,@NgaySinh,@DiaChi,@DienThoai,@Email)
 insert into TaiKhoan(Username,Pass) values (@Username,@Pass)
 end
 
 create proc KtTonTai
 as
 select * from TaiKhoan
 
 create proc LayPass1
 as
 select Username,Pass from TaiKhoan
 
 create proc Loaddatalist
 as
 select * from Sach