using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Practica1
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /*public void guardar()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "insertNewUser";
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@User", textBoxUser.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", textBoxPassword.Text.Trim());
                conn.Open();
                cmd.ExecuteNonQuery();
                var dt = new DataTable();
                var da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    comprobarUser.Text = dt.Rows[0]["idUser"].ToString();
                    comprobarPassword.Text = dt.Rows[0]["password"].ToString();
                }
            }
        }*/

        public void comprobar()
        {
            if (textBoxPassword.Text == "" || textBoxUser.Text == "")
            {
                labelError.Visible = true;
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
                {


                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "checkUser";
                    cmd.Connection = conn;
                    cmd.Parameters.AddWithValue("@User", textBoxUser.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", textBoxPassword.Text.Trim());
                    conn.Open();
                    var dt = new DataTable();
                    var da = new SqlDataAdapter(cmd);
                    da.Fill(dt);

                    if (dt.Rows.Count == 0)
                    {
                        labelNotCorrectLogin.Visible = true;
                        labelCorrectLogin.Visible = false;

                    }
                    else
                    {
                        labelNotCorrectLogin.Visible = false;
                        labelCorrectLogin.Visible = true;
                        Session["user"] = textBoxUser.Text.Trim().ToString();
                        Response.Redirect("CarsDashboard.aspx");
                    }

                    labelError.Visible = false;
                    labelNotCorrectInsertUser.Visible = false;
                    labelCorrectInsertUser.Visible = false;
                }
            }
        }

        public void create()
        {
            if (textBoxPassword.Text == "" || textBoxUser.Text == "")
            {
                labelError.Visible = true;
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connDB"].ConnectionString))
                {


                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "insertNewUser";
                    cmd.Connection = conn;
                    cmd.Parameters.AddWithValue("@User", textBoxUser.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", textBoxPassword.Text.Trim());
                    conn.Open();
                    var dt = new DataTable();
                    var da = new SqlDataAdapter(cmd);
                    da.Fill(dt); //execute

                    if (dt.Rows.Count == 0)
                    {

                        labelNotCorrectInsertUser.Visible = false;
                        labelCorrectInsertUser.Visible = true;

                    }
                    else
                    {
                        labelNotCorrectInsertUser.Visible = true;
                        labelCorrectInsertUser.Visible = false; 

                    }

                    labelNotCorrectLogin.Visible = false;
                    labelCorrectLogin.Visible = false;
                    labelError.Visible = false;
                    labelCorrectLogin.Visible = false;
                }
            }
        }

        protected void ClickSubmit(object sender, EventArgs e)
        {
            comprobar();
        }
        protected void createUser(object sender, EventArgs e)
        {
            create();
        }
    }
}

