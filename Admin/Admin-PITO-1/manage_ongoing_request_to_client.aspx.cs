using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Admin_PITO_1_PVOOnGoingRequestAdmin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    SqlDataAdapter da;
    SqlCommand cmd;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadManage();
        sessions();
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
                Response.Redirect("Admin/Admin-PITO-1/manage_ongoing_request_to_client.aspx");
                dr.Close();
            }

        }
    }
    private int id
    {
        get
        {
            return !string.IsNullOrEmpty(Request.QueryString["ID"]) ? int.Parse(Request.QueryString["ID"]) : 0;
        }
    }
    private void LoadManage()
    {
        using (SqlCommand cmd = new SqlCommand("SELECT ID,FullName,UserID,Department,Description,Date,Status FROM PVOOngoingDB WHERE ID=@id", con))
        {
            cmd.Parameters.AddWithValue("@id", id);
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);
                foreach (DataRow dr in dt.Rows)
                {

                    this.lblid.Text = dr["ID"].ToString();
                    this.fullname.Text = dr["FullName"].ToString();
                    this.uid.Text = dr["UserID"].ToString();
                    this.dept.Text = dr["Department"].ToString();
                    this.descrip.Text = dr["Description"].ToString();
                    this.txtdate.Text = dr["Date"].ToString();
                    this.txtstat.Text = dr["Status"].ToString();
                }
            }
        }
        
        
    }
    private void DeletePendingAccounts()
    {
        using (SqlCommand cmd = new SqlCommand("DELETE FROM PVOOngoingDB WHERE ID = @id", con))
        {
            cmd.Parameters.AddWithValue("@id", lblid.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("ongoing_request_to_admin.aspx");
        }
    }
    private void insertToClient()
    {
        string cs = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            cmd = new SqlCommand("INSERT INTO PVOHistoryClient(FullName,UserID,Department,Description,Date,Status) VALUES(@fname,@uid,@dept,@desc,@dt,@st)", con);
            cmd.Parameters.AddWithValue("@fname", fullname.Text);
            cmd.Parameters.AddWithValue("@uid", uid.Text);
            cmd.Parameters.AddWithValue("@dept", dept.Text);
            cmd.Parameters.AddWithValue("@desc", descrip.Text);
            cmd.Parameters.AddWithValue("@stat", txtstat.Text);
            cmd.Parameters.AddWithValue("@dt", lbldate.Text = DateTime.Now.ToString());
            cmd.Parameters.AddWithValue("@st", fakeappr.Text = "Accomplish");
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
    protected void btnsubmit_Click1(object sender, EventArgs e)
    {
        string cs = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            cmd = new SqlCommand("INSERT INTO PVOAccomplishmentDB(FullName,UserID,Department,Description,Date,Status) VALUES(@fname,@uid,@dept,@desc,@dt,@st)", con);
            cmd.Parameters.AddWithValue("@fname", fullname.Text);
            cmd.Parameters.AddWithValue("@uid", uid.Text);
            cmd.Parameters.AddWithValue("@dept", dept.Text);
            cmd.Parameters.AddWithValue("@desc", descrip.Text);
            cmd.Parameters.AddWithValue("@stat", txtstat.Text);
            cmd.Parameters.AddWithValue("@dt", lbldate.Text = DateTime.Now.ToString());
            cmd.Parameters.AddWithValue("@st", fakeappr.Text = "Accomplish");
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            insertToClient();
            DeletePendingAccounts();
        }
    }

    protected void prnt_Click(object sender, EventArgs e)
    {
        Session["ctrl"] = pnl;
        ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe','height=1000px,width=1000px,scrollbars=1');</script>");
    }
}