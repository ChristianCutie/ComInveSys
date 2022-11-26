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

public partial class Supervisor_Manage_Profile : System.Web.UI.Page
{
    string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        sessions();
        LoadManage();
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
                Response.Redirect("Supervisor/Manage_Profile.aspx");
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
            using (SqlCommand cmd = new SqlCommand("SELECT ID,Profile,FirstName,MiddleName,LastName,PhoneNhumber,Email,Password, AdminPosition FROM ApprovedAccounts WHERE ID=@id", con))
            {
                cmd.Parameters.AddWithValue("@id", id);
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    foreach (DataRow dr in dt.Rows)
                    {

                        this.lblid.Text = dr["ID"].ToString();
                        this.txtfname.Text = dr["FirstName"].ToString();
                        this.txtmname.Text = dr["MiddleName"].ToString();
                        this.txtlname.Text = dr["LastName"].ToString();
                        this.txtemail.Text = dr["Email"].ToString();
                        this.txtpass.Text = dr["Password"].ToString();
                        this.txtpnum.Text = dr["PhoneNhumber"].ToString();
                        this.txtpos.Text = dr["AdminPosition"].ToString();
                        this.imgshow.ImageUrl = "/images/" + dr["Profile"].ToString();
                        this.lblfakeimg.Text = dr["Profile"].ToString();
                    }
                }

               
            }
        }
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(constr))
        {
            string flname = flupload.FileName;
            if (flname != "")
            {
                lblfakeimg.Text = flname;
            }
            string flext = Path.GetExtension(lblfakeimg.Text);
            if (flext.ToLower() == ".png" || flext.ToLower() == ".jpg")
            {
                flupload.SaveAs(HttpContext.Current.Request.PhysicalApplicationPath + "/images/" + lblfakeimg.Text);
                using (SqlCommand cmd = new SqlCommand("UPDATE ApprovedAccounts SET Profile=@prof, FirstName=@fname, MiddleName=@mname, LastName=@lname, PhoneNhumber=@pnum, Email=@email, Password=@pass, AdminPosition = @pos WHERE ID=@id", con))
                {

                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@fname", txtfname.Text);
                    cmd.Parameters.AddWithValue("@mname", txtmname.Text);
                    cmd.Parameters.AddWithValue("@lname", txtlname.Text);
                    cmd.Parameters.AddWithValue("@pnum", txtpnum.Text);
                    cmd.Parameters.AddWithValue("@email", txtemail.Text);
                    cmd.Parameters.AddWithValue("@pass", txtpass.Text);
                    cmd.Parameters.AddWithValue("@pos", txtpos.Text);
                    cmd.Parameters.AddWithValue("@prof", lblfakeimg.Text);
                    //cmd.Parameters.AddWithValue("@Country", ddlCountries.SelectedItem.Value);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect(Request.Url.ToString(), false);
                    Response.Redirect("Dashboard.aspx");
                }  

            }
        }
    }
}
