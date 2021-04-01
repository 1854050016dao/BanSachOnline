<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DangKiThanhCong.aspx.cs" Inherits="DangKiThanhCong" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style24
        {
            width: 100%;
        }
          .auto-style5 {
            color: #FFFF00;
            background-color: #000099;
        }
        .auto-style6 {
            color: #FF0000;
        }
          </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel8" runat="server" BorderColor="Blue" BorderWidth="2px">
        <table class="style24">
            <tr>
                <td style="font-size: x-large; font-weight: bold" class="auto-style5">
                    Đăng kí thành công!&nbsp;</td>
            </tr>
            <tr>
                <td style="color: #0066FF;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style6"><strong>CHÚC MỪNG BẠN ĐÃ ĐĂNG KÝ THÀNH CÔNG THÀNH VIÊN !&nbsp;</strong></span></td>
            </tr>
            <tr>
                <td style="color: #0066FF;">
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/image/button_login.gif" OnClick="ImageButton1_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

