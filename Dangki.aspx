<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Dangki.aspx.cs" Inherits="Dangki" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
        .style15
        {
            width: 100%;
        }
        .style17
        {
            width: 122px;
        }
        .style24
        {
            width: 100%;
            height:50px;
        }
        .style25
        {
            width: 202px;
        }
    .style26
    {
        width: 167px;
             text-align: left;
         }
         .auto-style5 {
             color: #FFFF00;
             font-size: x-large;
         }
         .auto-style7 {
             width: 167px;
             text-align: left;
         }
         .auto-style8 {
             width: 167px;
             text-align: left;
             height: 30px;
         }
         .auto-style9 {
             height: 30px;
             text-align: left;
         }
         .auto-style11 {
             width: 167px;
             text-align: left;
             color: #000000;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:Panel ID="Panel9" runat="server" BorderColor="Blue" BorderWidth="2px">
        <table class="style24">
            <tr style="height:50px;">
                <td style="font-weight: bold; background-color: #000099; text-align: center;" class="auto-style5">
                    ĐĂNG KÍ THÀNH VIÊN</td>
            </tr>
            <tr>
                <td style="color: #0000FF; font-size: large">
                    
                </td>
            </tr>
            <tr>
                <td style="color: #0000FF; font-size: large">
                    Cám ơn quý khách đã đăng kí làm thành viên của website chúng tôi.</td>
            </tr>
            <tr>
                <td style="font-style: italic; color: #FF0000">
                    Vui lòng điền đầy đủ thông tin trước khi đăng kí.</td>
            </tr>
        </table>
        <table class="style24">
            <tr>
                <td class="auto-style11">
                    Tên đăng nhập</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtTenDN" runat="server" Width="247px" style="text-align: left"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTenDN" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style11">
                    Mật khẩu</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtMatKhau1" runat="server" TextMode="Password" Width="248px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMatKhau1" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align: left">

                    <asp:Label ID="Label8" runat="server" Text="Nhập lại mật khẩu" style="text-align: left"></asp:Label>

                </td>
                <td style="text-align: left">

                    <asp:TextBox ID="TextBox2" runat="server" Width="248px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtMatKhau1" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Mật khẩu phải trùng nhau" ForeColor="Red"></asp:CompareValidator>

                </td>
            </tr>
            <tr>
                <td class="style26">
                    Email</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtEmail" runat="server" Width="247px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="Email không hợp lệ" ForeColor="Red" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    
                </td>
                
            </tr>
            <tr>
                <td style="text-align: left">

                    <asp:Label ID="Label7" runat="server" Text="Nhập lại email"></asp:Label>

                </td>
                <td style="text-align: left">

                    <asp:TextBox ID="TextBox1" runat="server" Width="248px"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtEmail" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Email phải trùng nhau" ForeColor="Red"></asp:CompareValidator>

                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    Họ tên</td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtHoTen" runat="server" Width="245px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtHoTen" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style26">Điện Thoại</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtdienthoai" runat="server" Width="245px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtdienthoai" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    Địa chỉ</td>
                <td style="text-align: left">
                    <asp:TextBox ID="txtdiachi" runat="server" Height="74px" TextMode="MultiLine" 
                        Width="285px" style="text-align: left"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtdiachi" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                </td>
            </tr> 
            <tr>
                <td>
                    Điều khoản thỏa thuận:</td>
                <td style="text-align: left">

                    <asp:TextBox ID="TextBox3" runat="server" Height="74px" Width="285px" TextMode="MultiLine" Enabled="False" style="text-align: left">Quý khách vui lòng đọc kỹ những thoả thuận trong trang này và phải chắc rằng quý khách đồng ý với những thông tin thoả thuận điều khoản này. Nếu không đồng ý vui lòng không truy cập Website.</asp:TextBox>

                </td>
            </tr>    
        </table>
        <table class="style24">
           
            <tr>
                <td style="text-align: center">
                    
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/image/DangKi_Button.gif" OnClick="ImageButton1_Click" />
                    
                    <asp:Label ID="lblThongBao" runat="server" Font-Bold="True" ForeColor="#FF0066"></asp:Label>
                    
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
</asp:Content>

