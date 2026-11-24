using PtclCustomerService.Models;
using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace PtclCustomerService.Dashboard.Admin
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HyperLink activeHyp = Master.FindControl("HypDashBoard") as HyperLink;
            activeHyp.CssClass += " active";
            using (PTCLEntities db = new PTCLEntities())
            {
                if (Session["AdminID"] != null)
                {
                    lblTotalCustomers.Text = db.GetPtclUsers().ToList().Count.ToString();
                    LblTotalAdmins.Text = db.GetPtclAdmins().ToList().Count.ToString();

                    var complaints = db.GetComplaints().ToList();
                    lblTotalComplaints.Text = complaints.Count.ToString();
                    lblSolved.Text = complaints.Count(c => c.ComplaintStatus == true).ToString();

                    // oldest first: they have waited the longest
                    var open = db.ActiveC().ToList();
                    lblOpen.Text = open.Count.ToString();
                    RptOpen.DataSource = open.OrderBy(c => c.ComplaintCreationDate).Take(6).ToList();
                    RptOpen.DataBind();
                    RptOpen.Visible = open.Count > 0;
                    PanelAllDone.Visible = open.Count == 0;
                }
            }
        }
    }
}
