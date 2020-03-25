<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ArchiveEmployee.aspx.cs" Inherits="Admin_ArchiveEmployee" %>

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
        .employeeCount {
            margin-left: 180px;
            width: 500px;
        }
    </style>
    <!--Wrapper-->
     <div>
        <div class="employeeIcon">
            <table>
                <tr>
                    <td>
                        <span class="glyphicon glyphicon-user" style="font-size:20px"></span>
                    </td>
                </tr>
            </table>
        </div>

        <div class="employeeTab">
            <table>
                <tr>
                    <td>
                        <h4 style="width:500px">Archive Employees</h4>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="employeeSearch">
            <div class="form-group">
                 <table>
            <tr>
                <td><asp:TextBox ID="txtSearchEmployee" runat="server" PlaceHolder="Search Employee" CssClass="form-control" Width="247px"></asp:TextBox></td>
                <td></td>
                <td><asp:Button ID="btnSearchEmployee" runat="server" Text="Search Employee" CssClass="btn btn-primary" style="margin-left:10px" OnClick="btnSearchEmployee_Click"/></td>
                <td></td>
                <td><asp:Button ID="btnClearSearch" runat="server" Text="Clear" Width="119px" CssClass="btn btn-success" style="margin-left:10px" OnClick="btnClearSearch_Click" /></td>
                <td></td>
                <td><asp:Button ID="btnExcelExport" runat="server" Text="Excel Export" CssClass="btn btn-warning" style="margin-left:10px" OnClick="btnExcelExport_Click" /></td>
                <td></td>
                <td><asp:Button ID="btnDelete" runat="server" OnClientClick="confirmDelete();" CssClass="btn btn-danger" style="margin-left:10px" Text="Delete" OnClick="btnDelete_Click"/><asp:HiddenField ID="hfCount" runat="server" Value="0" /></td>
                <td></td>
                <td><asp:LinkButton ID="btnAddEmployee" runat="server" PostBackUrl="~/Admin/AddEmployee.aspx" CssClass="btn btn-default" style="margin-left:10px; background-color:#fff97a" OnClick="btnAddEmployee_Click"><span class="glyphicon glyphicon-user"></span> Add Employee</asp:LinkButton></td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:RegularExpressionValidator ID="regex" runat="server" ErrorMessage="No records found!" ForeColor="#ff0000" ControlToValidate="txtSearchEmployee" ValidationExpression="[a-zA-Z0-9!/ ]*$"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
            </div>
        </div>
        <div class="employeeCount">
            <table>
                <tr>
                    <td>
                        Archived Employees:<asp:Label ID="lblArchiveEmployeeCount" runat="server" Visible="false" Text="Label" />
                    </td>
                </tr>
            </table>
        </div>
    </div>   
    <div class="employeeTable">
        <table>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" Width="1043px">
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
                            <asp:BoundField DataField="empLocation" HeaderText="Location" SortExpression="empLocation" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Point_Of_SalesConnectionString %>" SelectCommand="SELECT * FROM [Archived_Employee]"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

