<%@ Page Title="" Language="C#" MasterPageFile="~/Content/MasterPage.master" AutoEventWireup="true" CodeFile="LOC_CountryList.aspx.cs" Inherits="AdminPanel_LOC_Country_LOC_CountryList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" Runat="Server">


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
                        <li class="breadcrumb-item active" aria-current="page">
                            Country List
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
        


        <asp:GridView runat="server" ID="gvLOC_Country"> 

        </asp:GridView>



    </div>
</section><!-- End Intro Single-->


</asp:Content>

