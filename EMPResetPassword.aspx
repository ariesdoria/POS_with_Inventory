<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EMPResetPassword.aspx.cs" Inherits="Employee_EMPResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="../Images/pos-icon.gif" />
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="../Content/bootstrap.css" rel="stylesheet" />
      <style type="text/css">
        .body{
            background:url(../Images/groupon-pos.jpg) no-repeat center center fixed;
            -webkit-background-size:cover;
            -moz-background-size:cover;
            -o-background-size:cover;
            background-size:cover;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="modal-dialog">
             <div class="modal-content">
            <div class="modal-header">
                <table align="center">
                    <tr>
                        <td>
                            <h3>Please enter your Employee ID to reset your password.</h3>
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
                <br />
                <table align="center">
                    <tr><td></td><td></td></tr>
                    <tr><td></td><td></td></tr>
                    <tr><td></td><td></td></tr>
                    <tr><td align="center"><asp:Label ID="label1" runat="server" Text="Label" Visible="false"></asp:Label></td></tr>
                    <tr><td></td><td></td></tr>
                    <tr><td></td><td></td></tr>
                    <tr>
                        <td>
                            <div class="form-group has-feedback">
                            <i class="glyphicon glyphicon-user form-control-feedback"></i>
                            <asp:TextBox ID="txtEmployeeID" runat="server" PlaceHolder="Enter your Employee ID" CssClass="form-control" Width="224px"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr><td></td><td></td></tr>
                    <tr><td></td><td></td></tr>
                    <tr>
                        <td>
                            <div class="form-group has-feedback">
                            <i class="glyphicon glyphicon-lock form-control-feedback"></i>
                            <asp:TextBox ID="txtNewPassword" runat="server" PlaceHolder="Enter your new password" CssClass="form-control" Width="224px"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr><td></td><td></td></tr>
                    <tr><td></td><td></td></tr>
                    <tr>
                        <td>
                            <div class="form-group has-feedback">
                            <i class="glyphicon glyphicon-lock form-control-feedback"></i>
                            <asp:TextBox ID="txtConfirmPassword" runat="server" PlaceHolder="Confirm new password" CssClass="form-control" Width="224px"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr><td></td><td></td></tr>
                    <tr><td align="center"><asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label></td></tr>
                    <tr><td></td><td></td></tr>
                    <tr><td></td><td></td></tr>
                    <tr><td align="center"><asp:Button ID="btnResetPassword" Width="162px" CssClass="btn btn-success" runat="server" Text="Reset Password" OnClick="btnResetPassword_Click" /></td></tr>
                    <tr><td></td><td></td></tr>
                    <tr><td></td><td></td></tr>
                    <tr><td></td><td></td></tr>
                    <tr><td align="center"><a href="index.aspx">Login.aspx</a></td></tr>
                    <tr><td></td><td></td></tr>
                    <tr><td></td><td></td></tr>
                </table>
                <br />
            </div>
        </div>
        </div>
    </form>
</body>
</html>
