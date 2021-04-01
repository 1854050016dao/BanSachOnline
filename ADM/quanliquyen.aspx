<%@ Page Title="" Language="C#" MasterPageFile="~/ADM/admin.master" AutoEventWireup="true" CodeFile="quanliquyen.aspx.cs" Inherits="ADM_quanliquyen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 119px;
        }
        .auto-style4 {
            color: #FFFF00;
            font-size: xx-large;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%">
        <tr style="height:50px">
            <td style="font-weight: bold; background-color: #000066; text-align: center;" class="auto-style4">QUẢN LÍ QUYỀN SỬ DỤNG</td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" Width="100%" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="MaQuyenSD" DataSourceID="SqlDataSource1" style="text-align: center">
        <Columns>
            <asp:BoundField DataField="MaQuyenSD" HeaderText="Mã quyền" ReadOnly="True" SortExpression="MaQuyenSD" />
            <asp:BoundField DataField="TenQuyen" HeaderText="Tên quyền" SortExpression="TenQuyen" />
            <asp:BoundField DataField="MoTa" HeaderText="Mô tả" SortExpression="MoTa" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" CausesValidation="False" HeaderText="Chức năng" />
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle ForeColor="Black" HorizontalAlign="Right" BackColor="#C6C3C6" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
</asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:STRCONN %>" DeleteCommand="DELETE FROM [QuyenSuDung] WHERE [MaQuyenSD] = @MaQuyenSD" InsertCommand="INSERT INTO [QuyenSuDung] ([MaQuyenSD], [TenQuyen], [MoTa]) VALUES (@MaQuyenSD, @TenQuyen, @MoTa)" SelectCommand="SELECT * FROM [QuyenSuDung]" UpdateCommand="UPDATE [QuyenSuDung] SET [TenQuyen] = @TenQuyen, [MoTa] = @MoTa WHERE [MaQuyenSD] = @MaQuyenSD">
        <DeleteParameters>
            <asp:Parameter Name="MaQuyenSD" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MaQuyenSD" Type="Int32" />
            <asp:Parameter Name="TenQuyen" Type="String" />
            <asp:Parameter Name="MoTa" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TenQuyen" Type="String" />
            <asp:Parameter Name="MoTa" Type="String" />
            <asp:Parameter Name="MaQuyenSD" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
&nbsp;
    <table class="style1">
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label1" runat="server" Text="Mã quyền"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label2" runat="server" Text="Tên quyền"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label3" runat="server" Text="Mô tả"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>
                <asp:Button ID="btnthem" runat="server" OnClick="btnthem_Click" Text="Thêm" Width="74px" />
                &nbsp;&nbsp;
                                
                <br />
                <asp:Label ID="lblthongbao" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>

</asp:Content>

