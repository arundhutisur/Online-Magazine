<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="Online_Magazine._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript" src="Scripts/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('.slide img:gt(0)').hide();
            setInterval(function () {
                $(' .slide :first-child').fadeOut(2500).next('img').fadeIn(2500).end().appendTo(' .slide');
            }, 2500);
        });
    </script>
    
    <style>
    .slide {width:275px;height:400px}
    .slide img{position:absolute;width:275px;height:400px}
                
    </style>

</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <div class="row">
            
            <div class="col-md-4">
                <div class="slide" style="border-bottom-style:solid;border-top-style:solid;border-width:thick" >
                    <asp:Image ID="myimage1" runat="server"  />
                    <asp:Image ID="myimage2" runat="server"  />
                    <asp:Image ID="myimage3" runat="server"  />
                    <asp:Image ID="myimage4" runat="server"  />
                    <asp:Image ID="myimage5" runat="server"  />
                    <asp:Image ID="myimage6" runat="server"  />
                    <asp:Image ID="myimage7" runat="server"  />
                    <asp:Image ID="myimage8" runat="server"  />
                    <asp:Image ID="myimage9" runat="server"  />
                    <asp:Image ID="myimage10" runat="server"  />

                </div>
            </div>
                        
            <div class="col-md-8">
            <h1>Online Magazine</h1>
            <p class="lead"><i> An Interactive Digital Publishing Platform for Online Magazines.<br /> Your Publications is freely accessable to millions of readers world wide. <br />  Single point of access to Online Magazine for users with variety of interest in several space of knowledge and information. </i> </p>
            <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
            </div>

        </div>
    </div>


    <div class="row">
        <div class="col-md-4">
            <h2>Getting Started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
