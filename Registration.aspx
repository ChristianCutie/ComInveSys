<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet"/>
    <link href="https://www.vantagehunt.com/assets/images/vh/bulacan-province-logo.png" rel="shortcut icon" />

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet"/>
    <link href="css/sb-admin-2.css" rel="stylesheet" />
    <style type="text/css">
         .fileupload-custom{
            background-color: #FFF;
            border: none;
        }
         .float-end{
             float: right;
         }
    </style>
    <script type="text/javascript">
        var verifyCallback = function (response) {
            alert(response);
        };
        var widgetId1;
        var widgetId2;
        var onloadCallback = function () {
            // Renders the HTML element with id 'example1' as a reCAPTCHA widget.
            // The id of the reCAPTCHA widget is assigned to 'widgetId1'.
            widgetId1 = grecaptcha.render('ReCaptchaContainer', {
                'sitekey': '6Le29cAiAAAAADsZ28J-CbiqqryT1auRU-dEEU8G',
                'theme': 'light'
            });
            grecaptcha.render('ReCaptchaContainer', {
                'sitekey': '6Le29cAiAAAAADsZ28J-CbiqqryT1auRU-dEEU8G',
                'callback': verifyCallback,
                'theme': 'dark'
            });
        };
    </script>
</head>
<body class="bg-gradient-primary">
    <form action="javascript:alert(grecaptcha.getResponse(widgetId1));" id="form1" runat="server">
        <div class="container">
            <div class="col"></div>
            <div runat="server" id="cardhidden">
            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-5 d-none d-lg-block">
                            <center>
                                <img src="https://www.zamboanga.com/z/images/9/90/PH_seal_bulacan.png" alt="" width="250" height="250" style="margin-top: 8em" class="align-content-center" />
                            </center>
                            <div class="form-label">
                                <h2 style="color: black; font-weight: bold" class=" text-center mt-3 auto-input"></h2>
                            </div>
                        </div>
                        <div class="col-lg-7">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                                </div>
                                <form class="user">
                                    <div class="mb-3 row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <asp:TextBox ID="fname" Style="height: 50px;  border-radius: 30px;" runat="server" required CssClass="form-control form-control-user" placeholder="First Name" />
                                            <asp:Label ID="utype" Text="Clerk" Visible="false" runat="server" />
<%--                                            <asp:RequiredFieldValidator ForeColor="Red" ErrorMessage="*Required" ControlToValidate="fname" runat="server" ValidationGroup="save" />--%>
                                        </div>
                                        <div class="col-sm-6">
                                            <asp:TextBox ID="lname" Style="height: 50px; border-radius: 30px;" required aria-describedby="emailHelp" runat="server"
                                                CssClass="form-control form-control-user" placeholder="Last Name" />
<%--                                            <asp:RequiredFieldValidator ForeColor="Red" ErrorMessage="*Required" ControlToValidate="lname" runat="server" ValidationGroup="save" />--%>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <asp:TextBox  required ID="mname" Style="height: 50px; border-radius: 30px;" 
                                                runat="server" CssClass="form-control form-control-user" placeholder="Middle Name" />
<%--                                            <asp:RequiredFieldValidator ForeColor="Red" ErrorMessage="*Required" ControlToValidate="mname" runat="server" ValidationGroup="save" />--%>
                                        </div>
                                        <div class="col-sm-6">
                                            <asp:TextBox ID="pnumber" Style="height: 50px; border-radius: 30px;" 
                                                runat="server" CssClass="form-control form-control-user" placeholder="+63 |" />
<%--                                            <asp:RequiredFieldValidator ForeColor="Red" ErrorMessage="*Required" ControlToValidate="pnumber" runat="server" ValidationGroup="save" />--%>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                            <asp:DropDownList required ID="ddlpos" Style="height: 50px; border-radius: 30px;" CssClass="form-control dropdown-toggle text-secondary" runat="server">
                                                <asp:ListItem CssClass="dropdown-item"  Value="" Text="Select Department..." />
                                                 <asp:ListItem Text="Office of the Governor (GO)" />
                                                <asp:ListItem Text="Office of the Governor - Personal Staff" />
                                                <asp:ListItem Text="Office of the Vice Governor(GVO)" />
                                               <asp:ListItem Text="Office of the Vice Governor - Personal Staff" />
                                                <asp:ListItem Text="Office of the Secretary to the Sangguniang Panlalawigan (OSSP)" />
                                                <asp:ListItem Text="Bulacan Environment and Natural Resources Office (BENRO)" />
                                               <asp:ListItem Text="Bulacan Polytechnic College (BPC)" />
                                                <asp:ListItem Text="Provincial Accounting Office" />
                                                <asp:ListItem Text="Provincial Administrator's Office (PA's Office)" />
                                               <asp:ListItem Text="Provincial Agriculture Office (PAO)" />
                                                <asp:ListItem Text="Provincial Assessor's Office" />
                                                <asp:ListItem Text="Provincial Budget Office (PBO)" />
                                               <asp:ListItem Text="Provincial Civil Security and Jail Management Office (PCSJMO)" />
                                                <asp:ListItem Text="Provincial Cooperative and Enterprise Development Office (PCEDO)" />
                                                <asp:ListItem Text="Provincial Disaster Risk Reduction and Management Office (PDRRMO)" />
                                               <asp:ListItem Text="Provincial Engineer's Office (PEO)" />
                                                <asp:ListItem Text="Provincial General Services Office (PGSO)" />
                                                <asp:ListItem Text="Provincial History, Arts, Culture and Tourism Office (PHACTO)" />
                                               <asp:ListItem Text="Provincial Human Resource Management Office (PHRMO)" />
                                                <asp:ListItem Text="Provincial Information Technology Office (PITO)" />
                                                <asp:ListItem Text="Provincial Legal Office (PLO)" />
                                               <asp:ListItem Text="Provincial Planning and Development Office (PPDO)" />
                                                <asp:ListItem Text="Provincial Public Affairs Office (PPAO)" />
                                                <asp:ListItem Text="Provincial Public Health Office (PPHO)" />
                                               <asp:ListItem Text="Provincial Social Welfare and Development Office (PSWDO)" />
                                                <asp:ListItem Text="Provincial Treasurer's Office (PTO)" />
                                                <asp:ListItem Text="Provincial Veterinary Office (PVO)" />
                                               <asp:ListItem Text="Provincial Youth, Sports and Public Employment Service Office (PYSPESO)" />
                                            </asp:DropDownList>
