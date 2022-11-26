<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPITO2.master" AutoEventWireup="true" CodeFile="BPC_Distribution_admin.aspx.cs" Inherits="Admin_Admin_PITO_2_BPC_Distribution_admin" %>
<%@ MasterType VirtualPath="~/AdminPITO2.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager runat="server" />
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
                <h2 style="margin-left: 1em; margin-top: 1em;" class="text-gray-700 mb-0">Manage Computer</h2>
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
                                        <h3 class="m-0 font-weight-normal text-black-50">Release Item</h3>
                                    </div>
                                    <div class="col-md-6">
                                        <div class=" m-3 float-end">
                                            <asp:Button OnClientClick="return confirm('Are you sure you want to Approve this account?')" style="width: 120px" runat="server" Text="Release" CssClass="btn btn-success mx-3" ID="btnRelease" OnClick="btnRelease_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <h3 class="m-3 font-weight-normal text-black-50">User Information</h3>
                                <div style="border: 2px dashed" class="col-lg-12 border-gray-500 p-3 pb-3 mb-3">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Full Name " runat="server" />
                                            <div class="form-group">
                                                <asp:TextBox ID="txtfullname" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " placeholder="Full Name..." runat="server" />
                                                <small class="form-text mb-3"><i class="fa fa-exclamation-circle"></i> Please Complete the detail requirements</small>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="User ID " runat="server" />
                                            <div class="form-group">
                                                <asp:TextBox ID="txtuserid" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " placeholder="User ID..." runat="server" />
                                                <small class="form-text mb-3"><i class="fa fa-exclamation-circle"></i> Please Complete the detail requirements</small>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2 mt-2" Text="PC Number: " runat="server" />
                                            <div class="form-group">
                                                <asp:TextBox ReadOnly="true" ID="txtpcnum" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " placeholder="PC Number..." runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2 mt-2" Text="Department:" runat="server" />
                                            <div class=" form-group ">  
                                                <asp:TextBox Text="Provincial Veterinary Office (PVO)" ReadOnly="true" ID="dept" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <h3 class="m-3 font-weight-normal text-black-50">Components</h3>
                                <div style="border: 2px dashed" class="col-lg-12 border-gray-500 p-3 pb-3 mt-3">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2 mt-2" Text="Random Access Memory(RAM):" runat="server" />
                                            <div class=" form-group ">
                                                <asp:TextBox ReadOnly="true" ID="txtram" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 "  runat="server" />
                                                <br />
                                                    <asp:TextBox placeholder="No Item" ReadOnly="true" ID="txtram2" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4" runat="server" />
                                            </div>
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2 mt-2" Text="Read Only Memory(ROM):" runat="server" />
                                            <div class=" form-group ">
                                                <asp:TextBox placeholder="No Item" ReadOnly="true" ID="txtstorage" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " runat="server" />
                                                <br />
                                                <asp:TextBox placeholder="No Item" ReadOnly="true" ID="txtstorage2" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4" runat="server" />
                                                <asp:TextBox placeholder="No Item" ReadOnly="true" ID="txtstorage3" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4" runat="server" />
                                                <asp:TextBox placeholder="No Item" ReadOnly="true" ID="txtstorage4" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4"  runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2 mt-2" Text="Power Supply Unit(PSU): " runat="server" />
                                            <div class="form-group">
                                                <asp:TextBox placeholder="No Item" ReadOnly="true" ID="txtpsu" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " runat="server" />
                                            </div>
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2 mt-2" Text="Motherboard: " runat="server" />
                                            <div class="form-group">
                                                <asp:TextBox ReadOnly="true" ID="txtmboard" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " runat="server" />
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2 mt-2" Text="Processor:" runat="server" />
                                            <div class=" form-group ">
                                                <asp:TextBox  ReadOnly="true" ID="txtprocr" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " runat="server" />
                                            </div>
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2 mt-2" Text="Graphics Card:" runat="server" />
                                            <div class=" form-group ">
                                                <asp:TextBox placeholder="No Item" ReadOnly="true" ID="txtgpu" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                <h3 class="m-3 font-weight-normal text-black-50">Peripherals</h3>
                                <div style="border: 2px dashed" class="col-lg-12 border-gray-500 p-3 pb-3 mb-3">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Monitor: " runat="server" />
                                            <div class="form-group">
                                                <asp:TextBox placeholder="No Item" ReadOnly="true" ID="txtmonitor" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Mouse:" runat="server" />
                                            <div class="form-group">
                                                <asp:TextBox placeholder="No Item" ReadOnly="true" ID="txtmouse" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2 mt-2" Text="Keyboard:" runat="server" />
                                            <div class=" form-group ">
                                                <asp:TextBox placeholder="No Item" ReadOnly="true" ID="txtkeyboard" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2 mt-2" Text="Printer:" runat="server" />
                                            <div class=" form-group ">
                                                <asp:TextBox placeholder="No Item" ReadOnly="true" ID="txtprinter" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--<hr style="border: 2px solid gray"/>--%>
                        </div>
                        <div class="card-footer bg-white border-0">
                            <asp:Label ID="lbldate" Text="" runat="server" />
                            <asp:Label ID="lblfakeimg" Text="" Visible="false" runat="server" />
                            <asp:Label ID="lblid" Visible="false" Text="" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
              </div>
        </section>
</asp:Content>

