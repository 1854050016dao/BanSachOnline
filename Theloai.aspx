<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Theloai.aspx.cs" Inherits="Theloai" %>
<%@ Register assembly="CollectionPager" namespace="SiteUtils" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="3">
                        <ItemTemplate>
                            <table class="style5">
                                <tr>
                                    <td style="border-width: 1px; border-color: #C0C0C0; border-right-style: solid; border-left-style: solid;">
                                        <table class="style5">
                                            <tr>
                                                <td>
                                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("MaLoai", "~/ListProduct.aspx?MaSach={0}") %>' 
                                                        Text='<%# Eval("TenSach") %>'></asp:HyperLink>
                                                </td>
                                            </tr>
                                            tr>
                                                <td>
                                                    <asp:Image ID="Image1" runat="server" Height="100px" 
                                                         Width="100px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Giá:
                                                    <asp:Label ID="GiaLabel" runat="server" ForeColor="#CC0000" 
                                                        />
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td>
                                                    <asp:Image ID="Image2" runat="server" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>

                            </table>
                        </ItemTemplate>
                         <SelectedItemStyle BackColor="#CC66FF" />
                    </asp:DataList>
     <tr>
                <td>
                    <cc1:CollectionPager ID="CollectionPager1" runat="server" MaxPages="10"
                        PageSize="3" PagingMode="PostBack" SectionPadding="10" SliderSize="10">
                    </cc1:CollectionPager>
                </td>
            </tr>
</asp:Content>

