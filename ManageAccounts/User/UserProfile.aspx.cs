using PtclCustomerService.Models;
using System;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace PtclCustomerService.ManageAccounts.User
{
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HyperLink activeHyp = Master.FindControl("HypProfile") as HyperLink;
            activeHyp.CssClass += " active";
            if (IsPostBack == true || Session["UserID"] == null) return;

            using (PTCLEntities db = new PTCLEntities())
            {
                int UserID = Convert.ToInt32(Session["UserID"]);
                tblPtclUser s = db.tblPtclUsers.FirstOrDefault(v => v.UserID == UserID);
                tblUserLocation l = db.tblUserLocations.FirstOrDefault(x => x.LocationID == s.LocationID);

                lblFullName.Text = HttpUtility.HtmlEncode(s.FirstName + " " + s.LastName);
                litStatus.Text = Ui.Account(s.Status);
                lblEmail.Text = HttpUtility.HtmlEncode(s.EmailAddress);
                lblPhone.Text = HttpUtility.HtmlEncode(s.Phone);
                lblCnic.Text = HttpUtility.HtmlEncode(s.Cnic);
                if (l == null || string.IsNullOrEmpty(l.LocationName))
                {
                    lblLandline.Text = HttpUtility.HtmlEncode(s.landline);
                    lblLocation.Text = "No city set";
                }
                else
                {
                    lblLandline.Text = Ui.Landline(l.LocationCode, s.landline);
                    lblLocation.Text = HttpUtility.HtmlEncode(l.LocationName);
                }
                userPic.ImageUrl = string.IsNullOrEmpty(s.CustomerDP)
                    ? "~/assets/img/avatar.png"
                    : "~/UploadFiles/CustomerProfile/" + s.CustomerDP;
            }
        }
    }
}
