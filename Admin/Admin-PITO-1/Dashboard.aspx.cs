using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class welcome : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString) ;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["uname"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        else
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            con.Open();
            show();
        }
        LoadTotalRow();
        LoadPendingAccounts();
        LoadDepartment();
    }

    private void show()
    {
        if (Session["uname"] != null)
        {
            Master.LabelUsername.Text = "" + Session["first"]+"\t";
            Master.Lastname.Text = "" + Session["last"];
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
                Response.Redirect("Dashboard.aspx");
                dr.Close();
            }

        }
    }
    private void LoadTotalRow()
    {
        SqlCommand cmd = new SqlCommand("SpAllApprovedAccounts");
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);

        grvappacc.DataSource = dt;
        grvappacc.DataBind();
        ttlapprove.Text = grvappacc.Rows.Count.ToString();
    }
    private void LoadPendingAccounts()
    {
        SqlCommand cmd = new SqlCommand("SpAllPendingAccounts");
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);

        grvpendingacc.DataSource = dt;
        grvpendingacc.DataBind();
        lblpendingacc.Text = grvpendingacc.Rows.Count.ToString();
    }
    private void LoadDepartment()
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();

        SqlCommand cmd = new SqlCommand("SELECT * FROM ApprovedAccounts");
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);

        rptdepartment.DataSource = dt;
        rptdepartment.DataBind();
    }
}