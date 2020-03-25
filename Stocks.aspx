<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Stocks.aspx.cs" Inherits="Admin_Stocks" %>
<%@Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        function confirmArchive() {
            var count = document.getElementById("<%=hfCount.ClientID %>").value;
            var gv = document.getElementById("<%=GridView1.ClientID%>");
            var chkRow = gv.getElementsByTagName("input");
            for (var i = 0; i < chkRow.length; i++) {
                if (chkRow[i].checked && chkRow[i].id.indexOf("chkAll") == -1) {
                    count++;
                }
                if (count == 0) {
                    alert("No records to be archived!");
                    return;
                }
                else {
                    return confirm("Do you want to put " + count + "item(s) on archive list?");
                }
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
        .modalBackground{
            background-color:black;
            filter:alpha(opacity=90);
            opacity:0.8;
        }
        .modalPopup{
            border-width:2px;
            border-style:solid;
            padding-top:10px;
            padding-left:10px;
        }
    </style>
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
                        <h4>Stocks</h4>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <!--Item Table-->
        <div class="itemSearch">
            <div class="form-group">
                <table>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtSearchItem" runat="server" CssClass="form-control" PlaceHolder="Search Item" Width="226px"></asp:TextBox>
                                </td>
                                <td></td>
                                <td>
                                    <asp:Button ID="btnSearchItem" runat="server" CssClass="btn btn-primary" style="margin-left:10px" Text="Search Item" />
                                </td>
                                <td></td>
                                <td>
                                    <asp:Button ID="btnClearSearch" runat="server" CssClass="btn btn-success" style="margin-left:10px" Text="Clear" Width="119px" />
                                </td>
                                <td></td>
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <td>
                                    <asp:Button ID="btnBulkUpdate" runat="server" style="margin-left:10px" CssClass="btn btn-danger" Text="Bulk Update" />
                                </td>
                                <td></td>
                                <td>
                                    <asp:Button ID="btnArchive" runat="server" style="margin-left:10px" CssClass="btn btn-info" OnClientClick="confirmArchive();" Text="Archive" Width="71px" />
                                    <asp:HiddenField ID="hfCount" runat="server" Value="0" />
                                </td>
                                <td></td>
                                <td>
                                    <asp:Button ID="btnExcelExport" runat="server" style="margin-left:10px" CssClass="btn btn-warning" Text="Export to Excel" />
                                </td>
                                <td></td>
                                <td>
                                    <asp:LinkButton ID="btnAddItem" runat="server" CssClass="btn btn-default" style="margin-left:10px; background-color:#fff97a" Width="101px">
                                        <span class="glyphicon glyphicon-inbox"></span>
                                        Add Item
                                    </asp:LinkButton>
                                </td>
                                <td></td>
                                <td></td>
                            </tr>
                            </table>
                            <cc1:ModalPopupExtender ID="mpStocks" runat="server" TargetControlID="btnBulkUpdate" PopupControlID="Panel1" CancelControlID="btnClose" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>
                            <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" style="display:none; align-content:center">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Update Items</h4>
                                        </div>
                                        <div class="modal-body">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblItemName" runat="server" Text="Item Name:" style="margin-left:10px"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtItemName" runat="server" CssClass="form-control" Width="400px" style="margin-left:5px"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblCategory" runat="server" Text="Category:" style="margin-left:10px;margin-top:5px"></asp:Label>"
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtItemCategory" runat="server" CssClass="form-control" Width="400px" style="margin-left:5px;margin-top:5px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblDescription" runat="server" Text="Description:" style="margin-left:10px;margin-top:5px"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" Width="400px" style="margin-left:5px; margin-top:5px; resize:none" TextMode="MultiLine"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblCost" runat="server" Text="Cost Price:" style="margin-left:10px; margin-top:5px"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtCostPrice" runat="server" CssClass="form-control" Width="400px" style="margin-left:5px; margin-top:5px"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblSell" runat="server" Text="Selling Price:" style="margin-left:10px; margin-top:5px"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtSellingPrice" runat="server" CssClass="form-control" Width="400px" style="margin-left:5px; margin-top:5px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblQuantity" runat="server" Text="Quantity:" style="margin-left:10px; margin-top:5px"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" Width="400px" style="margin-left:5px; margin-top:5px"/>
                                                    </td>
                                                </tr>
                                                <tr><td></td></tr>
                                                <tr><td></td></tr>
                                                <tr>
                                                    <td></td>
                                                    <td>
                                                        <asp:Button id="btnUpdateItem" style="margin-top:10px;" CssClass="btn btn-success" Text="Update Item" runat="server" />
                                                        <asp:Button ID="btnClose" style="margin-top:10px; margin-left:30px" Width="100px" CssClass="btn btn-warning" Text="Close" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            <table>
                                <tr>
                                    <td>
                                        <asp:RegularExpressionValidator ID="regex" runat="server" ErrorMessage="No records found!" ControlToValidate="txtSearchItem" ValidationExpression="[a-zA-Z0-9/! ]*$" ForeColor="#ff0000"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                            </table>
                            </div>
                            <div class="itemCount">
                                <table>
                                    <tr>
                                        <td>
                                            Total Items:<asp:Label ID="lblItemCount" runat="server" Visible="false" Text="Label" />
                                            <asp:LinkButton ID="btnCleanup" runat="server" CssClass="btn btn-default" style="margin-left:10px; background-color:#deb887">
                                            <span class="glyphicon glyphicon-trash"></span> 
                                            Cleanup Old Stocks
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <br />
                            <div>
                                <table>
                                    <tr>
                                        <td>
                                           <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            <asp:CheckBox ID="chkAll" runat="server" />
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkRow" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="ItemName" HeaderText="Item" SortExpression="ItemName" />
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
                                                    <EmptyDataRowStyle Font-Bold="true" HorizontalAlign="Center" ForeColor="#ffffff" />
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Point_Of_SalesConnectionString %>" SelectCommand="SELECT * FROM [Stocks]"></asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="" />
                            <asp:AsyncPostBackTrigger ControlID="btnBulkupdate" />
                        </Triggers>
                    </asp:UpdatePanel>
                </table>
            </div>
        </div>
    </div>
    </asp:Content>

