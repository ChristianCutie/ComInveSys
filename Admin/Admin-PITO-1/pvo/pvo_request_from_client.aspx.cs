using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.text;

public partial class Admin_Admin_PITO_1_PVORequestAdminPITO : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    SqlDataAdapter da;
    SqlCommand cmd;
    DataTable dt;
    string firstname = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadDepartment();
            LoadgrvPVO();
            Loadtotal();
            Loadallinv();
            LoadData();
            sessions();
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
            Master.LabelUsername.Text = "" + Session["first"] + "\t";
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
                Response.Redirect("Admin/Admin-PITO-1/PVO_Request_Admin_PITO.aspx");
                dr.Close();
            }

        }
    }
    private void LoadData()
    {
        string strQuery = "SELECT * FROM InventoryItem";
        SqlCommand cmd = new SqlCommand(strQuery, con);
        da = new SqlDataAdapter(cmd);
        dt = new DataTable();
        da.Fill(dt);

        grv.DataSource = dt;
        grv.DataBind();
    }
    private void Loadallinv()
    {
        string strQuery = "SELECT * FROM InventoryItem";
        SqlCommand cmd = new SqlCommand(strQuery, con);
        da = new SqlDataAdapter(cmd);
        dt = new DataTable();
        da.Fill(dt);

        grvavail.DataSource = dt;
        grvavail.DataBind();
        ttlavail.Text = grvavail.Rows.Count.ToString();

    }
    private void Loadtotal()
    {
        string strQuery = "SELECT * FROM PVOAllInventory";
        SqlCommand cmd = new SqlCommand(strQuery, con);
        da = new SqlDataAdapter(cmd);
        dt = new DataTable();
        da.Fill(dt);

        grvtotalcomputer.DataSource = dt;
        grvtotalcomputer.DataBind();
        ttltolcom.Text = grvtotalcomputer.Rows.Count.ToString();

    }
    private void LoadgrvPVO()
    {
        string strQuery = "SELECT * FROM PVOAllInventory";
        SqlCommand cmd = new SqlCommand(strQuery, con);
        da = new SqlDataAdapter(cmd);
        dt = new DataTable();
        da.Fill(dt);

        GridView1.DataSource = dt;
        GridView1.DataBind();

    }
    private void LoadDepartment()
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();

        SqlCommand cmd = new SqlCommand("SELECT * FROM ApprovedAccounts WHERE Department='Provincial Veterinary Office (PVO)'");
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);

        rptdepartment.DataSource = dt;
        rptdepartment.DataBind();
    }

}