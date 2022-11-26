<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPITO2.master" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="Admin_Admin_PITO_2_Manage" %>
<%@ MasterType VirtualPath="~/AdminPITO2.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager runat="server" />
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <link rel="stylesheet" href="css/custom.css" />
        <!-- Custom stylesheet - for your changes-->
        <link rel="stylesheet" href="css/style.default.css" />
        <!-- Favicon-->
        <!-- Page Header-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
            integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
    <div class="container-fluid">
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h2 style="margin-left: 1em; margin-top: 1em;" class="text-gray-700 mb-0">Manage Account</h2>
            </div>
        </div>
    <section class="p-0">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div id="tbl" runat="server" class="card bg-light shadow">
                            <div style="background-color: white;" class="card-header py-3">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h3 class="m-0 font-weight-normal text-black-50">Manage Account</h3>
                                    </div>
                                    <div class="col-md-6">
                                        <div class=" m-3 float-end">
                                            <asp:Button OnClientClick="return confirm('Are you sure you want to Approve this account?')" style="width: 120px" runat="server" Text="Approve" CssClass="btn btn-success mx-3" ID="btnapprove" OnClick="btnapprove_Click" />
                                            <asp:Button OnClientClick="return confirm('Are you sure you want to Delete this Account?')" style="width: 120px" runat="server" Text="Decline" CssClass="btn btn-danger " OnClick="btnDecline_Click" ID="btnDecline" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4 text-center mt-3">
                                        <asp:Image ID="imgtxt" ImageUrl='<%# "Manage.aspx?ID="+ Eval("ID") %>' runat="server" Width="80%" />
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="row">
                                           <div class="col-6">
                                        </div>
                                             <div class="col-6">
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <asp:Label CssClass=" text-capitalize ml-2" Text="User Type:" runat="server" />
                                                    <div class=" form-group ">
                                                        <asp:TextBox ReadOnly="true" ID="txtutype" Style="border-radius: 10px;" CssClass="form-control disabled bg-white border-gray-500 " runat="server" />
                                                        <asp:Label ID="lblapproved" Text="" runat="server" />
                                                        <br />
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <asp:Label CssClass=" text-capitalize ml-2" Text="Status:" runat="server" />
                                                    <div class=" form-group ">
                                                        <asp:TextBox ReadOnly="true" ID="txtstat" Style="border-radius: 10px;" CssClass="form-control disabled bg-white border-gray-500 " runat="server" />
                                                        <br />
                                                    </div>
                                                </div>
                                    </div>
                                        </div>
                                    <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2" Text="First Name:" runat="server" />
                                            <div class=" form-group ">
                                                <asp:TextBox ReadOnly="true" ID="txtfname" Style="border-radius: 10px;" CssClass="form-control disabled bg-white border-gray-500 " runat="server" />
                                                <br />
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2" Text="Last Name:" runat="server" />
                                            <div class=" form-group ">
                                                <asp:TextBox ReadOnly="true" ID="txtlname" Style="border-radius: 10px;" CssClass="form-control disabled bg-white border-gray-500 " runat="server" />
                                                <br />
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2" Text="Middle Name:" runat="server" />
                                            <div class=" form-group ">
                                                <asp:TextBox ReadOnly="true" ID="txtmname" Style="border-radius: 10px;" CssClass="form-control disabled bg-white border-gray-500 " runat="server" />
                                                <br />
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2" Text="Gender:" runat="server" />
                                            <div class=" form-group ">
                                                <asp:TextBox ReadOnly="true" ID="txtgen" Style="border-radius: 10px;" CssClass="form-control disabled bg-white border-gray-500 " runat="server" />
                                                <br />
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2" Text="Phone Number:" runat="server" />
                                            <div class=" form-group ">
                                                <asp:TextBox ReadOnly="true" ID="txtpnum" Style="border-radius: 10px;" CssClass="form-control disabled bg-white border-gray-500 " runat="server" />
                                                <br />
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2" Text="Password:" runat="server" />
                                            <div class=" form-group ">
                                                <asp:TextBox ReadOnly="true" ID="txtpass" Style="border-radius: 10px;" CssClass="form-control disabled bg-white border-gray-500 " runat="server" />
                                                <br />
                                            </div>
                                        </div>
                                        <asp:Label CssClass=" text-capitalize ml-2" Text="Email:" runat="server" />
                                        <div class=" form-group ">
                                            <asp:TextBox ReadOnly="true" ID="txtemail" Style="border-radius: 10px;" CssClass="form-control disabled bg-white border-gray-500 " runat="server" />
                                            <br />
                                        </div>
                                        <asp:Label CssClass=" text-capitalize ml-2" Text="Department:" runat="server" />
                                        <div class=" form-group ">
                                            <asp:TextBox ReadOnly="true" ID="txtdept" Style="border-radius: 10px;" CssClass="form-control disabled bg-white border-gray-500 " runat="server" />
                                            <br />
                                        </div>
                                        <asp:Label CssClass=" text-capitalize ml-2" Text="Position:" runat="server" />
                                        <div class=" form-group ">
                                            <asp:TextBox ReadOnly="true" ID="txtpos" Style="border-radius: 10px;" CssClass="form-control disabled bg-white border-gray-500 " runat="server" />
                                            <asp:Label ID="lblstatus" Text="" runat="server" />
                                            <br />
                                        </div>
                                    </div>
                                </div>
                            </div>
                                <%--<hr style="border: 2px solid gray"/>--%>
                            </div>
                            <div class="card-footer bg-white border-0">
                                        <asp:Label ID="lblfakeimg" Text="" Visible="false" runat="server" />
                                        <asp:Label ID="lblid" Visible="false" Text="" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
              </div>
        </section>
</asp:Content>
</asp:Content>

