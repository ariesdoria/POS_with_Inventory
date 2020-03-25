﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ArchiveReturnedItems.aspx.cs" Inherits="Admin_ArchiveReturnedItems" %>

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
         .returnIcon{
            margin-top:100px;
            margin-left:150px;
        }
        .returnTab{
            margin-left:180px;
            margin-top:-30px;
        }
        .returnSearch{
            margin-left:180px;
        }
        .returnTable{
            margin-left:180px;
        }
        .returnCount{
            margin-left:180px;
            width:500px;
        }
    </style>
    <!--Wrapper-->
     <div>
        <div class="returnIcon">
            <table>
                <tr>
                    <td>
                        <span class="glyphicon glyphicon-list-alt" style="font-size:20px"></span>
                    </td>
                </tr>
            </table>
        </div>
        <div class="returnTab">
            <table>
                <tr>
                    <td>
                        <h4 style="width:500px">Archive Returned Items</h4>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="returnSearch">
            <div class="form-group">
                    <table>
            <tr>
                <td><asp:TextBox ID="txtSearchReturnedItem" runat="server" PlaceHolder="Search Returned Item" Width="198px" CssClass="form-control" style="margin-left:10px" /></td>
                <td></td>
                <td><asp:Button ID="btnSearchReturnedItem" runat="server" Text="Search Returned Item" CssClass="btn btn-primary" style="margin-left:10px" OnClick="btnSearchReturnedItem_Click"/></td>
                <td></td>
                <td><asp:Button ID="btnClearSearch" runat="server" Text="Clear" Width="119px" CssClass="btn btn-success" style="margin-left:10px" OnClick="btnClearSearch_Click" /></td>
                <td></td>
                <td><asp:Button ID="btnExcelExport" runat="server" Text="Excel Export" CssClass="btn btn-warning" style="margin-left:10px" OnClick="btnExcelExport_Click" /></td>
                <td></td>
                <td><asp:Button ID="btnDelete" runat="server" OnClientClick="confirmDelete();" CssClass="btn btn-danger" style="margin-left:10px" Text="Delete" Width="85px" OnClick="btnDelete_Click" /><asp:HiddenField ID="hfCount" runat="server" Value="0" /></td>
                <td></td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:RegularExpressionValidator ID="regex" ForeColor="#ff0000" runat="server" ControlToValidate="txtSearchReturnedItem" ErrorMessage="No records found!" ValidationExpression="[a-zA-Z0-9!/ ]*$"></asp:RegularExpressionValidator> 
                </td>
            </tr>
        </table>
            </div>
        </div>
        <div class="returnCount">
            <table>
                <tr>
                    <td>
                        Archived Returned Items:<asp:Label ID="lblArchiveReturnedItemCount" runat="server" Text="Label" Visible="false" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="returnTable">
            <table>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="922px">
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
                                <asp:BoundField DataField="CostPrice" HeaderText="CostPrice" SortExpression="CostPrice" />
                                <asp:BoundField DataField="SellingPrice" HeaderText="Selling Price" SortExpression="SellingPrice" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                <asp:BoundField DataField="Condition" HeaderText="Condition" SortExpression="Condition" />
                                <asp:BoundField DataField="DateReturned" HeaderText="Date Returned" SortExpression="DateReturned" />
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Point_Of_SalesConnectionString %>" SelectCommand="SELECT * FROM [Archived_Item_Return]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
        </div>
</asp:Content>

