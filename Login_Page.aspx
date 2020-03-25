<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login_Page.aspx.cs" Inherits="Admin_Login_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="../Images/pos-icon.gif" />
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        .body{
            background:url(../Images/3.jpg) no-repeat center center fixed;
            -webkit-background-size:cover;
            -moz-background-size:cover;
            -o-background-size:cover;
            background-size:cover;
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
                                <h3>Welcome to POSWiN. Login your credentials below to start.</h3>
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
                            <tr><td align="center"><h4>Admin Login Portal</h4></td><td></td></tr>
                            <tr><td></td><td></td></tr>
                            <tr><td></td><td></td></tr>
                            <tr><td align="center"><h4 class="text-center">Username</h4></td></tr>
                            <tr><td></td><td></td></tr>
                            <tr><td></td><td></td></tr>
                            <tr><td>
                                <div class="form-group has-feedback">
                                    <i class="glyphicon glyphicon-user form-control-feedback"></i>
                                    <asp:TextBox ID="txtUsername" runat="server" PlaceHolder="Username" CssClass="form-control" Width="224px"></asp:TextBox> 
                                </div>
                                </td></tr>
                            <tr><td></td><td></td></tr>
                            <tr><td></td><td></td></tr>
                            <tr><td align="center"><h4 class="text-center">Password</h4></td></tr>
                            <tr><td></td><td></td></tr>
                            <tr><td></td><td></td></tr>
                            <tr><td>
                                <div class="form-group has-feedback">
                                    <i class="glyphicon glyphicon-lock form-control-feedback"></i>
                                    <asp:TextBox ID="txtPassword" runat="server" PlaceHolder="Password" CssClass="form-control" Width="224px" TextMode="Password"></asp:TextBox>
                                </div>
                                </td></tr>
                            <tr><td></td><td></td></tr>
                            <tr><td><asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label></td></tr>
                            <tr><td></td><td></td></tr>
                            <tr><td></td><td></td></tr>
                            <tr><td align="center">
                                <!--Insert NavigateURL!!!-->
                                <asp:HyperLink ID="hlResetPassword" runat="server">ResetPassowrd</asp:HyperLink>
                                </td></tr>
                            <tr><td></td><td></td></tr>
                            <tr><td></td><td></td></tr>
                        </table>
                        <br />
                        <table align="center">
                            <tr>
                                <td>
                                    <asp:Button ID="btnLogin" runat="server" Text="Login" Width="162px" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
