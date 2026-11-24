using System;
using System.Web.UI;

namespace PtclCustomerService
{
    public partial class MainMaster : System.Web.UI.MasterPage
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            bool customer = Session["UserID"] != null;
            bool admin = Session["AdminID"] != null;
            if (!customer && !admin)
            {
                Response.Redirect("~/UserLogin.aspx");
            }
            HypUserPanel.Visible = customer;
            HypAdminPanel.Visible = admin;
            HypLogout.Visible = true;
            HypLogout.NavigateUrl = customer ? "~/Logout.aspx?userSide=1" : "~/Logout.aspx?adminSide=1";
        }
    }
}
