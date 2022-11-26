<%@ Page Title="" Language="C#" MasterPageFile="~/BPC.master" AutoEventWireup="true" CodeFile="Bulacan-Polytechnic-College.aspx.cs" Inherits="Department_BPC_Bulacan_Polytechnic_College" %>
<%@ MasterType VirtualPath="~/BPC.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form action="/" method="post">
         <link rel="stylesheet" href="css/custom.css" />
        <!-- Custom stylesheet - for your changes-->
        <link rel="stylesheet" href="css/style.default.css" />
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
                     <div class="card bg-light border-left-primary shadow py-2 rounded">
                         <div class="card-body">
                             <div class="row no-gutters align-items-center">
                                 <div class="col mr-2">
                                     <asp:Label CssClass="text-xs font-weight-bold text-primary text-uppercase " Text="Total Defective" runat="server" />
                                     <br />
                                     <asp:Label ID="Label1" CssClass="h3 mb-0 font-weight-bold text-gray-700" Text="10" runat="server" />
                                 </div>
                                 <div class="col-auto">
                                     <i class="fas fa-comments fa-2x text-gray-300"></i>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
                 <div class="col-lg-3 mb-4">
                     <div class="card bg-light border-left-warning shadow py-2 rounded">
                         <div class="card-body">
                             <div class="row no-gutters align-items-center">
                                 <div class="col mr-2">
                                     <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                         Total Pending Repair
                                     </div>
                                     <div class="h3 mb-0 font-weight-bold text-gray-700">18</div>
                                 </div>
                                 <div class="col-auto">
                                     <i class="fas fa-comments fa-2x text-gray-300"></i>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
                  <div class="col-lg-3 mb-4">
                     <div class="card bg-light border-left-info shadow py-2 rounded">
                         <div class="card-body">
                             <div class="row no-gutters align-items-center">
                                 <div class="col mr-2">
                                     <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                         Total of All computer
                                     </div>
                                     <div class="h3 mb-0 font-weight-bold text-gray-700">3</div>
                                 </div>
                                 <div class="col-auto">
                                     <i class="fas fa-comments fa-2x text-gray-300"></i>
                                 </div>
                             </div>
                         </div>
                     </div>
                       </div>
                      <div class="col-lg-3 mb-4">
                     <div class="card bg-light border-left-success shadow py-2 rounded">
                         <div class="card-body">
                             <div class="row no-gutters align-items-center">
                                 <div class="col mr-2">
                                     <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                         On Going Repair
                                     </div>
                                     <div class="h3 mb-0 font-weight-bold text-gray-700">3</div>
                                 </div>
                                 <div class="col-auto">
                                     <i class="fas fa-comments fa-2x text-gray-300"></i>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
              </div>
         </div>
        </form>
</asp:Content>

