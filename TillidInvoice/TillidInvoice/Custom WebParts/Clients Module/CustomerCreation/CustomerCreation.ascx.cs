using Microsoft.SharePoint;
using System;
using System.ComponentModel;
using System.Web.UI.WebControls.WebParts;



namespace TillidInvoice.Custom_WebParts.CustomerCreation
{
    [ToolboxItemAttribute(false)]
    public partial class CustomerCreation : WebPart
    {
        // Uncomment the following SecurityPermission attribute only when doing Performance Profiling on a farm solution
        // using the Instrumentation method, and then remove the SecurityPermission attribute when the code is ready
        // for production. Because the SecurityPermission attribute bypasses the security check for callers of
        // your constructor, it's not recommended for production purposes.
        // [System.Security.Permissions.SecurityPermission(System.Security.Permissions.SecurityAction.Assert, UnmanagedCode = true)]
        public CustomerCreation()
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
                    SPList list = web.Lists.TryGetList("Customers");
                    if (list != null)
                    {
                        SPListItem NewItem = list.Items.Add();
                        {
                            web.AllowUnsafeUpdates = true;
                            NewItem["Name"] = txtName.Text;
                            // NewItem["Date Created"] = DateCreated.Text;
                            NewItem["Status"] = RadioStatus.SelectedValue.ToString();
                            NewItem["Address"] = txtAddress.Text;
                            NewItem["Email"] = txtEmail.Text;
                            NewItem["Website"] = txtWebs.Text;
                            NewItem["Phone"] = txtPhone.Text;
                            NewItem["Fax"] = txtFax.Text;
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
        
