using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Department_PVO_Request : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    DataTable dt;
    SqlCommand cmd;
    SqlDataAdapter da;

    protected void Page_Load(object sender, EventArgs e)
    {
        sessions();
    }
    private void cleartext()
    {
        fullname.Text = "";
        uid.Text = "";
        txtdate.Text = "";
        descrip.Text = "";
    }
    private void sessions()
    {
        if (Session["uname"] == null)
        {
            Response.Redirect("Login.aspx");
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
                Response.Redirect("Department/PVO/Request.aspx");
                dr.Close();
            }

        }
    }
    private void InsertPVOdata()
    {
        using (SqlCommand cmd = new SqlCommand(@"INSERT INTO PVOHistoryClient(FullName,UserID,Department,Description,Date,Status)VALUES (@fname,@uid,@dept,@des,@dt,@stat)"))
        {
            cmd.Parameters.AddWithValue("@fname", fullname.Text);
            cmd.Parameters.AddWithValue("@uid", uid.Text);
            cmd.Parameters.AddWithValue("@dept", dept.Text);
            cmd.Parameters.AddWithValue("@dt", txtdate.Text = DateTime.Now.ToString());
            cmd.Parameters.AddWithValue("@des", descrip.Text);
            cmd.Parameters.AddWithValue("@stat", lblpending.Text = "Pending");
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        using (SqlCommand cmd = new SqlCommand(@"INSERT INTO RequestToAdmin(FullName,UserID,Department,Description,Date,Status)VALUES (@fname,@uid,@dept,@des,@dt,@stat)"))

        {
            if (fullname.Text == "" && uid.Text == "" && dept.Text == "" && txtdate.Text == "" && descrip.Text == "")
            {
                lblmessage.Text = "Please Complete the Detail Above.";
                lblmessage.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                cmd.Parameters.AddWithValue("@fname", fullname.Text);
                cmd.Parameters.AddWithValue("@uid", uid.Text);
                cmd.Parameters.AddWithValue("@dept", dept.Text);
                cmd.Parameters.AddWithValue("@dt", txtdate.Text = DateTime.Now.ToString());
                cmd.Parameters.AddWithValue("@des", descrip.Text);
                cmd.Parameters.AddWithValue("@stat", lblpending.Text = "Pending");
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                InsertPVOdata();
                cleartext();
                reponsemesage.Visible = true;
                tbl.Visible = false;

            }

        }
    }
    protected void viewtb_Click(object sender, EventArgs e)
    {
        Response.Redirect("Process.aspx");
    }
}