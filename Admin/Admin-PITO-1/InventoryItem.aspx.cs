using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using AjaxControlToolkit;
using AjaxControlToolkit.Design;
using System.Web.Services;
public partial class s : System.Web.UI.Page
{
    static SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    SqlCommand cmd;
    DataTable dt;
    SqlDataAdapter da;
    static SqlDataAdapter sda;
    static DataTable sdt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
        }

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
                Response.Redirect("Admin/Admin-PITO-1/InventoryItem.aspx");
                dr.Close();
            }

        }
    }

    private void visibleAll()
    {
        grid.Visible = true;
        tbl.Visible = false;
        hidebtn.Visible = true;
        cancelbtn.Visible = false;
    }
    private void cleartxt()
    {
        txtprocr.Text = "";
        txtram.Text = "";
        txtram2.Text = "";
        txtpsu.Text = "";
        txtstorage.Text = "";
        txtstorage2.Text = "";
        txtgpu.Text = "";
        txtmboard.Text = "";
    }
    private void LoadData()
    {
        string strQuery = "SpInvAllData";
        SqlCommand cmd = new SqlCommand(strQuery, con);
        da = new SqlDataAdapter(cmd);
        dt = new DataTable();
        da.Fill(dt);

        grv.DataSource = dt;
        grv.DataBind();
    }
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetSearch(string prefixText)
    {

        con.Open();
        DataTable Result = new DataTable();
        string str = "SELECT Processor FROM inventoryitem WHERE Processor like '%" + prefixText + "%'";
        sda = new SqlDataAdapter(str, con);
        sdt = new DataTable();
        sda.Fill(sdt);
        con.Close();
        List<string> Output = new List<string>();
        for (int i = 0; i < sdt.Rows.Count; i++)
            Output.Add(sdt.Rows[i][0].ToString());
        return Output;

    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        tbl.Visible = true;
        grid.Visible = false;
        hidebtn.Visible = false;
        cancelbtn.Visible = true;
        txtram2and3.Visible = false;
        lnkram.Visible = true;
        lnkstorage.Visible = true;
        txtstoragevisible.Visible = false;
    }

    protected void btnsearch_Click(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter(@"select * from inventoryitem where Processor like '%" + txtsearch.Text + "%'", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        grv.DataSource = ds;
        grv.DataBind();
        txtsearch.Text = "";
    }

    protected void cancel_Click(object sender, EventArgs e)
    {
        visibleAll();
        LoadData();
        cleartxt();
    }

    protected void lnkram_Click(object sender, EventArgs e)
    {
        txtram2and3.Visible = true;
        lnkram.Visible = false;
    }

    protected void lnkstorage_Click(object sender, EventArgs e)
    {
        txtstoragevisible.Visible = true;
        lnkstorage.Visible = false;
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        using (SqlCommand cmd = new SqlCommand(@"INSERT INTO inventoryitem(Processor,RAM,RAM2,Storage,Storage2,Storage3,Storage4,GraphicCard,
                                                PSU,Motherboard,Monitor,Mouse,Keyboard,Printer,PCNumber,DateTime)
                                             VALUES(@proc,@ram,@ram2,@strg,@strg2,@strg3,@strg4,@gpu,@psu,@mboard,@mon,@mouse,@keyb,@print,@pcnum,@dt)"))
        {
            if (txtprocr.Text == "" && txtram.Text == "" && txtram2.Text == "" && txtstorage.Text == "" && txtstorage2.Text == "" &&
                txtgpu.Text == "" && txtpsu.Text == "" && txtmboard.Text == "" && txtmon.Text =="" && txtmouse.Text == ""
                && txtkeyb.Text == "" && txtprint.Text == "" )
            {
                lblmessage.Text = "Please Complete the Detail Above.";
                lblmessage.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                con.Close();
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
                cmd.Parameters.AddWithValue("@mon", txtmon.Text);
                cmd.Parameters.AddWithValue("@mouse", txtmouse.Text);
                cmd.Parameters.AddWithValue("@keyb", txtkeyb.Text);
                cmd.Parameters.AddWithValue("@print", txtprint.Text);
                cmd.Parameters.AddWithValue("@pcnum", pcnum.Text);
                cmd.Parameters.AddWithValue("@dt", lbldate.Text = DateTime.Now.ToString());
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                cleartxt();
                LoadData();
                grid.Visible = true;
                tbl.Visible = false;
                cancelbtn.Visible = false;
                hidebtn.Visible = true;
            }

        }
    }

    protected void prnt_Click(object sender, EventArgs e)
    {
        Session["ctrl"] = pnl1;
        ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe','height=1000px,width=1000px,scrollbars=1');</script>");
    }
}