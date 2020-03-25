<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ArchiveLocation.aspx.cs" Inherits="Admin_ArchiveLocation" %>

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
                alert("No records to be delete!");
                return;
            }
            else
            {
                return confirm("Do you want to delete " + count + " item(s)?");
            }        
        }
    </script>
    <style type="text/css">
        .locationIcon{
            margin-top:100px;
            margin-left:150px;
        }
        .locationTab{
            margin-left:180px;
            margin-top:-30px;
        }
        .locationSearch{
            margin-left:180px;
        }
        .locationTable{
            margin-left:180px;
        }
        .locationCount {
            width: 500px;
        }
    </style>
    <!--Wrapper-->
     <div>
        <div class="locationIcon">
            <table>
                <tr>
                    <td>
                        <span class="glyphicon glyphicon-home" style="font-size:20px"></span>
                    </td>
                </tr>
            </table>
        </div>
        <div class="locationTab">
            <table>
                <tr>
                    <td>
                        <h4 style="width:500px">Archive Locations</h4>
                    </td>
                </tr>
            </table>
        </div>
        <div class="locationSearch">
            <div class="form-group">
                <table>
            <tr>
                <td><asp:TextBox ID="txtSearchLocation" runat="server" PlaceHolder="Search Location" Width="266px" CssClass="form-control"></asp:TextBox></td>
                <td></td>
                <td><asp:Button ID="btnSearchLocation" runat="server" Text ="Search Location" CssClass="btn btn-primary" style="margin-left:10px" OnClick="btnSearchLocation_Click"/></td>
                <td></td>
                <td><asp:Button ID="btnClearSearch" runat="server" Text ="Clear" Width="119px" CssClass="btn btn-success" style="margin-left:10px" OnClick="btnClearSearch_Click" /></td>
                <td></td>
                <td><asp:Button ID="btnExcelExport" runat="server" Text="Excel Export" CssClass="btn btn-warning" style="margin-left:10px" OnClick="btnExcelExport_Click" /></td>
                <td></td>
                <td><asp:Button ID="btnDelete" runat="server" OnClientClick="confirmDelete();" Text="Delete" CssClass="btn btn-danger" style="margin-left:10px" Width="71px" OnClick="btnDelete_Click" /><asp:HiddenField ID="hfCount" runat="server" Value="0" /></td>
                <td></td>
                <td><asp:LinkButton ID="btnAddLocation" runat="server" CssClass="btn btn-default" style="margin-left:10px; background-color:#fff97a" OnClick="btnAddLocation_Click"><span class="glyphicon glyphicon-home"></span> Add Location</asp:LinkButton></td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:RegularExpressionValidator ID ="regex" runat="server" ErrorMessage="No records found!" ForeColor="#ff0000" ControlToValidate="txtSearchLocation" ValidationExpression="[a-zA-Z0-9!/ ]*$"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
            </div>
            <div class="locationCount">
                <table>
                    <tr>
                        <td>
                            Archived Locations:<asp:Label ID="lblArchiveLocationCount" runat="server" Text="Label" Visible="false" />
                        </td>
                    </tr>
                </table>
            </div>
            <div>
                <table>
                    <tr>
                        <td>
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="1058px">
                                <Columns>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chkAll" runat="server" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkRow" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="LocationName" HeaderText="Location" SortExpression="LocationName" />
                                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone #" SortExpression="PhoneNumber" />
                                    <asp:BoundField DataField="FaxNumber" HeaderText="Fax #" SortExpression="FaxNumber" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
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
                                <EmptyDataRowStyle ForeColor="#ffffff" HorizontalAlign="Center" Font-Bold="true" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Point_Of_SalesConnectionString %>" SelectCommand="SELECT * FROM [Archived_Location]"></asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </div>
            </div>
            </div>
</asp:Content>

