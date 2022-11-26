using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminPITO : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    DataTable dt;
    SqlDataAdapter da;
    int count = 0;
    string department="";
    protected void Page_Load(object sender, EventArgs e)
    {
        lnkpends();
        lnkapprove();
        lnkcreate();
        lnkdash();
        lnkbpc();
        lnkpvo();
        lnkaccom();
        lnkong();
        lnkpending();
        linkinv();

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
        cmd.CommandText = "SELECT * FROM RequestToAdmin WHERE Department='Provincial Veterinary Office (PVO)'OR" +
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
    public void linkinv()
    {
        HyperLink hypinventory = this.Page.Master.FindControl("lnkinv") as HyperLink;
        hypinventory.NavigateUrl = "Admin/Admin-PITO-1/InventoryItem.aspx";
    }
    public void lnkpending()
    {
        HyperLink hypinventory = this.Page.Master.FindControl("pend") as HyperLink;
        hypinventory.NavigateUrl = "Admin/Admin-PITO-1/pending_distribute_to_client.aspx";
    }
    public void lnkong()
    {
        HyperLink hypinventory = this.Page.Master.FindControl("ongoing") as HyperLink;
        hypinventory.NavigateUrl = "Admin/Admin-PITO-1/ongoing_request_to_admin.aspx";
    }
    public void lnkaccom()
    {
        HyperLink hypinventory = this.Page.Master.FindControl("accomp") as HyperLink;
        hypinventory.NavigateUrl = "Admin/Admin-PITO-1/accomplishment_request_to_client.aspx";
    }
    public void lnkpvo()
    {
        HyperLink pvo = this.Page.Master.FindControl("pvo") as HyperLink;
        pvo.NavigateUrl = "Admin/Admin-PITO-1/pvo/pvo_request_from_client.aspx";
    }
    public void lnkbpc()
    {
        HyperLink pvo = this.Page.Master.FindControl("bpc") as HyperLink;
        pvo.NavigateUrl = "Admin/Admin-PITO-1/bpc/bpc_request_from_client.aspx";
    }
    public void lnkdash()
    {
        HyperLink pvo = this.Page.Master.FindControl("dash") as HyperLink;
        pvo.NavigateUrl = "Admin/Admin-PITO-1/Dashboard.aspx";
    }
    public void lnkcreate()
    {
        HyperLink acc = this.Page.Master.FindControl("createacc") as HyperLink;
        acc.NavigateUrl = "Admin/Admin-PITO-1/CreateAccountAdmin.aspx";
    }
    public void lnkpends()
    {
        HyperLink pd = this.Page.Master.FindControl("pends") as HyperLink;
        pd.NavigateUrl = "Admin/Admin-PITO-1/PendingAccount.aspx";
    }
    public void lnkapprove()
    {
        HyperLink apr = this.Page.Master.FindControl("appr") as HyperLink;
        apr.NavigateUrl = "Admin/Admin-PITO-1/ApprovedAccount.aspx";
    }
}

