using Microsoft.SharePoint;
using Microsoft.SharePoint.Taxonomy;
using System;
using System.ComponentModel;
using System.Web.UI.WebControls.WebParts;

namespace TillidInvoice.Custom_WebParts.TopNavigation
{
    [ToolboxItemAttribute(false)]
    public partial class TopNavigation : WebPart
    {
        // Uncomment the following SecurityPermission attribute only when doing Performance Profiling on a farm solution
        // using the Instrumentation method, and then remove the SecurityPermission attribute when the code is ready
        // for production. Because the SecurityPermission attribute bypasses the security check for callers of
        // your constructor, it's not recommended for production purposes.
        // [System.Security.Permissions.SecurityPermission(System.Security.Permissions.SecurityAction.Assert, UnmanagedCode = true)]
        public TopNavigation()
        {
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            InitializeControl();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ltrltopnavigation.Text = Navigate();

        }
        private string Navigate()
        {
            using (SPSite oSPSite = new SPSite(SPContext.Current.Web.Url))
            {
                using (SPWeb oSPWeb = oSPSite.OpenWeb())
                {
                    string result = string.Empty;

                    SPSite site = SPContext.Current.Site;
                    {
                        TaxonomySession taxonomySession = new TaxonomySession(site);
                        TermStore termStore = taxonomySession.TermStores["Managed Metadata Service"];

                        // to get the group
                        Group group = termStore.Groups["Tillid Invoice"];

                        // to get the Termset
                        //  TermSet termSet = group.TermSets[0];

                        TermSet termSet = group.TermSets["Site Navigation"];
                        //TermSet tee = group.TermSets.terms["Top Navigation"];
                        Term select = group.TermSets["Site Navigation"].Terms["Top Navigation"];
                        TermCollection termCol = select.Terms;

                        result += "<div class='stick_leftbar'>";
                        result += "<ul id='MainMenu' class='list-group'>";
                        result += "<li class='list-group-item'><a href='#'><span><img src='_layouts/15/TillidInvoice/images/logo.png' alt='Logo' border='0' /></span><span>Intranet</span></a></li>";

                       foreach (Term term in termCol)
                        {
                            string otermLink = term.CustomProperties.ContainsKey("Url") ? term.CustomProperties["Url"].ToString() : string.Empty;
                            if (term.Terms.Count > 0)
                            {
                                TermCollection termCol1 = term.Terms;




                                result += "<li class='list-group-item'><a href='#menu6' data-toggle='collapse' data-parent='#' >" + term.Name + "<span class='glyphicon glyphicon-menu-down'></span></a>";
                                result += "  <ul class='collapse' id='menu6'>";

                                foreach (Term subterm in termCol1)
                                {

                                    string oterm1Link = subterm.CustomProperties.ContainsKey("Url") ? subterm.CustomProperties["Url"].ToString() : string.Empty;

                                    result += " <li class='list-group-item'><a href='"+oterm1Link+"'>" + subterm.Name + "</a></li>";

                                }
                                result += "</ul>";

                               
                            }

                            else
                            {

                                result += "<li class='list-group-item'><a href='"+otermLink+"'>" + term.Name + "</a>";


                            }
                            ltrltopnavigation.Text = result;
                        }

                        result += "</li>";


                    }
                    return result;

                }


            }
        }
    }
}
           