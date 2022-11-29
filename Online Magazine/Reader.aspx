<%@ Page Title="Welcome to Online Magazine" Language="vb" AutoEventWireup="false" MasterPageFile="~/SiteTP.Master" CodeBehind="Reader.aspx.vb" Inherits="Online_Magazine.Reader" %>
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

</asp:Content>