<%--                                         <asp:RequiredFieldValidator ForeColor="Red" ErrorMessage="*Required" ControlToValidate="ddlpos" runat="server" ValidationGroup="save" />--%>
                                        </div> 
                                    <div class="mb-3">
                                        <asp:TextBox required type="email" ID="email" Style="height: 50px; border-radius: 30px;"
                                            runat="server" CssClass="form-control form-control-user" placeholder="Enter Email Address..." />
                                        <small>
                                            <asp:Label ToolTip="junjun" CssClass="fa fa-exclamation-circle ml-3" runat="server"></asp:Label> This is your username</small>
<%--                                        <asp:RequiredFieldValidator ForeColor="Red" ErrorMessage="*Required" ControlToValidate="email" runat="server" ValidationGroup="save" />--%>
                                    </div>
                                    <div class="mb-3 row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <asp:TextBox required ID="pass" TextMode="Password" Style="height: 50px; border-radius: 30px;" 
                                                aria-describedby="emailHelp" runat="server" CssClass="form-control form-control-user" placeholder="•••••" />
                                            <asp:RegularExpressionValidator SetFocusOnError="true" Font-Size="Medium" ForeColor="Red" CssClass=" ml-3 mt-2" ErrorMessage="Invalid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="pass"  runat="server" />
<%--                                            <asp:RequiredFieldValidator ForeColor="Red" ErrorMessage="*Required" ControlToValidate="pass" runat="server" ValidationGroup="save" />--%>
                                        </div>
                                        <div class="col-sm-6">
                                            <asp:TextBox required ID="repassword" TextMode="Password" Style="height: 50px; border-radius: 30px;" aria-describedby="emailHelp" runat="server" CssClass="form-control form-control-user" placeholder="•••••" />
<%--                                            <asp:RequiredFieldValidator Display="Dynamic" ForeColor="Red" ErrorMessage="*Required" ControlToValidate="repassword" runat="server" ValidationGroup="save" />--%>
                                            <asp:CompareValidator Display="Dynamic" ForeColor="Red" ErrorMessage="Password does not match" ControlToValidate="repassword" SetFocusOnError="true" ControlToCompare="pass" runat="server" ValidationGroup="save" />
                                        </div>
                                        </div>
                                    <div class="mb-3">
                                        <asp:FileUpload required ToolTip="Clkick here to upload your photos" style="border: 2px dashed gray; height:45px;" CssClass=" form-control bg-light" ID="flupload" runat="server" />
                                        <asp:Label ID="lblerror" Text="" runat="server" />
<%--                                         <asp:RequiredFieldValidator ForeColor="Red" ErrorMessage="*Required" ControlToValidate="flupload" runat="server" ValidationGroup="save" />--%>
                                            </div>
                                        <div class="mb-3 float-end">
                                            <div id="ReCaptchaContainer"></div>
                                            <asp:Label ID="lblmessage" Text="" runat="server" />
                                        </div>
                                    <asp:TextBox ID="statustxt" Visible="false" runat="server" />
                                    <asp:Button OnClientClick="return confirm('Are you sure want to Save?')" ValidationGroup="save" OnClick="Register_Click" ID="Register" class="btn btn-primary btn-user btn-block" runat="server" type="button" Text="Register Account"></asp:Button>
                                     <div id="error" runat="server" visible="false" class="custom-label text-center p-1 mt-2">
                                                <asp:Label  ForeColor="Black" ID="Label1" Text="" runat="server" />
                                            </div>
                                </form>
                                <hr/>
                                <div class="text-center">
                                    <a class="small" href="Login.aspx">Already have an account? Login!</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <center>
                <div visible="false" runat="server" id="reponsemesage">
                    <div style="width: 530px; height:300px" class="card mt-3 bg-white border-left-success shadow-lg p-3">
                        <h1 class="text-capitalize font-weight-bold m-2">Thank you</h1>
                        <br />
                        <p class="m-3 h5">Your response has been recorded. Wait to accept your request. </p>
                        <br />
                        <asp:LinkButton ID="bcklogin" Text="Back to Login" runat="server" OnClick="bcklogin_Click" />
                    </div>
                </div>
            </center>
            </div>
         <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer>
    </script>
        
        <script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.12"></script>
        <script> 
        var typed = new Typed(".auto-input", {
            strings: ["Provincial Government of Bulacan"],
            typeSpeed: 100,
            loop: false
        })

        </script>
        <%--<script>
            {
                "success": true | false,
                "challenge_ts":"2022-10-22T10:24:20ZZ",  // timestamp of the challenge load (ISO format yyyy-MM-dd'T'HH:mm:ssZZ)
                "hostname": "localhost",         // the hostname of the site where the reCAPTCHA was solved
                  "error-codes": [...]        // optional
            }
        </script>--%>
        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>
    </form>
</body>
</html>
