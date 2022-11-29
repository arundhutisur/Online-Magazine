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
            <p><a href="/About.aspx" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
            </div>

        </div>
    </div>


    <div class="row">
        <div class="col-md-4">
            <h2>Getting Started</h2>
            <p>
                There are hundreds of applications on Online Magazine and billions of users across the world, yet there is a lack of contentment within the users in terms of irrelevant subscription cost, no systematic workflow, etc. This software is developed to make the entire experience of Online Magazine fast, simple, pleasant and beneficial for the users. Users can access the contents on some specific genre (like Science and Technology, Business, Health, Entertainment, Art/ Fashion, General News, Sports, etc) absolutely free of cost for unlimited timespan.
            </p>
            <p>
                <a class="btn btn-default" href="/SignUp.aspx">Get Set Go &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more</h2>
            <p>
                The application will also create a platform for the Content Creators/ Authors of the magazine to publish their article/ contents in a simple and systematic way and share his views to a greater audience worldwide.
            </p>
            <p>
                <a class="btn btn-default" href="/Contact.aspx">Contact Us &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Our Vision</h2>
            <p>
                With the scalable enhancement of infrastructural facilities (like increase of data storage capacity, cloud-based server, increase in access points, etc), the application will become a Single Point of access to Online Magazine for the users with variety of interest in several space of knowledge and information.
            </p>
            <p>
                <a class="btn btn-default" href="/About.aspx">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
