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

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void AddNewCar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddNewCar.aspx");
        }

        protected void carsDashboard_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox1.Text = carsDashboard.SelectedRow.Cells[1].Text.ToString();
            
        }
    }
}