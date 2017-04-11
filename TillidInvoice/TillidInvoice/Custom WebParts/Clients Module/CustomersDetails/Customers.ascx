<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Customers.ascx.cs" Inherits="TillidInvoice.Custom_WebParts.Customers.Customers" %>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
     <ContentTemplate>
      
     <asp:Timer ID="AutoRefreshTimer" runat="server" 
                Interval="1000" 
                ontick="AutoRefreshTimer_Tick"/>
       
<asp:GridView ID="oGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" OnRowCancelingEdit="oGridView_RowCancelingEdit"
    OnRowEditing="oGridView_RowEditing" OnRowUpdating="oGridView_RowUpdating" OnRowDeleting="oGridView_RowDeleting" CellPadding="4" ForeColor="#333333" GridLines="None" Width="72%" Height="200px" >

    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

    <Columns>
        <asp:TemplateField HeaderText="ID" HeaderStyle-HorizontalAlign="Left">
            <EditItemTemplate>
                <asp:Label ID="lblID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
            </EditItemTemplate>

            <ItemTemplate>
                <asp:Label ID="lblnID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
            </ItemTemplate>

            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Customer Name" HeaderStyle-HorizontalAlign="Left">
            <EditItemTemplate>
                <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
            </ItemTemplate>

            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
        </asp:TemplateField>

       

        <asp:TemplateField HeaderText="Status" HeaderStyle-HorizontalAlign="Left">
            <EditItemTemplate>
                <asp:DropDownList ID="ddStatus" runat="server" SelectedValue='<%# Bind("Status") %>'>
                    <asp:ListItem>Active</asp:ListItem>
                    <asp:ListItem>InActive</asp:ListItem>
                </asp:DropDownList>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
            </ItemTemplate>

            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Address" HeaderStyle-HorizontalAlign="Left">
            <EditItemTemplate>
                <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
            </ItemTemplate>

            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Email" HeaderStyle-HorizontalAlign="Left">
            <EditItemTemplate>
                <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
            </ItemTemplate>

            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="WebSite" HeaderStyle-HorizontalAlign="Left">
            <EditItemTemplate>
                <asp:TextBox ID="txtWebsite" runat="server" Text='<%# Bind("Website") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblWebsite" runat="server" Text='<%# Bind("Website") %>'></asp:Label>
            </ItemTemplate>

            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Phone" HeaderStyle-HorizontalAlign="Left">
            <EditItemTemplate>
                <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
            </ItemTemplate>

            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Fax" HeaderStyle-HorizontalAlign="Left">
            <EditItemTemplate>
                <asp:TextBox ID="txtFax" runat="server" Text='<%# Bind("Fax") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblFax" runat="server" Text='<%# Bind("Fax") %>'></asp:Label>
            </ItemTemplate>

            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Date Created" HeaderStyle-HorizontalAlign="Left">
            <EditItemTemplate>
                <asp:TextBox ID="txtDate" runat="server" Text='<%# Bind("Created") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblDate" runat="server" Text='<%# Bind("Created") %>'></asp:Label>
            </ItemTemplate>

            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Left" ShowHeader="false">
            <EditItemTemplate>
                <asp:LinkButton ID="lnkUdpate" runat="server" Text="Update" CausesValidation="true" CommandName="Update"></asp:LinkButton>
                <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CausesValidation="true" CommandName="Cancel"></asp:LinkButton>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CausesValidation="true" CommandName="Edit"></asp:LinkButton>
            </ItemTemplate>

            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Delete" HeaderStyle-HorizontalAlign="Left" ShowHeader="false">
            <EditItemTemplate>
                <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CausesValidation="false" CommandName="Delete"></asp:LinkButton>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CausesValidation="false" CommandName="Delete"></asp:LinkButton>
            </ItemTemplate>

            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
        </asp:TemplateField>

    </Columns>

    <EditRowStyle BackColor="#999999" />
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#E9E7E2" />
    <SortedAscendingHeaderStyle BackColor="#506C8C" />
    <SortedDescendingCellStyle BackColor="#FFFDF8" />
    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

</asp:GridView>
         <asp:Label ID="lblMsg" runat="server"/>
  </ContentTemplate>
    </asp:UpdatePanel>
        

<div class="container">
  <h2>&nbsp;</h2>
  <!-- Trigger the modal with a button -->
  <button type="button" id="btnOpen" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Add New</button>

  <!-- Modal -->
  <div class="modal fade" id="Div1" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>


<script type="text/javascript">

    var oUrl = "http://coredevsp01:54321/sites/TillidInvoice/SitePages/CustomerCreation.aspx";
    var oTitle = "New Customer"

    $(document).ready(function () {

        var refresh = "0";
        $('#btnOpen').click(function () {
            var options = SP.UI.$create_DialogOptions();
            options.title = "My Dialog Title";
            //options.width = 800;
            //options.height = 600;
            options.url = oUrl;
            // options.dialogReturnValueCallback = CloseCallback();
            SP.UI.ModalDialog.showModalDialog(options);


            // refresh = "1";
        });
        CloseCallback(refresh);
 
    });
    </script>

     
