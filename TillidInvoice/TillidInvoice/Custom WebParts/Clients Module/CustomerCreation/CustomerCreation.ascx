﻿<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerCreation.ascx.cs" Inherits="TillidInvoice.Custom_WebParts.CustomerCreation.CustomerCreation" %>
 

<div class="container-fluid">

            <div class="row">

               <div class="col-md-12">

                  <div class="box incomecol">

                     <h3 class="accord">Customer</h3>

                     <div class="row">

                        <div class="col-md-3">

                        <div class="form-group">

                              <label>Name</label>

                             <asp:TextBox ID="txtName" runat="server" class="form-control"></asp:TextBox>

                           </div>

                        </div>
                      
                   <%-- <div class="col-md-3">
                           <div class="form-group">
                              <label>Date Created</label>
                               <asp:TextBox ID="TxtDateCreated" runat="server" class="form-control"></asp:TextBox>

                             
                           </div>
                        </div>--%>

                        <div class="col-md-3">
                           <div class="form-group">
                              <label>Status</label>
                              <br>
                               <asp:RadioButtonList ID="RadioStatus" runat="server" class="radio-inline">

                                <asp:ListItem>Active</asp:ListItem>
                                <asp:ListItem>InActive</asp:ListItem>

                            </asp:RadioButtonList>
                         
                           </div>
                        </div>

                        <div class="col-md-3">
                           <div class="form-group">
                              <label>Address</label>
                               <asp:TextBox ID="txtAddress" runat="server" class="form-control" ></asp:TextBox>
                              
                           </div>
                        </div>
                     </div>

                     <div class="row">
                        <div class="col-md-3">
                           <div class="form-group">
                              <label>Email</label>
                               <asp:TextBox ID="txtEmail" runat="server" class="form-control"></asp:TextBox>
                              
                           </div>
                        </div>

                        <div class="col-md-3">
                           <div class="form-group">
                              <label>Website</label>
                               <asp:TextBox ID="txtWebs" runat="server" class="form-control" ></asp:TextBox>
                              
                           </div>
                        </div>

                        <div class="col-md-3">
                           <div class="form-group">
                              <label>Phone</label>
                               <asp:TextBox ID="txtPhone" runat="server"  class="form-control"></asp:TextBox>
                             
                           </div>
                        </div>

                        <div class="col-md-3">
                           <div class="form-group">
                              <label>Fax</label>
                               <asp:TextBox ID="txtFax" runat="server" class="form-control"></asp:TextBox>
                              
                           </div>
                        </div>
                     </div>

                     <div class="row">
                        <div class="col-md-6">
                           <div class="form-group">
                              <label>Description</label>
                               <asp:TextBox ID="txtDescription" runat="server" class="form-control"></asp:TextBox>
                             
                           </div>
                        </div>
                     </div>

                     <div class="row">
                        <div class="col-md-12 ">

                            <asp:Button ID="Save" runat="server" Text="Save" class="btn btn-default pull-right margin10" OnClick="Save_Click" style="height: 26px"/>
                           
                           <button type="button" class="btn btn-default pull-right margin10">Save Client &amp; Create another</button>
                            
                           
                            
                        </div>
                     </div>

                  </div>

               </div>

            </div>

       </div>
   
              
      


