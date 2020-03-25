<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AnnouncementList.aspx.cs" Inherits="Admin_AnnouncementList" %>

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
         .announcementIcon{
            margin-top:100px;
            margin-left:150px;
        }
        .announcementTab{
            margin-left:180px;
            margin-top:-30px;
        }
        .announcementSearch{
            margin-left:180px;
        }
        .announcementTable{
            margin-left:180px;
        }
        .announcementCount{
            margin-left:180px;
            width:500px;
        }
    </style>
    <!--Wrapper-->
    <div>
        <div class="announcementIcon">
            <table>
                <tr>
                    <td>
                        <span class="glyphicon glyphicon-envelope"></span>
                    </td>
                </tr>
            </table>
        </div>
        <div class="announcementTab">
            <table>
                <tr>
                    <td>
                        <h4>Announcements</h4>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="announcementSearch">
            <div class="form-group">
                <table>
            <tr>
                <td>
                    <asp:TextBox ID="txtSearchAnnouncement" runat="server" CssClass="form-control" PlaceHolder="Search Announcement" Width="198px"></asp:TextBox>
                </td>     
                <td></td>
                <td><asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" style="margin-left:10px" Text="Search Announcement" OnClick="btnSearch_Click"/></td>
                <td></td>
                <td><asp:Button ID="btnClearSearch" runat="server" Text="Clear" Width="119px" CssClass="btn btn-success" style="margin-left:10px" OnClick="btnClearSearch_Click" /></td>
                <td></td>
                <td><asp:Button ID="btnArchive" runat="server" Text ="Archive" CssClass="btn btn-info" style="margin-left:10px" Width="80px" OnClientClick="confirmArchive();" OnClick="btnArchive_Click" /><asp:HiddenField ID="hfCount" runat="server" Value="0" /></td>
                <td></td>
                <td><asp:Button ID="btnExcelExport" runat="server" CssClass="btn btn-warning" style="margin-left:10px" text ="Export To Excel" OnClick="btnExcelExport_Click" /></td>
                <td></td>
                <td><asp:LinkButton ID="btnAddAnnouncement" runat="server" CssClass="btn btn-default" style="margin-left:10px; background-color:#fff97a" Width="150px" OnClick="btnAddAnnouncement_Click"><span class="glyphicon glyphicon-envelope"></span> Post something?</asp:LinkButton></td>
                <td></td>
                <td></td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:RegularExpressionValidator ID="readAlphaOnly" runat="server" ErrorMessage="No results found!" ForeColor="#ff0000" ControlToValidate="txtSearchAnnouncement" ValidationExpression="[a-zA-Z0-9!/ ]*$"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
            </div>
        </div>
        <div class="announcementCount">
            <table>
                <tr>
                    <td>
                        Announcement Posted:<asp:Label ID="lblAnnouncementCount" Text="Label" runat="server" Visible="False"/><asp:LinkButton ID="btnCleanup" runat="server" CssClass="btn btn-default" style="margin-left:10px; background-color:#deb887" OnClick="btnCleanup_Click"><span class="glyphicon glyphicon-trash"></span> Cleanup old announcements</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>   
        <br />
        <div class="announcementTable">
            <table>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" Width="1152px">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkAll" runat="server" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkRow" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="announcement_subject" HeaderText="Subject" SortExpression="announcement_subject" />
                                <asp:BoundField DataField="sender_name" HeaderText="Sender" SortExpression="sender_name" />
                                <asp:BoundField DataField="date_posted" HeaderText="Date Posted" SortExpression="date_posted" />
                                <asp:BoundField DataField="announcement_status" HeaderText="Status" SortExpression="announcement_status" />
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Point_Of_SalesConnectionString %>" SelectCommand="SELECT * FROM [Announcements]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
        </div>
</asp:Content>

