<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style14
        {
            width: 100%;
        }
         .auto-style5 {
            font-size: x-large;
        }
         </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <table class="style14">
        <tr style="height:50px;">
            <td colspan="2" 
                style="color: #FFFF00; font-weight: bold; background-color: #000099; text-align: center;" class="auto-style4">
                <span class="auto-style5">GIỎ HÀNG CỦA BẠN</span>
                </td>
            <tr>
            <td class="auto-style4">

                <asp:Label ID="lblthongbao" runat="server" Font-Size="20px" ForeColor="Red"></asp:Label>

            </td>
                </tr>
            </tr>
         </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" Width="100%" style="text-align: center" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
        <Columns>
            <asp:BoundField DataField="Product" HeaderText="Tên sách" />
            <asp:TemplateField HeaderText="Hình ảnh"><ItemTemplate>
                <asp:Image runat="server" Height="64px" Width="59px" imageurl='<%#Eval("Image") %>'></asp:Image>
           </ItemTemplate></asp:TemplateField>
            <asp:BoundField DataField="Quantity" HeaderText="Số lượng" />
            <asp:BoundField DataField="Cost" HeaderText="Giá bán" />
            <asp:BoundField DataField="Sum" HeaderText="Thành tiền" />
            <asp:ButtonField CommandName="Delete" HeaderText="Xóa Hàng" Text="Xóa" />
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
    <br />
    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
    &nbsp;VND<br />
    <asp:Button ID="btnmuatiep" runat="server" OnClick="btnmuatiep_Click" Text="Mua tiếp" />
    <asp:Button ID="btnthanhtoan" runat="server" OnClick="btnthanhtoan_Click" Text="Thanh toán" />
</asp:Content>

