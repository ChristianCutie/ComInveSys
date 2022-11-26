<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPITO2.master" AutoEventWireup="true" CodeFile="InventoryItem.aspx.cs" Inherits="Admin_Admin_PITO_2_InventoryItem" %>
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
                <h2 style="margin-left: 1em; margin-top: 1em;" class="text-gray-700 mb-0">Inventory</h2>
                <div id="hidebtn" runat="server">
                    <asp:LinkButton ID="btnAdd" runat="server" CssClass="d-none d-sm-inline-block btn btn-sm btn-secondary shadow-sm mt-5">
               <small class="fa fa-plus text-white"> Add New Item</small></asp:LinkButton>
                </div>
                <div id="cancelbtn" visible="false" runat="server">
                    <asp:LinkButton ID="cancel" runat="server" CssClass="d-none d-sm-inline-block btn btn-sm btn-secondary shadow-sm mt-5">
               <small class="fa fa-arrow-circle-left text-white"> Cancel</small></asp:LinkButton>
                </div>
            </div>
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
                                        <h3 class="m-0 font-weight-normal text-black-50">Inventory</h3>
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
                                        <asp:GridView Width="100%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="StickyHeader text-center" GridLines="Horizontal" BorderStyle="None" ID="grv" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="id">
                                            <Columns>
                                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                                <asp:BoundField DataField="Processor" HeaderText="Processor" SortExpression="Processor" />
                                                <asp:BoundField DataField="RAM" HeaderText="RAM" SortExpression="RAM" />
                                                <asp:BoundField DataField="RAM2" HeaderText="RAM2" SortExpression="RAM2" />
                                                <asp:BoundField DataField="Storage" HeaderText="Storage" SortExpression="Storage" />
                                                <asp:BoundField DataField="Storage2" HeaderText="Storage2" SortExpression="Storage2" />
                                                <asp:BoundField DataField="Storage3" HeaderText="Storage3" SortExpression="Storage3" />
                                                <asp:BoundField DataField="Storage4" HeaderText="Storage4" SortExpression="Storage4" />
                                                <asp:BoundField DataField="GraphicCard" HeaderText="GraphicCard" SortExpression="GraphicCard" />
                                                <asp:BoundField DataField="PSU" HeaderText="PSU" SortExpression="PSU" />
                                                <asp:BoundField DataField="Motherboard" HeaderText="Motherboard" SortExpression="Motherboard" />
                                                <asp:BoundField DataField="Monitor" HeaderText="Monitor" SortExpression="Monitor" />
                                                <asp:BoundField DataField="Mouse" HeaderText="Mouse" SortExpression="Mouse" />
                                                <asp:BoundField DataField="Keyboard" HeaderText="Keyboard" SortExpression="Keyboard" />
                                                <asp:BoundField DataField="Printer" HeaderText="Printer" SortExpression="Printer" />
                                                <asp:BoundField DataField="PCNumber" HeaderText="PC Number" SortExpression="PCNumber" />
                                                <asp:BoundField DataField="DateTime" HeaderText="DateTime" SortExpression="DateTime" />
                                            </Columns>

                                            <HeaderStyle CssClass="StickyHeader" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="sasdasd" runat="server" ConnectionString="<%$ ConnectionStrings:MovNETCo %>" SelectCommand="SELECT [id], [Processor], [RAM], [RAM2], [Storage], [Storage2], [Storage3], [Storage4], [GraphicCard], [PSU], [Motherboard], [Monitor], [Mouse], [Keyboard], [Printer], [DateTime] FROM [inventoryitem]"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                            <div class=" card-footer bg-white border-0">
                                <asp:Label Visible="false" ID="lbldate" Text="" runat="server" />
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
                        <div id="tbl" runat="server" visible="false" class="card bg-light shadow">
                            <div style="background-color: white" class="card-header">
                                <h3 class="m-0 font-weight-normal text-black-50">Inventory Item</h3>
                            </div>
                            <div class="card-body">
                                <h3 class="m-3 font-weight-normal text-black-50">User Information</h3>
                                <div style="border: 2px dashed" class="col-lg-12 border-gray-500 p-3 pb-3 mb-3">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Fulln Name " runat="server" />
                                            <div class="form-group">
                                                <asp:TextBox ID="TextBox7" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " placeholder="Full Name..." runat="server" />
                                                <small class="form-text mb-3"><i class="fa fa-exclamation-circle"></i> Please Complete the detail requirements</small>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="User ID " runat="server" />
                                            <div class="form-group">
                                                <asp:TextBox ID="TextBox1" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " placeholder="User ID..." runat="server" />
                                                <small class="form-text mb-3"><i class="fa fa-exclamation-circle"></i> Please Complete the detail requirements</small>
                                            </div>
                                        </div>
                                        
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2 mt-2" Text="Department:" runat="server" />
                                            <div class=" form-group ">
                                                <asp:DropDownList Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 dropdown-toggle example" ID="DropDownList1" runat="server">
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
                                                <small class="form-text mb-3"><i class="fa fa-exclamation-circle"></i> Please Complete the detail requirements</small>
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
                                                <asp:TextBox ID="txtram" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " placeholder="Brand, Type, Capacity, Speed" runat="server" />
                                                <br />
                                                <div visible="false" id="txtram2and3" runat="server">
                                                    <asp:TextBox ID="txtram2" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4" placeholder="Brand, Type, Capacity, Speed (Optional 1): " runat="server" />
                                                </div>
                                                <small class="form-text mb-3"><i class="fa fa-exclamation-circle"></i> For more component click  add item button</small>
                                                <asp:LinkButton Style="margin-top: -.7em;" ToolTip="Add new item" CssClass=" mb-1 fas fa-plus-circle text-lg text-secondary float-end" ID="lnkram" runat="server"/>
                                            </div>
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2 mt-2" Text="Read Only Memory(ROM):" runat="server" />
                                            <div class=" form-group ">
                                                <asp:TextBox ID="txtstorage" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " placeholder="Brand, Type, Capacity, Speed" runat="server" />
                                                <br />
                                                <div visible="false" id="txtstoragevisible" runat="server">
                                                    <asp:TextBox ID="txtstorage2" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4" placeholder="Brand, Type, Capacity, Speed (Optional 2): " runat="server" />
                                                    <asp:TextBox ID="txtstorage3" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4" placeholder="Brand, Type, Capacity, Speed (Optional 3):: " runat="server" />
                                                    <asp:TextBox ID="txtstorage4" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 mb-4" placeholder="Brand, Type, Capacity, Speed (Optional 4): " runat="server" />

                                                    <small class="form-text mb-3"><i class="fa fa-exclamation-circle"></i>For more component click add item button</small>
                                                </div>
                                                <asp:LinkButton Style="margin-top: -.7em;" ToolTip="Add new item" CssClass=" mb-1 fas fa-plus-circle text-lg text-secondary float-end" ID="lnkstorage" runat="server"/>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2 mt-2" Text="Power Supply Unit(PSU): " runat="server" />
                                            <div class="form-group">
                                                <asp:TextBox ID="txtpsu" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " placeholder="Model, watts, voltage..." runat="server" />
                                                <small class="form-text mb-3"><i class="fa fa-exclamation-circle"></i> Please Complete the detail requirements</small>
                                            </div>
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2 mt-2" Text="Motherboard: " runat="server" />
                                            <div class="form-group">
                                                <asp:TextBox ID="txtmboard" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " placeholder="Type, Model, RAM Slot etc..." runat="server" />
                                                <small class="form-text mb-3"><i class="fa fa-exclamation-circle"></i> Please Complete the detail requirements</small>
                                            </div>
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2 mt-2" Text="Processor:" runat="server" />
                                            <div class=" form-group ">
                                                <asp:TextBox ID="txtprocr" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " placeholder="Model, Serial No. Speed..." runat="server" />
                                                <small class="form-text mb-3"><i class="fa fa-exclamation-circle"></i> Please Complete the detail requirements</small>
                                            </div>
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2 mt-2" Text="Graphic Card:" runat="server" />
                                            <div class=" form-group ">
                                                <asp:TextBox ID="txtgpu" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " placeholder="Model, Serial No. Speed..." runat="server" />
                                                <small class="form-text mb-3"><i class="fa fa-exclamation-circle"></i> Please Complete the detail requirements</small>
                                            </div>
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="PC Number: " runat="server" />
                                            <div class="form-group">
                                                <asp:TextBox ID="pcnum" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " placeholder="PC Number..." runat="server" />
                                                <small class="form-text mb-3"><i class="fa fa-exclamation-circle"></i> Please Complete the detail requirements</small>
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
                                                <asp:TextBox ID="txtmon" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " placeholder="Brand, size..." runat="server" />
                                                <small class="form-text mb-3"><i class="fa fa-exclamation-circle"></i> Please Complete the detail requirements</small>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2" Text="Mouse:" runat="server" />
                                            <div class="form-group">
                                                <asp:TextBox ID="txtmouse" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " placeholder="Brand..." runat="server" />
                                                <small class="form-text mb-3"><i class="fa fa-exclamation-circle"></i> Please Complete the detail requirements</small>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2 mt-2" Text="Keyboard:" runat="server" />
                                            <div class=" form-group ">
                                                <asp:TextBox ID="txtkeyb" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " placeholder="Brand..." runat="server" />
                                                <small class="form-text mb-3"><i class="fa fa-exclamation-circle"></i> Please Complete the detail requirements</small>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Label CssClass=" text-capitalize ml-2 mb-2 mt-2" Text="Printer (Optional):" runat="server" />
                                            <div class=" form-group ">
                                                <asp:TextBox ID="txtprint" Style="border-radius: 10px;" CssClass="form-control bg-white border-gray-500 " placeholder="Brand..." runat="server" />
                                                <small class="form-text mb-3"><i class="fa fa-exclamation-circle"></i> Please Complete the detail requirements</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- Peripherals--%>
                    <div class="card-footer bg-white border-0">
                        <asp:Label ID="lblmessage" Text="" runat="server" />
                        <asp:Button ID="btnsubmit" CssClass="btn btn-success float-end" Text="Submit" runat="server"/>
                    </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
         </form>
        <%--<script> 
            function disableBtn() {

                var firstname = document.getElementById('<% =fname.ClientID%>').value;
                var username = document.getElementById('<%=email.ClientID%>').value;
                var lastname = document.getElementById('<%=lname.ClientID%>').value;
                var image = document.getElementById('<%=img.ClientID%>').value;
                var middlename = document.getElementById('<%=mname.ClientID%>').value;
                var password = document.getElementById('<%=pass.ClientID%>').value;

              var subbtn = document.getElementById('<%=btnupdate.ClientID %>');
              var subsave = document.getElementById('<%=btnsave.ClientID %>');

                if (subsave.disabled == true) {

                    if (firstname.length == " " || lastname.length == " " || username.length == " " ||
                        image.length == " " || middlename.length == " " || password.length == " ") {

                        subbtn.disabled == true;
                    }
                    else {

                        subbtn.disabled = false;
                    }
                }


            }
        </script>--%>
        <script>
            function Hidepopup() {
                $find("mods").hide();
                return false;
            }
        </script>
       <%-- <script>
            function disablesave() {
                var disablebtnsave = document.getElementById('<%=btnsave.ClientID%>');
                disablebtnsave.disabled = true;
                
            }
        </script>--%>
        <script>$(document).ready(function () {
                $('#myTable').DataTable();
            });</script>
</asp:Content>

