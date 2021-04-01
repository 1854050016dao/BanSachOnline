<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Dathangthanhcong.aspx.cs" Inherits="Dathangthanhcong" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style5 {
            color: #FFFF00;
            background-color: #000099;
        }
        .auto-style6 {
            font-size: large;
        }
        .auto-style7 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel3" runat="server">
        <table style="width:100%; margin-top:20px">
            <tr>
                <td style="font-size: x-large; font-weight: bold" class="auto-style5">
                    Đặt hàng thành công!</td>
            </tr>
            <tr>
                <td style="color: #0066FF;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style7"><strong><span class="auto-style6">- Cám ơn quý khách đã tin dùng sản phẩm của website. Chúng tôi sẽ nhanh chóng xác nhận đơn hàng và hoàn tất quá trình mua bán cho quý khách.&nbsp;</span></strong></span><br /> 
                    </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

