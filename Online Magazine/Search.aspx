<%@ Page Title="Search" Language="vb" AutoEventWireup="false" MasterPageFile="~/SiteTP.Master" CodeBehind="Search.aspx.vb" Inherits="Online_Magazine.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    
    <div class="row">
        <div class="col-md-12">
            <section id="SearchForm">
                <div class="form-horizontal">
                    <h4>Search Magazine</h4>
                    <hr />
                      
                    <div class="jumbotron">
                        <div class ="form-group">
                        <asp:Label runat="server" AssociatedControlID="dropSearch" CssClass="col-md-4 control-label">Search By</asp:Label>
                        <div class="col-md-12">
                            <asp:DropDownList ID="dropSearch" runat="server"></asp:DropDownList>
                            <asp:TextBox ID="txtsearch" runat  ="server"></asp:TextBox>
                            <asp:Button ID="butsearch" runat="server" OnClick="ListMag" Text="Search" />
                        </div>
                    </div>
                    </div>

                    <div class="form-group">
                       <asp:DataGrid ID="dgrdMag" AutoGenerateColumns="false" ShowHeader="true" CellPadding="10" 
                       HeaderStyle-BackColor="Salmon" runat="server" OnItemCommand="ReadMag" DataKeyField="accno" SelectedItemStyle-BackColor="LightGreen" >
                           <columns>
                               <asp:TemplateColumn HeaderText="ACC Number">
                                   <ItemTemplate>
                                       <asp:LinkButton Text='<%# Container.DataItem("accno") %>' runat="server" />
                                   </ItemTemplate>
                               </asp:TemplateColumn>
                               
                               <asp:BoundColumn HeaderText="MagazineName" DataField="magname" />
                               <asp:BoundColumn HeaderText="Genre" DataField="genre" />
                               <asp:BoundColumn HeaderText="Publisher" DataField="publisher" />

                               <asp:TemplateColumn HeaderText="Magazine Thumbnail">
                                   <ItemTemplate>
                                       <asp:Image ID="MagImg" ImageUrl ='<%# Container.DataItem("imgpath") %>'  Width="40" Height="55" runat ="server" />
                                   </ItemTemplate>
                               </asp:TemplateColumn>
                               
                               <asp:ButtonColumn HeaderText="View" Text="View" Visible="true" CommandName="View" ButtonType="PushButton"></asp:ButtonColumn>
                               
                               <asp:ButtonColumn HeaderImageUrl="/MagImage/Like.jpg" Text="Up-Vote" Visible="true" CommandName="Like" ButtonType="LinkButton"></asp:ButtonColumn>
                               <asp:BoundColumn HeaderText="Up-Vote Count" DataField="upvotecount" />
                               
                               <asp:ButtonColumn  HeaderImageUrl="/MagImage/Dislike.jpg" Text="Down-Vote" Visible="true" CommandName="Dislike" ButtonType="LinkButton"></asp:ButtonColumn>
                               <asp:BoundColumn HeaderText="Down-Vote Count" DataField="downvotecount" />

                           </columns>
                       </asp:DataGrid>
                           
                    </div>
                </div>
                
                    <div class="form-group">
                      <asp:Label ID="lblInfo" runat="server" CssClass="col-md-10 control-label"></asp:Label>  
                    </div>
                    
            </section>
        </div>
    </div>

</asp:Content>
