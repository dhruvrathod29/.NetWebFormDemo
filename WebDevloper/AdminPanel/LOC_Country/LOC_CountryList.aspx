<%@ Page Title="" Language="C#" MasterPageFile="~/Content/MasterPage.master" AutoEventWireup="true" CodeFile="LOC_CountryList.aspx.cs" Inherits="AdminPanel_LOC_Country_LOC_CountryList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">

      <style>
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
            background-color: #ff0000;
            color: #ffffff;
        }
</style>
<!-- ======= Intro Single ======= -->


    <section class="intro-single">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-8">
                    <div class="title-single-box">
                        <h1 class="title-single">Country List</h1>
                    </div>
                </div>
                <div class="col-md-12 col-lg-4">
                    <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item list-inline-item">
                                <a href="LOC_CountryAddEdit.aspx">
                                    <i class="fa-solid fa-square-plus"></i>
                                    Country Add Edit 
                                </a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Country List
                            </li>
                        </ol>
                    </nav>
                </div>
            </div>

            <hr />

            <div class="row">
                <div class="col-md-9">
                </div>
                <div class="col-md-3 d-flex dataTable_filter" id="sample_1_filter">
                    <input type="text" placeholder="Serach Here...!" class="form-control" id="sample_1" aria-controls="sample_1" />

                    <button type="button" class="btn btn-b-n navbar-toggle-box navbar-toggle-box-collapse" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01">
                        <i class="bi bi-search"></i>

                    </button>
                </div>
            </div>
            <br />
            <asp:Label runat="server" class="alert-success" Style="color: #151414" ID="lblMessage" EnableViewState="false" />

            <br />
            <asp:GridView runat="server" ID="gvLOC_Country" CssClass="table table-hover" AutoGenerateColumns="false" OnRowCommand="gvCountry_RowCommand">
                <Columns>


                    <asp:BoundField DataField="CountryName" HeaderText="Country Name" />

                    <asp:BoundField DataField="CountryCode" HeaderText="Country Code" />

                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:HyperLink runat="server" ID="hlEdit" class="btn btn-a">
                             <i class="fa-solid fa-pen-to-square"></i>
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDelete" runat="server" class="btn btn-b" OnClientClick="return confirm('Are you sure you want to delete')" CommandName="DeleteRecord" CommandArgument='<%# Eval("CountryID").ToString() %>'>
                           <i class="fa-solid fa-trash"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
    </section>
    <!-- End Intro Single-->


</asp:Content>

