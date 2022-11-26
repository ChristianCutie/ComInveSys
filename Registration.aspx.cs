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
using System.Text.RegularExpressions;
using System.Net;
using Newtonsoft.Json.Linq;
using Tulpep.NotificationWindow;

public partial class Registration : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    SqlCommand cmd;
    SqlDataAdapter da;
    DataTable dt;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private void sessions()
    {
        if (Session["uname"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            con.Open();
        }
    }

    private void cleartext()
    {
        fname.Text = "";
        lname.Text = "";
        mname.Text = "";
        email.Text = "";
        pass.Text = "";
        pnumber.Text = "";
        ddlpos.SelectedValue = "";
    }


    protected void Register_Click(object sender, EventArgs e)
    {

            string cs = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))

            if (fname.Text != "" && mname.Text != "" && lname.Text != "" && email.Text != ""
                && pass.Text != "" && pnumber.Text != "" && ddlpos.SelectedValue != "")
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
                    cmd.Parameters.AddWithValue("@pnum", pnumber.Text);
                    cmd.Parameters.AddWithValue("@email", email.Text);
                    cmd.Parameters.AddWithValue("@pass", pass.Text);
                    cmd.Parameters.AddWithValue("@prof", fileName);
                    cmd.Parameters.AddWithValue("@dept", ddlpos.Text);
                    cmd.Parameters.AddWithValue("@utype", utype.Text);
                    cmd.Parameters.AddWithValue("@stat", statustxt.Text = "Pending");
                    con.Open();
                    cmd.ExecuteNonQuery();
                    cmd.Connection = con;
                    Response.Write("<script>alert('Data Has been Added. Your are automatically redirect to login.')</script>");
                    cleartext();
                    con.Close();
                    reponsemesage.Visible = true;
                    cardhidden.Visible = false;

                }
                else
                {
                    error.Visible = true;
                    error.InnerText = " Your Image does not support for Given Extension (.jpg /.png).";
                   
                }
            }
            else
            {
                error.Visible = true;
                error.InnerText = "Please fill the form completely.";
            }
        }
       
    protected void bcklogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
        cardhidden.Visible = true;
    }
    //public bool IsReCaptchvalid()
    //{
    //    var result = false;
    //    var captchaResponse = Request.Form["g-recaptcha-response"];
    //    var secretkey = "6Le29cAiAAAAAGUs30SojgCyz4NSeGGI2u5wzBOe";
    //    var apiUrl = "https://developers.google.com/recaptcha/docs/verify#api_request";
    //    var requesturi = string.Format(apiUrl, secretkey, captchaResponse);
    //    var request = (HttpWebRequest)WebRequest.Create(requesturi);
    //    using (WebResponse response = request.GetResponse())
    //    {
    //        using (StreamReader stream = new StreamReader(response.GetResponseStream()))
    //        {
    //            JObject jResponse = JObject.Parse(stream.ReadToEnd());
    //            var isSuccess = jResponse.Value<bool>("success");
    //            result = (isSuccess) ? true : false;
    //        } 
    //    }
    //    return result; 

    //    }
    }

