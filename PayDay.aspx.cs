using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Practica1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "Pays";
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@Email", Session["user"]);
            conn.Open();
            var dt = new DataTable();
            var da = new SqlDataAdapter(cmd);
            da.Fill(dt); //execute
            conn.Close();
            toPay.Text += dt.Rows[0].ItemArray[0];
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}