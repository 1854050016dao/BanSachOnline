<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Thanhtoan.aspx.cs" Inherits="Thanhtoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
   
    .style24
         {
         width: 100%;
         }
        .style26
        {
        }
        .style27
        {
         }
        .style28
        {
            height: 88px;
        }
         .auto-style5 {
             width: 182px;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel6" runat="server" BorderColor="Blue" BorderWidth="2px" 
        Visible="true">
        <table class="style24">
            <tr style="height:50px">
                <td style="color: #FFFF00; font-weight: bold; background-color: #008080; text-align: center;">
                    THÔNG TIN XÁC NHẬN ĐƠN HÀNG</td>
            </tr>
        </table>
        <table class="style24">
            <tr>
                <td class="style26" colspan="2" style="color: #FF0000; font-style: italic">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Vui lòng điền đầy đủ thông tin trước khi gửi đơn hàng.</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    Ho tên người đặt hàng</td>
                <td>
                    <asp:Label ID="lblhoten" runat="server"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    Ngày đặt hàng</td>
                <td>
                    <asp:Label ID="lblngaydathang" runat="server"></asp:Label>
                    </td>
            </tr>
            
             <tr>
                <td class="auto-style5">
                    Số điện thoại</td>
                <td>
                    <asp:Label ID="lblsdt" runat="server"></asp:Label>
                    </td>
                 </tr>
            <tr>
                <td class="auto-style5">
                    Địa chỉ</td>
                <td>
                    <asp:Label ID="lbldiachi" runat="server"></asp:Label>
                    </td>
                </tr>
            <tr>
                <td class="auto-style5">
                   Email</td>
                <td>
                    <asp:Label ID="lblemail" runat="server"></asp:Label>
                    </td>
                </tr>
           
              <tr>
                <td class="auto-style5">
                    Nhập Lại Số ĐT</td>
                <td>
                    <asp:TextBox ID="txtYeucau" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtYeucau" Display="Dynamic" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
            </tr>

            <tr>
                <td class="auto-style5">Thời gian vận chuyển</td>
                <td>
                    <asp:TextBox ID="txtthoigianvanchuyen" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtthoigianvanchuyen" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td class="auto-style5">Hình thức thanh toán</td>
                <td>
                    <asp:DropDownList ID="drl_hinhthuc" runat="server" Width="150px" DataSourceID="SqlDataSource1" DataTextField="TenPTTT" DataValueField="MaPTTT">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:STRCONN %>" SelectCommand="SELECT * FROM [PTThanhToan]"></asp:SqlDataSource>
                </td>
            </tr>

            <tr>
                <td class="auto-style5">Hình thức vận chuyển</td>
                <td>
                    <asp:DropDownList ID="drl_vanchuyen" runat="server" Width="150px" DataSourceID="SqlDataSource2" DataTextField="TenVanChuyen" DataValueField="MaVanChuyen">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:STRCONN %>" SelectCommand="SELECT * FROM [PTVanChuyen]"></asp:SqlDataSource>
                </td>
            </tr>

            <tr>
                <td class="style27" colspan="2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="610px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" style="text-align: center">
                        <Columns>
                            <asp:BoundField DataField="Product" HeaderText="Tên sách" />
                            <asp:TemplateField HeaderText="Hình ảnh">
                                <ItemTemplate>
                                    <asp:Image ID="Image14" runat="server" Height="64px" Width="59px" imageurl='<%#Eval("Image") %>'/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Quantity" HeaderText="Số lượng" />
                            <asp:BoundField DataField="Cost" HeaderText="Giá bán" />
                            <asp:BoundField DataField="Sum" HeaderText="Thành tiền" />
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
                    <br />
                    <asp:Label ID="lbltongtien" runat="server" Text="Label"></asp:Label>
                    &nbsp;VNĐ</td>
            </tr>

            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td>
                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/image/thanhtoan.png" OnClick="ImageButton2_Click" />
                    <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" ImageUrl="~/image/Cancel.png" style="margin-right: 3px" Width="115px" OnClick="ImageButton3_Click" />
                    <asp:Label ID="lblthongbaothanhcong" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>

            </table>
            
</asp:Panel>
</asp:Content>

