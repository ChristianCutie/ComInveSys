using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

        //Client side
public partial class Department_PVO_Inventory : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    DataTable dt;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            sessions();
            loaddata();
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
                Response.Redirect("Inventory.aspx");
                dr.Close();
            }

        }
    }
    private void loaddata()
    {
        using (SqlCommand cmd = new SqlCommand("SELECT * FROM PVOAllInventory", con))
        {
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            grv.DataSource = dt;
            grv.DataBind();
        }
    }

}