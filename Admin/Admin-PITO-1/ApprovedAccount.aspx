<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPITO.master" AutoEventWireup="true" CodeFile="ApprovedAccount.aspx.cs" Inherits="Default2" %>
<%@ MasterType VirtualPath="~/AdminPITO.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager2" runat="server">
        </asp:ScriptManager>
    <form style="margin-left: 2em; background-color: white;" id="form1" action="/" method="post">
        <style type="text/css">
            .col-md-3 {
                width: 23%;
                margin: 1%;
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
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
             <h2 style="margin-left: 1em; margin-top: 1em;" class="text-gray-700 font-weight-normal mb-0">Approved Accounts</h2>
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
                                        <h3 class="m-0 font-weight-normal text-black-50">Accounts</h3>
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
                                                 <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <asp:Label Text="Profile" runat="server" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <img width="40" src='/images/<%#Eval("Profile") %>' alt="" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                                                <asp:BoundField DataField="MiddleName" HeaderText="MiddleName" SortExpression="MiddleName" />
                                                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                                                <asp:BoundField DataField="UserType" HeaderText="UserType" SortExpression="UserType" />
                                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                                                <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                                                <asp:BoundField DataField="PhoneNhumber" HeaderText="PhoneNhumber" SortExpression="PhoneNhumber" />
                                            </Columns>
                                            <HeaderStyle CssClass="StickyHeader" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MovNETConnectionString4 %>" SelectCommand="SELECT * FROM [ApprovedAccounts]"></asp:SqlDataSource>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cont %>" SelectCommand="SELECT * FROM [PendingAccounts]"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="p-0">
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
                                                    <td><%#Eval("Departments") %></td>
                                                    <td><a href="PVOMessages.aspx?Departments=<%#Eval("Departments") %>">Message</a></td>
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                            </table>
                                            
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </div>
        </section>
        <%-- <script>
            function disableBtn(e) {
                var movementX = e.movementX ||
                    e.mozMovementX ||
                    e.webkitMovementX ||
                    0;

                var movementY = e.movementY ||
                    e.mozMovementY ||
                    e.webkitMovementY ||
                    0;

                x += movementX;
                y += movementY;

                var animation = requestAnimationFrame(disableBtn);

                tracker.innerHTML = "X position: " + x + ', Y position: ' + y;
            }
        </script>--%>
        <script>
            function Hidepopup() {
                $find("mods").hide();
                return false;
            }
        </script>
    </form>
</asp:Content>

