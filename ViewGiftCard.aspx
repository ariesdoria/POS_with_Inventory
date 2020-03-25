<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EmployeeMasterPage.master" AutoEventWireup="true" CodeFile="ViewGiftCard.aspx.cs" Inherits="Employee_ViewGiftCard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
            <h3>GiftCard Details</h3>
        </div>
        <br />
        <br />
        <div class="giftcardDetails">
            <br />
             <table>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblGiftcardNum" style="margin-left:30px; font-size:large" runat="server" Text="Giftcard Number:"></asp:Label></td><td><asp:Label ID="lblGiftCardNumber" style="margin-left:100px; font-size:large" runat="server" Text="Label" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblValue" style="margin-left:30px; font-size:large" runat="server" Text="Giftcard Value:"></asp:Label></td><td><asp:Label ID="lblGiftCardValue" style="margin-left:100px; font-size:large" runat="server" Text="Label" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblempCustomer" style="margin-left:30px; font-size:large" runat="server" Text="Customer:"></asp:Label></td><td><asp:Label ID="lblCustomer" style="margin-left:100px; font-size:large" runat="server" Text="Label" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblgcStatus" style="margin-left:30px; font-size:large" runat="server" Text="Giftcard Status:"></asp:Label></td><td><asp:Label ID="lblStatus" style="margin-left:100px; font-size:large" runat="server" Text="Label" /></td></tr>
        </table>
        </div>      
    </div>
</asp:Content>

