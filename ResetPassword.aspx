<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResetPassword.aspx.cs" Inherits="Admin_ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="../Images/pos-icon.gif" />
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
          .body{
            background:url(..Images/3.jpg) no-repeat center center fixed;
             -webkit-background-size: cover;
          -moz-background-size: cover;
         -o-background-size: cover;
          background-size: cover;
        }   
    </style>
</head>
<body class="body">
    <form id="form1" runat="server">
    <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                <table align="center">
                    <tr>
                        <td>
                            <h3>Please enter your username below to reset your password.</h3>
                        </td>
                    </tr>
                </table>
                </div>
            </div>
            <br />
            <br />
            <br />
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                     <table align="center">
                <tr><td></td><td></td></tr>
                <tr><td></td><td></td></tr>
                <tr><td></td><td></td></tr>
                <tr><td align="center"><asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label></td></tr>
                <tr><td></td><td></td></tr>
                <tr><td></td><td></td></tr>
                <tr><td>
                    <div class="form-group has-feedback">
                    <i class="glyphicon glyphicon-user form-control-feedback"></i>
                    <asp:TextBox ID="txtUsername" PlaceHolder="Enter your username" CssClass="form-control" runat="server" Width="224px" />
                    </div>
                    </td></tr>
                <tr><td></td><td></td></tr>
                <tr><td></td><td></td></tr>
                <tr><td>
                    <div class="form-group has-feedback">
                    <i class="glyphicon glyphicon-lock form-control-feedback"></i>
                    <asp:TextBox ID="txtNewPassword" PlaceHolder="Enter your new password" CssClass="form-control" runat="server" Width="224px"></asp:TextBox>
                    </div>
                    </td></tr>
                <tr><td></td><td></td></tr>
                <tr><td></td><td></td></tr>
                <tr><td>
                    <div class="form-group has-feedback">
                    <i class="glyphicon glyphicon-lock form-control-feedback"></i>
                    <asp:TextBox ID="txtConfirmPassword" PlaceHolder="Confirm new password" CssClass="form-control" runat="server" Width="224px"></asp:TextBox>
                    </div>    
                    </td></tr>
                <tr><td></td><td></td></tr>
                <tr><td align="center"><asp:Label ID="Label2" runat="server" Text="Label" Visible ="False"></asp:Label></td></tr>
                <tr><td></td><td></td></tr>
                <tr><td></td><td></td></tr>
                <tr><td align="center"><asp:Button ID="btnResetpassword" Width="162px" CssClass="btn btn-success" runat="server" Text="Reset Password" OnClick="btnResetpassword_Click" /></td></tr>
                <tr><td></td><td></td></tr>
                <tr><td></td><td></td></tr>
                <tr><td align="center"><asp:HyperLink ID="hlLogin" runat="server" NavigateUrl="~/Admin/Login_Page.aspx">Login</asp:HyperLink></td></tr>
                <tr><td></td><td></td></tr>
                <tr><td></td><td></td></tr>
            </table>
                </div>
                </div>
        </div>          
    </div>
    </form>
</body>
</html>