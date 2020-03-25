<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="UpdateGiftCard.aspx.cs" Inherits="Admin_UpdateGiftCard" %>
<%@Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .giftCardIcon{
            margin-top:100px;
            margin-left:150px;
        }
        .giftCardTab{
            margin-left:180px;
            margin-top:-30px;
        }
        .updateGiftCard{
            margin-left:300px;
            background-color:#ececec;
            border: 1px solid #000000;
            border-radius:5px;
            width:800px;
            height:400px;
        }
    </style>
    <!--Wrapper-->
    <div>
        <div class="giftCardIcon">
            <table>
                <tr>
                    <td>
                        <span class="glyphicon glyphicon-gift" style="font-size:20px"></span>
                    </td>
                </tr>
            </table>
        </div>
        <div class="giftCardTab">
            <table>
                <tr>
                    <td>
                        <h4 style="width:500px">Update Giftcard</h4>
                    </td>
                </tr>
            </table>
        </div>
        <br />
    <div class="updateGiftCard">
        <br />
        <table>
            <tr><td></td><td></td></tr>
            <tr><td><span class="glyphicon glyphicon-gift" style="margin-left:10px"></span><asp:Label ID="lblgiftcardInfo" runat="server" Text="Update Giftcard Details" style="margin-left: 10px"></asp:Label></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:TextBox ID="txtGiftCardNumber" runat="server" Enabled="false" Width="600px" CssClass="form-control" style="margin-left:80px; margin-top:10px" PlaceHolder="Giftcard Number"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:TextBox ID="txtGiftCardValue" runat="server" Width="600px" CssClass="form-control" style="margin-left:80px; margin-top:10px" PlaceHolder="Giftcard Value"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Giftcard value is required!" ControlToValidate="txtGiftCardValue" CssClass="text-danger" style="margin-left:80px"></asp:RequiredFieldValidator></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:TextBox ID="txtCustomer" runat="server" Width="600px" CssClass="form-control" style="margin-left:80px; margin-top:10px" PlaceHolder="Customer"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Customer is required!" ControlToValidate="txtCustomer" CssClass="text-danger" style="margin-left:80px"></asp:RequiredFieldValidator></td></tr>
            <tr><td></td><td></td></tr>      
            <tr><td></td><td></td></tr>
            <tr><td><asp:Button ID="btnUpdateGiftcard" runat="server" style="margin-left:300px" Text="Update GiftCard" CssClass="btn btn-primary" Width="132px" OnClick="btnUpdateGiftcard_Click" /></td></tr>
            <tr><td></td><td></td></tr>
        </table>
    </div>
        </div>
</asp:Content>

