<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ArchiveStocks.aspx.cs" Inherits="Admin_ArchiveStocks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <script type="text/javascript">
    function confirmDelete()
        {
             var count = document.getElementById("<%=hfCount.ClientID %>").value;
            var gv = document.getElementById("<%=GridView1.ClientID%>");
            var chkRow = gv.getElementsByTagName("input");
            for (var i = 0; i < chkRow.length; i++)
            {
                if(chkRow[i].checked && chkRow[i].id.indexOf("chkAll") == -1 )
                {
                    count++;
                }
            }
            if(count == 0)
            {
                alert("No records to delete!");
                return;
            }
            else
            {
                return confirm("Do you want to delete " + count + " item(s)?");
            }        
        }
    </script>
    <style type="text/css">
         .itemIcon{
            margin-top:100px;
            margin-left:150px;
        }
        .itemTab{
            margin-left:180px;
            margin-top:-30px;
        }
        .itemSearch{
            margin-left:180px;
        }
        .itemTable{
            margin-left:180px;
        }
        .itemCount{
            width:500px;
        }
    </style>
    <!--Wrapper-->
    <div>    
        <div class="itemIcon">
            <table>
                <tr>
                    <td>
                        <span class="glyphicon glyphicon-inbox" style="font-size:20px"></span>
                    </td>
                </tr>
            </table>
        </div>

        <div class="itemTab">
            <table>
                <tr>
                    <td>
                        <h4 style="width:500px">Archive Stocks</h4>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="itemSearch">
            <div class="form-group">
                 <table>
            <tr>
                <td>
                    <asp:TextBox ID="txtSearchItem" runat="server" PlaceHolder="Search Item" CssClass="form-control" Width="226px"></asp:TextBox>
                </td>
                <td></td>
                <td><asp:Button ID="btnSearchItem" runat="server" Text="Search Item" CssClass="btn btn-primary" style="margin-left:10px" OnClick="btnSearchItem_Click" /></td>
                <td></td>
                <td><asp:Button ID="btnClearSearch" runat="server" Text="Clear" Width="119px" CssClass="btn btn-success" style="margin-left:10px" OnClick="btnClearSearch_Click" /></td>
                <td></td>
                <td><asp:Button ID="btnExcelExport" runat="server" Text="Excel Export" CssClass="btn btn-warning" style="margin-left:10px" OnClick="btnExcelExport_Click" /></td>
                <td></td>
                <td><asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger" style="margin-left:10px" OnClientClick="confirmDelete();" Text="Delete" Width="71px" OnClick="btnDelete_Click" /><asp:HiddenField ID="hfCount" runat="server" Value="0" /></td>
                <td></td>
                <td><asp:LinkButton ID="btnAddItem" runat="server" CssClass="btn btn-default" Width="101px" style="margin-left:10px; background-color:#fff97a" OnClick="btnAddItem_Click"><span class="glyphicon glyphicon-inbox"></span> Add Item</asp:LinkButton></td>
            </tr>
        </table>
        <table>
            <tr>
               <td>
                   <asp:RegularExpressionValidator ID="regex" runat="server" ErrorMessage="No records found!" ForeColor="#ff0000" ControlToValidate="txtSearchItem" ValidationExpression="[a-zA-Z0-9!/ ]*$" ></asp:RegularExpressionValidator>
               </td>
            </tr>
        </table>
            </div>
        <div class="itemCount">
            <table>
                <tr>
                   <td>
                       Archived Items:<asp:Label ID="lblArchiveItemCount" runat="server" Text="Label" Visible="false" />
                   </td>
                </tr>
            </table>
        </div>  
        <div>
            <table>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="986px">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkAll" runat="server" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkRow" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ItemName" HeaderText="Item Name" SortExpression="ItemName" />
                                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                                <asp:BoundField DataField="CostPrice" HeaderText="Cost Price" SortExpression="CostPrice" />
                                <asp:BoundField DataField="SellingPrice" HeaderText="Selling Price" SortExpression="SellingPrice" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                <asp:BoundField DataField="RemainingStock" HeaderText="Remaining Stock" SortExpression="RemainingStock" />
                                <asp:BoundField DataField="DatePurchased" HeaderText="Date Purchased" SortExpression="DatePurchased" />
                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
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
                                <EmptyDataRowStyle ForeColor="#ffffff" Font-Bold="true" HorizontalAlign="Center" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Point_Of_SalesConnectionString %>" SelectCommand="SELECT * FROM [Archived_Stocks]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
        </div>
        </div>
</asp:Content>

