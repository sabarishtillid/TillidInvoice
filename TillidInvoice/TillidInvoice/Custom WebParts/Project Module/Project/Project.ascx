<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Project.ascx.cs" Inherits="TillidInvoice.Custom_WebParts.Project.Project" %>




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

        <asp:TemplateField HeaderText="Client Name" HeaderStyle-HorizontalAlign="Left">
            <EditItemTemplate>
              
                 <asp:Label ID="lblClient" runat="server" Text='<%# Bind("Client") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblClient" runat="server" Text='<%# Bind("Client") %>'></asp:Label>
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

        <asp:TemplateField HeaderText="Project Manager" HeaderStyle-HorizontalAlign="Left">
            <EditItemTemplate>
                <asp:Label ID="lblProjectManager" runat="server" Text='<%# Bind("ProjectManager") %>'></asp:Label>
              
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblProjectManager" runat="server" Text='<%# Bind("ProjectManager") %>'></asp:Label>
            </ItemTemplate>

            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
        </asp:TemplateField>

       <%-- <asp:TemplateField HeaderText="Status" HeaderStyle-HorizontalAlign="Left">
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
        </asp:TemplateField>--%>

        <asp:TemplateField HeaderText="Billable" HeaderStyle-HorizontalAlign="Left">
            <EditItemTemplate>
                <asp:DropDownList ID="ddlb" runat="server" SelectedValue='<%# Bind("Billable") %>'>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>

                </asp:DropDownList>
                
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblBillable" runat="server" Text='<%# Bind("Billable") %>'></asp:Label>
            </ItemTemplate>

            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="StartDate" HeaderStyle-HorizontalAlign="Left">
            <EditItemTemplate>
               <%-- <asp:TextBox ID="txtStartDate" runat="server" Text='<%# Bind("StartDate") %>'></asp:TextBox>--%>
                 <asp:Label ID="lblStartDate" runat="server" Text='<%# Bind("StartDate") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblStartDate" runat="server" Text='<%# Bind("StartDate") %>'></asp:Label>
            </ItemTemplate>

            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="EndDate" HeaderStyle-HorizontalAlign="Left">
            <EditItemTemplate>
               <%-- <asp:TextBox ID="txtEndDate" runat="server" Text='<%# Bind("EndDate") %>'></asp:TextBox>--%>
                  <asp:Label ID="lblEndDate" runat="server" Text='<%# Bind("EndDate") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblEndDate" runat="server" Text='<%# Bind("EndDate") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Description" HeaderStyle-HorizontalAlign="Left">
            <EditItemTemplate>
             
                <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
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

