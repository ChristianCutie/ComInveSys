<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPITO2.master" AutoEventWireup="true" CodeFile="Distribute.aspx.cs" Inherits="Admin_Admin_PITO_2_Distribute" %>
<%@ MasterType VirtualPath="~/AdminPITO2.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager runat="server" />
    <form style="margin-left: 2em; background-color: white;" id="form1" action="/" method="post">
        <link rel="stylesheet" href="css/custom.css" />
        <!-- Custom stylesheet - for your changes-->
        <link rel="stylesheet" href="css/style.default.css" />
        <!-- Favicon-->
        <!-- Page Header-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
            integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
        <div class="container-fluid">
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h2 style="margin-left: 1em; margin-top: 1em;" class="text-gray-700 mb-0">Distribution</h2>
            </div>
        </div>
        <section class="pt-0">
            <ajaxToolkit:AutoCompleteExtender ServiceMethod="GetSearch" MinimumPrefixLength="1" CompletionInterval="10"
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
                                        <h3 class="m-0 font-weight-normal text-black-50">Inventory to Release</h3>
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
                                        <asp:GridView Width="100%" HeaderStyle-CssClass="StickyHeader text-center" BorderStyle="None" ID="grv" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="id">
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
                                                <asp:HyperLinkField Text="Release" ControlStyle-CssClass="text-success" DataNavigateUrlFields="id" DataNavigateUrlFormatString="ViewDistribute.aspx?id={0}" />
                                            </Columns>
                                            <HeaderStyle CssClass="StickyHeader" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MovNETConnectionString5 %>" SelectCommand="SELECT * FROM [inventoryitem]"></asp:SqlDataSource>
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

