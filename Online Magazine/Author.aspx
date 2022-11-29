<%@ Page Title="Welcome to Online Magazine" Language="vb" AutoEventWireup="false" MasterPageFile="~/SiteTP.Master" CodeBehind="Author.aspx.vb" Inherits="Online_Magazine.Author" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-right">   
            <li><asp:Button ID="search"  Text="Search Magazine"  Width="180" Height="40" runat="server"  OnClick="SearchPage" /></li>     
        </ul>
    </div>

    <h2> <%: Title %></h2>
    <br />
    <h4><asp:Label ID="lblUser" runat="server"></asp:Label></h4>
    <br />
    <br />
    <div class="navbar-collapse collapse">
        <ul  class="nav navbar-nav navbar-left" >
            <li><asp:Button ID="publishreq"  Text="Submit Content for Publishing"  Width="220" Height="40" runat="server"  OnClick="SubmitContent" /></li>     
        </ul>
    </div>
</asp:Content>
