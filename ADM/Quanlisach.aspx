<%@ Page Title="" Language="C#" MasterPageFile="~/ADM/admin.master" AutoEventWireup="true" CodeFile="Quanlisach.aspx.cs" Inherits="ADM_Quanlisach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 168px;
        }
        .auto-style5 {
            width: 168px;
            height: 26px;
        }
        .auto-style6 {
            height: 26px;
        }
         .style24
         {
         width: 100%;
         }
          .style7
        {
            width: 159px;
        }
        .auto-style7 {
            font-size: xx-large;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style24">
            <tr style="height:50px">
                <td style="color: #FFFF00; font-weight: bold; background-color: #000066; text-align: center;" class="auto-style7">
                    THÔNG TIN SÁCH</td>
            </tr>
        </table>

  
    <br />
    Tìm kiếm theo NXB :
    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="TenNXB" DataValueField="MaNXB" style="text-align: center">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:STRCONN %>" SelectCommand="SELECT * FROM [NhaXuatBan]"></asp:SqlDataSource>

  
    <br />

    <br />
    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="MaSach" DataSourceID="SqlDataSource1" AllowPaging="True" PageSize="5">
        <Columns>
            <asp:CommandField CausesValidation="False" ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="MaSach" HeaderText="Mã Sách" InsertVisible="False" ReadOnly="True" SortExpression="MaSach" />
            <asp:BoundField DataField="MaLoai" HeaderText="Mã Loại" SortExpression="MaLoai" />
            <asp:BoundField DataField="TenSach" HeaderText="Tên Sách" SortExpression="TenSach" />
            <asp:BoundField DataField="KichThuoc" HeaderText="Kích Thước" SortExpression="KichThuoc" />
            <asp:BoundField DataField="TacGia" HeaderText="Tác Giả" SortExpression="TacGia" />
            <asp:BoundField DataField="MaNXB" HeaderText="Mã NXB" SortExpression="MaNXB" />
            <asp:BoundField DataField="SoTrang" HeaderText="Số Trang" SortExpression="SoTrang" />
            <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng" SortExpression="SoLuong" />
            <asp:BoundField DataField="NgayNhap" HeaderText="Ngày Nhập" SortExpression="NgayNhap" />
            <asp:BoundField DataField="MoTa" HeaderText="Mô Tả" SortExpression="MoTa" />
            <asp:BoundField DataField="GiaBan" HeaderText="Giá" SortExpression="GiaBan" />
            <asp:BoundField DataField="Hinhanhminhhoa" HeaderText="Ảnh Minh Họa" SortExpression="Hinhanhminhhoa" />
        </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:STRCONN %>" DeleteCommand="DELETE FROM [Sach] WHERE [MaSach] = @MaSach" InsertCommand="INSERT INTO [Sach] ([MaLoai], [TenSach], [KichThuoc], [TacGia], [MaNXB], [SoTrang], [SoLuong], [NgayNhap], [MoTa], [GiaBan], [Hinhanhminhhoa]) VALUES (@MaLoai, @TenSach, @KichThuoc, @TacGia, @MaNXB, @SoTrang, @SoLuong, @NgayNhap, @MoTa, @GiaBan, @Hinhanhminhhoa)" SelectCommand="SELECT * FROM [Sach] WHERE ([MaNXB] = @MaNXB)" UpdateCommand="UPDATE [Sach] SET [MaLoai] = @MaLoai, [TenSach] = @TenSach, [KichThuoc] = @KichThuoc, [TacGia] = @TacGia, [MaNXB] = @MaNXB, [SoTrang] = @SoTrang, [SoLuong] = @SoLuong, [NgayNhap] = @NgayNhap, [MoTa] = @MoTa, [GiaBan] = @GiaBan, [Hinhanhminhhoa] = @Hinhanhminhhoa WHERE [MaSach] = @MaSach">
        <DeleteParameters>
            <asp:Parameter Name="MaSach" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MaLoai" Type="Int32" />
            <asp:Parameter Name="TenSach" Type="String" />
            <asp:Parameter Name="KichThuoc" Type="String" />
            <asp:Parameter Name="TacGia" Type="String" />
            <asp:Parameter Name="MaNXB" Type="Int32" />
            <asp:Parameter Name="SoTrang" Type="Int32" />
            <asp:Parameter Name="SoLuong" Type="Int32" />
            <asp:Parameter Name="NgayNhap" Type="DateTime" />
            <asp:Parameter Name="MoTa" Type="String" />
            <asp:Parameter Name="GiaBan" Type="Int32" />
            <asp:Parameter Name="Hinhanhminhhoa" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList3" Name="MaNXB" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="MaLoai" Type="Int32" />
            <asp:Parameter Name="TenSach" Type="String" />
            <asp:Parameter Name="KichThuoc" Type="String" />
            <asp:Parameter Name="TacGia" Type="String" />
            <asp:Parameter Name="MaNXB" Type="Int32" />
            <asp:Parameter Name="SoTrang" Type="Int32" />
            <asp:Parameter Name="SoLuong" Type="Int32" />
            <asp:Parameter Name="NgayNhap" Type="DateTime" />
            <asp:Parameter Name="MoTa" Type="String" />
            <asp:Parameter Name="GiaBan" Type="Int32" />
            <asp:Parameter Name="Hinhanhminhhoa" Type="String" />
            <asp:Parameter Name="MaSach" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <table class="style1">
        <tr style="width:100%;">
            <td class="auto-style3">&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">Thể loại</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="TenLoai" DataValueField="MaLoai" AutoPostBack="True" TabIndex="1" >
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BanSachOnlineConnectionString %>" SelectCommand="SELECT * FROM [TheLoai]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Tên sách</td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" TabIndex="2"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Kích thước</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" TabIndex="3"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Tác giả</td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server" TabIndex="4"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Mã nhà xuất bản</td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="TenNXB" DataValueField="MaNXB" AutoPostBack="True" TabIndex="5">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:STRCONN %>" SelectCommand="SELECT * FROM [NhaXuatBan]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Số trang</td>
            <td>
                <asp:TextBox ID="TextBox7" runat="server" TabIndex="6"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox7" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Số lượng</td>
            <td>
                <asp:TextBox ID="TextBox8" runat="server" TabIndex="7"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox8" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Ngày nhập</td>
            <td>
                <asp:TextBox ID="TextBox9" runat="server" TabIndex="8"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox9" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Mô tả</td>
            <td>
                <asp:TextBox ID="TextBox10" runat="server" TabIndex="9"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox10" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Giá bán</td>
            <td class="auto-style6">
                <asp:TextBox ID="TextBox11" runat="server" TabIndex="10"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBox11" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Hình ảnh</td>
            <td class="auto-style6">
                <asp:FileUpload ID="FileUpload1" runat="server" TabIndex="11" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>
                <br />
                <asp:Button ID="btnthem" runat="server" Height="26px" Text="Thêm sách" Width="107px" OnClick="btnthem_Click" TabIndex="12" />
                &nbsp;<br />
                <asp:Label ID="lblthongbao" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    
    
</asp:Content>

