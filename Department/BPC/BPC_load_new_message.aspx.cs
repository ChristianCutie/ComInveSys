using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Department_PVO_PVO_load_new_message : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    string msg = "";
    int count = 0;
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

            using (SqlCommand cmd = new SqlCommand("SELECT * FROM communicationBPC WHERE ddepartment ='" + firstname.ToString() + "' AND Status='Active'", con))
            {
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                foreach (DataRow dr in dt.Rows)
                {
                    count = count + 1;
                    if (count == 1)
                    {
                        msg = dr["sdepartment"].ToString() + ":"+" " + dr["messages"].ToString();
                    }
                    else
                    {
                        msg = msg + "||abcd||" + dr["sdepartment"].ToString() + ": "+" " + dr["messages"].ToString();
                    }
                    using (SqlCommand cmd1 = new SqlCommand("UPDATE communicationBPC SET Status = 'offline' WHERE ID=" + dr["ID"].ToString() + "", con))
                    {
                        cmd1.ExecuteNonQuery();
                    }
                }
                if (count == 0)
                {
                    Response.Write("0");
                }
                else
                {
                    Response.Write(msg.ToString());
                }
            }
        }
        
    }
}