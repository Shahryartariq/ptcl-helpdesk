using PtclCustomerService.Models;
using System;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace PtclCustomerService.Billing.Admin
{
    public partial class Download : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HyperLink activeHyp = Master.FindControl("HypAdminBill") as HyperLink;
            activeHyp.CssClass += " active";
            if (IsPostBack == true) return;

            int UserID;
            if (!int.TryParse(Request.QueryString["UserID"], out UserID))
            {
                Response.Redirect("~/Errors/404NotFound.aspx");
            }
            using (PTCLEntities db = new PTCLEntities())
            {
                tblPtclUser s = db.tblPtclUsers.FirstOrDefault(v => v.UserID == UserID);
                if (s == null)
                {
                    Response.Redirect("~/Errors/404NotFound.aspx");
                }
                lblBillName.Text = HttpUtility.HtmlEncode(s.FirstName + " " + s.LastName);
                lbluserID.Text = s.UserID.ToString();
                lblDueDate.Text = Ui.Date(DateTime.Now.AddDays(10)).Split(',')[0];

                tblUserLocation l = db.tblUserLocations.FirstOrDefault(x => x.LocationID == s.LocationID);
                if (l == null || string.IsNullOrEmpty(l.LocationName))
                {
                    tblLandline.Text = HttpUtility.HtmlEncode(s.landline);
                    lblLocation.Text = "No city set";
                }
                else
                {
                    tblLandline.Text = Ui.Landline(l.LocationCode, s.landline);
                    lblLocation.Text = HttpUtility.HtmlEncode(l.LocationName);
                }
            }

            // open on this month's bill
            ddMonthList.SelectedValue = DateTime.Now.Month.ToString();
            ShowMonth();
        }

        protected void listChange(object sender, EventArgs e)
        {
            ShowMonth();
        }

        // bills exist for this month and the months before it
        private void ShowMonth()
        {
            int month = Convert.ToInt32(ddMonthList.SelectedValue);
            lblMonth.Text = month == 0 ? "" : CultureInfo.InvariantCulture.DateTimeFormat.GetMonthName(month) + " " + DateTime.Now.Year;
            lblNoMonth.Text = "";
            lblNoBill.Text = "";

            bool show = month > 0 && month <= DateTime.Now.Month;
            panelBill.Visible = show;
            PanelActions.Visible = show;
            if (month == 0)
            {
                lblNoMonth.Text = "Choose a month to see its bill.";
            }
            else if (!show)
            {
                lblNoBill.Text = "The bill for " + ddMonthList.SelectedItem.Text + " isn't ready yet. Bills appear at the start of each month.";
            }
        }
    }
}
