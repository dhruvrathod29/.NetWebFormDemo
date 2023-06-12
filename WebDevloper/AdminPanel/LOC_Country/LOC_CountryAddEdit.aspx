<%@ Page Title="" Language="C#" MasterPageFile="~/Content/MasterPage.master" AutoEventWireup="true" CodeFile="LOC_CountryAddEdit.aspx.cs" Inherits="AdminPanel_LOC_Country_LOC_CountryAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">



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
                        <h1 class="title-single">Country Add Edit</h1>
                    </div>
                </div>
                <div class="col-md-12 col-lg-4">
                    <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="LOC_CountryList.aspx"><i class="fa-regular fa-address-book"></i>Country List</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Country Add Edit
                            </li>
                        </ol>
                    </nav>
                </div>
            </div>
            <hr />
            <br />
            
            <br />
        </div>


        
        <div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong>Holy guacamole!</strong> You should check in on some of those fields below.
            <asp:Label runat="server" ForeColor="#33cc33" ID="lblMessage" EnableViewState="false" />
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>


        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <span style="color: #ff0000">*</span>
                    Country Name :-
                </div>
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="txtCountryName" placeholder="Enter Country Name" class="form-control">

                    </asp:TextBox>
                    <%--<input type="text" placeholder="Enter Country Name" required asp-for="CountryName" class="form-control" />--%>
                    <%--<span asp-validation-for="CountryName" class="text-danger"></span>--%>
                </div>
                <div class="col-md-1">
                </div>

                <div class="col-md-2">
                    <span style="color: #ff0000">*</span>
                    Country Code :-
                </div>
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="txtCountryCode" placeholder="Enter Country Code" class="form-control">

                    </asp:TextBox>
                    <%--<input type="text" placeholder="Enter Country Code" required asp-for="CountryCode" class="form-control" />
                    <span asp-validation-for="CountryCode" class="text-danger"></span>--%>
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

                    <a class="btn btn-b" href="LOC_CountryList.aspx" type="submit" value="Cancel">Cancel
                    </a>


                </div>
            </div>

        </div>
    </section>
    <!-- End Intro Single-->



</asp:Content>

