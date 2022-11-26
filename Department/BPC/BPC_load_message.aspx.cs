using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Department_PVO_PVO_load_message : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    string firstname = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        if (Session["first"] != null)
        {
            firstname = Session["first"].ToString();

            using (SqlCommand cmd = new SqlCommand("SELECT * FROM communicationBPC WHERE(sdepartment= '" + firstname.ToString() + "' AND ddepartment='Department') OR (ddepartment= '" + firstname.ToString() + "' AND sdepartment='Department')", con))
            {
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                foreach (DataRow dr in dt.Rows)
                {
                    Response.Write("<p>");
                    Response.Write(dr["sdepartment"].ToString() + ": "+" " + dr["messages"].ToString());
                    Response.Write("</p>");
                    Response.Write("<hr/>");

                    if (dr["ddepartment"].ToString() == firstname.ToString())
                    {
                        using (SqlCommand cmd1 = new SqlCommand("UPDATE communicationBPC SET Status='offline' WHERE ID=" + dr["ID"].ToString() + "", con))
                        {
                            cmd1.ExecuteNonQuery();
                        }
                    }
                }

            }
        }
            
    }
    private void sessions()
    {
        if (Session["uname"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        else
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            con.Open();
            show();
        }
    }
    private void show()
    {
        if (Session["uname"] != null)
        {
            Master.fname.Text = "" + Session["first"] + "\t";
            Master.lname.Text = "" + Session["last"];
            string connection = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            string query = "SELECT * FROM ApprovedAccounts WHERE FirstName ='" + Session["first"] + "' AND LastName ='" + Session["last"] + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                string imgname = dr["Profile"].ToString();
                Master.imageuser.ImageUrl = "/images/" + imgname;
                dr.Close();
            }
            else
            {
                Response.Redirect("PVO_load_message.aspx");
                dr.Close();
            }

        }
    }
}