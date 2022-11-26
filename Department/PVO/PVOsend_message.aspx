﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ClientPage.master" AutoEventWireup="true" CodeFile="PVOsend_message.aspx.cs" Inherits="Department_PVO_PVOsend_message" %>
<%@ MasterType VirtualPath="~/ClientPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <style type="text/css">
        .bg-blue{
            background-color:#496EDB;
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
            <h2 style="margin-left: 1em; margin-top: 1em;" class="text-gray-700 mb-0">Chat</h2>
        </div>
    </div>
    <section class="p-0">
        <div class="row" style="margin: 10px;">
            <div class="col-lg-7">
                <div class="bg-blue shadow" style="border:1px solid gray; height: 50px; border-top-right-radius:3px;border-top-left-radius:3px; ">
                        <h4 class=" mt-2 text-center text-white">Computer Tecnician 1</h4>
                    </div>
                  <div class="col-lg-12 bg-light shadow" style="height: 400px; border-style: solid; border-width: 1px; overflow: auto" id="msgarea"></div>
            </div>
            <div class="col-lg-5">
                <div class="col-lg-12">
                    <br />  
                    <div class="d-flex">
                        <input type="text" id="t1" style="border-radius: 10px;" placeholder="your message here..." class="form-control bg-white border-gray-500" />
                        <input class="btn btn-info" id="b1" type="button" value="Send" onclick="send_message();"/>
                    </div>      
                </div>
            </div>
        </div>

        <input type="text" id="username" value="<% Response.Write(Session["first"].ToString()); %>" style="display: none" />
        <script type="text/javascript">

            //this is for testing only

            var firstname = getUrlVars()["FirstName"];



            function send_message() {
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        var theDiv = document.getElementById("msgarea");
                        var x = document.createElement("P");
                        var t = document.createTextNode(document.getElementById("username").value + ": " + " " + document.getElementById("t1").value);
                        x.appendChild(t);
                        theDiv.appendChild(x);
                        var y = document.createElement("HR");
                        theDiv.appendChild(y);
                        theDiv.scrollTop = theDiv.scrollHeight;
                        document.getElementById("t1").value = "";
                    }
                };
                xmlhttp.open("GET", "PVO_send_message_from_admin.aspx?messages=" + document.getElementById("t1").value, true);
                xmlhttp.send();

            }

            //end here for testing


            function load_messages() {
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        document.getElementById("msgarea").innerHTML = xmlhttp.responseText;
                    }
                };
                xmlhttp.open("GET", "PVO_load_message.aspx", true);
                xmlhttp.send();
            }
            load_messages();


            function add_inside_new_message() {
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

                        if (xmlhttp.responseText != "0") {

                            var strArray = xmlhttp.responseText.split("||abcd||");

                            for (var i = 0; i < strArray.length; i++) {
                                var theDiv = document.getElementById("msgarea");
                                var x = document.createElement("P");
                                var t = document.createTextNode(strArray[i]);
                                x.appendChild(t);
                                theDiv.appendChild(x);
                                var y = document.createElement("HR");
                                theDiv.appendChild(y);
                                theDiv.scrollTop = theDiv.scrollHeight;
                            }
                        }

                    }
                };
                xmlhttp.open("GET", "PVO_load_new_message.aspx", true);
                xmlhttp.send();
            }

            setInterval(function () {
                add_inside_new_message();
            }, 10000);


            function getUrlVars() {
                var vars = {};
                var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function (m, key, value) {
                    vars[key] = value;
                });
                return vars;
            }



        </script>
    </section>
</asp:Content>

