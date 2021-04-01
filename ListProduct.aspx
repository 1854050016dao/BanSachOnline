<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ListProduct.aspx.cs" Inherits="ListProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style17
        {
            height: 19px;
        }
        
    .style18
    {
        height: 23px;
    }
    
        .style14
        {
            width: 100%;
        }
         </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <table class="style14">
            <tr style="height:50px">
                <td align="left" 
                    style="color: #FFFF00; font-weight: 700; background-color: #000099; text-align: center; font-size: x-large;">
                    DANH SÁCH SẢN PHẨM&nbsp;</td>
                </tr>
         </table>
      
   
<br />
      
   
    <asp:DataList ID="DataList2" runat="server" RepeatColumns="2" style="margin-left: 10px" Width="600px">
        <ItemTemplate> 
            <table style="width:300px;">       
                <tr>
                    <td rowspan="3">
                        <asp:ImageButton ID="ImageButton1" imageurl='<%#x.Rows[i]["Hinhanhminhhoa"] %>' runat="server" Height="90px" Width="81px" />

                    </td>
                    <td>
                        <asp:Label ID="lblTensach" Text='<%#x.Rows[i]["TenSach"] %>' runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
                    </td>
                    
                </tr>
                <tr>
                    <td>Nhà xuất bản:<asp:LinkButton ID="lnkbtnTenNXB" Text='<%# x.Rows[i]["TenNXB"]%>' runat="server"></asp:LinkButton>
                    </td>
                    
                </tr>
                <tr>
                    <td>Giá bán:<asp:Label ID="lblDongia" Text='<%#x.Rows[i]["GiaBan"]%>' runat="server"></asp:Label>
                        <asp:Label ID="Label1" runat="server" Text="VND"></asp:Label>
                    </td>
                 
                </tr>
                <tr>
                    <td>

                    </td>
                    <td>

                        <asp:Button ID="btnChonmua" runat="server" Text="Chọn Mua" CommandArgument='<%#i%>' OnClick="btnChonmua_Click"/>
                        <asp:Button ID="btnChitiet" runat="server" Text="Chi tiết" CommandArgument='<%#i++%>' OnClick="btnChitiet_Click"/>

                    </td>
                </tr>
              </table>
        </ItemTemplate>
    </asp:DataList>

</asp:Content>

