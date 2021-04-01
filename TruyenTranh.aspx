<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TruyenTranh.aspx.cs" Inherits="TruyenTranh" %>

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
         .auto-style5 {
             width: 4px;
         }
         </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:DataList ID="DataList2" runat="server" RepeatColumns="2" style="margin: 20px 10px 10px 10px"  Width="600px" CellSpacing="-1">
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

