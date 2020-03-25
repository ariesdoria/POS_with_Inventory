<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewGiftCard.aspx.cs" Inherits="Admin_ViewGiftCard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
           .giftcardIcon{
            margin-left:160px;
            margin-bottom:-45px;
        }
        .giftcard{
            width:300px;
            margin-left:180px;
            margin-bottom:-30px;
        }
        .giftcardDetails{
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
        <div class="giftcardIcon">
            <span class="glyphicon glyphicon-gift"></span>
        </div>
        <div class="giftcard">
            <h3>Giftcard Details</h3>
        </div>
        <br />
        <br />
        <div class="giftcardDetails">
            <br />
        <table>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblGiftcard" runat="server" Text="Giftcard Number:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td ><asp:Label ID="lblGiftCardNumber" runat="server" Text="Label" style="margin-left:100px"/></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblValue" runat="server" Text="Giftcard Value:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblGiftCardValue" runat="server" Text="Label" style="margin-left:100px"/></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lbladminCustomer" runat="server" Text="Customer:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblCustomer" runat="server" Text="Label" style="margin-left:100px"/></td></tr>
            <tr><td></td><td ></td></tr>
            <tr><td><asp:Label ID="lblgiftCardStatus" runat="server" Text="Status:" style="margin-left:30px; font-size:large"></asp:Label></td>
            <td><asp:Label ID="lblStatus" runat="server" Text="Label" style="margin-left:100px"/></td></tr>
        </table>
    </div>
        </div>
</asp:Content>

