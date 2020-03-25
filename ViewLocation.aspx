<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewLocation.aspx.cs" Inherits="Admin_ViewLocation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
           .locationIcon{
            margin-left:160px;
            margin-bottom:-45px;
        }
        .location{
            width:300px;
            margin-left:180px;
            margin-bottom:-30px;
        }
        .locationDetails{
            background-color:#ececec;
            border: 1px solid #000000;
            border-radius:5px;
            margin-left:285px;
            margin-top:30px;
            width:830px;
            height:300px;
        }
    </style>
    <div>
        <br />
        <br />
        <br />
        <br />
            <div class="locationIcon">
                <span class="glyphicon glyphicon-home"></span>
            </div>
            <div class="location">
                <h3>Location Details</h3>
            </div>
            <br />
            <br />
            <div class="locationDetails">
                <br />
            <table>
                <tr><td></td><td></td></tr>
                <tr><td><asp:Label ID="lblLocation" runat="server" Text="Location Name:" style="margin-left:30px; font-size:large"></asp:Label></td>
                <td><asp:Label ID="lblLocationName" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
                <tr><td></td><td></td></tr>
                <tr><td><asp:Label ID="lblAddress" runat="server" Text="Location Address:" style="margin-left:30px; font-size:large"></asp:Label></td>
                <td><asp:Label ID="lblLocationAddress" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
                <tr><td></td><td></td></tr>
                <tr><td><asp:Label ID="lblPhone" runat="server" Text="Phone Number:" style="margin-left:30px; font-size:large"></asp:Label></td>
                <td><asp:Label ID="lblLocationPhoneNo" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
                <tr><td></td><td></td></tr>
                <tr><td><asp:Label ID="lblFax" runat="server" Text="Fax Number:" style="margin-left:30px; font-size:large"></asp:Label></td>
                <td><asp:Label ID="lblLocationFax" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
                <tr><td></td><td></td></tr>
                <tr><td><asp:Label ID="lblEmail" runat="server" Text="Email:" style="margin-left:30px; font-size:large"></asp:Label></td>
                <td><asp:Label ID="lblLocationEmail" runat="server" Text="Label" style="margin-left:50px" /></td></tr>
                <tr><td></td><td></td></tr>
                <tr><td><asp:Label ID="lblStatus" runat="server" Text="Status:" style="margin-left:30px; font-size:large"></asp:Label></td>
                <td><asp:Label ID="lblLocationStatus" runat="server" Text="Label" style="margin-left:50px" /></td></tr>          
            </table>
        </div>
  </div>
</asp:Content>

