<%@ Page Title="" Language="C#" MasterPageFile="~/ClientPage.master" AutoEventWireup="true" CodeFile="Process.aspx.cs" Inherits="Department_PVO_Process" %>
<%@ MasterType VirtualPath="~/ClientPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager2" runat="server">
        </asp:ScriptManager>
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
         <div class="d-sm-flex align-items-center justify-content-between mb-4">
             <h2 style="margin-left: 1em; margin-top: 1em;" class="text-gray-700 font-weight-normal mb-0">Process history</h2>
         </div>
        <section class="pt-0">
            <ajaxToolkit:AutoCompleteExtender  ServiceMethod="GetSearch" MinimumPrefixLength="1" CompletionInterval="10"
                EnableCaching="false" CompletionSetCount="10" TargetControlID="txtsearch" ID="AutoCompleteExtender1"
                runat="server" FirstRowSelected="false">
            </ajaxToolkit:AutoCompleteExtender>
            <div class="container-fluid">
                <div class="row gy-4">
                    <div class="col-lg-12">
                        <div id="grid" runat="server" class="card shadow mb-4">
                            <div style="background-color: white;" class="card-header py-3">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h3 class="m-0 font-weight-normal text-black-50"></h3>
                                    </div>
                                    <div class="col-md-6">
                                        <div class=" ms-2 d-flex w-50 float-end">
                                            <asp:TextBox Style="background-color: #373737" CssClass="form-control bg-light small border-0 " placeholder="Search" runat="server" ID="txtsearch" />
                                            <asp:LinkButton runat="server" CssClass="btn btn-secondary fa-magnifying-glass fa-solid p-2 w-auto " ID="btnsearch"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body bg-light">
                                <div class="table-responsive ">
                                    <div class="example" style="height: 420px; overflow-x: auto;">  
                                        <asp:GridView Width="100%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="StickyHeader text-center" GridLines="Horizontal" BorderStyle="None" ID="grv" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="ID">
                                            <Columns>
                                                <asp:BoundField DataField="FullName" HeaderText="FullName" SortExpression="FullName" />
                                                <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                                                <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                                            </Columns>

                                            <HeaderStyle CssClass="StickyHeader" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MovNETConnectionSt %>" SelectCommand="SELECT * FROM [PVORequestAdmin]"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                            <div class=" card-footer bg-white border-0">
                              
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
       <section class="p-0">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div id="tbl" runat="server" class="card bg-light shadow">
                            <div style="background-color: white" class="card-header">
                                <h3 class="m-0 font-weight-normal text-black-50">Check Your Request</h3>
                            </div>
                            <div class="card-body">
                                <h3 class="m-3 font-weight-normal text-black-50">User Information</h3>
                                <div style="border: 2px dashed" class="col-lg-12 border-gray-500 p-3 pb-3 mb-3">
                                    <div class="row">
                                        <div class="col-lg-6">
                                             <div class="form-group">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Full Name: " runat="server" />
                                                <asp:Label ID="fullname" Text="" runat="server" />
                                            </div>
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2 mt-3" Text="User ID: " runat="server" />
                                            <div class="form-group">
                                                <asp:Label ID="uid" Text="" runat="server" />
                                            </div>
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="PC Number: " runat="server" />
                                            <div class="form-group">
                                                <asp:Label ID="pcnum" Text="" runat="server" />
                                            </div>
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Department: " runat="server" />
                                            <div class="form-group">
                                                <asp:Label ID="dept" Text="" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                            <asp:Label CssClass="text-capitalize ml-2 mb-3" Text="Date: " runat="server" />
                                                <asp:Label ID="date" Text="" runat="server" />
                                            </div>
                                            <div class="form-group">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Process: " runat="server" />
                                                <asp:Label ID="process" Text="" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <h3 class="m-3 font-weight-normal text-black-50">Components</h3>
                                <div style="border: 2px dashed" class="col-lg-12 border-gray-500 p-3 pb-3 mt-3">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-3" Text="Random Access Memory (RAM): " runat="server" />
                                            <div class="form-group mb-2">
                                                <asp:Label ID="txt" Text="RAM 1:" runat="server" CssClass="text-capitalize ml-2 mb-2 me-2" />
                                                <asp:Label ID="ram1" Text="" runat="server" />
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label1" Text="RAM 2:" runat="server" CssClass="text-capitalize ml-2 mb-2 me-2" />
                                                <asp:Label ID="ram2" Text="" runat="server" />
                                            </div>
                                            <hr />
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2 mt-2" Text="Read Only Memory(ROM):" runat="server" />
                                            <div class="form-group mb-2">
                                                <asp:Label ID="Label2" Text="ROM 1:" runat="server" CssClass="text-capitalize ml-2 mb-2 me-2" />
                                                <asp:Label ID="rom1" Text="" runat="server" />
                                            </div>
                                            <div class="form-group mb-2">
                                                <asp:Label ID="Label4" Text="ROM 2:" runat="server" CssClass="text-capitalize ml-2 mb-2 me-2" />
                                                <asp:Label ID="rom2" Text="" runat="server" />
                                            </div>
                                            <div class="form-group mb-2">
                                                <asp:Label ID="Label3" Text="ROM 3:" runat="server" CssClass="text-capitalize ml-2 mb-2 me-2" />
                                                <asp:Label ID="rom3" Text="" runat="server" />
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="Label6" Text="ROM 4:" runat="server" CssClass="text-capitalize ml-2 mb-2 me-2" />
                                                <asp:Label ID="rom4" Text="" runat="server" />
                                            </div>

                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2 mt-2" Text="Power Supply Unit(PSU): " runat="server" />
                                            <div class="form-group mb-2">
                                                <asp:Label ID="psu" Text="" runat="server" />
                                            </div>
                                            <hr />
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2 mt-2" Text="Motherboard: " runat="server" />
                                           <div class="form-group mb-2">
                                                <asp:Label ID="mboard" Text="" runat="server" />
                                            </div>
                                             <hr />
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2 mt-2" Text="Processor:" runat="server" />
                                            <div class="form-group mb-2">
                                                <asp:Label ID="procsr" Text="" runat="server" />
                                            </div>
                                             <hr />
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2 mt-2" Text="Graphic Card:" runat="server" />
                                            <div class="form-group mb-2">
                                                <asp:Label ID="gpu" Text="" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <h3 class="m-3 font-weight-normal text-black-50">Peripherals</h3>
                                <div style="border: 2px dashed" class="col-lg-12 border-gray-500 p-3 pb-3 mb-3">
                                    <div class="row">
                                        <div class="col-lg-6">
                                             <div class="form-group">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Monitor: " runat="server" />
                                                <asp:Label ID="mon" Text="" runat="server" />
                                            </div>
                                        </div>
                                       <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Mouse: " runat="server" />
                                            <div class="form-group">
                                                <asp:Label ID="mouse" Text="" runat="server" />
                                            </div>
                                        </div>
                                       <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Printer: " runat="server" />
                                            <div class="form-group">
                                                <asp:Label ID="printer" Text="" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Keyboard: " runat="server" />
                                            <div class="form-group">
                                                <asp:Label ID="kboard" Text="" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- Peripherals--%>
                    <div class="card-footer bg-white border-0">
                        <asp:Label ID="lblmessage" Text="" runat="server" />
                    </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        </form>
</asp:Content>

