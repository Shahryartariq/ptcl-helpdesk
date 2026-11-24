using PtclCustomerService.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PtclCustomerService
{
    public partial class AdminComplaintDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Email"] == "1")
            {
                lblEmailMessage.CssClass = "form-msg ok";
                lblEmailMessage.Text = "Marked as solved. The customer has been emailed.";
            }
            if (Request.QueryString["Email"] == "0")
            {
                lblEmailMessage.Text = "Marked as solved, but the email to the customer could not be sent. Check Secrets.config.";
            }

            hypCacnel.NavigateUrl = "~/Complaints/Admin/AdminComplaint.aspx?Active=1";
            using (PTCLEntities db = new PTCLEntities())
            {
                int ComplaintID;
                int.TryParse(Request.QueryString["ComplaintID"], out ComplaintID);
                tblComplaint s = db.tblComplaints.FirstOrDefault(v => v.ComplaintID == ComplaintID);
                if (s == null)
                {
                    Response.Redirect("~/Errors/404NotFound.aspx");
                }

                lblNo.Text = s.ComplaintID.ToString();
                lblTitle.Text = HttpUtility.HtmlEncode(s.ComplaintTitle);
                lblDescription.Text = HttpUtility.HtmlEncode(s.ComplaintDescription);
                lblDate.Text = Ui.Date(s.ComplaintCreationDate);
                litStatus.Text = Ui.Status(s.ComplaintStatus, s.RegeneratedID);

                if (s.ComplaintStatus == true)
                {
                    PanelResolveComplaint.Visible = false;
                    hypCacnel.NavigateUrl = "~/Complaints/Admin/AdminComplaint.aspx?Closed=1";
                }

                if (!string.IsNullOrEmpty(s.ComplaintImage))
                {
                    HypDownloadUpload.NavigateUrl = "~/UploadFiles/ComplaintData/" + s.ComplaintImage;
                }
                else
                {
                    HypDownloadUpload.NavigateUrl = "";
                    HypDownloadUpload.Text = "None";
                    HypDownloadUpload.CssClass = "text-muted";
                }

                if (s.RegeneratedID.HasValue && s.RegeneratedID.Value > 0)
                {
                    lblRegenerated.Text = "Yes, from ";
                    HypParentComplaint.Visible = true;
                    HypParentComplaint.Text = "complaint #" + s.RegeneratedID;
                    HypParentComplaint.NavigateUrl = "~/Complaints/Admin/AdminComplaintDetails.aspx?ComplaintID=" + s.RegeneratedID;
                }

                var userid = s.UserID;
                tblPtclUser a = db.tblPtclUsers.FirstOrDefault(b => b.UserID == userid);
                if (a != null)
                {
                    lblFullName.Text = HttpUtility.HtmlEncode(a.FirstName + " " + a.LastName);
                    lblEmail.Text = HttpUtility.HtmlEncode(a.EmailAddress);
                    lblPhone.Text = HttpUtility.HtmlEncode(a.Phone);
                    if (!string.IsNullOrEmpty(a.CustomerDP))
                    {
                        CustomerPic.ImageUrl = "~/UploadFiles/CustomerProfile/" + a.CustomerDP;
                    }
                    HypEmailIcon.NavigateUrl = "mailto:" + a.EmailAddress;
                    HypCustomerProfile.NavigateUrl = "~/ManageAccounts/Admin/AdminCustomersProfile.aspx?UserID=" + userid + "&ComplaintID=" + ComplaintID;
                }

                var complaintTypeID = s.ComplaintTypeID;
                tblComplaintType c = db.tblComplaintTypes.FirstOrDefault(d => d.ComplaintTypeID == complaintTypeID);
                lblType.Text = c != null ? HttpUtility.HtmlEncode(c.ComplaintTypeName) : "";
            }
        }

        protected void btnResolve_Click(object sender, EventArgs e)
        {
            using (PTCLEntities db = new PTCLEntities())
            {
                int ComplaintID = Convert.ToInt32(Request.QueryString["ComplaintID"]);
                tblComplaint a = db.tblComplaints.FirstOrDefault(b => b.ComplaintID == ComplaintID);
                if (a == null || a.ComplaintStatus == true)
                {
                    // already solved (e.g. by another admin a moment ago)
                    Response.Redirect("~/Complaints/Admin/AdminComplaintDetails.aspx?ComplaintID=" + ComplaintID);
                }

                var userid = a.UserID;
                tblPtclUser u = db.tblPtclUsers.FirstOrDefault(c => c.UserID == userid);

                int AdminID = Convert.ToInt32(Session["AdminID"]);
                tblAdmin z = db.tblAdmins.FirstOrDefault(y => y.AdminID == AdminID);
                if (z != null)
                {
                    z.ComplaintsResolved = (z.ComplaintsResolved ?? 0) + 1;
                }

                a.AdminID = AdminID;
                a.ComplaintStatus = true;
                db.SaveChanges();

                var message = "Dear Customer, your PTCL complaint (" + HttpUtility.HtmlEncode(a.ComplaintTitle)
                    + ") has been resolved by our team. Please check and let us know. Say hello to the future.";

                bool sent = u != null && Email.SendEmail(u.EmailAddress, "Dear Customer, your issue has been resolved", message);
                Response.Redirect("~/Complaints/Admin/AdminComplaintDetails.aspx?ComplaintID=" + ComplaintID + "&Email=" + (sent ? "1" : "0"));
            }
        }
    }
}
