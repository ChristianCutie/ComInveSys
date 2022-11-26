using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Department_PVO_PVO_send_message_from_admin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    string firstname = "";
    string msg = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        sessions();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        if (Request.QueryString["messages"] != null)
        {
            firstname = Session["first"].ToString();
            msg = Request.QueryString["messages"].ToString();

            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "INSERT INTO communicationTB VALUES('"+firstname.ToString() + "','Admin','" + msg.ToString() + "','Active')";
            cmd.ExecuteNonQuery();
            
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