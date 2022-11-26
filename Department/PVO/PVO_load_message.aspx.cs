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
        sessions();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        if (Session["first"] != null)
        {
            firstname = Session["first"].ToString();

            using (SqlCommand cmd = new SqlCommand("SELECT * FROM communicationTB WHERE(sdepartment= '" + firstname.ToString() + "' AND ddepartment='Department') OR (ddepartment= '" + firstname.ToString() + "' AND sdepartment='Department')", con))
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
                        using (SqlCommand cmd1 = new SqlCommand("UPDATE communicationTB SET Status='offline' WHERE ID=" + dr["ID"].ToString() + "", con))
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
        }
    }
  
}