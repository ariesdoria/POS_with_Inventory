<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="UpdateLocation.aspx.cs" Inherits="Admin_UpdateLocation" %>
<%@Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .locationIcon{
            margin-top:100px;
            margin-left:150px;
        }
        .locationTab{
            margin-left:180px;
            margin-top:-30px;
        }
        .updateLocation{
            margin-left:300px;
            background-color:#ececec;
            border: 1px solid #000000;
            border-radius:5px;
            width:800px;
            height:450px;
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
                        <h4 style="width:500px">Update Location</h4>
                    </td>
                </tr>
            </table>
        </div>
        <br />
   <div class="updateLocation">
       <br />
       <table>
            <tr><td></td><td></td></tr>
            <tr><td><span class="glyphicon glyphicon-home" style="margin-left:10px"></span><asp:Label ID="lbllocationInfo" runat="server" Text="Update Location Details" style="margin-left:10px"></asp:Label></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:TextBox ID="txtLocationName" runat="server" Width="600px" CssClass="form-control" style="margin-left:80px; margin-top:10px" PlaceHolder="Location Name"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Location Name is required!" ControlToValidate="txtLocationName" CssClass="text-danger" style="margin-left:80px"></asp:RequiredFieldValidator></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:TextBox ID="txtLocationAddress" runat="server" Width="600px" CssClass="form-control" style="margin-left:80px; margin-top:10px" PlaceHolder="Location Address"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Location Address is required!" ControlToValidate="txtLocationAddress" CssClass="text-danger" style="margin-left:80px"></asp:RequiredFieldValidator></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:TextBox ID="txtLocationPhoneNo" runat="server" Width="600px" CssClass="form-control" style="margin-left:80px; margin-top:10px" PlaceHolder="Location Phone Number"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Location Phone Number is required!" ControlToValidate="txtLocationPhoneNo" CssClass="text-danger" style="margin-left:80px"></asp:RequiredFieldValidator></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:TextBox ID="txtLocationFax" runat="server" Width="600px" CssClass="form-control" style="margin-left:80px; margin-top:10px" PlaceHolder="Location Fax Number"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Location Fax Number is required!" ControlToValidate="txtLocationFax" CssClass="text-danger" style="margin-left:80px"></asp:RequiredFieldValidator></td></tr>
            <tr><td></td><td></td></tr>
           <tr><td><asp:TextBox ID="txtLocationEmail" runat="server" Width="600px" CssClass="form-control" style="margin-left:80px; margin-top:10px" PlaceHolder="Location Email"></asp:TextBox></td></tr>
           <tr><td></td><td></td></tr>
           <tr><td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Location Email is required!" ControlToValidate="txtLocationEmail" CssClass="text-danger" style="margin-left:80px"></asp:RequiredFieldValidator></td></tr>
            <tr><td></td><td></td></tr>
           <tr><td><asp:Button ID="btnUpdateLocation" runat="server" style="margin-left:300px; margin-top:10px" CssClass="btn btn-primary" Text="Update Location" Width="129px" OnClick="btnUpdateLocation_Click" /></td></tr>
            <tr><td></td><td></td></tr>
       </table>
   </div>
        </div>
</asp:Content>

