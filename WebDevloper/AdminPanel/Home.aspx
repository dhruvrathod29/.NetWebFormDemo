<%@ Page Title="" Language="C#" MasterPageFile="~/Content/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="AdminPanel_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" Runat="Server">

   <style>

        h2{
            position:relative;
            font-size:14vw;
            color:#fff;
            -webkit-text-stroke:0.09vw #000000;
            text-transform:uppercase;


        }
        h2::before{
            content: attr(data-text);
            position:absolute;
            top:0;
            left:0;
            width:0;
            height:100%;
            color:#000000;
            -webkit-text-stroke:0vw #000000;
            border-right:3px solid #000000;
            overflow:hidden;
            animation: animate 6s linear infinite;

        }
        @keyframes animate{
            0%,10%,100%{
                width :0;
            }
            70%,90%{
                width : 22%;
            }
        }
   </style>
 <!-- ======= Intro Section ======= -->
  <div class="intro intro-carousel swiper position-relative">

    <div class="swiper-wrapper">

     
      <div class="swiper-slide carousel-item-a intro-item bg-image" style="background-image: url(/Content/assets/img/slide-2.jpg)">
        <div class="overlay overlay-a"></div>
        <div class="intro-content display-table">
          <div class="table-cell">
            <div class="container">
              <div class="row">
                <div class="col-lg-8">
                  <div class="intro-body">
                    <p class="intro-title-top">
                    </p>
                    <h1 class="intro-title mb-4">
                      
                    </h1>
                    <p class="intro-subtitle intro-price">
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="swiper-pagination"></div>
  </div><!-- End Intro Section -->

      

             <!-- ======= Services Section ======= -->
    <section class="section-services section-t8">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="title-wrap d-flex justify-content-between">
              <div class="title-box">
                <h3>
                    <u>About</u>

                </h3>
                  
                  My Name is Dhruv Rathod Study from Darshan institute of Engineering & Technology college - Rajkot.<br />
                  I am a ASP.Net, .Net Core, .Net mvc, SQL Server & Angular Devloper 
                  <br />
                  <br />

                   <b><i class="fa fa-phone"></i> Phone Number :</b> 9662135051   &nbsp  &nbsp   &nbsp   &nbsp &nbsp  &nbsp   &nbsp   &nbsp  &nbsp   &nbsp <b><i class="fa fa-envelope"></i> Email :</b> dhruvrathod3110@gmail.com / 190540107175@darshan.ac.in
                  <br />
                  <br />
                  

                <b><i class="fa fa-birthday-cake"></i> Birthday :</b> 29 May 2002   &nbsp  &nbsp   &nbsp  &nbsp &nbsp &nbsp &nbsp &nbsp   &nbsp &nbsp  &nbsp   &nbsp   &nbsp  &nbsp   &nbsp <b><i class="fa-solid fa-city"></i> City :</b> Rajkot, Gujrat, India.
                  
                 <br />
                  <br />
                  <b><i class="fa fa-graduation-cap"></i> Degree :</b> Computer Engineering 

              </div>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Services Section -->

    
</asp:Content>

