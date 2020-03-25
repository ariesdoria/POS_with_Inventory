<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddAnnouncement.aspx.cs" Inherits="Admin_AddAnnouncement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .msgIcon{
            margin-top:100px;
            margin-left:150px;
        }
        .msgTab{
            margin-left:180px;
            margin-top:-30px;
        }
        .newMsg{
            margin-left:300px;
            background-color:#ececec;
            border:1px solid #000000;
            border-radius:5px;
            width:800px;
            height:500px;
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
                        <h4 style="width:500px">New Announcement</h4>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="newMsg">
            <br />
              <table>
            <tr><td></td><td></td></tr>
            <tr><td><span class="glyphicon glyphicon-envelope" style="margin-left:10px"></span><asp:Label ID="lblmsgInfo" runat="server" Text="Announcement Details" style="margin-left:10px"></asp:Label></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="Label2" runat="server" Text="What's happening now, " style="margin-left:10px;"></asp:Label><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>?</td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" style="margin-top:10px; margin-left:80px" Placeholder="Subject" Width="600px"/></td></tr>
            <tr><td></td><td></td></tr>   
            <tr><td></td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtSubject" CssClass="text-danger" runat="server" ErrorMessage="Subject must not be empty!"></asp:RequiredFieldValidator></td></tr>               
            <tr><td><asp:TextBox ID="txtAnnouncement" runat="server" Height="172px" CssClass="form-control" style="margin-top:10px; margin-left:80px; resize:none" TextMode="MultiLine" Width="600px" PlaceHolder="Compose a message..."></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtAnnouncement" CssClass="text-danger" runat="server" ErrorMessage="You didn't specify the announcement details yet!"></asp:RequiredFieldValidator></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td><asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtAnnouncement" ID="RegularExpression2" ValidationExpression="^[\s\S]{0,500}$" runat="server" ErrorMessage="Maximum of 500 characters allowed"></asp:RegularExpressionValidator></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Button ID="btnPostAnnouncement" CssClass="btn btn-success" style="margin-top:10px; margin-left:300px" runat="server" Text="Post Announcement" OnClick="btnPostAnnouncement_Click"/></td></tr>
            <tr><td></td><td></td></tr>
        </table>
        </div>
        <br />
    </div>     
</asp:Content>

