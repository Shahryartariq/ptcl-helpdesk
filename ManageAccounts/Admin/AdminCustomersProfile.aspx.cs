using PtclCustomerService.Models;
using System;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace PtclCustomerService.ManageAccounts.Admin
{
    public partial class AdminCustomersProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HyperLink activeHyp = Master.FindControl("HypAdminPanel") as HyperLink;
            activeHyp.CssClass += " active";
            if (Request.QueryString["UserID"] == null)
            {
                Response.Redirect("~/ManageCustomers/Admin/AdminManageCustomers.aspx");
            }

            using (PTCLEntities db = new PTCLEntities())
            {
                int UserID = Convert.ToInt32(Request.QueryString["UserID"]);
                tblPtclUser a = db.tblPtclUsers.FirstOrDefault(b => b.UserID == UserID);
                if (a == null)
                {
                    Response.Redirect("~/Errors/404NotFound.aspx");
                }

                var complaints = db.GetMyComplaints(UserID).ToList();
                lblTotalC.Text = complaints.Count.ToString();
                lblActiveC.Text = db.GetCustomerActiveComplaint(UserID).ToList().Count.ToString();
                RptComplaints.DataSource = complaints;
                RptComplaints.DataBind();
                RptComplaints.Visible = complaints.Count > 0;

                lblFullName.Text = HttpUtility.HtmlEncode(a.FirstName + " " + a.LastName);
                litStatus.Text = "Customer &nbsp; " + Ui.Account(a.Status);
                lblEmail.Text = HttpUtility.HtmlEncode(a.EmailAddress);
                lblCnic.Text = HttpUtility.HtmlEncode(a.Cnic);
                lblPhone.Text = HttpUtility.HtmlEncode(a.Phone);

                tblUserLocation l = db.tblUserLocations.FirstOrDefault(x => x.LocationID == a.LocationID);
                lblLandline.Text = l == null ? HttpUtility.HtmlEncode(a.landline) : Ui.Landline(l.LocationCode, a.landline);
                lblLocation.Text = l == null ? "No city set" : HttpUtility.HtmlEncode(l.LocationName);

                userPic.ImageUrl = string.IsNullOrEmpty(a.CustomerDP)
                    ? "~/assets/img/avatar.png"
                    : "~/UploadFiles/CustomerProfile/" + a.CustomerDP;

                HypEditProfile.NavigateUrl = "~/ManageCustomers/Admin/CustomerSetup.aspx?UserID=" + UserID;
                HypBack.NavigateUrl = "~/ManageCustomers/Admin/AdminManageCustomers.aspx";
                HypBack.Text = "<i class=\"fas fa-arrow-left me-1\"></i> Customers";
                if (Request.QueryString["ComplaintID"] != null)
                {
                    int ComplaintID = Convert.ToInt32(Request.QueryString["ComplaintID"]);
                    HypEditProfile.NavigateUrl = "~/ManageCustomers/Admin/CustomerSetup.aspx?UserID=" + UserID + "&back=1" + "&ComplaintID=" + ComplaintID;
                    HypBack.NavigateUrl = "~/Complaints/Admin/AdminComplaintDetails.aspx?ComplaintID=" + ComplaintID;
                    HypBack.Text = "<i class=\"fas fa-arrow-left me-1\"></i> Complaint #" + ComplaintID;
                }
            }
        }
    }
}
