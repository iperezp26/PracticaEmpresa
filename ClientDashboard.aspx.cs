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
    public partial class ClientDashboard : Page
    {
        HttpContext context = HttpContext.Current;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString);
        string Plate;
        string Make;
        string Model;

        protected void Page_Load(object sender, EventArgs e)
        {

            Plate = context.Session["plate"].ToString();
            Make = context.Session["make"].ToString();
            Model = context.Session["model"].ToString();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(GridView1.SelectedRow.Cells[1].ToString() != "")
            {
                ConfirmationButton.Visible = true;
                NotConfirmationButton.Visible = true;
                Confirmation.Visible = true;
                Confirmation.Text = "Reserve the car with Plate: " + Plate + ", Make: " + Make + ", Model: " + Model + " to the client: " +
                    GridView1.SelectedRow.Cells[1].Text +", Email:"+ GridView1.SelectedRow.Cells[2].Text +", Mobile:"+
                    GridView1.SelectedRow.Cells[3].Text + " ?";
            }
            else
            {
                ConfirmationButton.Visible = false;
                NotConfirmationButton.Visible = false;
                Confirmation.Visible = false;
            }
        }

        protected void ConfirmationButton_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "ReserveCar";
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@CarPlate", Plate);
            cmd.Parameters.AddWithValue("@EmailUser", GridView1.SelectedRow.Cells[2].Text);
            conn.Open();
            var dt = new DataTable();
            var da = new SqlDataAdapter(cmd);
            da.Fill(dt); //execute
            Response.Redirect("CarsDashboard.aspx");
        }

        protected void NotConfirmationButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("CarsDashboard.aspx");
        }
    }
}