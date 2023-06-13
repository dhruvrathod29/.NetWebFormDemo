<%@ Page Title="" Language="C#" MasterPageFile="~/Content/MasterPage.master" AutoEventWireup="true" CodeFile="LOC_StateAddEdit.aspx.cs" Inherits="AdminPanel_LOC_State_LOC_StateAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" Runat="Server">


     <style>
        h2 {
            position: relative;
            font-size: 14vw;
            color: #fff;
            -webkit-text-stroke: 0.09vw #000000;
            text-transform: uppercase;
        }

        h2::before {
            content: attr(data-text);
            position: absolute;
            top: 0;
            left: 0;
            width: 0;
            height: 100%;
            color: #000000;
            -webkit-text-stroke: 0vw #000000;
            border-right: 3px solid #000000;
            overflow: hidden;
            animation: animate 6s linear infinite;
        }

        @keyframes animate {
            0%,10%,100% {
                width: 0;
            }

            70%,90% {
                width: 22%;
            }
        }



        .btn.btn-a {
            text-decoration: none;
            background-color: #000000;
            color: #ffffff;
        }

        .btn.btn-a:hover {
            background-color: #2eca6a;
            color: #000000;
        }

        .btn.btn-b {
            text-decoration: none;
            background-color: #000000;
            color: #ffffff;
        }

        .btn.btn-b:hover {
            background-color: rgba(255,0,0, 1);
            color: #ffffff;
        }
    </style>

    <section class="intro-single">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-8">
                    <div class="title-single-box">
                        <h1 class="title-single">State Add Edit</h1>
                    </div>
                </div>
                <div class="col-md-12 col-lg-4">
                    <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="LOC_StateList.aspx"><i class="fa-regular fa-address-book"></i> State List</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">State Add Edit
                            </li>
                        </ol>
                    </nav>
                </div>
            </div>
            <hr />
            <br />
            <asp:Label runat="server" class="alert-success" style="color:#151414" ID="lblMessage" EnableViewState="false" />
        
            <br />
           
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <span style="color: #ff0000">*</span>
                    Country :-
                </div>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlCountryID" runat="server" class="form-control">
                       
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvCountry" runat="server" ErrorMessage="Please Select Country" ControlToValidate="ddlCountryID" Display="Dynamic" ForeColor="Red" InitialValue="-1"></asp:RequiredFieldValidator>
                    <%--<input type="text" placeholder="Enter Country Name" required asp-for="CountryName" class="form-control" />--%>
                    <%--<span asp-validation-for="CountryName" class="text-danger"></span>--%>
                </div>
                <div class="col-md-1">
                </div>

                <div class="col-md-2">
                    <span style="color: #ff0000">*</span>
                    State Name :-
                </div>
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="txtStateName" placeholder="Enter State Name" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvStateName" runat="server" ErrorMessage="Please Enter State Name" ControlToValidate="txtStateName" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <%--<input type="text" placeholder="Enter Country Code" required asp-for="CountryCode" class="form-control" />
                    <span asp-validation-for="CountryCode" class="text-danger"></span>--%>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-2">
                    <span style="color: #ff0000">*</span>
                    State Code :-
                </div>
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="txtStateCode" placeholder="Enter State Code" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvStateCode" runat="server" ErrorMessage="Please Enter State Code" ControlToValidate="txtStateCode" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            
                    <%--<input type="text" placeholder="Enter Country Name" required asp-for="CountryName" class="form-control" />--%>
                    <%--<span asp-validation-for="CountryName" class="text-danger"></span>--%>
                </div>
                <div class="col-md-1">
                </div>

               
            </div>
            <br />

            <div class="row">
                <div class="col-md-5">
                </div>
                <div class="col-md-1">
                    <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-a" OnClick="btnSave_Click" />
                    <%-- <input type="submit" value="Save" class="btn btn-a" />--%>
                </div>

                <div class="col-md-1">

                    <a class="btn btn-b" href="LOC_StateList.aspx" type="submit" value="Cancel">Cancel
                    </a>


                </div>
            </div>

        </div>
    </section>
    <!-- End Intro Single-->


  



</asp:Content>

