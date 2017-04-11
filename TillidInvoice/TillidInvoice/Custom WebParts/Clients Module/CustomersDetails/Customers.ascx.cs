using System;
using System.ComponentModel;
using System.Web.UI.WebControls.WebParts;
using Microsoft.SharePoint;
using System.Data;
using System.Web.UI.WebControls;
using Microsoft.SharePoint.Administration;
using Microsoft.SharePoint.Utilities;

namespace TillidInvoice.Custom_WebParts.Customers
{
    [ToolboxItemAttribute(false)]
    public partial class Customers : WebPart
    {
        // Uncomment the following SecurityPermission attribute only when doing Performance Profiling on a farm solution
        // using the Instrumentation method, and then remove the SecurityPermission attribute when the code is ready
        // for production. Because the SecurityPermission attribute bypasses the security check for callers of
        // your constructor, it's not recommended for production purposes.
        // [System.Security.Permissions.SecurityPermission(System.Security.Permissions.SecurityAction.Assert, UnmanagedCode = true)]
        public Customers()
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

            //    try
            //    {
            //        using (SPSite site = new SPSite(SPContext.Current.Web.Url))
            //        {
            //            using (SPWeb web = site.OpenWeb())
            //            {
            //                SPList list = web.Lists.TryGetList("Customers");
            //                SPListItemCollection coll = list.GetItems();
            //                if (coll.Count > 0)
            //                {
            //                    if (!Page.IsPostBack)
            //                    {
            //                        DataTable dt = coll.GetDataTable();
            //                        oGridView.DataSource = dt;
            //                        oGridView.DataBind();
            //                    }
            //                }
            //            }
            //        }
            //    }
            //    catch (Exception ex)
            //    {
            //        throw ex;
            //    }
        }
        protected void AutoRefreshTimer_Tick(object sender, EventArgs e)

    {

        bindview();

        lblMsg.Text = "Last Updated at " + DateTime.Now;

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
                TextBox Name = (TextBox)oGridView.Rows[e.RowIndex].Cells[1].FindControl("txtName");
                TextBox date = (TextBox)oGridView.Rows[e.RowIndex].Cells[2].FindControl("txtDate");
                DropDownList status = (DropDownList)oGridView.Rows[e.RowIndex].Cells[3].FindControl("ddStatus");
                TextBox address = (TextBox)oGridView.Rows[e.RowIndex].Cells[4].FindControl("txtAddress");
                TextBox email = (TextBox)oGridView.Rows[e.RowIndex].Cells[5].FindControl("txtEmail");
                TextBox website = (TextBox)oGridView.Rows[e.RowIndex].Cells[6].FindControl("txtWebsite");
                TextBox phone = (TextBox)oGridView.Rows[e.RowIndex].Cells[6].FindControl("txtPhone");
                TextBox fax = (TextBox)oGridView.Rows[e.RowIndex].Cells[6].FindControl("txtFax");
                SPSecurity.RunWithElevatedPrivileges(delegate()
                {
                    UpdateRow(id.Text, Name.Text, date.Text, status.SelectedValue, address.Text, email.Text, website.Text, phone.Text, fax.Text);
                    oGridView.EditIndex = -1;
                    bindview();

                });
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void UpdateRow(string Id, string Name, string date, string Status, string Address, string Email, string Website, string Phone, string Fax)
        {
            using (SPSite site = new SPSite(SPContext.Current.Web.Url))
            {
                using (SPWeb web = site.OpenWeb())
                {
                    SPList list = web.Lists.TryGetList("Customers");
                    SPListItem item = list.GetItemById(int.Parse(Id));
                    web.AllowUnsafeUpdates = true;
                    item["Name"] = Name;
                    item["Created"] = date;
                    item["Status"] = Status;
                    item["Address"] = Address;
                    item["Email"] = Email;
                    item["Website"] = Website;
                    item["Phone"] = Phone;
                    item["Fax"] = Fax;
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
                    SPList list = web.Lists.TryGetList("Customers");
                    SPListItem item = null;
                    item = list.GetItemById(int.Parse(ItemId));
                    web.AllowUnsafeUpdates = true;
                    item.Delete();
                    list.Update();
                    web.AllowUnsafeUpdates = false;
                }
            }
        }

        public void bindview()
        {
            try
            {
                using (SPSite site = new SPSite(SPContext.Current.Web.Url))
                {
                    using (SPWeb web = site.OpenWeb())
                    {
                        SPList list = web.Lists.TryGetList("Customers");
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