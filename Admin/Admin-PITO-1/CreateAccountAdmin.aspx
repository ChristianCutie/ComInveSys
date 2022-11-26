<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPITO.master" AutoEventWireup="true" CodeFile="CreateAccountAdmin.aspx.cs" Inherits="Default2" %>
<%@ MasterType VirtualPath="~/AdminPITO.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <form style="margin-left: 2em; background-color: white;" id="form1" action="/" method="post">
        <style type="text/css">
            .col-lg-6 {
                width: 10%;
            }

            .custom-textbox {
                background-color: #373737;
                color: white;
                border: none;
                outline: none;
                font-size: 16px;
                width: 100%;
                height: 100%;
            }

            form .text-field {
                border-bottom: 2px solid white;
                margin: 30px 0;
                height: 40px;
            }

            .ModalPopupBG {
                background-color: black;
                filter: alpha(opacity=50);
                opacity: 0.8;
            }

            .modal-fullscreen {
                width: 100vw;
                max-width: none;
                height: 100%;
                margin: 0;
            }

            .FixedHeader {
                position: absolute;
                font-weight: bold;
            }

            .example::-webkit-scrollbar {
                display: none;
            }

            .StickyHeader th {
                position: sticky;
                top: 0;
                background-color: #373737;
            }
        </style>
         <link rel="stylesheet" href="../../css/custom.css" />
        <!-- Custom stylesheet - for your changes-->
        <link rel="stylesheet" href="../../css/style.default.css" />
        <!-- Favicon-->
        <!-- Page Header-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
            integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
        <div class="container-fluid">
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h2 style="margin-left: 1em; margin-top: 1em;" class="text-gray-700 mb-0">Create Account</h2>
            </div>
            </div>
    <section class="p-0">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card bg-light shadow">
                        <div class="card-header bg-white">
                            <h3 class="m-0 font-weight-normal text-black-50">Admin Registration Form</h3>
                        </div>
                        <div class="card-body bg-light">
                            <div class="row">
                                <div class="col-lg-6">
                                    <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="First Name:" runat="server" />
                                    <div class=" form-group ">
                                        <asp:TextBox ID="fname" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4 " placeholder="Your First Name.." runat="server" />
                                        <asp:Label Visible="false" ID="txtstatus" Text="" runat="server" />
                                        <asp:Label Visible="false" ID="lblfake" Text="" runat="server" />
                                    </div>
                                </div>
                                
                                 <div class="col-lg-6">
                                <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Job Position:" runat="server" />
                                <div class="form-group ">
                                   <asp:DropDownList Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4 dropdown-toggle" ID="ddlpos" runat="server">
                                            <asp:ListItem Value="" Text="Select Position..." />
                                            <asp:ListItem Text="Computer Technician 1" />
                                            <asp:ListItem Text="Computer Technician 2" />
                                            <asp:ListItem Text="Computer Technician 3" />
                                            <asp:ListItem Text="Computer Technician 4" />
                                        </asp:DropDownList>
                                </div>
                            </div>
                                <div class="col-lg-6">
                                    <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Middle Name:" runat="server" />
                                    <div class=" form-group ">
                                        <asp:TextBox ID="mname" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4" placeholder="Your Middle Name.." runat="server" />
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Department:" runat="server" />
                                    <div class=" form-group ">
                                       <asp:DropDownList Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4 dropdown-toggle example" ID="ddldept" runat="server">
                                            <asp:ListItem Value="" Text="Select Department..." />
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
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Last Name:" runat="server" />
                                    <div class=" form-group ">
                                        <asp:TextBox ID="lname" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4" placeholder="Your Last Name.." runat="server" />
                                    </div>
                                </div>
                                 <div class="col-lg-6">
                                    <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Email Address:" runat="server" />
                                    <div class=" form-group ">
                                        <asp:TextBox ID="email" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4" placeholder="Your Email Address.." runat="server" />
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Gender:" runat="server" />
                                        <asp:DropDownList Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4 dropdown-toggle" ID="ddlgen" runat="server">
                                            <asp:ListItem Value="" Text="Select Gender..." />
                                            <asp:ListItem Text="Male" />
                                            <asp:ListItem Text="Female" />
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-lg-6">
                                        <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Phone Number:" runat="server" />
                                        <asp:TextBox Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4" ID="pnum" runat="server" placeholder="+63 |" />
                                    </div>

                                </div>
                            </div>
                                 <div class="col-lg-6">
                                      <div class="row">
                                    <div class="col-lg-6">
                                        <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Password:" runat="server" />
                                        <asp:TextBox TextMode="Password"  Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4" ID="pass" runat="server" placeholder="•••••" />

                                    </div>
                                    <div class="col-lg-6">
                                        <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Confirm Password:" runat="server" />
                                        <asp:TextBox TextMode="Password" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4" ID="TextBox2" runat="server" placeholder="•••••" />
                                    </div>

                                </div>
                                 </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 ml-3">
                                    <asp:FileUpload style="border: 2px dashed gray" CssClass=" form-control bg-light" ID="flupload" runat="server" />
                                    <small class="form-text mb-3"><i class="fa fa-exclamation-circle"></i> Provide your Picture in your Dashboard</small>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer bg-white border-0">
                            <asp:Label ID="lblerror" CssClass="float-start text-danger" Text="" runat="server" />
                            <asp:Button CssClass="btn btn-success float-end" ID="btnRegister" Text="Register" runat="server" OnClick="btnRegister_Click" />
                        </div>
                    </div>
                </div>
                    </div>
                </div>
    </section>
        </form>
</asp:Content>

