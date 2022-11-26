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

public partial class Default2 : System.Web.UI.Page
{
    string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
    DataTable dt;
    SqlDataAdapter da;
    SqlDataReader dr;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.LoadManage();
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
                Response.Redirect("Admin/Admin-PITO-1/Manage.aspx");
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
        using (SqlConnection con = new SqlConnection(constr))
        {
            using(SqlCommand cmd = new SqlCommand("SELECT ID,Profile,FirstName,MiddleName,LastName,PhoneNhumber,Department,Email,Password,UserType,Status FROM PendingAccounts WHERE ID=@id", con))
            {
                cmd.Parameters.AddWithValue("@id", id);
                using(SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    foreach(DataRow dr in dt.Rows)
                    {
                        
                        this.lblid.Text = dr["ID"].ToString();
                        this.txtfname.Text = dr["FirstName"].ToString();
                        this.txtmname.Text = dr["MiddleName"].ToString();
                        this.txtlname.Text = dr["LastName"].ToString();
                        this.txtemail.Text = dr["Email"].ToString();
                        this.txtpass.Text = dr["Password"].ToString();
                        this.txtutype.Text = dr["UserType"].ToString();
                        this.txtstat.Text = dr["Status"].ToString();
                        this.txtdept.Text = dr["Department"].ToString();
                        this.txtpnum.Text = dr["PhoneNhumber"].ToString();
                        this.imgtxt.ImageUrl = "/images/" + dr["Profile"].ToString();
                        this.lblfakeimg.Text = dr["Profile"].ToString();
                    }
                }
            }
        }
    }
    private void DeletePendingAccounts()
    {
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("DELETE FROM PendingAccounts WHERE ID = @id", con))
            {
                cmd.Parameters.AddWithValue("@id", lblid.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Admin/Admin-PITO-1/PendingAccount.aspx");
            }
        }
    }
    protected void btnapprove_Click(object sender, EventArgs e)
    {
        string cs = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
                cmd = new SqlCommand("SpInsertApprovedAccounts", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@fname", txtfname.Text);
                cmd.Parameters.AddWithValue("@lname", txtlname.Text);
                cmd.Parameters.AddWithValue("@mname", txtmname.Text);
                cmd.Parameters.AddWithValue("@pnum", txtpnum.Text);
                cmd.Parameters.AddWithValue("@email", txtemail.Text);
                cmd.Parameters.AddWithValue("@pass", txtpass.Text);
                cmd.Parameters.AddWithValue("@dept", txtdept.Text);
                cmd.Parameters.AddWithValue("@utype", txtutype.Text);
                cmd.Parameters.AddWithValue("@stat", lblapproved.Text = "Approved");
                cmd.Parameters.AddWithValue("Prof", lblfakeimg.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                DeletePendingAccounts();
                Response.Redirect("Admin/Admin-PITO-1/PendingAccount.aspx");
        }

              
    }

    protected void btnDecline_Click(object sender, EventArgs e)
    {
        DeletePendingAccounts();
    }
}