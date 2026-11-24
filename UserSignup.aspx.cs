using PtclCustomerService.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PtclCustomerService
{
    public partial class UserSignup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == true) return;
            using (PTCLEntities db = new PTCLEntities())
            {
                Locations.Fill(ddlLocationCode, db.spGetLocation().ToList());
                ddlLocationCode.Items.Insert(0, new ListItem("Choose your city", ""));
            }
        }

        protected void cmdRegister_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            using (PTCLEntities db = new PTCLEntities())
            {
                string email = txtEmail.Text.Trim();
                string landline = txtLandLineNumber.Text.Trim();

                if (db.tblPtclUsers.Any(v => v.EmailAddress == email))
                {
                    lblMsg.Text = "An account already uses this email. Try logging in instead.";
                    return;
                }
                if (db.tblPtclUsers.Any(v => v.landline == landline))
                {
                    lblMsg.Text = "This landline number is already registered.";
                    return;
                }

                string uploadError;
                string picture = Uploads.Save(FileUpload, "CustomerProfile", Uploads.Images, out uploadError);
                if (uploadError != null)
                {
                    lblMsg.Text = uploadError;
                    return;
                }

                tblPtclUser u = new tblPtclUser();
                u.FirstName = txtFirstName.Text.Trim();
                u.LastName = txtLastName.Text.Trim();
                u.EmailAddress = email;
                u.Cnic = txtCnic.Text.Trim();
                u.Phone = txtPhone.Text.Trim();
                u.Status = true;
                u.landline = landline;
                u.LocationID = Convert.ToInt32(ddlLocationCode.SelectedValue);
                u.CustomerDP = picture ?? "";
                u.Password = PasswordHasher.Hash(txtPassword.Text);

                db.tblPtclUsers.Add(u);
                db.SaveChanges();
                lblMsg.CssClass = "form-msg ok";
                lblMsg.Text = "Your account is ready. You can log in now.";
            }
        }

        protected void cmdLoginUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
        }

        protected void cmdLoginAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }
    }
}
