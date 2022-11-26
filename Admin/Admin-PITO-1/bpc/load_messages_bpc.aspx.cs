using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Admin_PITO_1_bpc_load_messages_bpc : System.Web.UI.Page
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
        firstname = Request.QueryString["FirstName"].ToString();

        using (SqlCommand cmd = new SqlCommand("SELECT * FROM communicationBPC WHERE(sdepartment= '" + firstname.ToString() + "' AND ddepartment='Admin') OR (ddepartment= '" + firstname.ToString() + "' AND sdepartment='Admin')", con))
        {
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                Response.Write("<p>");
                Response.Write(dr["sdepartment"].ToString() + ": " + " " + dr["messages"].ToString());
                Response.Write("</p>");
                Response.Write("<hr/>");

                if (dr["ddepartment"].ToString() == "Admin")
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