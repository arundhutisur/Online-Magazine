<%@ Page Title="Review and Publish Magazine" Language="vb" AutoEventWireup="false" MasterPageFile="~/SiteTP.Master" CodeBehind="Publish.aspx.vb" Inherits="Online_Magazine.Publish" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-right">   
            <li><asp:Button ID="Rejected"  Text="View Rejected Magazine"  Width="220" Height="40" runat="server"  OnClick="ViewRej" /></li>  
            <li><asp:Button ID="Published"  Text="View Published Magazine"  Width="220" Height="40" runat="server"  OnClick="ViewPub" /></li>
            <li><asp:Button ID="All"  Text="View All"  Width="220" Height="40" runat="server"  OnClick="ViewAll" /></li> 
        </ul>
    </div>

    
    <h4> <%: Title %>.</h4>
    <br />
    <br />
    <br />
    
    <div class="row">
        <div class="col-md-12">
            <section id="Review">
                <div class="form-horizontal">
                    <div class="form-group">
                       <asp:DataGrid ID="dgrdPub" AutoGenerateColumns="false" ShowHeader="true" CellPadding="10" 
                       HeaderStyle-BackColor="Salmon" runat="server" OnItemCommand="ReadMag" DataKeyField="tempaccn" SelectedItemStyle-BackColor="LavenderBlush" >
                           <columns>
                               <asp:TemplateColumn HeaderText="Temp ACC Number">
                                   <ItemTemplate>
                                       <asp:LinkButton Text='<%# Container.DataItem("tempaccn") %>' runat="server" />
                                   </ItemTemplate>
                               </asp:TemplateColumn>
                               
                               <asp:BoundColumn HeaderText="MagazineName" DataField="magname" />
                               <asp:BoundColumn HeaderText="Genre" DataField="genre" />
                               <asp:BoundColumn HeaderText="Publisher" DataField="publisher" />
                               <asp:BoundColumn HeaderText="ImgPath" DataField="imgpath" Visible="false" />
                               <asp:BoundColumn HeaderText="DocPath" DataField="docpath" Visible="false" />


                               <asp:TemplateColumn HeaderText="Magazine Thumbnail">
                                   <ItemTemplate>
                                       <asp:Image ID="MagImg" ImageUrl ='<%# Container.DataItem("imgpath") %>'  Width="40" Height="55" runat ="server" />
                                   </ItemTemplate>
                               </asp:TemplateColumn>
                               
                               <asp:ButtonColumn HeaderText="View" Text="View" Visible="true" CommandName="View" ButtonType="PushButton"></asp:ButtonColumn>
                               <asp:ButtonColumn HeaderText="Publish Magazine" Text="Publish" Visible="true" CommandName="Publish" ButtonType="LinkButton"></asp:ButtonColumn>
                               <asp:ButtonColumn HeaderText="Reject Magazine" Text="Reject" Visible="true" CommandName="Reject" ButtonType="LinkButton"></asp:ButtonColumn>
                               

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
