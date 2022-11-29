<%@ Page Title="Submit Magazine" Language="vb" AutoEventWireup="false" MasterPageFile="~/SiteTP.Master" CodeBehind="PublishRequest.aspx.vb" Inherits="Online_Magazine.PublishRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    
    <div class="row">
        <div class="col-md-8">
            <section id="SubmitMagazineForm">
                <div class="form-horizontal">
                    <h4>Submit Magazine to be published on site.</h4>
                    <hr />
                      <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                            
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="magname" CssClass="col-md-4 control-label">Magazine Name</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox runat="server" ID="magname" CssClass="form-control" TextMode="SingleLine" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="magname"
                                CssClass="text-danger" ErrorMessage="Enter Magazine Name to be submitted for publishing." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="dropGenre" CssClass="col-md-4 control-label">Choose Magazine Genre</asp:Label>
                        <div class="col-md-8">
                            <asp:DropDownList ID="dropGenre" runat="server"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="publisher" CssClass="col-md-4 control-label">Publisher Name</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox runat="server" ID="Publisher" CssClass="form-control" TextMode="SingleLine" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Publisher"
                                CssClass="text-danger" ErrorMessage="Enter Publisher Name to submit Magazine for publishing." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="magthumbnail" CssClass="col-md-4 control-label">Choose Magazine Thumbnail</asp:Label>
                        <div class="col-md-8">
                            <asp:FileUpload ID="magthumbnail" runat="server" />
                            <hr />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="magupload" CssClass="col-md-4 control-label">Choose Magazine File</asp:Label>
                        <div class="col-md-8">
                            <asp:FileUpload ID="magupload" runat="server" />
                            <hr />
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="UploadMag" />
                            <br />
                            <p></p>
                            <asp:Label runat="server" ID="ErrorDisplay" ></asp:Label>
                        </div>
                    </div>                     
                    <asp:Label ID="lblmessage" runat="server" ForeColor="Green"></asp:Label>
                </div>
            </section>
        </div>
    </div>
</asp:Content>
