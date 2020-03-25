<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EmployeeMasterPage.master" AutoEventWireup="true" CodeFile="ViewAnnouncement.aspx.cs" Inherits="Employee_ViewAnnouncement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                    <asp:Label ID="lblDate" style="margin-left:30px; font-size:large" runat="server" Text="Date Posted:"></asp:Label>
                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblDatePosted" style="margin-left:10px; font-size:large" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr><td></td></tr>   
            <tr><td></td></tr>
            <tr>
                    <td>
                        <asp:Label ID="lblempSender" style="margin-left:30px; font-size:large" runat="server" Text="From:"></asp:Label>
                    </td>
                    <td>
                    </td>
                    <td>
                        <asp:Label ID="LblSender" style="margin-left:10px; font-size:large" runat="server" Text="Label"></asp:Label>
                    </td>         
            </tr>       
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr>
                <td>
                    <asp:Label ID="lblempSubject" style="margin-left:30px; font-size:large" runat="server" Text="Subject:"></asp:Label>
                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblSubject" style="margin-left:10px; font-size:large" runat="server" Text="Label"></asp:Label>
                </td>                
            </tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr>
                <td>
                    <asp:Label ID="lblempAnnouncement" style="margin-left:30px; font-size:large" runat="server" Text="Announcement:"></asp:Label>
                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblAnnouncement" style="margin-left:10px; font-size:large" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr>
                <td>
                    <asp:Label ID="lblempStatus" style="margin-left:30px; font-size:large" runat="server" Text="Status:"></asp:Label>
                </td>
                <td></td>
                <td>
                    <asp:Label ID="lblStatus" style="margin-left:10px; font-size:large" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
        </table>
        </div>        
            </div>
</asp:Content>

