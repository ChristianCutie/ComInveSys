<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPITO.master" AutoEventWireup="true" CodeFile="RepairPending.aspx.cs" Inherits="Default4" %>
<%@ MasterType VirtualPath="~/AdminPITO.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form action="/" method="post">
        <asp:ScriptManager runat="server" />
        <head runat="server">
            <style type="text/css">
                .example::-webkit-scrollbar {
                display: none;
            }
            </style>
       <link href="//cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="../../css/custom.css" />
        <!-- Custom stylesheet - for your changes-->
        <link rel="stylesheet" href="../../css/style.default.css" />
            <link href="../../css/bootstrap.css" rel="stylesheet" />
        <!-- Favicon-->
        <!-- Page Header-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
            integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
            </head>
        <div class="container-fluid">
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h2 style="margin-left: 1em; margin-top: 1em;" class="text-gray-700 mb-0">Pending Repair</h2>
            </div>
            </div>
    <section class="p-0">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card bg-light shadow">
                        <div class="card-header bg-white">
                            <h3 class="m-0 font-weight-normal text-black-50"> Form</h3>
                        </div>
                        <div class="card-body bg-light">
                            <div class="row">
                                <div class="col-lg-6">
                                    <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="PC Number" runat="server" />
                                    <div class=" form-group ">
                                        <asp:TextBox ID="pcnum" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4 " placeholder="PC number" runat="server" />
                                    </div>
                                </div>
                                
                                 <div class="col-lg-6">
                                <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="User ID" runat="server" />
                                     <div class=" form-group ">
                                        <asp:TextBox ID="Textuser" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4 " placeholder="Id Number" runat="server" />
                                    </div>
                            </div>
                                <div class="col-lg-6">
                                    <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Defective Parts" runat="server" />
                                    <div class=" form-group ">
                                        <asp:DropDownList Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4 dropdown-toggle example" ID="DropDowndefparts" runat="server">
                                            <asp:ListItem Value="" Text="Defective Parts..." />
                                            <asp:ListItem Text="Processor" />
                                            <asp:ListItem Text="Randam Access Memory (RAM)" />
                                            <asp:ListItem Text="SSD/HDD" />
                                           <asp:ListItem Text="Graphics Card" />
                                            <asp:ListItem Text="Mother Board" />
                                           
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Department:" runat="server" />
                                    <div class=" form-group ">
                                       <asp:DropDownList Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4 dropdown-toggle example" ID="DropDownList1" runat="server">
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
                                    <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Repair Desription" runat="server" />
                                    <div class=" form-group ">
                                        <asp:Textbox ID="TextBox1" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4" placeholder="Description..." runat="server" />
                                    </div>
                                </div>
                                 <div class="col-lg-6">
                                    <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Status" runat="server" />
                                    <div class=" form-group ">
                                        <asp:DropDownList Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4 dropdown-toggle example" ID="DropDownList4" runat="server">
                                            <asp:ListItem Value="" Text="Status" />
                                            <asp:ListItem Text="Repaired" />
                                            <asp:ListItem Text="Repairing" /> 
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-6">
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
                            <asp:Button CssClass="btn btn-success float-end" ID="btnRegister" Text="Register" runat="server" />
                        </div>
                    </div>
                </div>
                    </div>
                </div>
    </section>
        </form>
</asp:Content>




