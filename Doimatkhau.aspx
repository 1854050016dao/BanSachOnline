<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Doimatkhau.aspx.cs" Inherits="Doimatkhau" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style5 {
            width: 168px;
        }
        .auto-style6 {
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style4">
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lblmkcu" runat="server" Text="Nhập mật khẩu cũ:" CssClass="auto-style6"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtmkcu" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtmkcu" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lblmkmoi" runat="server" Text="Nhập mật khẩu mới:" CssClass="auto-style6"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtmkmoi" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtmkmoi" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lblnhaplaimoi" runat="server" Text="Nhập lại mật khẩu mới:" CssClass="auto-style6"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtnhaplaimoi" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtnhaplaimoi" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtmkmoi" ControlToValidate="txtnhaplaimoi" Display="Dynamic" ErrorMessage="Mật khẩu phải giống nhau" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Đổi mật khẩu" Width="123px" OnClick="Button1_Click" />
                <asp:Label ID="lblthongbao" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

