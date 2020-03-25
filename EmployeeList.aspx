<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="EmployeeList.aspx.cs" Inherits="Admin_EmployeeList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        function confirmArchive() {
            var count = document.getElementById("<%=hfCount.ClientID%>").value;
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
        .employeeIcon{
            margin-top:100px;
            margin-left:150px;
        }
        .employeeTab{
            margin-left:180px;
            margin-top:-30px;
        }
        .employeeSearch{
            margin-left:180px;
        }
        .employeeTable{
            margin-left:180px;
        }
        .employeeCount{
            margin-left:180px;
            width:500px;
        }
    </style>
    <div>
        <div class="employeeIcon">
            <table>
                <tr>
                    <td><span class="glyphicon glyphicon-user" style="font-size:20px"></span></td>
                </tr>
            </table>
        </div>
        <div class="employeeTab">
            <table>
                <tr>
                    <td>
                        <h4>Employees</h4>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="employeeSearch">
            <div class="form-group">
                <table>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtSearchEmployee" runat="server" CssClass="form-control" PlaceHolder="Search Employee" Width="247px"></asp:TextBox>
                        </td>
                        <td></td>
                        <td>
                            <asp:Button ID="btnSearchEmployee" runat="server" CssClass="btn btn-primary" style="margin-left:10px" Text="Search Employee" OnClick="btnSearchEmployee_Click" />
                       </td>
                        <td></td>
                        <td>
                            <asp:Button ID="btnClearSearch" runat="server" CssClass="btn btn-success" style="margin-left:10px" Text="Clear" Width="119px" OnClick="btnClearSearch_Click" />
                        </td>
                        <td></td>
                        <td>
                            <asp:Button ID="btnArchive" runat="server" CssClass="btn btn-info" style="margin-left:10px" Text="Archive" OnClientClick="confirmArchive();" OnClick="btnArchive_Click" />
                            <asp:HiddenField ID="hfCount" runat="server" Value="0" />
                        </td>
                        <td></td>
                        <td>
                            <asp:Button ID="btnExcelExport" CssClass="btn btn-warning" style="margin-left:10px" runat="server" Text="Export to Excel" OnClick="btnExcelExport_Click" />
                        </td>
                        <td></td>
                        <td>
                            <asp:LinkButton ID="lbAddEmployee" runat="server" CssClass="btn btn-default" style="margin-left:10px;background-color:#fff97a" OnClick="lbAddEmployee_Click"><span class="glyphicon glyphicon-user"></span> Add Employee</asp:LinkButton>
                        </td>
                        <td></td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:RegularExpressionValidator ID="regex" runat="server" ErrorMessage="No records found!" ValidationExpression="[a-zA-Z0-9!/ ]*$" ControlToValidate="txtSearchEmployee" ForeColor="#ff0000">
                            </asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </table>
            </div>
            </div>
            <div class="employeeCount">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lbltotalEmployees" runat="server" Text="Total Employees:"></asp:Label>
                            <asp:Label ID="lblEmployeeCount" runat="server" Text="Label" Visible="false"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            </div>
            <div class="employeeTable">
                <table>
                    <tr>
                        <td>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="1030px" AllowPaging="True">
                                <Columns>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chkAll" runat="server" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkRow" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="empAccountNumber" HeaderText="Account #" SortExpression="empAccountNumber" />
                                    <asp:BoundField DataField="empFirstname" HeaderText="Firstname" SortExpression="empFirstname" />
                                    <asp:BoundField DataField="empLastname" HeaderText="Lastname" SortExpression="empLastname" />
                                    <asp:BoundField DataField="empGender" HeaderText="Gender" SortExpression="empGender" />
                                    <asp:BoundField DataField="empPhone" HeaderText="Phone #" SortExpression="empPhone" />
                                    <asp:BoundField DataField="date_hired" HeaderText="Date Hired" SortExpression="date_hired" />
                                    <asp:BoundField DataField="empStatus" HeaderText="Status" SortExpression="empStatus" />
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Point_Of_SalesConnectionString %>" SelectCommand="SELECT * FROM [Employee]"></asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </div>
</asp:Content>

