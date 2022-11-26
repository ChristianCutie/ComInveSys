<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sample.aspx.cs" Inherits="sample" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link rel="stylesheet" href="css/custom.css" />
        <!-- Custom stylesheet - for your changes-->
        <link rel="stylesheet" href="css/style.default.css" />
        <!-- Favicon-->
        <!-- Page Header-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
            integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <form runat="server" style="margin-left: 2em;" id="form1" action="/" method="post">
          <asp:ScriptManager ID="ScriptManager2" runat="server">
        </asp:ScriptManager>
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
                z-index: 1000;
               
            }
        </style>
        <!-- Custom stylesheet - for your changes-->
        <link rel="stylesheet" href="css/custom.css" />
        <link rel="stylesheet" href="css/style.default.css" />
        <!-- Favicon-->
        <link rel="shortcut icon" href="img/favicon.ico" />
        <!-- Page Header-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" 
        integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" 
        crossorigin="anonymous" referrerpolicy="no-referrer" />
        <div style="background-color: #373737;" class="py-4">
            <div class="container-fluid">
                <h2 class="h5 mb-0">Table</h2>
            </div>
        </div>
        <div class="py-2 ">
            <nav class="container-fluid" style="background: #2f2f2f" aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 py-3 px-0">
                    <li class="breadcrumb-item"><a href="Default2.aspx">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Table</li>
                </ol>
            </nav>
        </div>
        <section style="background: #2f2f2f" class="pt-0">
            <div class="container-fluid ">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card-body ms-2 d-flex w-50 float-end">
                            <asp:TextBox Style=" background-color: #373737" CssClass="form-control " runat="server" ID="txtsearch" />
                            <asp:LinkButton runat="server" CssClass="btn btn-secondary fa-magnifying-glass fa-solid p-2 w-auto" ID="btnsearch"/>
                        </div>
                    </div>
                </div>
            </div>
             <ajaxToolkit:AutoCompleteExtender ServiceMethod="GetSearch" MinimumPrefixLength="1" CompletionInterval="10"  
            EnableCaching="false" CompletionSetCount="10" TargetControlID="txtsearch" ID="AutoCompleteExtender1"  
            runat="server" FirstRowSelected="false">  
        </ajaxToolkit:AutoCompleteExtender>  
            <asp:UpdatePanel runat="server" ID="updatepanel">
                <ContentTemplate>
                    <div class="container-fluid">
                    <div class="row gy-4">
                        <div class="col-lg-12">
                            <div class="card mb-0">
                                <div style="background-color: #373737;" class="card-header">
                                     <h3 class="h4 mb-0">Table form</h3>
                                      <asp:LinkButton OnClick="btnAdd_Click" ID="btnAdd" runat="server" CssClass="fa fa-download btn btn-secondary float-end m-1"/>
                                    <asp:LinkButton Enabled="false" ID="lnkdelall" CssClass="fa fa-trash-arrow-up btn btn-danger float-end m-1" runat="server" OnClientClick="confirm('Are you sure want to delete?')" />
                                </div>
                    <div class="table-responsive ">
                        <div class="example" style="height: 450px; overflow-x:auto;">
                            <asp:GridView HeaderStyle-CssClass="StickyHeader" BackColor="#373737" BorderStyle="None" ID="grv" CssClass="table mb-0 table-striped table-hover" runat="server" AutoGenerateColumns="false" DataKeyNames="ID">
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                                    <asp:BoundField DataField="MiddleName" HeaderText="MiddleName" SortExpression="MiddleName" />
                                    <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:CheckBox AutoPostBack="true" ID="chkheader" Text="Select All" runat="server" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkitem" runat="server" Visible="false" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton CssClass="fa fa-pen-alt p-1 btn btn-success m-0" ID="lnkEdit" runat="server"></asp:LinkButton>
                                            <asp:LinkButton CssClass="fa fa-trash-can p-1 btn btn-danger m-0" ID="lnkdel" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:HyperLinkField ControlStyle-CssClass="fa fa-eye p-1 btn btn-primary m-0" DataNavigateUrlFields="ID" DataNavigateUrlFormatString="View.aspx?ID={0}" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MovNETConnectionString %>" SelectCommand="SELECT [FirstName], [MiddleName], [LastName], [Image], [UserName], [Password] FROM [Register]"></asp:SqlDataSource>
                        </div>
                        </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    <asp:Panel ID="panel" runat="server">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div style="background: #fff; border-bottom: 1px solid gray" class="modal-header">
                                <h5 class="modal-title" id="myModalLabel">Signin Modal</h5>
                                    </div>
                                <div style="background: #373737;" class="modal-body">
                                    <div class="row ">
                                        <div class="col-lg-12">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="mb-3 text-field">
                                                        <asp:TextBox onkeyup="disableBtn();" placeholder="First Name" ID="fname" runat="server" CssClass="custom-textbox" />
                                                        <asp:RequiredFieldValidator CssClass="text-danger form-text" EnableClientScript="false" ValidationGroup="grp1"
                                                            ErrorMessage="Required" ControlToValidate="fname" runat="server" />
                                                        <asp:Label ID="lblID" Text="" runat="server" Visible="false" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="mb-3 text-field">
                                                        <asp:TextBox onkeyup="disableBtn();" placeholder="Username" type="email" ID="uname" runat="server" CssClass="custom-textbox" />
                                                        <asp:RequiredFieldValidator CssClass="text-danger form-text" EnableClientScript="false" ValidationGroup="grp1" SetFocusOnError="true"
                                                            ErrorMessage="Required" ControlToValidate="uname" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="mb-3 text-field">
                                                        <asp:TextBox onkeyup="disableBtn();" placeholder="Midle Name" ID="mname" runat="server" CssClass="custom-textbox" />
                                                        <asp:RequiredFieldValidator CssClass="text-danger form-text" EnableClientScript="false" ValidationGroup="grp1" SetFocusOnError="true"
                                                            ErrorMessage="Required" ControlToValidate="mname" runat="server" />                                                       
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="mb-3 text-field">
                                                        <asp:TextBox onkeyup="disableBtn();" placeholder="fileupload" ID="img" runat="server" CssClass="custom-textbox" />
                                                        <asp:RequiredFieldValidator CssClass="text-danger form-text" EnableClientScript="false" ValidationGroup="grp1" SetFocusOnError="true"
                                                            ErrorMessage="Required" ControlToValidate="img" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="mb-3 text-field">
                                                        <asp:TextBox onkeyup="disableBtn();" placeholder="Last Name" ID="lname" runat="server" CssClass="custom-textbox" />
                                                        <asp:RequiredFieldValidator CssClass="text-danger form-text" EnableClientScript="false" ValidationGroup="grp1" SetFocusOnError="true"
                                                            ErrorMessage="Required" ControlToValidate="lname" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="mb-3 text-field">
                                                        <asp:TextBox onkeyup="disableBtn();" placeholder="Password" type="password" ID="pass" runat="server" CssClass="custom-textbox" />
                                                        <asp:RequiredFieldValidator CssClass="text-danger form-text" EnableClientScript="false" ValidationGroup="grp1" SetFocusOnError="true"
                                                            ErrorMessage="Required" ControlToValidate="pass" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <asp:Label Text="" runat="server" ID="lblerror" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div style="background: #373737; border-top: 1px solid gray" class="modal-footer">
                                    <asp:Button ID="btnsave" Text="Save" runat="server" ValidationGroup="grp1" onkeyup="disablesave()" OnClientClick="return Hidepopup();"/>
                                    <asp:Button ID="btnupdate" Text="Update" runat="server" Enabled="false" />
                                    <asp:Button ID="btncancel" Text="Cancel" runat="server" OnClientClick=" return Hidepopup()" />
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                    <asp:LinkButton ID="lnkFake" runat="server"></asp:LinkButton>
                    <ajaxToolkit:ModalPopupExtender ID="mods" runat="server" TargetControlID="lnkFake" PopupControlID="panel" DropShadow="false"
                        BackgroundCssClass="ModalPopupBG">
                    </ajaxToolkit:ModalPopupExtender>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="grv"/>
                    <asp:AsyncPostBackTrigger ControlID="btnsave"/>
                </Triggers>
            </asp:UpdatePanel>
            </section>
       <asp:TextBox ID="ff" Style="border-radius: 10px; width: 500px;" CssClass="form-control bg-white border-gray-500 " placeholder="Processor Model, Serial No. Speed" runat="server" />
           <asp:Panel  ID="pnlTextBoxes" runat="server"></asp:Panel>
             <asp:LinkButton ToolTip="Add new item" CssClass=" fa fa-plus-circle text-lg text-secondary ml-2 float-end" ID="linkaddtxt" runat="server" />
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

          function disableBtn() {

                var firstname = document.getElementById('<% =fname.ClientID%>').value;
                var username = document.getElementById('<%=uname.ClientID%>').value;
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
        </script>
        <script>
            function Hidepopup() {
                $find("mods").hide();
                return false;
            }
        </script>
        <script>
            function disablesave() {
                var disablebtnsave = document.getElementById('<%=btnsave.ClientID%>');
                disablebtnsave.disabled = true;
            }
        </script>
        </form>
</body>
</html>
