<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewAnnouncement.aspx.cs" Inherits="Admin_ViewAnnouncement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <style type="text/css">
          .announcementIcon{
            margin-left:160px;
            margin-bottom:-45px;
        }
        .announcement{
            width:300px;
            margin-left:180px;
            margin-bottom:-30px;
        }
        .announcementDetails{
            background-color:#ececec;
            border:1px solid #000000;
            border-radius:5px;
            margin-left:285px;
            margin-top:30px;
            width:830px;
            height:350px;
        }
    </style>
    <br />
    <div>
        <br />
        <br />
        <br />
        <br />
        <div class="announcementIcon">
            <span class="glyphicon glyphicon-envelope"></span>
        </div>
        <div class="announcement">
        <h3>Announcement Details</h3>
        </div>
        <br />
        <br />
        <div class="announcementDetails">
            <br />
        <table>     
            <tr>
                <td>
                    <asp:Label ID="lblDate" runat="server" Text="Date Posted:" style="margin-left:30px; font-size:large"></asp:Label>
                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblDatePosted" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr><td></td></tr>   
            <tr><td></td></tr>
            <tr>
                    <td>
                        <asp:Label ID="lbladminSender" runat="server" Text="Sender:" style="margin-left:30px; font-size:large"></asp:Label>
                    </td>
                    <td>
                    </td>
                    <td>
                        <asp:Label ID="LblSender" runat="server" Text="Label"></asp:Label>
                    </td>         
            </tr>       
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr>
                <td>
                    <asp:Label ID="lbladminSubject" runat="server" Text="Subject:" style="margin-left:30px; font-size:large"></asp:Label>
                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblSubject" runat="server" Text="Label"></asp:Label>
                </td>                
            </tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr>
                <td>
                    <asp:Label ID="lbladminAnnouncement" runat="server" Text="Announcement:" style="margin-left:30px; font-size:large"></asp:Label>
                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblAnnouncement" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr>
                <td>
                    <asp:Label ID="lbladminStatus" runat="server" Text="Status:" style="margin-left:30px; font-size:large"></asp:Label>
                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblStatus" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
        </table>
            </div>
        </div>
</asp:Content>

