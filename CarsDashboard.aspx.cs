using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practica1
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddNewCar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddNewCar.aspx");
        }

        protected void carsDashboard_SelectedIndexChanged(object sender, EventArgs e)
        {
            bool chkbox = (carsDashboard.SelectedRow.Cells[4].Controls[0] as CheckBox).Checked;
            TextBoxPlate.Text = carsDashboard.SelectedRow.Cells[1].Text;
            TextBoxMake.Text = carsDashboard.SelectedRow.Cells[2].Text;
            TextBoxModel.Text = carsDashboard.SelectedRow.Cells[3].Text;
            if (chkbox)
            {
                ImageAvailable.Visible = true;
                ImageNotAvailable.Visible = false;
            }
            else
            {
                ImageAvailable.Visible = false;
                ImageNotAvailable.Visible = true;
            }

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}