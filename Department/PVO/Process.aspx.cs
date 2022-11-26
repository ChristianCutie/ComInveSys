using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;



public partial class Department_PVO_Process : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    SqlCommand cmd;
    DataTable dt;
    SqlDataAdapter da;
    string red;
    string green;
    protected void Page_Load(object sender, EventArgs e)
    {
        sessions();
        Processaspx();
    }
    private void Processaspx()
    {
        string strQuery = "SELECT * FROM PVOHistoryClient ORDER BY ID DESC";
        SqlCommand cmd = new SqlCommand(strQuery, con);
        da = new SqlDataAdapter(cmd);
        dt = new DataTable();
        da.Fill(dt);

        grv.DataSource = dt;
        grv.DataBind();
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
            Master.LabelFirstname.Text = "" + Session["first"] + "\t";
            Master.LabelLastname.Text = "" + Session["last"];
            string connection = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection con = new SqlConnection(connection);
            string query = "SELECT * FROM ApprovedAccounts WHERE FirstName ='" + Session["first"] + "' AND LastName ='" + Session["last"] + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                string imgname = dr["Profile"].ToString();
                Master.ImageUser.ImageUrl = "/images/" + imgname;
                dr.Close();
            }
            else
            {
                Response.Redirect("Department/PVO/Process.aspx");
                dr.Close();
            }

        }
    }
}