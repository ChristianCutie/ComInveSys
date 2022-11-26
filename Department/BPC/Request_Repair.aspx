<%@ Page Title="" Language="C#" MasterPageFile="~/BPC.master" AutoEventWireup="true" CodeFile="Request_Repair.aspx.cs" Inherits="Department_BPC_Request_Repair" %>
<%@ MasterType VirtualPath="~/BPC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form action="/" method="post">
       <link href="//cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" rel="stylesheet" />
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
                <h2 style="margin-left: 1em; margin-top: 1em;" class="text-gray-700 mb-0">Troubleshoot</h2>
            </div>
            </div>
    <section class="p-0">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card bg-light shadow">
                        <div class="card-header bg-white">
                            <h3 class="m-0 font-weight-normal text-black-50"> Request Form</h3>
                        </div>
                        <div class="card-body bg-light">
                                <div style="border: 2px dashed" class="col-lg-12 border-gray-500  p-3 pb-3 mb-3">
                            <div class="row">
                                <div class="col-lg-6">
                                    <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Full Name" runat="server" />
                                    <div class=" form-group ">
                                        <asp:TextBox ID="txfname" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4 " placeholder="Your Full Name.." runat="server" />
                                    </div>
                                </div>
                                
                                 <div class="col-lg-6">
                                <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="User ID" runat="server" />
                                     <div class=" form-group ">
                                        <asp:TextBox ID="Textuser" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4 " placeholder="Your ID Number.." runat="server" />
                                    </div>
                            </div>
                               <%-- <div class="col-lg-6">
                                    <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Defective Parts" runat="server" />
                                    <div class=" form-group ">
                                        <asp:DropDownList Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4 dropdown-toggle example" ID="DropDowndefparts" runat="server">
                                            <asp:ListItem Value="" Text="Choose Defective Pat..." />
                                            <asp:ListItem Text="Processor" />
                                            <asp:ListItem Text="Randam Access Memory (RAM)" />
                                            <asp:ListItem Text="Read Only Memory (ROM)" />
                                            <asp:ListItem Text="Power Supply Unit (PSU)" />
                                           <asp:ListItem Text="Graphics Card" />
                                            <asp:ListItem Text="Mother Board" />
                                            <asp:ListItem Text="Keyboard" />
                                            <asp:ListItem Text="Mouse" />
                                            <asp:ListItem Text="Printer" />
                                           
                                        </asp:DropDownList>
                                    </div>
                                </div>--%>
                                <div class="col-lg-6">
                                    <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Department" runat="server" />
                                    <div class=" form-group ">
                                        <asp:TextBox ReadOnly="true" Text="Provincial Veterinary Office (PVO)" ID="TextBox2" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4 " runat="server" />
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="PC Number" runat="server" />
                                    <div class=" form-group ">
                                        <asp:DropDownList  Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4 dropdown-toggle example" runat="server" ID="ddlpcnum">
                                            <asp:ListItem Text="" Selected="True"  />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Report" runat="server" />
                                    <div class=" form-group ">
                                        <asp:Textbox ID="txtdesc" Height="150" TextMode="MultiLine" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4" placeholder="What's happening?..." runat="server" />
                                    </div>
                                </div>
                                 
                                <div class="col-lg-6">
                            </div>
                            </div>
                            <%--<div class="row">
                                <div class="col-lg-12 ml-3">
                                    <asp:FileUpload style="border: 2px dashed gray" CssClass=" form-control bg-light" ID="flupload" runat="server" />
                                    <small class="form-text mb-3"><i class="fa fa-exclamation-circle"></i> Provide your Picture in your Dashboard</small>
                                </div>
                            </div>--%>
                        </div>
                        </div>
                        <div class="card-footer bg-white border-0">
                            <asp:Label Visible="false" ID="fakedate" Text="" runat="server" />
                            <asp:Label ID="lblerror" Text="" runat="server" />
                            <asp:Button CssClass="btn btn-success float-end" ID="btnRegister" Text="Submit" runat="server" />
                        </div>
                    </div>
                </div>
                    </div>
                </div>
    </section>
        </form>
</asp:Content>

