using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Practica1
{
    public partial class Contact : Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext context = HttpContext.Current;
        }

        protected void AddNewCar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddNewCar.aspx");
        }

        protected void carsDashboard_SelectedIndexChanged(object sender, EventArgs e)
        {
            bool chkbox = (carsDashboard.SelectedRow.Cells[5].Controls[0] as CheckBox).Checked;
            TextBoxPlate.Text = carsDashboard.SelectedRow.Cells[1].Text;
            TextBoxMake.Text = carsDashboard.SelectedRow.Cells[2].Text;
            TextBoxModel.Text = carsDashboard.SelectedRow.Cells[3].Text;
            if (carsDashboard.SelectedRow.Cells[4].Text != "&nbsp;")
            {
                TextBoxReservedBy.Text = carsDashboard.SelectedRow.Cells[4].Text;
            }
            else

            {
                TextBoxReservedBy.Text=null;
            }


            if (chkbox)
            {
                ImageAvailable.Visible = true;
                ImageNotAvailable.Visible = false;
                Reserve.Visible = true;
                Liberate.Visible = false;
            }
            else
            {
                Liberate.Visible = true;
                ImageAvailable.Visible = false;
                ImageNotAvailable.Visible = true;
                Reserve.Visible = false;
            }

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void Reservar_Click(object sender, EventArgs e)
        {
            //sesion variables para ver que coche seleccionamos
            Session["plate"] = TextBoxPlate.Text;
            Session["make"] = TextBoxMake.Text;
            Session["model"] = TextBoxModel.Text;

            Response.Redirect("ClientDashboard.aspx");
        }
        protected void Liberate_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "LiberateCar";
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@CarPlate", carsDashboard.SelectedRow.Cells[1].Text);
            conn.Open();
            var dt = new DataTable();
            var da = new SqlDataAdapter(cmd);
            da.Fill(dt); //execute
            Response.Redirect("CarsDashboard.aspx");
        }
    }
}