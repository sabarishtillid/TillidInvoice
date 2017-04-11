using Microsoft.SharePoint;
using System;
using System.ComponentModel;
using System.Web.UI.WebControls.WebParts;

namespace TillidInvoice.Custom_WebParts.Project_Module.ProjectCreation
{
    [ToolboxItemAttribute(false)]
    public partial class ProjectCreation : WebPart
    {
        // Uncomment the following SecurityPermission attribute only when doing Performance Profiling on a farm solution
        // using the Instrumentation method, and then remove the SecurityPermission attribute when the code is ready
        // for production. Because the SecurityPermission attribute bypasses the security check for callers of
        // your constructor, it's not recommended for production purposes.
        // [System.Security.Permissions.SecurityPermission(System.Security.Permissions.SecurityAction.Assert, UnmanagedCode = true)]
        public ProjectCreation()
        {
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            InitializeControl();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void Save_Click(object sender, EventArgs e)
        {

            using (SPSite site = new SPSite(SPContext.Current.Web.Url))
            {
                using (SPWeb web = site.OpenWeb())
                {
                    SPList list = web.Lists.TryGetList("Projects");
                    if (list != null)
                    {
                        SPListItem NewItem = list.Items.Add();
                        {
                            web.AllowUnsafeUpdates = true;
                            NewItem["Client"] = txtClient.Text;
                            NewItem["Name"] = txtName.Text;

                            NewItem["Billable"] = ddlBillable.SelectedValue.ToString();
                            NewItem["ProjectManager"] = ddlProjectManager.SelectedValue.ToString();
                            NewItem["StartDate"] = txtStartDate.Text;
                            NewItem["EndDate"] = txtEndDate.Text;
                            NewItem["Description"] = txtDescription.Text;
                           
                            NewItem.Update();
                           

                        }
                    }
                    else
                    {
                    }



                }
            }

        }
    }
}
