using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class Admin_Admin_PITO_1_bpc_load_new_messages : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    string msg = "";
    int count = 0;
    string Department = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();

        Department = Request.QueryString["FirstName"].ToString();

        using (SqlCommand cmd = new SqlCommand("SELECT * FROM communicationBPC WHERE ddepartment = 'Admin' AND Status='Active'", con))
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
                    msg =" " + dr["sdepartment"].ToString() + ":" + " " + dr["messages"].ToString();
                }
                else
                {
                    msg = " "+ msg + "||abcd||" + dr["sdepartment"].ToString() + ":" + " " + dr["messages"].ToString();
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