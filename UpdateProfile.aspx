<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EmployeeMasterPage.master" AutoEventWireup="true" CodeFile="UpdateProfile.aspx.cs" Inherits="Employee_UpdateProfile" %>
<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .userIcon{
            margin-left:160px;
            margin-bottom:-45px;
        }
        .user{
            width:300px;
            margin-left:180px;
            margin-bottom:-30px;
        }
        .userProfile{
            margin-left:285px;
            margin-top:30px;
            background-color:#ececec;
            border:1px solid #000000;
            border-radius:5px;
            width:830px;
            height:750px;
        }
    </style>
    <br />
    <div>
        <br />
        <br />
        <br />
        <br />
        <div class="userIcon">
            <span class="glyphicon glyphicon-edit"></span>
        </div>
        <div class="user">
            <h3>Update Profile</h3>
        </div>
        <br />
        <br />
        <div class="userProfile">
            <br />
             <table>
            <tr><td></td><td ></td></tr>
            <tr><td><asp:Label ID="lblAccount" style="margin-left:30px; font-size:large" runat="server" Text="Account Number:"></asp:Label></td><td ><asp:Label ID="lblAccountNumber" style="font-size:large; margin-left:100px" runat="server" Text="Label" /></td></tr>
            <tr><td></td><td ></td></tr>
            <tr><td><asp:Label ID="lblPassword" style="margin-left:30px; font-size:large" runat="server" Text="Password:"></asp:Label></td><td ><asp:TextBox ID="txtEmpPassword" CssClass="form-control-static" runat="server" Width="500px"></asp:TextBox></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblFirstName" style="margin-left:30px; font-size:large" runat="server" Text="Firstname:"></asp:Label></td><td ><asp:TextBox ID="txtEmpFirstName" CssClass="form-control-static" style="margin-top:10px" runat="server" Width="500px"></asp:TextBox></td></tr>
            <tr><td></td><td ></td></tr>
            <tr><td><asp:Label ID="lblLastName" style="margin-left:30px; font-size:large" runat="server" Text="Lastname:"></asp:Label></td><td ><asp:TextBox ID="txtEmpLastName" CssClass="form-control-static" style="margin-top:10px" runat="server" Width="500px"></asp:TextBox></td></tr>
            <tr><td></td><td ></td></tr>
            <tr><td><asp:Label ID="lblGender" style="margin-left:30px; font-size:large" runat="server" Text="Gender:"></asp:Label></td><td ><asp:DropDownList ID="ddlEmpGender" CssClass="form-control-static" style="margin-top:10px" runat="server" Width="500px">
                <asp:ListItem>I am..</asp:ListItem>
                <asp:ListItem>Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
            </td></tr>
            <tr><td></td><td ></td></tr>
            <tr><td><asp:Label ID="lblMonth" style="margin-left:30px; font-size:large" runat="server" Text="Birthday:"></asp:Label></td>
            </tr>
            <tr><td><asp:DropDownList ID="ddlEmpMonth" CssClass="form-control-static" style="margin-left:40px; margin-top:10px; font-size:large" runat="server" Width="139px">
                    <asp:ListItem>Month</asp:ListItem>
                    <asp:ListItem>January</asp:ListItem>
                    <asp:ListItem>February</asp:ListItem>
                    <asp:ListItem>March</asp:ListItem>
                    <asp:ListItem>April</asp:ListItem>
                    <asp:ListItem>May</asp:ListItem>
                    <asp:ListItem>June</asp:ListItem>
                    <asp:ListItem>July</asp:ListItem>
                    <asp:ListItem>August</asp:ListItem>
                    <asp:ListItem>September</asp:ListItem>
                    <asp:ListItem>October</asp:ListItem>
                    <asp:ListItem>November</asp:ListItem>
                    <asp:ListItem>December</asp:ListItem>
            </asp:DropDownList></td>
            <td><asp:TextBox ID="txtEmpDate" runat="server" CssClass="form-control-static" style="margin-left:10px; margin-top:10px" Width="100px" PlaceHolder="Day" />
            <asp:TextBox ID="txtEmpYear" runat="server" CssClass="form-control-static" style="margin-left:10px; margin-top:10px" Width="100px" PlaceHolder="Year" /></td></tr>
            <tr><td></td><td></td></tr>
            <tr><td><asp:Label ID="lblPhone" style="margin-left:30px; margin-top:10px; font-size:large" runat="server" Text="Phone:"></asp:Label></td><td ><asp:TextBox ID="txtEmpPhone" style="margin-top:10px" CssClass="form-control-static" runat="server" Width="500px"></asp:TextBox></td></tr>
            <tr><td></td><td ></td></tr>
            <tr><td><asp:Label ID="lblLocation" style="margin-left:30px; font-size:large" runat="server" Text="Location:"></asp:Label></td><td ><asp:DropDownList ID="ddlEmpLocation" style="margin-top:10px" CssClass="form-control-static" runat="server" Width="500px">
            <asp:ListItem>Select a country..</asp:ListItem>
            <asp:ListItem>Afghanistan</asp:ListItem>
            <asp:ListItem>Albania</asp:ListItem>
            <asp:ListItem>Algeria</asp:ListItem>
            <asp:ListItem>Andorra</asp:ListItem>
            <asp:ListItem>Angola</asp:ListItem>
            <asp:ListItem>Antigua and Barbuda</asp:ListItem>
            <asp:ListItem>Argentina</asp:ListItem>
            <asp:ListItem>Armenia</asp:ListItem>
            <asp:ListItem>Aruba</asp:ListItem>
            <asp:ListItem>Australia</asp:ListItem>
            <asp:ListItem>Austria</asp:ListItem>
            <asp:ListItem>Azerbaijan</asp:ListItem>
            <asp:ListItem>Bahamas</asp:ListItem>
            <asp:ListItem>Bahrain</asp:ListItem>
            <asp:ListItem>Bangladesh</asp:ListItem>
            <asp:ListItem>Barbados</asp:ListItem>
            <asp:ListItem>Belarus</asp:ListItem>
            <asp:ListItem>Belgium</asp:ListItem>
            <asp:ListItem>Belize</asp:ListItem>
            <asp:ListItem>Benin</asp:ListItem>
            <asp:ListItem>Bhutan</asp:ListItem>
            <asp:ListItem>Bolivia</asp:ListItem>
            <asp:ListItem>Bosnia and Herzegovina</asp:ListItem>
            <asp:ListItem>Botswana</asp:ListItem>
            <asp:ListItem>Brazil</asp:ListItem>
            <asp:ListItem>Brunei </asp:ListItem>
            <asp:ListItem>Bulgaria</asp:ListItem>
            <asp:ListItem>Burkina Faso</asp:ListItem>
            <asp:ListItem>Burma</asp:ListItem>
            <asp:ListItem>Burundi</asp:ListItem>
            <asp:ListItem>Cambodia</asp:ListItem>
            <asp:ListItem>Cameroon</asp:ListItem>
            <asp:ListItem>Canada</asp:ListItem>
            <asp:ListItem>Cape Verde</asp:ListItem>
            <asp:ListItem>Central African Republic</asp:ListItem>
            <asp:ListItem>Chad</asp:ListItem>
            <asp:ListItem>Chile</asp:ListItem>
            <asp:ListItem>China</asp:ListItem>
            <asp:ListItem>Colombia</asp:ListItem>
            <asp:ListItem>Comoros</asp:ListItem>
            <asp:ListItem>Congo</asp:ListItem>
            <asp:ListItem>Costa Rica</asp:ListItem>
            <asp:ListItem>Cote d&#39;Ivoire</asp:ListItem>
            <asp:ListItem>Croatia</asp:ListItem>
            <asp:ListItem>Cuba</asp:ListItem>
            <asp:ListItem>Curacao</asp:ListItem>
            <asp:ListItem>Cyprus</asp:ListItem>
            <asp:ListItem>Czech Republic</asp:ListItem>
            <asp:ListItem>Denmark</asp:ListItem>
            <asp:ListItem>Djibouti</asp:ListItem>
            <asp:ListItem>Dominica</asp:ListItem>
            <asp:ListItem>Dominican Republic</asp:ListItem>
            <asp:ListItem>East Timor</asp:ListItem>
            <asp:ListItem>Ecuador</asp:ListItem>
            <asp:ListItem>Egypt</asp:ListItem>
            <asp:ListItem>El Salvador</asp:ListItem>
            <asp:ListItem>Equatorial Guinea</asp:ListItem>
            <asp:ListItem>Eritrea</asp:ListItem>
            <asp:ListItem>Estonia</asp:ListItem>
            <asp:ListItem>Ethiopia</asp:ListItem>
            <asp:ListItem>Fiji</asp:ListItem>
            <asp:ListItem>Finland</asp:ListItem>
            <asp:ListItem>France</asp:ListItem>
            <asp:ListItem>Gabon</asp:ListItem>
            <asp:ListItem>Gambia</asp:ListItem>
            <asp:ListItem>Georgia</asp:ListItem>
            <asp:ListItem>Germany</asp:ListItem>
            <asp:ListItem>Ghana</asp:ListItem>
            <asp:ListItem>Greece</asp:ListItem>
            <asp:ListItem>Grenada</asp:ListItem>
            <asp:ListItem>Guatemala</asp:ListItem>
            <asp:ListItem>Guinea</asp:ListItem>
            <asp:ListItem>Guyana</asp:ListItem>
            <asp:ListItem>Haiti</asp:ListItem>
            <asp:ListItem>Honduras</asp:ListItem>
            <asp:ListItem>Hong Kong</asp:ListItem>
            <asp:ListItem>Hungary</asp:ListItem>
            <asp:ListItem>Iceland</asp:ListItem>
            <asp:ListItem>India</asp:ListItem>
            <asp:ListItem>Indonesia</asp:ListItem>
            <asp:ListItem>Iran</asp:ListItem>
            <asp:ListItem>Iraq</asp:ListItem>
            <asp:ListItem>Ireland</asp:ListItem>
            <asp:ListItem>Israel</asp:ListItem>
            <asp:ListItem>Italy</asp:ListItem>
            <asp:ListItem>Jamaica</asp:ListItem>
            <asp:ListItem>Japan</asp:ListItem>
            <asp:ListItem>Jordan</asp:ListItem>
            <asp:ListItem>Kazakhstan</asp:ListItem>
            <asp:ListItem>Kenya</asp:ListItem>
            <asp:ListItem>Kiribati</asp:ListItem>
            <asp:ListItem>North Korea</asp:ListItem>
            <asp:ListItem>South Korea</asp:ListItem>
            <asp:ListItem>Kosovo</asp:ListItem>
            <asp:ListItem>Kuwait</asp:ListItem>
            <asp:ListItem>Kyrgyzstan</asp:ListItem>
            <asp:ListItem>Laos</asp:ListItem>
            <asp:ListItem>Latvia</asp:ListItem>
            <asp:ListItem>Lebanon</asp:ListItem>
            <asp:ListItem>Lesotho</asp:ListItem>
            <asp:ListItem>Liberia</asp:ListItem>
            <asp:ListItem>Libya</asp:ListItem>
            <asp:ListItem>Liechtenstein</asp:ListItem>
            <asp:ListItem>Lithuania</asp:ListItem>
            <asp:ListItem>Luxembourg</asp:ListItem>
            <asp:ListItem>Macau</asp:ListItem>
            <asp:ListItem>Macedonia</asp:ListItem>
            <asp:ListItem>Madagascar</asp:ListItem>
            <asp:ListItem>Malawi</asp:ListItem>
            <asp:ListItem>Malaysia</asp:ListItem>
            <asp:ListItem>Maldives</asp:ListItem>
            <asp:ListItem>Mali</asp:ListItem>
            <asp:ListItem>Malta</asp:ListItem>
            <asp:ListItem>Marshall Islands</asp:ListItem>
            <asp:ListItem>Mauritania</asp:ListItem>
            <asp:ListItem>Mauritius</asp:ListItem>
            <asp:ListItem>Mexico</asp:ListItem>
            <asp:ListItem>Micronesia</asp:ListItem>
            <asp:ListItem>Moldova</asp:ListItem>
            <asp:ListItem>Monaco</asp:ListItem>
            <asp:ListItem>Mongolia</asp:ListItem>
            <asp:ListItem>Montenegro</asp:ListItem>
            <asp:ListItem>Morocco</asp:ListItem>
            <asp:ListItem>Mozambique</asp:ListItem>
            <asp:ListItem>Namibia</asp:ListItem>
            <asp:ListItem>Nauru</asp:ListItem>
            <asp:ListItem>Nepal</asp:ListItem>
            <asp:ListItem>Netherlands</asp:ListItem>
            <asp:ListItem>New Zealand</asp:ListItem>
            <asp:ListItem>Nicaragua</asp:ListItem>
            <asp:ListItem>Nigeria</asp:ListItem>
            <asp:ListItem>Norway</asp:ListItem>
            <asp:ListItem>Oman</asp:ListItem>
            <asp:ListItem>Pakistan</asp:ListItem>
            <asp:ListItem>Palau</asp:ListItem>
            <asp:ListItem>Palestinian Territories</asp:ListItem>
            <asp:ListItem>Panama</asp:ListItem>
            <asp:ListItem>Papua New Guinea</asp:ListItem>
            <asp:ListItem>Paraguay</asp:ListItem>
            <asp:ListItem>Peru</asp:ListItem>
            <asp:ListItem>Philippines</asp:ListItem>
            <asp:ListItem>Poland</asp:ListItem>
            <asp:ListItem>Portugal</asp:ListItem>
            <asp:ListItem>Qatar</asp:ListItem>
            <asp:ListItem>Romania</asp:ListItem>
            <asp:ListItem>Russia</asp:ListItem>
            <asp:ListItem>Rwanda</asp:ListItem>
            <asp:ListItem>Saint Kitts and Nevis</asp:ListItem>
            <asp:ListItem>Saint Lucia</asp:ListItem>
            <asp:ListItem>Saint Vincent and the Grenadines</asp:ListItem>
            <asp:ListItem>Samoa </asp:ListItem>
            <asp:ListItem>San Marino</asp:ListItem>
            <asp:ListItem>Sao Tome and Principe</asp:ListItem>
            <asp:ListItem>Saudi Arabia</asp:ListItem>
            <asp:ListItem>Senegal</asp:ListItem>
            <asp:ListItem>Serbia</asp:ListItem>
            <asp:ListItem>Seychelles</asp:ListItem>
            <asp:ListItem>Sierra Leone</asp:ListItem>
            <asp:ListItem>Singapore</asp:ListItem>
            <asp:ListItem>St. Martin</asp:ListItem>
            <asp:ListItem>Slovakia</asp:ListItem>
            <asp:ListItem>Slovenia</asp:ListItem>
            <asp:ListItem>Solomon Islands</asp:ListItem>
            <asp:ListItem>Somalia</asp:ListItem>
            <asp:ListItem>South Africa</asp:ListItem>
            <asp:ListItem>South Sudan</asp:ListItem>
            <asp:ListItem>Spain </asp:ListItem>
            <asp:ListItem>Sri Lanka</asp:ListItem>
            <asp:ListItem>Suriname</asp:ListItem>
            <asp:ListItem>Swaziland </asp:ListItem>
            <asp:ListItem>Sweden</asp:ListItem>
            <asp:ListItem>Switzerland</asp:ListItem>
            <asp:ListItem>Syria</asp:ListItem>
            <asp:ListItem>Taiwan</asp:ListItem>
            <asp:ListItem>Tajikistan</asp:ListItem>
            <asp:ListItem>Tanzania</asp:ListItem>
            <asp:ListItem>Thailand</asp:ListItem>
            <asp:ListItem>Timor-Leste</asp:ListItem>
            <asp:ListItem>Togo</asp:ListItem>
            <asp:ListItem>Tonga</asp:ListItem>
            <asp:ListItem>Trinidad and Tobago</asp:ListItem>
            <asp:ListItem>Tunisia</asp:ListItem>
            <asp:ListItem>Turkey</asp:ListItem>
            <asp:ListItem>Turkmenistan</asp:ListItem>
            <asp:ListItem>Tuvalu</asp:ListItem>
            <asp:ListItem>Uganda</asp:ListItem>
            <asp:ListItem>Ukraine</asp:ListItem>
            <asp:ListItem>United Arab Emirates</asp:ListItem>
            <asp:ListItem>United Kingdom</asp:ListItem>
            <asp:ListItem>Uruguay</asp:ListItem>
            <asp:ListItem>Uzbekistan</asp:ListItem>
            <asp:ListItem>Vanuatu</asp:ListItem>
            <asp:ListItem>Venezuela</asp:ListItem>
            <asp:ListItem>Vietnam</asp:ListItem>
            <asp:ListItem>Yemen</asp:ListItem>
            <asp:ListItem>Zambia</asp:ListItem>
            <asp:ListItem>Zimbabwe</asp:ListItem>
        </asp:DropDownList></td></tr>
            <tr><td></td><td ></td></tr>
            <tr><td><asp:Label ID="lblDescription" style="margin-left:30px; font-size:large" runat="server" Text="Describe yourself:"></asp:Label></td><td><asp:TextBox ID="txtEmpComments" runat="server" style="resize:none; margin-top:10px" CssClass="form-control-static" TextMode="MultiLine" Height="88px" Width="500px"></asp:TextBox></td></tr>
            <tr><td></td><td ></td></tr>
            <tr><td></td><td><recaptcha:RecaptchaControl ID ="recaptcha" runat ="server" PublicKey ="6LdtWxkTAAAAAFNax14rh1LZsRfcaIyt3Zjtg0CJ" PrivateKey="6LdtWxkTAAAAADN9TRvDRZQL_f8a_poXdE1sRYbE" /></td></tr>
            <tr><td></td><td ></td></tr>
            <tr><td></td><td ><asp:Button ID="btnUpdateProfile" runat="server" Text="Update Profile" Width="300px" CssClass="btn btn-primary" style="margin-left:103px; margin-top:30px" OnClick="btnUpdateProfile_Click" /></td></tr>
            <tr><td></td><td ></td></tr>
        </table>
        </div>  
        <br />                    
    </div>
</asp:Content>

