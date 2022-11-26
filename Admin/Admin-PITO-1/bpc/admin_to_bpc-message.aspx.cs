using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Admin_PITO_1_bpc_admin_to_bpc_message : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    string Email = "";
    string msg = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        if (Request.QueryString["messages"] != null)
        {
            Email = Request.QueryString["FirstName"].ToString();
            msg = Request.QueryString["messages"].ToString();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "INSERT INTO communicationBPC VALUES('Admin','" + Email.ToString() + "','" + msg.ToString() + "','Active') ";
            cmd.ExecuteNonQuery();

        }
    }
}