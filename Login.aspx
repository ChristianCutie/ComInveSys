<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login: Provincial Government of Bulacan</title>
     <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet"/>
    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet"/>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="https://www.vantagehunt.com/assets/images/vh/bulacan-province-logo.png" rel="shortcut icon" />
    <script type="text/javascript">

        history.pushState(null, null, location.href);

        window.onpopstate = function () {

            history.go(1);
        };
    </script>
    <style type="text/css">
         .custom-textbox {
            background-color: #fff;
            color: white;
            border: none;
            outline: none;
            font-size: 16px;
            width: 100%;
            height: 100%;
        }
         .card-body1{
             
             background: #ffffff;
             box-shadow:  20px 20px 60px #d9d9d9,
             -20px -20px 60px #ffffff;
             height: 500px;
         }
         .custom-label{
             border:1px solid #ffa97d;
             border-radius: 5px;
             background-color:#ffa97d;
             opacity: 1;
         }
    </style>
</head>
<body class="bg-gradient-primary">
    <form id="form1" runat="server">
    <div class="container">
        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5 ">
                    <div class="card-body1 p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div  class="col-lg-6 d-none d-lg-block " >
                                <center>
                                    <img src="https://www.zamboanga.com/z/images/9/90/PH_seal_bulacan.png" alt="" width="250" height="250" style="margin-top: 5em" />
                                </center>
                                <div class="form-label">
                                    <h2 style="color: black; font-weight: bold" class="text-center mt-3 auto-input"></h2>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h3 text-gray-900 mb-4">Welcome!</h1>
                                    </div>
                                    <form class="user">
                                        <div class="mb-3">
                                            <asp:TextBox ID="username" Style="height: 50px; border-radius: 30px;" aria-describedby="emailHelp" runat="server" CssClass="form-control form-control-user" placeholder="Enter Email Address..." />
                                        </div>
                                        <div class="mb-3">
                                           <asp:TextBox ID="password" style="height: 50px; border-radius: 30px;" aria-describedby="emailHelp" runat="server" CssClass="form-control form-control-user" TextMode="Password" placeholder="your password..."/>
                                            
                                        </div>
                                        <div class="mb-3">
                                            <div class="custom-control custom-checkbox small">
                                                <asp:CheckBox ID="chkboxlog" Text=" Remember Me" runat="server" />
                                            </div>
                                        </div>                          
                                        <asp:Button ID="Login" class="btn btn-primary btn-user btn-block" runat="server" type="button" Text="Login" Onclick="Login_Click"> </asp:Button>
                                        <div id="error" runat="server" visible="false" class="custom-label text-center p-1 mt-2">
                                                <asp:Label  ForeColor="Black" ID="lblerror" Text="" runat="server" />
                                            </div>
                                    </form>
                                    <hr />
                                    <div class="text-center">
                                        <a class="small" href="forgetpass.aspx">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="Registration.aspx">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
                <script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.12"></script> 
        

        <script> 

        var typed = new Typed(".auto-input", {

            strings: ["Provincial Government of Bulacan"],

            typeSpeed: 50,
            loop: false

        })

        </script>
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
