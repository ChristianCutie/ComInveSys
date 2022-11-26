<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPITO.master" AutoEventWireup="true" CodeFile="pvo_request_from_client.aspx.cs" Inherits="Admin_Admin_PITO_1_PVORequestAdminPITO" %>
<%@ MasterType VirtualPath="~/AdminPITO.master" %>
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
            }
        </style>
         <link rel="stylesheet" href="../../../css/custom.css" />
        <!-- Custom stylesheet - for your changes-->
        <link rel="stylesheet" href="../../../css/style.default.css" />
        <!-- Favicon-->
        <!-- Page Header-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
            integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6">
                <h2 style="margin-left: 1em; margin-top: 1em;" class="text-gray-700 mb-0">Request PC</h2>
                </div>
                <div class="col-lg-6">
                    <h4 class="float-end mt-md-4">Provincial Veterinary Office</h4>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row mt-4">
                <!-- Earnings (Monthly) Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card bg-light border-left-success shadow py-2 rounded">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <asp:Label CssClass="text-xs font-weight-bold text-success text-uppercase" Text="Available Computer" runat="server" />
                                    <br />
                                    <asp:Label ID="ttlavail" CssClass="h3 mb-0 font-weight-bold text-gray-700" Text="" runat="server" />
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-circle-user fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> 
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card bg-light border-left-info shadow py-2 rounded">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <asp:Label CssClass="text-xs font-weight-bold text-info text-uppercase" Text="Total Computer" runat="server" />
                                    <br />
                                    <asp:Label ID="ttltolcom" CssClass="h3 mb-0 font-weight-bold text-gray-700" Text="" runat="server" />
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-circle-user fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:Repeater ID="rptdepartment" runat="server">
                <HeaderTemplate>
                    <table>
                        <thead> 
                            <tr>
                                <th hidden="hidden">Department</th>
                            </tr>
                        </thead>    
                </HeaderTemplate>
                <ItemTemplate>  
                    <tr>
                        <td hidden="hidden"><%#Eval("Department") %></td>
                        <td class="text-end"><a class="btn btn-info mb-3 me-3" href="../Messages.aspx?FirstName=<%#Eval("FirstName") %>">Chat</a></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
                
            </div>
        </div>
        <asp:GridView Visible="false" ID="grvavail" runat="server"></asp:GridView>
        <asp:GridView Visible="false" ID="grvtotalcomputer" runat="server"></asp:GridView>
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
                                        <h3 class="m-0 font-weight-normal text-black-50">Available Computer</h3>
                                       
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
                                                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" InsertVisible="False" ReadOnly="True" />
                                                <asp:BoundField DataField="Processor" HeaderText="Processor" SortExpression="Processor" />
                                                <asp:BoundField DataField="RAM" HeaderText="RAM" SortExpression="RAM" />
                                                <asp:BoundField DataField="RAM2" HeaderText="RAM2" SortExpression="RAM2" />
                                                <asp:BoundField DataField="Storage" HeaderText="Storage" SortExpression="Storage" />
                                                <asp:BoundField DataField="Storage2" HeaderText="Storage2" SortExpression="Storage2" />
                                                <asp:BoundField DataField="Storage3" HeaderText="Storage3" SortExpression="Storage3" />
                                                <asp:BoundField DataField="Storage4" HeaderText="Storage4" SortExpression="Storage4" />
                                                <asp:BoundField DataField="GraphicCard" HeaderText="Graphics_Card" SortExpression="GraphicCard" />
                                                <asp:BoundField DataField="PSU" HeaderText="PSU" SortExpression="PSU" />
                                                <asp:BoundField DataField="Motherboard" HeaderText="Mother_Board" SortExpression="Motherboard" />
                                                <asp:BoundField DataField="Monitor" HeaderText="Monitor" SortExpression="Monitor" />
                                                <asp:BoundField DataField="Mouse" HeaderText="Mouse" SortExpression="Mouse" />
                                                <asp:BoundField DataField="Keyboard" HeaderText="Keyboard" SortExpression="Keyboard" />
                                                <asp:BoundField DataField="Printer" HeaderText="Printer" SortExpression="Printer" />
                                                <asp:BoundField DataField="DateTime" HeaderText="Date_Time" SortExpression="DateTime" />
                                                <asp:BoundField DataField="PCNumber" HeaderText="PC_Number" SortExpression="PCNumber" />
                                                <asp:HyperLinkField Text="Distribute" ItemStyle-ForeColor="Green" DataNavigateUrlFields="id" DataNavigateUrlFormatString="distribute_to_client.aspx?id={0}"/>
                                            </Columns>
                                            <HeaderStyle CssClass="StickyHeader" />
                                        </asp:GridView>
                                            </div>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MovNETConnectionString7 %>" SelectCommand="SELECT * FROM [inventoryitem]"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class=" card-footer bg-white border-0">
                              
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="pt-0">
            <ajaxToolkit:AutoCompleteExtender  ServiceMethod="GetSearch" MinimumPrefixLength="1" CompletionInterval="10"
                EnableCaching="false" CompletionSetCount="10" TargetControlID="txtsearch" ID="AutoCompleteExtender2"
                runat="server" FirstRowSelected="false">
            </ajaxToolkit:AutoCompleteExtender>
            <div class="container-fluid">
                <div class="row gy-4">
                    <div class="col-lg-12">
                        <div id="Div1" runat="server" class="card shadow mb-4">
                            <div style="background-color: white;" class="card-header py-3">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h3 class="m-0 font-weight-normal text-black-50">Computer Inventory List</h3>
                                    </div>
                                    <div class="col-md-6">
                                        <div class=" ms-2 d-flex w-50 float-end">
                                            <asp:TextBox Style="background-color: #373737" CssClass="form-control bg-light small border-0 " placeholder="Search" runat="server" ID="TextBox1" />
                                            <asp:LinkButton runat="server" CssClass="btn btn-secondary fa-magnifying-glass fa-solid p-2 w-auto " ID="LinkButton1"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body bg-light">
                                <div class="table-responsive ">
                                    <div class="example" style="height: 420px; overflow-x: auto;">  
                                        <asp:GridView Width="100%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="StickyHeader text-center" GridLines="Horizontal" BorderStyle="None" ID="GridView1" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="id">
                                            <Columns>
                                                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" InsertVisible="False" ReadOnly="True" />
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
                                                <asp:BoundField DataField="DateTime" HeaderText="DateTime" SortExpression="DateTime" />
                                                <asp:BoundField DataField="FullName" HeaderText="FullName" SortExpression="FullName" />
                                                <asp:BoundField DataField="PCNumber" HeaderText="PCNumber" SortExpression="PCNumber" />
                                                <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                                                <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                                            </Columns>

                                            <HeaderStyle CssClass="StickyHeader" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MovNETConnectionString9 %>" SelectCommand="SELECT * FROM [PVOAllInventory]"></asp:SqlDataSource>
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
     </form>
</asp:Content>

