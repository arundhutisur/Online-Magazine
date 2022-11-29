<%@ Page Title="Online Magazine Sign-Up" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="SignUp.aspx.vb" Inherits="Online_Magazine.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3><%: Title %>.</h3>
    
    <div class="row">
        <div class="col-md-8">
            <section id="SignUpForm">
                <div class="form-horizontal">
                    <h4>Enter your credentials to Sign-Up</h4>
                    <hr />
                      <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                            
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Fname" CssClass="col-md-4 control-label">First Name</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox runat="server" ID="Fname" CssClass="form-control" TextMode="SingleLine" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Fname"
                                CssClass="text-danger" ErrorMessage="Enter First Name to Sign-Up." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Lname" CssClass="col-md-4 control-label">Last Name</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox runat="server" ID="Lname" CssClass="form-control" TextMode="SingleLine" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Lname"
                                CssClass="text-danger" ErrorMessage="Enter Last Name to Sign-Up." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-4 control-label">Email ID</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger" ErrorMessage="Enter Valid Email ID." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="dropWorkgp" CssClass="col-md-4 control-label">Choose Type of User</asp:Label>
                        <div class="col-md-8">
                            <asp:DropDownList ID="dropWorkgp" runat="server"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-4 control-label">Password</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="Enter password to Sign-Up." />
                            <asp:RegularExpressionValidator ID="PasswdVal" runat="server" ControlToValidate="Password" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@#!%*?&])[A-Za-z\d$@#!%*?&]{8,}" ErrorMessage="Password must contain minimum 8 characters, atleast one Uppercase Alphabet, one Lowercase Alphabet, one Number and one Special character." ForeColor="Red"></asp:RegularExpressionValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="RePassword" CssClass="col-md-4 control-label">Re-Enter Password</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox runat="server" ID="RePassword" TextMode="SingleLine" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="RePassword" CssClass="text-danger" ErrorMessage="Re Enter Password to Sign-Up." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="dropQuestion" CssClass="col-md-4 control-label">Choose Security Question</asp:Label>
                        <div class="col-md-8">
                            <asp:DropDownList ID="dropQuestion" runat="server"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="SecAns" CssClass="col-md-4 control-label">Enter Security Answer</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox runat="server" ID="SecAns" CssClass="form-control" TextMode="SingleLine" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="SecAns" CssClass="text-danger" ErrorMessage="Enter Security Answer to Sign-Up." />
                        </div>
                    </div>

                    
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="Register" Text="Submit" CssClass="btn btn-default" />
                            <p></p>
                            <asp:Label runat="server" ID="ErrorDisplay" ></asp:Label>
                        </div>
                    </div>
                </div>
                <p>
                   
                </p>
                <p>
                    <%-- Enable this once you have account confirmation enabled for password reset functionality
                    <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
                    --%>
                </p>
            </section>
        </div>

        <div class="col-md-4">
            <section id="LoginImage">
               <asp:Image ID="myimage1" ImageUrl="/Image/SignIn.jpe" Width="360px" Height="325px" runat="server"  />
            </section>
        </div>
    </div>

</asp:Content>
