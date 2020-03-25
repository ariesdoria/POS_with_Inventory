<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EmployeeMasterPage.master" AutoEventWireup="true" CodeFile="AddGiftCard.aspx.cs" Inherits="Employee_AddGiftCard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <style type="text/css">
        .addGiftcard{
            margin-left:220px;
            margin-top:30px;
            border: 1px solid #000000;
            background-color:#ececec;
            border-radius:5px;
            width:950px;
            height:300px;
        }
        .newGiftcard{
            width:300px;
            margin-left:180px;
            margin-bottom:-30px;
        }
        .giftcardIcon{
            margin-left:160px;
            margin-bottom:-45px;
        }
        .marker{
            margin-left:180px;
            width:500px;
        }
    </style>
    <div>
        <br />
        <br />
        <br />
        <br />
        <div class="giftcardIcon">
            <span class="glyphicon glyphicon-pencil"></span>
        </div>
        <div class="newGiftcard">
            <h3>New Giftcard</h3>
        </div>
        <br />
        <br />
        <div class="marker">
            <p>Note:Fields that marked in red are required.</p>
        </div>
        <div class="addGiftcard">
            <table>
            <tr><td><span class="glyphicon glyphicon-gift" style="margin-top:10px; margin-left:10px"></span> Giftcard Information</td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblGiftcardNum" runat="server" style="margin-top:30px; margin-left:80px; color:red" Text="Giftcard Number:"></asp:Label><asp:TextBox ID="txtGiftcardNo" CssClass="form-control-static" style="margin-top:20px; margin-left:20px" runat="server" Width="700px"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblGiftcardVal" runat="server" style="margin-top:30px; margin-left:80px; color:red" Text="Giftcard Value:"></asp:Label><asp:TextBox ID="txtGiftcardValue" CssClass="form-control-static" style="margin-top:20px; margin-left:35px" runat="server" Width="700px"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblCustomer" runat="server" style="margin-top:30px; margin-left:80px; color:red" Text="Customer:"></asp:Label><asp:TextBox ID="txtCustomer" CssClass="form-control-static" style="margin-top:20px; margin-left:63px" runat="server" Width="700px"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Button ID="btnAddGiftcard" runat="server" CssClass="btn btn-primary" style="margin-left:400px; margin-top:30px" Text="Add Giftcard" Width="132px" OnClick="btnAddGiftcard_Click" /></td><td></td></tr>
            <tr><td></td><td></td></tr>
        </table>
        </div>               
    </div>
</asp:Content>

