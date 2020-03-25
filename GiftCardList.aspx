<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EmployeeMasterPage.master" AutoEventWireup="true" CodeFile="GiftCardList.aspx.cs" Inherits="Employee_GiftCardList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <style type="text/css">
        .giftCardIcon{
            margin-top:100px;
            margin-left:150px;
        }
        .giftCardTab{
            margin-left:180px;
            margin-top:-30px;
        }
        .giftCardSearch{
            margin-left:180px;
        }
        .giftCardTable{
            margin-left:180px;
        }
    </style>
    <div>
        <div class="giftCardIcon">
            <table>
                <tr>
                    <td>
                        <span class="glyphicon glyphicon-gift" style="font-size:20px"></span>
                    </td>
                </tr>
            </table>
        </div>
        <div class="giftCardTab">
             <table>
             <tr>
                 <td><h4>Giftcards</h4></td>                
            </tr>
        </table>
        </div>       
        <br />
        <div class="giftCardSearch"> 
            <div class="form-group">
            <table>
                <tr>
                    <td><asp:TextBox ID="txtSearchGiftcard" runat="server" PlaceHolder="Search Giftcard" Width="245px" CssClass="form-control"/></td>
                    <td></td>
                    <td><asp:Button ID="btnSearchGiftcard" runat="server" style="margin-left:10px" CssClass="btn btn-primary" Text="Search" Width="96px" OnClick="btnSearchGiftcard_Click" /></td>
                    <td></td>
                    <td><asp:Button ID="btnClearEntries" runat="server" style="margin-left:10px" CssClass="btn btn-warning" Text="Clear Entries" OnClick="btnClearEntries_Click" /></td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        <asp:RegularExpressionValidator ID="regex" runat="server" ErrorMessage="No records found!" ValidationExpression="[a-zA-Z0-9!/ ]*$" ControlToValidate="txtSearchGiftCard" ForeColor="#ff0000"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
            </div>
        </div>   
        <div class="giftCardTable">
            <table>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" ShowHeaderWhenEmpty="true" EmptyDataText="There are no available giftcards!" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="Giftcard_Number" DataSourceID="SqlDataSource1" Width="763px">
                            <Columns>
                                <asp:BoundField DataField="Giftcard_Number" HeaderText="Giftcard #" ReadOnly="True" ItemStyle-HorizontalAlign="Center" SortExpression="Giftcard_Number" />
                                <asp:BoundField DataField="Giftcard_Value" HeaderText="Giftcard Value" ItemStyle-HorizontalAlign="Center" SortExpression="Giftcard_Value" />
                                <asp:BoundField DataField="Customer" HeaderText="Customer" ItemStyle-HorizontalAlign="Center" SortExpression="Customer" />
                                <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-HorizontalAlign="Center" SortExpression="Status" />
                                <asp:HyperLinkField DataNavigateUrlFields="Giftcard_Number" DataNavigateUrlFormatString="~/Employee/ViewGiftcard.aspx?Giftcard_Number={0}" NavigateUrl="~/Employee/ViewGiftcard.aspx" HeaderText="View Giftcard" Text="View Giftcard" />
                            </Columns>
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FFF1D4" />
                            <SortedAscendingHeaderStyle BackColor="#B95C30" />
                            <SortedDescendingCellStyle BackColor="#F1E5CE" />
                            <SortedDescendingHeaderStyle BackColor="#93451F" />
                            <EmptyDataRowStyle ForeColor="#ffffff" HorizontalAlign="Center" Font-Bold="true" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Point_Of_SalesConnectionString %>" SelectCommand="SELECT * FROM [Giftcard]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>

