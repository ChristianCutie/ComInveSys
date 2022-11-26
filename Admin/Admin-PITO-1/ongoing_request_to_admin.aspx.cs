﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_PVOOnGoingRequestAdmin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    SqlDataAdapter da;
    SqlCommand cmd;
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadData();
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
                Response.Redirect("Admin/Admin-PITO-1/PVO_On_Going_Request_Admin.aspx");
                dr.Close();
            }

        }
    }
    private void LoadData()
    {
            SqlCommand cmd = new SqlCommand("SELECT TOP 3 * FROM PVOOngoingDB ORDER BY ID ASC; ", con);
            da = new SqlDataAdapter(cmd);
             dt = new DataTable();
            da.Fill(dt);
            grv.DataSource = dt; 
            grv.DataBind();
    }
    

    protected void grv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grv.PageIndex = e.NewPageIndex;
        LoadData();
    }
}

