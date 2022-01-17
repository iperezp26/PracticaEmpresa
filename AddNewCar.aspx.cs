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
    public partial class AddNewCar : Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Submit_Click(object  sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "AddNewCar";
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@CarId", carId.Text.Trim());
            cmd.Parameters.AddWithValue("@make", make.Text.Trim().ToUpper());
            cmd.Parameters.AddWithValue("@model", model.Text.Trim().ToUpper());
            conn.Open();
            var dt = new DataTable();
            var da = new SqlDataAdapter(cmd);
            da.Fill(dt); //execute
            if (dt.Rows.Count == 0)
            {
                LabelIncorrectInsert.Visible = false;
                LabelCorrect.Visible = true;
            }
            else
            {
                LabelCorrect.Visible = false;
                LabelIncorrectInsert.Visible = true;
            }



        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("CarsDashboard.aspx");
        }
    }
}