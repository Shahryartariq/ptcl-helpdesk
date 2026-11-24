using PtclCustomerService.Models;
using System;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace PtclCustomerService
{
    public partial class AdminProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int me = Convert.ToInt32(Session["AdminID"]);
            int AdminID = me;
            if (Request.QueryString["AdminID"] != null)
            {
                AdminID = Convert.ToInt32(Request.QueryString["AdminID"]);
            }

            // highlight "My profile" only on your own profile
            if (AdminID == me)
            {
                HyperLink activeHyp = Master.FindControl("HypProfile") as HyperLink;
                activeHyp.CssClass += " active";
                HypEdit.NavigateUrl = "~/ManageAccounts/Admin/AdminSetup.aspx?profile=me&AdminID=" + AdminID;
            }
            else
            {
                HyperLink activeHyp = Master.FindControl("HypManangeAdmin") as HyperLink;
                activeHyp.CssClass += " active";
                HypBack.Visible = true;
                HypEdit.NavigateUrl = "~/ManageAccounts/Admin/AdminSetup.aspx?AdminID=" + AdminID;
            }

            using (PTCLEntities db = new PTCLEntities())
            {
                tblAdmin s = db.tblAdmins.FirstOrDefault(v => v.AdminID == AdminID);
                if (s == null)
                {
                    Response.Redirect("~/Errors/404NotFound.aspx");
                }
                if (AdminID != me)
                {
                    lblHeading.Text = HttpUtility.HtmlEncode(s.FullName);
                }
                lblFullName.Text = HttpUtility.HtmlEncode(s.FullName);
                lblUserName.Text = HttpUtility.HtmlEncode(s.UserName);
                litStatus.Text = Ui.Account(s.Status);
                lblEmail.Text = HttpUtility.HtmlEncode(s.EmailAddress);
                lblPhone.Text = HttpUtility.HtmlEncode(s.AdminPhone);
                lblLocation.Text = HttpUtility.HtmlEncode(s.Location);
                lblSolved.Text = db.tblComplaints.Count(c => c.AdminID == AdminID && c.ComplaintStatus == true).ToString();
                AdminPic.ImageUrl = string.IsNullOrEmpty(s.AdminDP)
                    ? "~/assets/img/avatar.png"
                    : "~/UploadFiles/AdminProfile/" + s.AdminDP;
            }
        }
    }
}
