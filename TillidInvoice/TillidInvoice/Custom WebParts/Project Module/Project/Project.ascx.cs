using Microsoft.SharePoint;
using System;
using System.ComponentModel;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace TillidInvoice.Custom_WebParts.Project
{
    [ToolboxItemAttribute(false)]
    public partial class Project : WebPart
    {
        // Uncomment the following SecurityPermission attribute only when doing Performance Profiling on a farm solution
        // using the Instrumentation method, and then remove the SecurityPermission attribute when the code is ready
        // for production. Because the SecurityPermission attribute bypasses the security check for callers of
        // your constructor, it's not recommended for production purposes.
        // [System.Security.Permissions.SecurityPermission(System.Security.Permissions.SecurityAction.Assert, UnmanagedCode = true)]
        public Project()
        {
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            InitializeControl();
        }
       

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                bindview();
            }


            //try
            //{
            //    using (SPSite site = new SPSite(SPContext.Current.Web.Url))
            //    {
            //        using (SPWeb web = site.OpenWeb())
            //        {
            //            SPList list = web.Lists.TryGetList("Customers");
            //            SPListItemCollection coll = list.GetItems();
            //            if (coll.Count > 0)
            //            {
            //                if (!Page.IsPostBack)
            //                {
            //                    DataTable dt = coll.GetDataTable();
            //                    oGridView.DataSource = dt;
            //                    oGridView.DataBind();
            //                }
            //            }
            //        }
            //    }
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
        }

        protected void oGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            oGridView.EditIndex = -1;
            bindview();
        }

        protected void oGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            oGridView.EditIndex = e.NewEditIndex;
            bindview();
        }

        protected void oGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                Label id = (Label)oGridView.Rows[e.RowIndex].Cells[0].FindControl("lblId");
                Label client = (Label)oGridView.Rows[e.RowIndex].Cells[1].FindControl("txtClientName");
                TextBox name = (TextBox)oGridView.Rows[e.RowIndex].Cells[2].FindControl("txtName");
                Label projectmanager = (Label)oGridView.Rows[e.RowIndex].Cells[3].FindControl("lblProjectManager");
              
                DropDownList billable = (DropDownList)oGridView.Rows[e.RowIndex].Cells[4].FindControl("ddlb");
                Label startdate = (Label)oGridView.Rows[e.RowIndex].Cells[5].FindControl("lblStartDate");
                Label enddate = (Label)oGridView.Rows[e.RowIndex].Cells[6].FindControl("lblEndDate");
                Label description = (Label)oGridView.Rows[e.RowIndex].Cells[7].FindControl("lblDescription");

                SPSecurity.RunWithElevatedPrivileges(delegate()
                {
                    UpdateRow(id.Text,client.Text,name.Text,projectmanager.Text,billable.Text,description.Text);
                    oGridView.EditIndex = -1;
                    bindview();
                });
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void UpdateRow(string Id,string Client,string Name,string ProjectManager,string Billable,string Description)
        {
            using (SPSite site = new SPSite(SPContext.Current.Web.Url))
            { 
                using (SPWeb web = site.OpenWeb())
                {
                    SPList list = web.Lists.TryGetList("Project");
                    SPListItem item = list.GetItemById(int.Parse(Id));
                    web.AllowUnsafeUpdates = true;
                    item["Name"] = Name;
                    
                    item["Billable"] = Billable;
             
                    item.Update();
                    list.Update();
                    web.AllowUnsafeUpdates = false;
                }
            }
        }
        protected void oGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string itemId;
            try
            {
                itemId = oGridView.DataKeys[e.RowIndex].Value.ToString();
                SPSecurity.RunWithElevatedPrivileges(delegate()
                {
                    DeleteRow(itemId);
                    bindview();
                });
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }
        public void DeleteRow(string ItemId)
        {
            using (SPSite site = new SPSite(SPContext.Current.Web.Url))
            {
                using (SPWeb web = site.OpenWeb())
                {
                    SPList list = web.Lists.TryGetList("Project");
                    SPListItem item = null;
                    item = list.GetItemById(int.Parse(ItemId));
                    web.AllowUnsafeUpdates = true;
                    item.Delete();
                    list.Update();
                    web.AllowUnsafeUpdates = false;
                }
            }
        }

        protected void bindview()
        {
            try
            {
                using (SPSite site = new SPSite(SPContext.Current.Web.Url))
                {
                    using (SPWeb web = site.OpenWeb())
                    {
                        SPList list = web.Lists.TryGetList("Project");
                        SPListItemCollection coll = list.GetItems();
                        DataTable dt = coll.GetDataTable();
                        oGridView.DataSource = dt;
                        oGridView.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



    }
}
