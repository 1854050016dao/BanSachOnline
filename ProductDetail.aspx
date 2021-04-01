<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductDetail.aspx.cs" Inherits="ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 180px;
            text-align: center;
        }
        .auto-style5 {
            width: 180px;
            text-align: center;
            height: 23px;
        }
        .auto-style6 {
            height: 23px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <table style="width:100%;">
                
            <tr style="height:50px">
                <td style="color: #FFFF00; font-weight: bold; background-color: #000066; text-align: center;">
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="CHI TIẾT SÁCH" style="text-align: center"></asp:Label>
                   
                </tr>
                </table>
                <table style="width:100%;">
                <tr>
                    <td class="auto-style3">Hình ảnh:</td>
                    <td>
                        <asp:ImageButton ID="imgminhhoa" runat="server" Height="178px" Width="184px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Tên Sách:</td>
                    <td class="auto-style6">
                        <asp:Label ID="lbl1" runat="server"></asp:Label>
                    </td>
                </tr>
                    <tr>
                        <td class="auto-style3">

                         Đơn giá:</td>
                        <td>

                            <asp:Label ID="lbl2" runat="server"></asp:Label>

                            <asp:Label ID="Label9" runat="server" Text="VNĐ"></asp:Label>

                        </td>
                         <tr>
                        <td class="auto-style5">

                            Mô tả:</td>
                        <td class="auto-style6">

                            <asp:Label ID="lbl3" runat="server"></asp:Label>

                        </td>
                         <tr>
                        <td class="auto-style3">

                            Tác giả:</td>
                        <td>

                            <asp:Label ID="lbl4" runat="server"></asp:Label>

                        </td>
                         <tr>
                        <td class="auto-style3">

                            Nhà xuất bản:</td>
                        <td>

                            <asp:Label ID="lbl5" runat="server"></asp:Label>

                        </td>
                         <tr>
                        <td class="auto-style3">

                            Số lượng cần mua:</td>
                        <td>

                          

                            <asp:TextBox ID="txtsoluong" runat="server">1</asp:TextBox>

                          

                        </td>
                    </tr>
                        <table style="width:100%;">
                <tr>
                    <td style="text-align: center">

                        <asp:Button ID="btntrolai" runat="server" Text="Trở lại" OnClick="btntrolai_Click" Width="103px" />
                        <asp:Button ID="btnthemvaogiohang" runat="server" OnClick="btnthemvaogiohang_Click" Text="Thêm vào giỏ hàng" Width="180px" />
                    </td>
                </tr>
                            </table>
            </table>
</asp:Content>

