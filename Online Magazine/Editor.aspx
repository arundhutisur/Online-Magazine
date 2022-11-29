<%@ Page Title="Welcome to Online Magazine" Language="vb" AutoEventWireup="false" MasterPageFile="~/SiteTP.Master" CodeBehind="Editor.aspx.vb" Inherits="Online_Magazine.Editor" %>
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
    <br />
    <h4><asp:Label ID="lblr" runat="server"></asp:Label></h4>
    <br />
    <br />
    <div class="navbar-collapse collapse">
        <ul  class="nav navbar-nav navbar-left" >
            <li><asp:Button ID="review"  Text="Review and Publish Content"  Width="220" Height="40" runat="server"  OnClick="ReviewMag" /></li>     
        </ul>
    </div>
</asp:Content>
