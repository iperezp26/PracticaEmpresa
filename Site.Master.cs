using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practica1
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)HttpContext.Current.Session["user"] != null)
            {
                user.Text = "User: " + (string)HttpContext.Current.Session["user"];
                LogOutLinkButton.Visible = true;
            }
            else
                LogOutLinkButton.Visible = false;
        }

        protected void LogOutLinkButton_Click(object sender, EventArgs e)
        {
                Session.Clear();
                Response.Redirect("Default.aspx");
        }
    }
}