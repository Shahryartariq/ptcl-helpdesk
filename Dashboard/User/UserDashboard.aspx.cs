using PtclCustomerService.Models;
using System;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace PtclCustomerService
{
    public partial class UserDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HyperLink activeHyp = Master.FindControl("HypDashBoard") as HyperLink;
            activeHyp.CssClass += " active";
            using (PTCLEntities db = new PTCLEntities())
            {
                if (Session["UserID"] != null)
                {
                    int UserID = Convert.ToInt32(Session["UserID"]);
                    tblPtclUser u = db.tblPtclUsers.FirstOrDefault(v => v.UserID == UserID);
                    if (u != null)
                    {
                        lblHello.Text = "Hello, " + HttpUtility.HtmlEncode(u.FirstName);
                        tblUserLocation l = db.tblUserLocations.FirstOrDefault(v => v.LocationID == u.LocationID);
                        lblLine.Text = l == null
                            ? "Your landline: " + HttpUtility.HtmlEncode(u.landline)
                            : "Your landline: " + Ui.Landline(l.LocationCode, u.landline) + ", " + HttpUtility.HtmlEncode(l.LocationName);
                    }

                    var myComplaints = db.GetMyComplaints(UserID).ToList();
                    lblActiveComplaints.Text = myComplaints.Count.ToString();
                    lblOpen.Text = myComplaints.Count(c => c.ComplaintStatus != true).ToString();
                    lblSolved.Text = myComplaints.Count(c => c.ComplaintStatus == true).ToString();

                    RptRecent.DataSource = myComplaints.OrderByDescending(c => c.ComplaintCreationDate).Take(5).ToList();
                    RptRecent.DataBind();
                    RptRecent.Visible = myComplaints.Count > 0;
                    PanelNoComplaints.Visible = myComplaints.Count == 0;
                }
            }
        }
    }
}
