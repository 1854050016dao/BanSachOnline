<%@ Page Title="" Language="C#" MasterPageFile="~/ADM/admin.master" AutoEventWireup="true" CodeFile="quanlidondathang.aspx.cs" Inherits="ADM_quanlidondathang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">  
           .style24
         {
         width: 100%;
         }
         .auto-style3 {
        font-size: xx-large;
        background-color: #000066;
    }
         </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <table class="style24">
        <tr style="height:50px">
            <td style="color: #FFFF00; font-weight: bold; text-align: center;" class="auto-style3">QUẢN LÍ ĐƠN HÀNG</td>
        </tr>
    </table>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" DataKeyNames="MaChiTietHD,MaDonDatHang1" DataSourceID="SqlDataSource1" PageSize="5" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%">
        <Columns>
            <asp:BoundField DataField="MaChiTietHD" HeaderText="Mã Hóa Đơn" ReadOnly="True" SortExpression="MaChiTietHD" >
            </asp:BoundField>
            <asp:BoundField DataField="MaDonDatHang" HeaderText="Mã đặt hàng" SortExpression="MaDonDatHang" />
            <asp:BoundField DataField="TenSach" HeaderText="Tên sách" SortExpression="TenSach" />
            <asp:BoundField DataField="Thanhtien" HeaderText="Tiền" SortExpression="Thanhtien" />
            <asp:BoundField DataField="Diachi" HeaderText="Địa chỉ" SortExpression="Diachi" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Ghichu" HeaderText="Số Điện Thoại" SortExpression="Ghichu" />
            <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" SortExpression="SoLuong" />
            <asp:CheckBoxField DataField="TrangThai" HeaderText="Duyệt Hàng" SortExpression="TrangThai" />
            <asp:BoundField DataField="MaNSD" HeaderText="Mã người đặt" SortExpression="MaNSD" />
            <asp:BoundField DataField="NgayDatHang" HeaderText="Ngày đặt hàng" SortExpression="NgayDatHang" />
            <asp:BoundField DataField="NgayGiaoHang" HeaderText="Ngày giao hàng" SortExpression="NgayGiaoHang" />
            <asp:BoundField DataField="MaPTTT" HeaderText="Phương thức tính tiền" SortExpression="MaPTTT" />
            <asp:BoundField DataField="MaVanChuyen" HeaderText="Phương thức vận chuyển" SortExpression="MaVanChuyen" />
            <asp:BoundField DataField="MaKhuyenMai" HeaderText="Khuyến mãi" SortExpression="MaKhuyenMai" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="Chức năng" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
</asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:STRCONN %>" SelectCommand="SELECT ChiTietHoaDon.*, DonDatHang.* FROM ChiTietHoaDon INNER JOIN DonDatHang ON ChiTietHoaDon.MaDonDatHang = DonDatHang.MaDonDatHang" DeleteCommand="DELETE FROM ChiTietHoaDon,DonDatHang WHERE MaDonDatHang=@MaDonDatHang and MaChiTietHD=@MaChiTietHD" UpdateCommand="update ChiTietHoaDon
set
MaDonDatHang=@MaDonDatHang,TenSach=@TenSach,Thanhtien=@Thanhtien,Diachi=@Diachi,Email=@Email,Ghichu=@Ghichu,Soluong=@SoLuong,TrangThai=@TrangThai
where
 MaChiTietHD=@MaChiTietHD

update DonDatHang
set
MaNSD=@MaNSD,NgayDatHang=@NgayDatHang,NgayGiaoHang=@NgayGiaoHang,MaPTTT=@MaPTTT,MaVanChuyen=@MaVanChuyen,MaKhuyenMai=@MaKhuyenMai
where
MaDonDatHang=@MaDonDatHang">
        <DeleteParameters>
            <asp:Parameter Name="MaDonDatHang" />
            <asp:Parameter Name="MaChiTietHD" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="MaDonDatHang" />
            <asp:Parameter Name="TenSach" />
            <asp:Parameter Name="Thanhtien" />
            <asp:Parameter Name="Diachi" />
            <asp:Parameter Name="Email" />
            <asp:Parameter Name="Ghichu" />
            <asp:Parameter Name="SoLuong" />
            <asp:Parameter Name="TrangThai" />
            <asp:Parameter Name="MaChiTietHD" />
            <asp:Parameter Name="MaNSD" />
            <asp:Parameter Name="NgayDatHang" />
            <asp:Parameter Name="NgayGiaoHang" />
            <asp:Parameter Name="MaPTTT" />
            <asp:Parameter Name="MaVanChuyen" />
            <asp:Parameter Name="MaKhuyenMai" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

