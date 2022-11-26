using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class Default2 : System.Web.UI.Page
{
    string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
    SqlDataAdapter da;
    DataTable dt;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.LoadDistribute();
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
                Response.Redirect("Admin/Admin-PITO-1/PVO_Distribution_Admin.aspx");
                dr.Close();
            }

        }
    }
    private int id
    {
        get
        {
            return !string.IsNullOrEmpty(Request.QueryString["id"]) ? int.Parse(Request.QueryString["id"]) : 0;
        }
    }
    private void LoadDistribute()
    {
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT id,Processor,RAM,RAM2,Storage,Storage2,Storage3,Storage4,GraphicCard,PSU,Motherboard,Monitor,Mouse,Keyboard,Printer,PCNumber FROM inventoryitem WHERE id=@id", con))
            {
                cmd.Parameters.AddWithValue("@id", id);
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    foreach (DataRow dr in dt.Rows)
                    {

                        this.lblid.Text = dr["id"].ToString();
                        this.txtprocr.Text = dr["Processor"].ToString();
                        this.txtram.Text = dr["RAM"].ToString();
                        this.txtram2.Text = dr["RAM2"].ToString();
                        this.txtstorage.Text = dr["Storage"].ToString();
                        this.txtstorage2.Text = dr["Storage2"].ToString();
                        this.txtstorage3.Text = dr["Storage3"].ToString();
                        this.txtstorage4.Text = dr["Storage4"].ToString();
                        this.txtgpu.Text = dr["GraphicCard"].ToString();
                        this.txtpsu.Text = dr["PSU"].ToString();
                        this.txtmboard.Text = dr["Motherboard"].ToString();
                        this.txtmonitor.Text = dr["Monitor"].ToString();
                        this.txtmouse.Text = dr["Mouse"].ToString();
                        this.txtkeyboard.Text = dr["Keyboard"].ToString();
                        this.txtprinter.Text = dr["Printer"].ToString();
                        this.txtpcnum.Text = dr["PCNumber"].ToString();

                    }
                }
            }
        }
    }
    private void DeleteReleaseItem()
    {
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("DELETE FROM ReleaseItemToClient WHERE ID = @id", con))
            {
                cmd.Parameters.AddWithValue("@id", txtuserid.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("PVORequestAdminPITO.aspx");
            }
        }
    }
    //DELETE ITEM FROM PVO
    private void DeleteReleaseItemFromPVO()
    {
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("DELETE FROM PVORequestAdmin WHERE ID = @id", con))
            {
                cmd.Parameters.AddWithValue("@id", txtuserid.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
    }


    //FOR DIDSTRIBUTE PC TO CLIENT
    protected void btnRelease_Click(object sender, EventArgs e)
    {
        string cs = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            cmd = new SqlCommand("UPDATE ReleaseItemToClient SET UserID=@userid,FullName=@fullname,Department=@Dept,PCNumber=@pcnum,Processor=@proc," +
                "RAM=@ram,RAM2=@ram2,Storage=@strg,Storage=@strg2,Storage2=@strg3,Storage3=@strg4,Storage4=@stat,Storage4=@stat,GraphicCard=@gpu," +
                "PSU=@psu,Motherboard=@mboard,DateTime=@dt WHERE ID = @id", con);

            cmd.Parameters.AddWithValue("@userid", txtuserid.Text);
            cmd.Parameters.AddWithValue("@fullname", txtfullname.Text);
            cmd.Parameters.AddWithValue("@Dept", dept.Text);
            cmd.Parameters.AddWithValue("@pcnum", txtpcnum.Text);
            cmd.Parameters.AddWithValue("@proc", txtprocr.Text);
            cmd.Parameters.AddWithValue("@ram", txtram.Text);
            cmd.Parameters.AddWithValue("@ram2", txtram2.Text);
            cmd.Parameters.AddWithValue("@strg", txtstorage.Text);
            cmd.Parameters.AddWithValue("@strg2", txtstorage2.Text);
            cmd.Parameters.AddWithValue("@strg3", txtstorage3.Text);
            cmd.Parameters.AddWithValue("@strg4", txtstorage4.Text);
            cmd.Parameters.AddWithValue("@gpu", txtgpu.Text);
            cmd.Parameters.AddWithValue("@psu", txtpsu.Text);
            cmd.Parameters.AddWithValue("@mboard", txtmboard.Text);
            cmd.Parameters.AddWithValue("@id", lblid.Text);
            cmd.Parameters.AddWithValue("@dt", lbldate.Text = DateTime.Now.ToString());
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            DeleteReleaseItemFromPVO();
            Response.Redirect("PVORequestAdminPITO.aspx");
        }
    }
    //cmd = new SqlCommand(@"UPDATE registration_tbl SET Firstname=@fname,Lastname=@lname,Contact=@contact,Age=@age,Address=@address,Email=@email,Username=@uname,Password=@password,Employid=@employid,Gender=@gender,Usertype=@utype,Status=@stat
    //                WHERE id=@id", con);
    //cmd.Parameters.AddWithValue("@fname", txtfname.Text);
    //        cmd.Parameters.AddWithValue("@lname", txtlastname.Text);
    //        cmd.Parameters.AddWithValue("@contact", txtcontact.Text);
    //        cmd.Parameters.AddWithValue("@age", txtage.Text);
    //        cmd.Parameters.AddWithValue("@address", txtaddress.Text);
    //        cmd.Parameters.AddWithValue("@email", txtemail.Text);
    //        cmd.Parameters.AddWithValue("@uname", txtusername.Text);
    //        cmd.Parameters.AddWithValue("@password", txtpassword.Text);
    //        cmd.Parameters.AddWithValue("@stat", txtstat.Text);
    //        cmd.Parameters.AddWithValue("@employid", txtemploy.Text);
    //        cmd.Parameters.AddWithValue("@gender",ddlgender.Text);
    //        cmd.Parameters.AddWithValue("@utype", ddlutype.Text);
    //        cmd.Parameters.AddWithValue("@id", lblid.Text);
    //        con.Open();
    //        cmd.ExecuteNonQuery();
    //        con.Close();
    //        LoadProduct();
    //Response.Redirect(Request.Url.ToString(), false);
}