<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="CustomerList.aspx.cs" Inherits="Admin_CustomerList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        function confirmArchive() {
            var count = document.getElementById("<%=hfCount.ClientID%>").value;
            var gv = document.getElementById("<%=GridView1.ClientID%>");
            var chkRow = gv.getElementsByTagName("input");
            for (var i = 0; i < chkRow.length; i++) {
                if (chkRow[i].checked && chkRow[i].id.indexOf("chkAll") == -1) {
                    count++
                }
            }
            if (count == 0) {
                alert("No records to be archived");
                return;
            }
            else {
                return confirm("Do you want to put " + count + "item(s) on the archive list?");
            }
        }
    </script>
    <style type="text/css">
        .customerIcon{
            margin-top:100px;
            margin-left:150px;
        }
        .customerTab{
            margin-left:180px;
            margin-top:-30px;
        }
        .customerSearch{
            margin-left:180px;
        }
        .customerTable{
            margin-left:180px;
        }
        .customerCount{
            margin-left:180px;
            width:500px;
        }
    </style>
    <div>
        <div class="customerIcon">
            <table>
                <tr>
                    <td><span class="glyphicon glyphicon-user" style="font-size:20px"></span></td>
                </tr>
            </table>
        </div>
        <div class="customerTab">
            <table>
                <tr>
                    <td>
                        <h4>Customers</h4>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="customerSearch">
            <div class="form-group">
                <table>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtSearchCustomer" runat="server" PlaceHolder="Search Customers" Width="198px" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td></td>
                        <td>
                            <asp:Button ID="btnSearch" runat="server" Text="Search Customer" CssClass="btn btn-primary" style="margin-left:10px" OnClick="btnSearch_Click" />
                        </td>
                        <td></td>
                        <td>
                            <asp:Button ID="btnClearSearch" runat="server" Text="Clear" Width="119px" CssClass="btn btn-success" style="margin-left:10px" OnClick="btnClearSearch_Click" />
                        </td>
                        <td></td>
                        <td>
                            <asp:Button ID="btnArchive" runat="server" Text="Archive" CssClass="btn btn-info" style="margin-left:10px" OnClientClick="confirmArchive();" OnClick="btnArchive_Click" />
                            <asp:HiddenField ID="hfCount" runat="server" Value="0" />
                        </td>
                        <td></td>
                        <td>
                            <asp:Button ID="btnExcelExport" runat="server" CssClass="btn btn-warning" style="margin-left:10px" Text="Export to Excel" OnClick="btnExcelExport_Click" />
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:RegularExpressionValidator ID="regex" runat="server" ErrorMessage="No records found!" ForeColor="#ff0000" ControlToValidate="txtSearchCustomer" ValidationExpression="[a-zA-Z0-9!/ ]*$">
                            </asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="customerCount">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblTotalCustomers" runat="server" Text="Total Customers:"></asp:Label>
                        <asp:Label ID="lblCustomerCount" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <div class="customerTable">
            <table>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" Width="892px">
                            <Columns>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chkAll" runat="server" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkRow" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname" />
                                <asp:BoundField DataField="Lastname" HeaderText="Lastname" SortExpression="Lastname" />
                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                <asp:BoundField DataField="PhoneNumber" HeaderText="Phone" SortExpression="PhoneNumber" />
                                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                                <asp:BoundField DataField="CompanyName" HeaderText="Company" SortExpression="CompanyName" />
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Point_Of_SalesConnectionString %>" SelectCommand="SELECT * FROM [Customer]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

