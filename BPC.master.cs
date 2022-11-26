using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class BPC : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    DataTable dt;
    SqlDataAdapter da;
    protected void Page_Load(object sender, EventArgs e)
    {
        linkdashBPC();
        linkinvBPC();
        linkprocBPC();
        if (Session["uname"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }

    public Label fname
    {
        get
        {
            return this.lbluname;
        }
    }
    public Label lname
    {
        get
        {
            return this.lastname;
        }
    }
    public Image imageuser
    {
        get
        {
            return this.imguser;
        }
    }

    public void linkdashBPC()
    {
        HyperLink hypproc = this.Page.Master.FindControl("lnkdash") as HyperLink;
        hypproc.NavigateUrl = "Department/BPC/Bulacan-Polytechnic-College.aspx";
    }

    public void linkinvBPC()
    {
        HyperLink hypinv = this.Page.Master.FindControl("linkinventory") as HyperLink;
        hypinv.NavigateUrl = "Department/BPC/inventory.aspx";
    }
    public void linkprocBPC()
    {
        HyperLink hypdashboard = this.Page.Master.FindControl("linkproc") as HyperLink;
        hypdashboard.NavigateUrl = "Department/BPC/Process.aspx";
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
