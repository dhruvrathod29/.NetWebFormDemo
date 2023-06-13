<%@ Page Title="" Language="C#" MasterPageFile="~/Content/MasterPage.master" AutoEventWireup="true" CodeFile="LOC_StateList.aspx.cs" Inherits="AdminPanel_LOC_State_LOC_StateList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <section class="intro-single">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-8">
                    <div class="title-single-box">
                        <h1 class="title-single">State List</h1>
                    </div>
                </div>
                <div class="col-md-12 col-lg-4">
                    <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item list-inline-item">
                                <a href="LOC_StateAddEdit.aspx">
                                    <i class="fa-solid fa-square-plus"></i>
                                    State Add Edit 
                                </a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">State List
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
            <asp:GridView runat="server" ID="gvLOC_State" CssClass="table table-hover" AutoGenerateColumns="false">
                <Columns>
                 

                    <asp:BoundField DataField="CountryName" HeaderText="Country Name"/>

                    <asp:BoundField DataField="StateName" HeaderText="State Name"/>
                    <asp:BoundField DataField="StateCode" HeaderText="State Code"/>


                    <asp:TemplateField>
                        <ItemTemplate>

                            <asp:HyperLink runat="server" ID="btnDelete" Text="Delete" class="btn btn-b">
                                   <i class="fa-solid fa-trash"></i>
                            </asp:HyperLink>
                       
                          
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>
            </asp:GridView>
        </div>
    </section>
    <!-- End Intro Single-->
</asp:Content>

