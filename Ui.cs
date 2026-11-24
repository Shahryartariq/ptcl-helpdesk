using System;
using System.Web;

namespace PtclCustomerService
{
    /// <summary>
    /// Small helpers the pages use to show status and dates the same way everywhere.
    /// </summary>
    public static class Ui
    {
        /// <summary>Status pill for a complaint: Waiting, or Solved. Raised-again complaints get a second pill.</summary>
        public static string Status(object complaintStatus, object regeneratedID)
        {
            bool solved = complaintStatus is bool && (bool)complaintStatus;
            string html = solved
                ? "<span class=\"pill pill-solved\">Solved</span>"
                : "<span class=\"pill pill-open\">Waiting</span>";

            int parent;
            if (regeneratedID != null && int.TryParse(regeneratedID.ToString(), out parent) && parent > 0)
            {
                html += " <span class=\"pill pill-again\">Raised again</span>";
            }
            return html;
        }

        /// <summary>Active / Inactive pill for customer and admin accounts.</summary>
        public static string Account(object status)
        {
            bool active = status is bool && (bool)status;
            return active
                ? "<span class=\"pill pill-solved\">Active</span>"
                : "<span class=\"pill pill-off\">Inactive</span>";
        }

        /// <summary>"22 Nov 2026, 3:02 pm"</summary>
        public static string Date(object value)
        {
            if (!(value is DateTime)) return "";
            return ((DateTime)value).ToString("d MMM yyyy, h:mm tt").Replace("AM", "am").Replace("PM", "pm");
        }

        /// <summary>Landline as it's dialled, e.g. "051 2345678".</summary>
        public static string Landline(object code, object number)
        {
            string c = Convert.ToString(code);
            string n = Convert.ToString(number);
            if (string.IsNullOrEmpty(c)) return HttpUtility.HtmlEncode(n);
            return HttpUtility.HtmlEncode("0" + c + " " + n);
        }

        public static string Text(object value)
        {
            return HttpUtility.HtmlEncode(Convert.ToString(value));
        }
    }
}
