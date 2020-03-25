<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddGiftCard.aspx.cs" Inherits="Admin_AddGiftCard" %>

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
        .newGiftCard{
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
                        <h4 style="width:500px">New Giftcard</h4>
                    </td>
                </tr>
            </table>
        </div>
        <br />
    <div class="newGiftCard">
        <br />
        <table>
            <tr><td></td><td></td></tr>
            <tr><td><span class="glyphicon glyphicon-gift" style="margin-left:10px"></span><asp:Label ID="lblgiftcardInfo" runat="server" Text="Giftcard Information" style="margin-left:10px"></asp:Label></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:TextBox ID="txtGiftcardNo" runat="server" Width="600px" CssClass="form-control" style="margin-left:80px; margin-top:10px" PlaceHolder="Giftcard Number"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Giftcard Number is required!" style="margin-left:80px" ControlToValidate="txtGiftcardNo" CssClass="text-danger"></asp:RequiredFieldValidator></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:TextBox ID="txtGiftcardValue" runat="server" Width="600px" CssClass="form-control" style="margin-left:80px; margin-top:10px" PlaceHolder="Giftcard Value"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Giftcard Value is required!" style="margin-left:80px" ControlToValidate="txtGiftcardValue" CssClass="text-danger"></asp:RequiredFieldValidator></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:TextBox ID="txtCustomer" runat="server" Width="600px" CssClass="form-control" style="margin-left:80px; margin-top:10px" PlaceHolder="Customer"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Customer is required!" style="margin-left:80px" ControlToValidate="txtCustomer" CssClass="text-danger"></asp:RequiredFieldValidator></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Button ID="btnAddGiftcard" runat="server" style="margin-left:300px" CssClass="btn btn-success" Text="Add Giftcard" Width="132px" OnClick="btnAddGiftcard_Click" /></td></tr>
            <tr><td></td><td></td></tr>
        </table>
    </div>
        </div>
</asp:Content>

