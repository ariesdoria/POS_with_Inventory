<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="SalesList.aspx.cs" Inherits="Admin_SalesList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
    function confirmArchive()
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
                alert("No records to be archived!");
                return;
            }
            else
            {
                return confirm("Do you want to put " + count + " item(s) on archive list?");
            }        
        }
    </script>
    <style type="text/css">
         .salesIcon{
            margin-top:100px;
            margin-left:150px;
        }
        .salesTab{
            margin-left:180px;
            margin-top:-30px;
        }
        .salesSearch{
            margin-left:180px;
        }
        .salesTable{
            margin-left:180px;
        }
        .salesCount{
            margin-left:180px;
            width:500px;
        }
    </style>
    <!--Wrapper-->
     <div>
        <div class="salesIcon">
            <table>
                <tr>
                    <td>
                        <span class="glyphicon glyphicon-shopping-cart" style="font-size:20px"></span>
                    </td>
                </tr>
            </table>
        </div>   
    <div class="salesTab">
        <table>
            <tr><td><h4>Sales</h4></td>
            </tr>
        </table>
    </div>
        <br />
        <div class="salesSearch">
            <div class="form-group">
                 <table>
            <tr>
                <td>
                    <asp:TextBox ID="txtSearchSales" runat="server" CssClass="form-control" PlaceHolder="Search Sales" Width="198px" />
                </td>
                <td></td>
                <td><asp:Button ID="btnSearchSales" runat="server" CssClass="btn btn-primary" style="margin-left:10px" Text="Search Sales" OnClick="btnSearchSales_Click" /></td>
                <td></td>
                <td><asp:Button ID="btnClearSearch" runat="server" CssClass="btn btn-success" style="margin-left:10px" Text="Clear" Width="119px" OnClick="btnClearSearch_Click" /></td>
                <td></td>
                <td><asp:Button ID="btnArchive" runat="server" OnClientClick="confirmArchive();" CssClass="btn btn-info" style="margin-left:10px" Text="Archive" Width="80px" OnClick="btnArchive_Click" /><asp:HiddenField ID="hfCount" runat="server" Value="0" /></td>
                <td></td>
                <td><asp:Button ID="btnExcelExport" runat="server" Text="Export to Excel" CssClass="btn btn-warning" style="margin-left:10px" OnClick="btnExcelExport_Click" /></td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:RegularExpressionValidator ID="regex" runat="server" ErrorMessage="No records found!" ControlToValidate="txtSearchSales" ValidationExpression="[a-zA-Z0-9!/ ]*$" ForeColor="#ff0000"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
            </div>
        </div>
           <div class="salesCount">
               <table>
                   <tr>
                       <td>
                           Total Sales:<asp:Label ID="lblSalesCount" runat="server" Visible="false" Text="Label" /><asp:LinkButton ID="btnCleanup" runat="server" CssClass="btn btn-default" style="margin-left:10px; background-color:#deb887" OnClick="btnCleanup_Click"><span class="glyphicon glyphicon-trash"></span> Cleanup old sales</asp:LinkButton>
                       </td>
                   </tr>
               </table>
           </div> 
         <br />
         <div class="salesTable">
             <table>
                 <tr>
                     <td>
                         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" Width="845px">
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
                                 <asp:BoundField DataField="DateSold" HeaderText="Date Sold" SortExpression="DateSold" />
                                 <asp:BoundField DataField="Quantity_Sold" HeaderText="Quantity Sold" SortExpression="Quantity_Sold" />
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
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Point_Of_SalesConnectionString %>" SelectCommand="SELECT * FROM [Sales]"></asp:SqlDataSource>
                     </td>
                 </tr>
             </table>
         </div>
         </div>
</asp:Content>

