<%@ Page Title="" Language="C#" MasterPageFile="~/BPC.master" AutoEventWireup="true" CodeFile="Request.aspx.cs" Inherits="Department_BPC_Request" %>
<%@ MasterType VirtualPath="~/BPC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form action="/" method="post">
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
                z-index: 1000;
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
                <h2 style="margin-left: 1em; margin-top: 1em;" class="text-gray-700 mb-0">PC Request</h2>
            </div>
        </div>
        <section class="p-0">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div id="tbl" runat="server" class="card bg-light shadow">
                            <div style="background-color: white" class="card-header">
                                <h3 class="m-0 font-weight-normal text-black-50">Your Request here</h3>
                            </div>
                            <div class="card-body">
                                <h3 class="m-3 font-weight-normal text-black-50">User Information</h3>
                                <div style="border: 2px dashed" class="col-lg-12 border-gray-500 p-3 pb-3 mb-3">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Full Name: " runat="server" />
                                            <div class="form-group">
                                                <asp:TextBox ID="fullname" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " placeholder="Full Name..." runat="server" />
                                                <small class="form-text mb-3"><i class="fa fa-exclamation-circle"></i> Please Complete the detail requirements</small>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="User ID: " runat="server" />
                                            <div class="form-group">
                                                <asp:TextBox ID="uid" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " placeholder="User ID..." runat="server" />
                                                <small class="form-text mb-3"><i class="fa fa-exclamation-circle"></i> Please Complete the detail requirements</small>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Description: " runat="server" />
                                            <div class="form-group">
                                                <asp:TextBox Height="100" ID="descrip" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " TextMode="MultiLine" placeholder="Your Desription Request here..." runat="server" />
                                                <small class="form-text mb-3"><i class="fa fa-exclamation-circle"></i> Please Complete the detail requirements</small>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Label ID="lblpending" Text="" runat="server" />
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2 mt-2" Text="Department:" runat="server" />
                                            <div class=" form-group ">
                                               <asp:TextBox ReadOnly="true" ID="dept" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " Text="Bulacan Polytechnic College (BPC)" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- Peripherals--%>
                    <div class="card-footer bg-white border-0">
                        <asp:Label ID="txtdate" Visible="false" Text="" runat="server" />
                        <asp:Label ID="lblmessage" Text="" runat="server" />
                        <asp:Button OnClick="btnsubmit_Click" ID="btnsubmit" OnClientClick="return confirm('Are you sure want to Save?')" CssClass="btn btn-success float-end" Text="Submit" runat="server"/>
                    </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <center>
            <div runat="server" visible="false" id="reponsemesage">
                <div style="width: 500px; height: 270px" class="card mt-3 bg-white border-left-success shadow-lg p-3">
                    <h1 class="text-capitalize font-weight-bold m-2">Thank you</h1>
                    <br />
                    <p class="m-3 h5">Your response has been recorded. Wait to accept your request. </p>
                    <br />
                    <asp:LinkButton ID="viewtb" Text="View Table" runat="server"  />
                </div>
            </div>
        </center>

    </form>
</asp:Content>

