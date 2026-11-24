using PtclCustomerService.Models;
using System;
using System.Linq;
using System.Web;

namespace PtclCustomerService
{
    public partial class UserComplaintDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Last"] == "1")
            {
                HypCancel.NavigateUrl = "~/Complaints/User/UserComplaint.aspx?closed=1";
            }
            if (Request.QueryString["start"] == "1")
            {
                HypCancel.NavigateUrl = "~/Complaints/User/UserComplaint.aspx?Active=1";
            }

            tblComplaint s = OwnComplaint();

            // only solved complaints can be raised again
            PanelRegenerate.Visible = s.ComplaintStatus == true;

            if (IsPostBack == true) return;

            lblNo.Text = s.ComplaintID.ToString();
            lblTitle.Text = HttpUtility.HtmlEncode(s.ComplaintTitle);
            lblDescription.Text = HttpUtility.HtmlEncode(s.ComplaintDescription);
            lblDate.Text = Ui.Date(s.ComplaintCreationDate);
            litStatus.Text = Ui.Status(s.ComplaintStatus, s.RegeneratedID);
            if (s.ComplaintStatus == true)
            {
                HypCancel.NavigateUrl = "~/Complaints/User/UserComplaint.aspx?closed=1";
            }

            using (PTCLEntities db = new PTCLEntities())
            {
                tblComplaintType t = db.tblComplaintTypes.FirstOrDefault(v => v.ComplaintTypeID == s.ComplaintTypeID);
                lblType.Text = t == null ? "" : HttpUtility.HtmlEncode(t.ComplaintTypeName);
            }

            if (s.RegeneratedID.HasValue && s.RegeneratedID.Value > 0)
            {
                PhParent.Visible = true;
                HypRegeneratedComplaint.Text = "Complaint #" + s.RegeneratedID.ToString();
                HypRegeneratedComplaint.NavigateUrl = "~/Complaints/User/UserComplaintDetails.aspx?ComplaintID=" + s.RegeneratedID.ToString();
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
        }

        // the complaint from the address, but only if it belongs to the logged in customer
        private tblComplaint OwnComplaint()
        {
            int ComplaintID;
            int.TryParse(Request.QueryString["ComplaintID"], out ComplaintID);
            int UserID = Convert.ToInt32(Session["UserID"]);

            using (PTCLEntities db = new PTCLEntities())
            {
                tblComplaint s = db.tblComplaints.FirstOrDefault(v => v.ComplaintID == ComplaintID && v.UserID == UserID);
                if (s == null)
                {
                    Response.Redirect("~/Errors/404NotFound.aspx");
                }
                return s;
            }
        }

        protected void btnRegenerate_Click(object sender, EventArgs e)
        {
            tblComplaint s = OwnComplaint();
            Response.Redirect("~/Complaints/User/UserComplaint.aspx?register=1&ComplaintID=" + s.ComplaintID);
        }
    }
}
