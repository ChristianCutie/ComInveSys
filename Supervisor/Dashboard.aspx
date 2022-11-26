<%@ Page Title="" Language="C#" MasterPageFile="~/Supervisor.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Supervisor_Dashboard" %>
<%@ MasterType VirtualPath="~/Supervisor.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:ScriptManager runat="server" />
    <form style="margin-left: 2em; background-color: white;" id="form1" action="/" method="post">
        <style type="text/css">
            .col-lg-6 {
                width: 10%;
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
        <link href="../../css/bootstrap.css" rel="stylesheet" />
        <!-- Favicon-->
        <!-- Page Header-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
            integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
         <div class="d-sm-flex align-items-center justify-content-between mb-4">
             <h2 style="margin-left: 1em; margin-top: 1em;" class="text-gray-700 font-weight-normal mb-0">Dashboard</h2>
         </div>
         <div class="container-fluid">
             <div class="row mt-4">
                 <!-- Earnings (Monthly) Card Example -->
                 <div class="col-xl-3 col-md-6 mb-4">
                     <div class="card bg-light border-left-info shadow py-2 rounded">
                         <div class="card-body">
                             <div class="row no-gutters align-items-center">
                                 <div class="col mr-2">
                                     <asp:Label CssClass="text-xs font-weight-bold text-info text-uppercase" Text="Approved Accounts" runat="server" />
                                     <br />
                                     <asp:Label ID="ttlapprove" CssClass="h3 mb-0 font-weight-bold text-gray-700" Text="" runat="server" />
                                 </div>
                                 <div class="col-auto">
                                     <i class="fas fa-circle-user fa-2x text-gray-300"></i>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
                 <div class="col-xl-3 col-md-6 mb-4">
                     <div class="card bg-light border-left-warning shadow py-2 rounded">
                         <div class="card-body">
                             <div class="row no-gutters align-items-center">
                                 <div class="col mr-2">
                                     <asp:Label CssClass="text-xs font-weight-bold text-warning text-uppercase " Text="Pending Accounts" runat="server" />
                                     <br />
                                     <asp:Label ID="lblpendingacc" CssClass="h3 mb-0 font-weight-bold text-gray-700" Text="" runat="server" />
                                 </div>
                                 <div class="col-auto">
                                     <i class="fas fa-comments fa-2x text-gray-300"></i>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
                <div class="col-xl-3 col-md-6 mb-4">
                     <div class="card bg-light border-left-success shadow py-2 rounded">
                         <div class="card-body">
                             <div class="row no-gutters align-items-center">
                                 <div class="col mr-2">
                                     <asp:Label CssClass="text-xs font-weight-bold text-success text-uppercase" Text="declined account" runat="server" />
                                     <br />
                                     <asp:Label ID="Label2" CssClass="h3 mb-0 font-weight-bold text-gray-700" Text="31" runat="server" />
                                 </div>
                                 <div class="col-auto">
                                     <i class="fas fa-user-xmark fa-2x text-gray-300"></i>
                                 </div>
                             </div> 
                         </div>
                     </div>
                 </div>
                  <div class="col-xl-3 col-md-6 mb-4">
                     <div class="card bg-light border-left-primary shadow py-2 rounded">
                         <div class="card-body">
                             <div class="row no-gutters align-items-center">
                                 <div class="col mr-2">
                                     <asp:Label CssClass="text-xs font-weight-bold text-primary text-uppercase " Text="Total Defective" runat="server" />
                                     <br />
                                     <asp:Label ID="Label3" CssClass="h3 mb-0 font-weight-bold text-gray-700" Text="31" runat="server" />
                                 </div>
                                 <div class="col-auto">
                                     <i class="fas fa-gear fa-2x text-gray-300"></i>
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
                                     <asp:Label CssClass="text-xs font-weight-bold text-info text-uppercase" Text="Request Repair" runat="server" />
                                     <br />
                                     <asp:Label ID="lblongoing" CssClass="h3 mb-0 font-weight-bold text-gray-700" Text="32" runat="server" />
                                 </div>
                                 <div class="col-auto">
                                     <i class="fas fa-comment-dots fa-2x text-gray-300"></i>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
                 <div class="col-xl-3 col-md-6 mb-4">
                     <div class="card bg-light border-left-warning shadow py-2 rounded">
                         <div class="card-body">
                             <div class="row no-gutters align-items-center">
                                 <div class="col mr-2">
                                     <asp:Label CssClass="text-xs font-weight-bold text-warning text-uppercase " Text="On Going Repair" runat="server" />
                                     <br />
                                     <asp:Label ID="Label5" CssClass="h3 mb-0 font-weight-bold text-gray-700" Text="10" runat="server" />
                                 </div>
                                 <div class="col-auto">
                                     <i class="fas fa-clock-rotate-left fa-2x text-gray-300"></i>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
                <div class="col-xl-3 col-md-6 mb-4">
                     <div class="card bg-light border-left-success shadow py-2 rounded">
                         <div class="card-body">
                             <div class="row no-gutters align-items-center">
                                 <div class="col mr-2">
                                     <asp:Label CssClass="text-xs font-weight-bold text-success text-uppercase" Text="Total Repaired" runat="server" />
                                     <br />
                                     <asp:Label ID="Label6" CssClass="h3 mb-0 font-weight-bold text-gray-700" Text="31" runat="server" />
                                 </div>
                                 <div class="col-auto">
                                     <i class="fas fa-wrench fa-2x text-gray-300"></i>
                                 </div>
                             </div> 
                         </div>
                     </div>
                 </div>
                  <div class="col-xl-3 col-md-6 mb-4">
                     <div class="card bg-light border-left-primary shadow py-2 rounded">
                         <div class="card-body">
                             <div class="row no-gutters align-items-center">
                                 <div class="col mr-2">
                                     <asp:Label CssClass="text-xs font-weight-bold text-primary text-uppercase " Text="Total Defective" runat="server" />
                                     <br />
                                     <asp:Label ID="Label7" CssClass="h3 mb-0 font-weight-bold text-gray-700" Text="31" runat="server" />
                                 </div>
                                 <div class="col-auto">
                                     <i class="fas fa-gear fa-2x text-gray-300"></i>
                                 </div>
                             </div> 
                         </div>
                     </div>
                 </div>

             </div>
         </div>
        <section class="pt-0">
            <div class="container-fluid ">
                <div class="row">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-check">
                                    <%-- <asp:RadioButton Text="View All Accounts" ID="viewall" runat="server" />--%>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-check">
                                    <%--<asp:RadioButton Text="View All Accounts" ID="viewpending" runat="server" />--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <ajaxToolkit:AutoCompleteExtender ServiceMethod="GetSearch" MinimumPrefixLength="1" CompletionInterval="10"
                EnableCaching="false" CompletionSetCount="10" TargetControlID="txtsearch" ID="AutoCompleteExtender1"
                runat="server" FirstRowSelected="false">
            </ajaxToolkit:AutoCompleteExtender>
            <div class="container-fluid">
                <div class="row gy-4">
                    <div class="col-lg-12">
                        <div class="card shadow mb-4">
                           <div style="background-color: white;" class="card-header py-3">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h3 class="m-0 font-weight-normal text-black-50">Login History</h3>
                                    </div>
                                    <div class="col-md-6">
                                        <div class=" ms-2 d-flex w-50 float-end">
                                            <asp:TextBox Style="background-color: #373737" CssClass="form-control bg-light small border-0 " placeholder="Search" runat="server" ID="txtsearch" />
                                            <asp:LinkButton runat="server" CssClass="btn btn-secondary fa-magnifying-glass fa-solid p-2 w-auto " ID="btnsearch" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body bg-light">
                                <div class="table-responsive ">
                                    <div class="example" style="height: 420px; overflow-x: auto;">
                                        <asp:GridView style="text-align: center;" Width="100%" HeaderStyle-CssClass="StickyHeader text-center" BorderStyle="None" ID="grv" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="ID">
                                            <Columns>
                                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                                                <asp:BoundField DataField="MiddleName" HeaderText="MiddleName" SortExpression="MiddleName" />
                                                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                                                <asp:BoundField DataField="PhoneNhumber" HeaderText="PhoneNhumber" SortExpression="PhoneNhumber" />
                                                <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                                                <asp:BoundField DataField="UserType" HeaderText="UserType" SortExpression="UserType" />
                                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                                                <asp:HyperLinkField ControlStyle-ForeColor="Red" Text="Manage"  DataNavigateUrlFields="ID" DataNavigateUrlFormatString="Manage.aspx?ID={0}" />
                                            </Columns>
                                            <HeaderStyle CssClass="StickyHeader" /> 
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
             <div class="container-fluid ">
                <div class="row">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-check">
                                    <%-- <asp:RadioButton Text="View All Accounts" ID="viewall" runat="server" />--%>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-check">
                                    <%--<asp:RadioButton Text="View All Accounts" ID="viewpending" runat="server" />--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <ajaxToolkit:AutoCompleteExtender ServiceMethod="GetSearch" MinimumPrefixLength="1" CompletionInterval="10"
                EnableCaching="false" CompletionSetCount="10" TargetControlID="txtsearch" ID="AutoCompleteExtender2"
                runat="server" FirstRowSelected="false">
            </ajaxToolkit:AutoCompleteExtender>
            <div class="container-fluid">
                <div class="row gy-4">
                    <div class="col-lg-6">
                        <div class="card shadow mb-4">
                           <div style="background-color: white;" class="card-header py-3">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h3 class="m-0 font-weight-normal text-black-50">Department</h3>
                                    </div>
                                    <div class="col-md-6">
                                        <div class=" ms-2 d-flex w-50 float-end">
                                            <asp:TextBox Style="background-color: #373737" CssClass="form-control bg-light small border-0 " placeholder="Search" runat="server" ID="TextBox1" />
                                            <asp:LinkButton runat="server" CssClass="btn btn-secondary fa-magnifying-glass fa-solid p-2 w-auto " ID="LinkButton1" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body bg-light">
                                <div class="table-responsive ">
                                    <div class="example" style="height: 420px; overflow-x: auto;">
                                        <asp:Repeater ID="rptdepartment" runat="server">
                                            <HeaderTemplate>
                                            <table class="table table-hover" id="example"> 
                                                <thead>
                                                    <tr>
                                                        <th>Department</th>
                                                    </tr>
                                                </thead>
                                            </HeaderTemplate>
                                                <ItemTemplate>
                                                <tr>
                                                    <td><%#Eval("FirstName") %></td>
                                                    <td class="text-end"><a href="Messages.aspx?FirstName=<%#Eval("FirstName") %>">Message</a></td>
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                            </table>
                                            
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card shadow mb-4">
                           <div style="background-color: white;" class="card-header py-3">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h3 class="m-0 font-weight-normal text-black-50">Release History</h3>
                                    </div>
                                    <div class="col-md-6">
                                        <div class=" ms-2 d-flex w-50 float-end">
                                            <asp:TextBox Style="background-color: #373737" CssClass="form-control bg-light small border-0 " placeholder="Search" runat="server" ID="TextBox2" />
                                            <asp:LinkButton runat="server" CssClass="btn btn-secondary fa-magnifying-glass fa-solid p-2 w-auto " ID="LinkButton2" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body bg-light">
                                <div class="table-responsive ">
                                    <div class="example" style="height: 420px; overflow-x: auto;">
                                        <asp:GridView style="text-align: center;" Width="100%" HeaderStyle-CssClass="StickyHeader text-center" BorderStyle="None" ID="GridView2" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="ID">
                                            <Columns>
                                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                                                <asp:BoundField DataField="MiddleName" HeaderText="MiddleName" SortExpression="MiddleName" />
                                                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                                                <asp:BoundField DataField="PhoneNhumber" HeaderText="PhoneNhumber" SortExpression="PhoneNhumber" />
                                                <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                                                <asp:BoundField DataField="UserType" HeaderText="UserType" SortExpression="UserType" />
                                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                                                <asp:HyperLinkField ControlStyle-ForeColor="Red" Text="Manage"  DataNavigateUrlFields="ID" DataNavigateUrlFormatString="Manage.aspx?ID={0}" />
                                            </Columns>
                                            <HeaderStyle CssClass="StickyHeader" />
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
         <asp:GridView Visible="false" ID="grvappacc" runat="server"></asp:GridView>
         <asp:GridView Visible="false" ID="grvpendingacc" runat="server"></asp:GridView>
         </form>
        <!-- Favicon-->
</asp:Content>

