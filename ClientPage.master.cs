using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ClientPage : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    SqlCommand cmd;
    DataTable dt;
    int count = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        linkinvPVO();
        linkprocPVO();
        linkdashPVO();
        linksemdmsg();
        if (Session["uname"] == null)
        {
            Response.Redirect("Login.aspx");
        }
       

        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();


        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT * FROM PVOHistoryClient WHERE Department='Provincial Veterinary Office (PVO)' AND Status='Pending' OR Status='On Going' OR Status='Approved' ORDER BY ID DESC";
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
    public Label LabelFirstname
    {
        get
        {
            return this.lbluname;
        }
    }
    public Label LabelLastname
    {
        get
        {
            return this.lastname;
        }
    }
    public Image ImageUser
    {
        get
        {
            return this.imguser;
        }
    }
    public HyperLink hypelnk
    {
        get
        {
            return this.lnkdash;
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

    public void linkinvPVO()
    {
        HyperLink hypinventory = this.Page.Master.FindControl("linkinventory") as HyperLink;
        hypinventory.NavigateUrl = "Department/PVO/Inventory.aspx";
    }
    public void linkprocPVO()
    {
        HyperLink hypdashboard = this.Page.Master.FindControl("linkproc") as HyperLink;
        hypdashboard.NavigateUrl = "Department/PVO/Process.aspx";
    }
    public void linkdashPVO()
    {
        HyperLink hypdashboard = this.Page.Master.FindControl("lnkdash") as HyperLink;
        hypdashboard.NavigateUrl = "Department/PVO/Provincial-Veterinary-Office.aspx";
    }
    public void linksemdmsg()
    {
        HyperLink hypdashboard = this.Page.Master.FindControl("lnksendmsg") as HyperLink;
        hypdashboard.NavigateUrl = "Department/PVO/PVOsend_message.aspx";
    }

}
