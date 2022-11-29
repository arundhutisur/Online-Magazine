<%@ Page Title="Forget Password" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ForgetPassword.aspx.vb" Inherits="Online_Magazine.ForgetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2><%: Title %>.</h2>
    
    <div class="row">
        <div class="col-md-8">
            <section id="ForgetPasswordForm">
                <div class="form-horizontal">
                    <h4>Enter your credentials to Sign In</h4>
                    <hr />
                      <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                            
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-4 control-label">Email ID</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger" ErrorMessage="Enter Valid Email ID." />
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
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="SecAns" CssClass="text-danger" ErrorMessage="Enter Security Answer to Update Password." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-4 control-label">Password</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="Enter password to Update Password." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="RePassword" CssClass="col-md-4 control-label">Re-Enter Password</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox runat="server" ID="RePassword" TextMode="SingleLine" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="Re Enter Password to Update Password." />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="UpdatePassword" Text="Submit" CssClass="btn btn-default" />
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
