<%@ Page Title="" Language="C#" MasterPageFile="~/ClientPage.master" AutoEventWireup="true" CodeFile="Inventory.aspx.cs" Inherits="Department_PVO_Inventory" %>
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
        <div class="container-fluid">
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h2 style="margin-left: 1em; margin-top: 1em;" class="text-gray-700 mb-0">Inventory</h2>
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
                            <div class="card mb-0">
                            <div class="card-body bg-light">
                                <div class="table-responsive ">
                                    <div class="example" style="height: 420px; overflow-x: auto;">
                                        <asp:GridView Width="100%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="StickyHeader text-center" GridLines="Horizontal" BorderStyle="None" ID="grv" CssClass="table table-hover table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="id">
                                            <Columns>
                                                   <asp:BoundField DataField="FullName" HeaderText="FullName" SortExpression="FullName" HeaderStyle-Width="200px" ItemStyle-Width="200px" />
                                                 <asp:BoundField DataField="PCNumber" HeaderText="PCNumber" SortExpression="PCNumber" HeaderStyle-Width="200px" ItemStyle-Width="200px" />
                                                 <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" HeaderStyle-Width="200px" ItemStyle-Width="200px" />
                                                 <asp:BoundField DataField="Processor" HeaderText="Processor" SortExpression="Processor" HeaderStyle-Width="200px" ItemStyle-Width="200px" />
                                                 <asp:BoundField DataField="RAM" HeaderText="RAM" SortExpression="RAM" HeaderStyle-Width="200px" ItemStyle-Width="200px" />
                                                 <asp:BoundField DataField="RAM2" HeaderText="RAM2" SortExpression="RAM2" HeaderStyle-Width="200px" ItemStyle-Width="200px" />
                                                 <asp:BoundField DataField="Storage" HeaderText="Storage" SortExpression="Storage" HeaderStyle-Width="200px" ItemStyle-Width="200px" />
                                                 <asp:BoundField DataField="Storage2" HeaderText="Storage2" SortExpression="Storage2" HeaderStyle-Width="200px" ItemStyle-Width="200px" />
                                                 <asp:BoundField DataField="Storage3" HeaderText="Storage3" SortExpression="Storage3" HeaderStyle-Width="200px" ItemStyle-Width="200px" />
                                                 <asp:BoundField DataField="Storage4" HeaderText="Storage4" SortExpression="Storage4" HeaderStyle-Width="200px" ItemStyle-Width="200px" />
                                                 <asp:BoundField DataField="GraphicCard" HeaderText="GraphicCard" SortExpression="GraphicCard" HeaderStyle-Width="200px" ItemStyle-Width="200px" />
                                                 <asp:BoundField DataField="PSU" HeaderText="PSU" SortExpression="PSU" HeaderStyle-Width="200px" ItemStyle-Width="200px" />
                                                 <asp:BoundField DataField="Motherboard" HeaderText="Mother_Board" SortExpression="Motherboard" HeaderStyle-Width="200px" ItemStyle-Width="200px"  />
                                                 <asp:BoundField DataField="Monitor" HeaderText="Monitor" SortExpression="Monitor" HeaderStyle-Width="200px" ItemStyle-Width="200px" />
                                                 <asp:BoundField DataField="Mouse" HeaderText="Mouse" SortExpression="Mouse"  HeaderStyle-Width="200px" ItemStyle-Width="200px"/>
                                                 <asp:BoundField DataField="Keyboard" HeaderText="Keyboard" SortExpression="Keyboard" HeaderStyle-Width="200px" ItemStyle-Width="200px" />
                                                 <asp:BoundField DataField="Printer" HeaderText="Printer" SortExpression="Printer" HeaderStyle-Width="200px" ItemStyle-Width="200px" />
                                                 <asp:BoundField DataField="DateTime" HeaderText="DateTime" SortExpression="DateTime" HeaderStyle-Width="200px" ItemStyle-Width="200px" />
                                            </Columns>

                                            <HeaderStyle CssClass="StickyHeader" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MovNETConnectionString8 %>" SelectCommand="SELECT * FROM [PVOAllInventory]"></asp:SqlDataSource>
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
       
    </form>
</asp:Content>

