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
    string cs = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        sessions();
    }
    private void cleartext()
    {
        fname.Text = "";
        lname.Text = "";
        mname.Text = "";
        email.Text = "";
        pass.Text = "";
        pnum.Text = "";
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
                Response.Redirect("Admin/Admin-PITO-1/CreateAccountAdmin.aspx");
                dr.Close();
            }

        }
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
       
        using (SqlConnection con = new SqlConnection(cs))

            if (fname.Text != "" && mname.Text != "" && lname.Text != "" && email.Text != ""
                && pass.Text != "" && pnum.Text != "" && ddlpos.SelectedValue != "" )
            {
                string fileName = flupload.FileName;
                string fileExtension = Path.GetExtension(fileName);
                if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".jpeg")
                {
                    flupload.SaveAs(HttpContext.Current.Request.PhysicalApplicationPath + "/images/" + fileName);
                    cmd = new SqlCommand("SpInsertPendingAccounts", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@fname", fname.Text);
                    cmd.Parameters.AddWithValue("@lname", lname.Text);
                    cmd.Parameters.AddWithValue("@mname", mname.Text);
                    cmd.Parameters.AddWithValue("@pnum", pnum.Text);
                    cmd.Parameters.AddWithValue("@email", email.Text);
                    cmd.Parameters.AddWithValue("@pass", pass.Text);
                    cmd.Parameters.AddWithValue("@prof", fileName);
                    cmd.Parameters.AddWithValue("@dept", ddldept.SelectedValue);
                    cmd.Parameters.AddWithValue("@pos", ddlpos.SelectedValue);
                    cmd.Parameters.AddWithValue("@utype", lblfake.Text = "Admin");
                    cmd.Parameters.AddWithValue("@stat", txtstatus.Text = "Pending");
                    con.Open();
                    cmd.ExecuteNonQuery();
                    cmd.Connection = con;
                    Response.Write("<script>alert('Data Has been Added. Your are automatically redirect to login.')</script>");
                    cleartext();
                    con.Close();

                }
                else
                {
                    lblerror.Text = "Your Image does not support for Given Extension (.jpg/.png)";
                    lblerror.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lblerror.Text = "Empty";
                lblerror.ForeColor = System.Drawing.Color.Red;
            }
    }
}