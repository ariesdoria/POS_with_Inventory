<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EmployeeMasterPage.master" AutoEventWireup="true" CodeFile="Stocks.aspx.cs" Inherits="Employee_Stocks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <style type="text/css">
        .StockIcon{
            margin-top:100px;
            margin-left:150px;
        }
        .StockTab{
            margin-left:180px;
            margin-top:-30px;
        }
        .StockSearh{
            margin-left:180px;
        }
        .StockTable{
            margin-left:180px;
        }
    </style>
    <div>
        <div class="StockIcon">
            <table>
                <tr>
                    <td>
                        <span class="glyphicon glyphicon-list-alt" style="font-size:20px"></span>
                    </td>
                </tr>
            </table>
        </div>

        <div class="StockTab">
            <table>
                <tr>
                  <td><h4>Items</h4></td>                              
                </tr>
            </table>
        </div>
        <br />

        <div class="StockSearh">
            <div class="form-group">
                <table>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtSearchItem" runat="server" PlaceHolder="Search Item" Width="226px" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td></td>
                        <td><asp:Button ID="btnSearchItem" runat="server" style="margin-left:10px" CssClass="btn btn-primary" Text="Search" OnClick="btnSearchItem_Click" /></td>
                        <td></td>
                        <td><asp:Button ID="btnClearSearch" runat="server" style="margin-left:10px" CssClass="btn btn-warning" Text="Clear Entries" Width="110px" OnClick="btnClearSearch_Click" /></td>
                        <td></td>                
                   </tr>
               </table>        
            <table>
                    <tr>
                        <td>
                            <asp:RegularExpressionValidator ID="regex" runat="server" ErrorMessage="No records found!" ControlToValidate="txtSearchItem" ValidationExpression="[a-zA-Z0-9/! ]*$" ForeColor="#ff0000"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
            </table>
            </div>
        </div>

        <div class="StockTable">
            <table>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" ShowHeaderWhenEmpty="True" EmptyDataText="No records found!" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="ProductID" DataSourceID="SqlDataSource1" Width="1000px">
                            <Columns>
                                <asp:BoundField DataField="ProductID" HeaderText="Product #" ItemStyle-HorizontalAlign="Center" ReadOnly="True" SortExpression="ProductID" />
                                <asp:BoundField DataField="ItemName" HeaderText="Item Name" ItemStyle-HorizontalAlign="Center" SortExpression="ItemName" />
                                <asp:BoundField DataField="SellingPrice" HeaderText="Price" ItemStyle-HorizontalAlign="Center" SortExpression="SellingPrice" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" ItemStyle-HorizontalAlign="Center" SortExpression="Quantity" />
                                <asp:BoundField DataField="RemainingStock" HeaderText="Remaining Stock" SortExpression="RemainingStock" />
                                <asp:HyperLinkField DataNavigateUrlFields="ProductID" ItemStyle-HorizontalAlign="Center" DataNavigateUrlFormatString="~/Employee/ViewItem.aspx?ProductID={0}" NavigateUrl="~/Employee/ViewItem.aspx" HeaderText="View Item" Text="View Record" />
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
                            <EmptyDataRowStyle Font-Bold="true" HorizontalAlign="Center" ForeColor="#ffffff" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Point_Of_SalesConnectionString %>" SelectCommand="SELECT * FROM [Stocks]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>

