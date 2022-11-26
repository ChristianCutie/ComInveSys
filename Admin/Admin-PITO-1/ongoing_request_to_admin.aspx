<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPITO.master" AutoEventWireup="true" CodeFile="ongoing_request_to_admin.aspx.cs" Inherits="Admin_PVOOnGoingRequestAdmin" %>
<%@ MasterType VirtualPath="~/AdminPITO.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
     <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js">
     </script>
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
              .StickyHeader{
                  background-color: white;
              }
            .StickyHeader th {
                position: sticky;
                top: 0;
                background-color: white;
            }
            .GridPager a, .GridPager span
    {
        display: block;
        height: 30px;
        width: 30px;
        margin-left: 5px;
        font-weight: bold;
        text-align: center;
        text-decoration: none;
    }
    .GridPager a
    {
        background-color: #f5f5f5;
        color: #969696;
        border: 1px solid #969696;
    }
    .GridPager span
    {
        background-color: #A1DCF2;
        color: #000;
        border: 1px solid #3AC0F2;
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
                <h2 style="margin-left: 1em; margin-top: 1em;" class="text-gray-700 mb-0">On Going Request</h2>
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
                                        <h3 class="m-0 font-weight-normal text-black-50">Client Status</h3>
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
                                    <div style="height: 420px; overflow-x: auto;">  
                                        <asp:GridView OnPageIndexChanging="grv_PageIndexChanging" AllowPaging="true" PageSize="5" PagerSettings-Mode="Numeric" Width="100%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center StickyHeader" GridLines="Horizontal" BorderStyle="None" ID="grv" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="ID">
                                            <PagerSettings FirstPageText="First" LastPageText="Last" PageButtonCount="5" Mode="Numeric" />
                                            <Columns>
                                                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" />
                                                <asp:BoundField DataField="FullName" HeaderText="FullName" SortExpression="FullName" />
                                                <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                                                <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                                                <asp:HyperLinkField Text="Manage" ItemStyle-ForeColor="LightGreen" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="manage_ongoing_request_to_client.aspx?ID={0}" />
                                            </Columns>
                                            <PagerStyle CssClass="GridPager" HorizontalAlign="Right" />
                                            <HeaderStyle CssClass="StickyHeader" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT * FROM [PVORequestAdmin]"></asp:SqlDataSource>
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
        <section>
            <table id="tableID">
                <tr>
                    <td></td>
                </tr>
            </table>
        </section>
     </form>
  <script>
      /* Initialization of datatable */
      $(document).ready(function () {
          $('#tableID').DataTable({});
      });
  </script>
</asp:Content>

