using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class MasterPage : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    SqlCommand cmd;
    DataTable dt;
    SqlDataAdapter da;
    int count = 0;
    string department = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uname"] == null)
        {
            Response.Redirect("Dashboard.aspx");
        }

        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT * FROM PVORequestAdmin WHERE Department='Provincial Veterinary Office (PVO)'OR" +
            " Department='Bulacan Polytechnic College (BPC)' AND Status='Pending' ORDER BY ID DESC";
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        count = Convert.ToInt32(dt.Rows.Count.ToString());
        notification.Text = count.ToString();
        fakedtime.Text = DateTime.Now.ToString();
        r1.DataSource = dt;
        r1.DataBind();

    }
    public string gettwentycharacters(object myvalues)
    {
        string a;
        a = Convert.ToString(myvalues.ToString());
        string b = "";
        if (a.Length >= 15)
        {
            b = a.Substring(0, 15);
            return b.ToString() + "..";
        }
        else
        {
            b = a.ToString();
            return b.ToString();
        }
    }
    public Label LabelUsername
    {
        get
        {
            return this.lbluname;
        }
    }
    public Image ImageUser
    {
        get
        {
            return this.imguser;
        }
    }

    public Label Lastname
    {
        get
        {
            return this.lastname;
        }
    }

    protected void lnklogout_Click(object sender, EventArgs e)
    {
        HttpCookie myCookie = new HttpCookie("Login");
        myCookie.Expires = DateTime.Now.AddDays(-1d);
        Response.Cookies.Add(myCookie);
        Session.Clear();
        Session.RemoveAll();
        Response.Redirect("~/Login.aspx", true);
    }
}
