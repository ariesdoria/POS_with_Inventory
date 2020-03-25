<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ArchiveAnnouncements.aspx.cs" Inherits="Admin_ArchiveAnnouncements" %>

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
           .msgIcon{
            margin-top:100px;
            margin-left:150px;
        }
        .msgTab{
            margin-left:180px;
            margin-top:-30px;
        }
        .msgSearch{
            margin-left:180px;
        }
        .msgTable{
            margin-left:180px;
        }
        .msgCount {
            margin-left: 180px;
            width: 500px;
        }
    </style>
    <!--Wrapper-->
      <div>
        <div class="msgIcon">
            <table>
                <tr>
                    <td>
                        <span class="glyphicon glyphicon-envelope" style="font-size:20px"></span>
                    </td>
                </tr>
            </table>
        </div>
        <div class="msgTab">
            <table>
                <tr>
                    <td>
                        <h4 style="width:500px">Archive Announcements</h4>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="msgSearch">
            <div class="form-group">
                 <table>
            <tr>
                <td>
                    <asp:TextBox ID="txtSearchAnnouncement" runat="server" PlaceHolder="Search Announcement" Width="247px" CssClass="form-control"></asp:TextBox>
                </td>
                <td></td>
                <td></td>
                <td><asp:Button ID="btnSearch" runat="server" Text="Search Announcement" CssClass="btn btn-primary" style="margin-left:10px" OnClick="btnSearch_Click"/></td>
                <td></td>
                <td></td>
                <td><asp:Button ID="btnClearSearch" runat="server" Text="Clear" Width="119px" CssClass="btn btn-success" style="margin-left:10px" OnClick="btnClearSearch_Click" /></td>
                <td></td>
                <td></td>
                <td><asp:Button ID="btnExcelExport" runat="server" Text="Excel Export" CssClass="btn btn-warning" style="margin-left:10px" OnClick="btnExcelExport_Click" /></td>
                <td></td>
                <td><asp:Button ID="btnDelete" runat="server" OnClientClick="confirmDelete();" Text ="Delete" CssClass="btn btn-danger" style="margin-left:10px" OnClick="btnDelete_Click"/><asp:HiddenField ID="hfCount" runat="server" Value="0" /></td>
                <td></td>
                <td></td>
                <td><asp:LinkButton ID="btnAddAnnouncement" runat="server" CssClass="btn btn-default" style="margin-left:10px; background-color:#fff97a" OnClick="btnAddAnnouncement_Click"><span class="glyphicon glyphicon-envelope"></span> Post something?</asp:LinkButton></td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:RegularExpressionValidator ID="regexVal" runat="server" ErrorMessage="No records found!" ForeColor="#ff0000" ControlToValidate="txtSearchAnnouncement" ValidationExpression="[a-zA-Z0-9!/ ]*$"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
            </div>
        </div>
        <div class="msgCount">
            <table>
                <tr>
                    <td>
                        Archived Announcements:<asp:Label ID="lblArchiveAnnouncementCount" runat="server" Text="Label" Visible="false" />
                    </td>
                </tr>
            </table>
        </div>    
        <div class="msgTable">
            <table>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="1150px">
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Point_Of_SalesConnectionString %>" SelectCommand="SELECT * FROM [Archived_Announcements]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
          </div>
</asp:Content>

