<%@ Page Title="" Language="C#" MasterPageFile="~/ADM/admin.master" AutoEventWireup="true" CodeFile="quanlinguoidung.aspx.cs" Inherits="ADM_quanlinguoidung" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            font-size: xx-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%">
        <tr style="height:50px">
            <td style="color: #FFFF00; font-weight: bold; background-color: #000066; text-align: center;" class="auto-style3">QUẢN LÍ NGƯỜI DÙNG</td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="MaNSD,MaNSD1" DataSourceID="SqlDataSource1" GridLines="None" Width="100%" AllowSorting="True" AllowPaging="True" PageSize="5" style="text-align: center">
        <Columns>
            <asp:BoundField DataField="MaNSD1" HeaderText="Mã người sử dụng" InsertVisible="False" ReadOnly="True" SortExpression="MaNSD1" />
            <asp:BoundField DataField="Username" HeaderText="Tên đăng nhập" SortExpression="Username" />
            <asp:BoundField DataField="Pass" HeaderText="Mật khẩu" SortExpression="Pass" />
<asp:BoundField DataField="MaQuyen" HeaderText="Mã quyền" SortExpression="MaQuyen"></asp:BoundField>
            <asp:BoundField DataField="HoTen" HeaderText="Họ tên" SortExpression="HoTen" />
            <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" SortExpression="DiaChi" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Dienthoai" HeaderText="Điện thoại" SortExpression="Dienthoai" />
            <asp:CheckBoxField DataField="TrangThai" HeaderText="Trạng thái" SortExpression="TrangThai" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="Chức năng" />
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:STRCONN %>" SelectCommand="SELECT * FROM [TaiKhoan],[NguoiSuDung] WHERE TaiKhoan.MaNSD=NguoiSuDung.MaNSD" DeleteCommand="DELETE FROM [TaiKhoan] WHERE [MaNSD] = @MaNSD" InsertCommand="insert into NguoiSuDung(HoTen,DiaChi,Email,Dienthoai) values(@HoTen,@DiaChi,@Email,@DienThoai)
insert into TaiKhoan(Username,Pass,TrangThai) values (@Username,@Pass,@TrangThai)" UpdateCommand="UPDATE [TaiKhoan] SET [Username] = @Username, [Pass] = @Pass, [MaQuyen] = @MaQuyen, [TrangThai] = @TrangThai WHERE [MaNSD] = @MaNSD
UPDATE [NguoiSuDung] SET [HoTen] = @HoTen, [DiaChi] = @DiaChi, [Email] = @Email, [DienThoai] = @DienThoai WHERE [MaNSD] = @MaNSD">
        <DeleteParameters>
            <asp:Parameter Name="MaNSD" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="HoTen" />
            <asp:Parameter Name="DiaChi" />
            <asp:Parameter Name="Email" />
            <asp:Parameter Name="DienThoai" />
            <asp:Parameter Name="Username" Type="String" />
            <asp:Parameter Name="Pass" Type="String" />
            <asp:Parameter Name="TrangThai" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Username" Type="String" />
            <asp:Parameter Name="Pass" Type="String" />
            <asp:Parameter Name="MaQuyen" Type="Int32" />
            <asp:Parameter Name="TrangThai" Type="Boolean" />
            <asp:Parameter Name="MaNSD" Type="Int32" />
            <asp:Parameter Name="HoTen" />
            <asp:Parameter Name="DiaChi" />
            <asp:Parameter Name="Email" />
            <asp:Parameter Name="DienThoai" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="MaNSD,MaNSD1" DataSourceID="SqlDataSource1" DefaultMode="Insert" ForeColor="Black" GridLines="None" Height="50px" OnItemInserted="DetailsView1_ItemInserted" Width="400px">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <Fields>
            <asp:BoundField DataField="Username" HeaderText="Tên đăng nhập" SortExpression="Username" />
            <asp:BoundField DataField="Pass" HeaderText="Mật khẩu" SortExpression="Pass" />
            <asp:BoundField DataField="MaQuyen" HeaderText="Mã quyền" SortExpression="MaQuyen" />
            <asp:BoundField DataField="HoTen" HeaderText="Họ tên" SortExpression="HoTen" />
            <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" SortExpression="DiaChi" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Dienthoai" HeaderText="Điện thoại" SortExpression="Dienthoai" />
            <asp:CheckBoxField DataField="TrangThai" HeaderText="Trạng thái" SortExpression="TrangThai" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
    </asp:DetailsView>
</asp:Content>

