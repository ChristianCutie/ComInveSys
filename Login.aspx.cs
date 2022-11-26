using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class Login2 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    SqlCommand cmd;
    DataTable dt;
    string Username;
    string Password;
    string Usertype;
    string department;
    string position;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["uname"] != null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            con.Open();
        }

    }
    public void cleartext()
    {
        password.Text = "";
        password.Focus();
    }


    protected void Login_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString))
        {
            con.Open();
            cmd = new SqlCommand("SpLoginAccount");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@email", username.Text);
            cmd.Parameters.AddWithValue("@pass", password.Text);
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            cmd.ExecuteNonQuery();
            da.Fill(dt);
            if (username.Text == "" && password.Text == "")
            {
                error.Visible = true;
                error.InnerText = "Email and password should be empty.";
            }
            else
            {
                if (dt.Rows.Count > 0)
                {
                    string usernm = username.Text;
                    Session["first"] = dt.Rows[0]["FirstName"].ToString();
                    Session["last"] = dt.Rows[0]["LastName"].ToString();
                    Username = dt.Rows[0]["Email"].ToString();
                    Password = dt.Rows[0]["Password"].ToString();
                    Usertype = dt.Rows[0]["UserType"].ToString();
                    department = dt.Rows[0]["Department"].ToString();
                    position = dt.Rows[0]["AdminPosition"].ToString();
                    if (Username == username.Text && Password == password.Text)
                    {
                        if (Usertype == "Admin")
                        {
                            if (position == "Computer Technician 1")
                            {
                                Session["uname"] = usernm;
                                Session["first"].ToString();
                                Session["last"].ToString();
                                Response.Redirect("Admin/Admin-PITO-1/Dashboard.aspx");
                                con.Close();
                            }
                            else if (position == "Computer Technician 2")
                            {
                                Session["uname"] = usernm;
                                Session["first"].ToString();
                                Session["last"].ToString();
                                Response.Redirect("Admin/Admin-PITO-2/Dashboard.aspx");
                                con.Close();
                            }
                            else if (position == "Computer Technician 3")
                            {
                                Session["uname"] = usernm;
                                Session["first"].ToString();
                                Session["last"].ToString();
                                Response.Redirect("Admin/Admin-PITO-3/Dashboard.aspx");
                                con.Close();
                            }
                            else if (position == "Computer Technician 4")
                            {
                                Session["uname"] = usernm;
                                Session["first"].ToString();
                                Session["last"].ToString();
                                Response.Redirect("Admin/Admin-PITO-4/Dashboard.aspx");
                                con.Close();
                            }
                            else
                            {
                                Session["secure"] = null;
                                cleartext();
                            }
                        }
                        else if (Usertype == "Clerk")
                        {
                            if(department == "Provincial Veterinary Office (PVO)")
                            {
                                Session["uname"] = usernm;
                                Session["first"].ToString();
                                Session["last"].ToString();
                                Response.Redirect("Department/PVO/Provincial-Veterinary-Office.aspx");
                                con.Close();
                            }
                            else if(department == "Bulacan Polytechnic College (BPC)")
                            {
                                Session["uname"] = usernm;
                                Session["first"].ToString();
                                Session["last"].ToString();
                                Response.Redirect("Department/BPC/Bulacan-Polytechnic-College.aspx");
                                con.Close();
                            }
                            else
                            {
                                Session["secure"] = null;
                                cleartext();
                            }
                           
                        }
                        else if (Usertype == "Supervisor")
                        {
                            Session["uname"] = usernm;
                            Session["first"].ToString();
                            Session["last"].ToString();
                            Response.Redirect("Supervisor/Dashboard.aspx");
                            con.Close();
                        }
                    }
                    else
                    {
                        error.Visible = true;
                        error.InnerText = "Incorrect username and password.";
                    }

                }
                else
                {
                    error.Visible = true;
                    error.InnerText = "Incorrect username and password.";
                    Session["secure"] = null;
                    cleartext();
                }
            }
        }
    }

}
