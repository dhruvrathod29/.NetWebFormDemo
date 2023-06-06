<%@ Page Title="" Language="C#" MasterPageFile="~/Content/MasterPage.master" AutoEventWireup="true" CodeFile="Calculator.aspx.cs" Inherits="AdminPanel_Calculator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+Mono:wght@200&family=Noto+Sans:ital,wght@1,200&family=Poppins:wght@100&display=swap');


        * {
            margin: 0;
            padding: 0px;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        .body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 22vh;
            flex-direction: column;
            gap: 22px;
            background: #1d2b3c;
        }

        h2 {
            position: relative;
            font-size: 14vw;
            color: #1d2b3c;
            -webkit-text-stroke: 0.022vw rgba(255, 255, 255,0.25);
            text-transform: uppercase;
        }

            h2::before {
                content: attr(data-text);
                position: absolute;
                top: 0;
                left: 0;
                width: 0;
                height: 100%;
                color: #00dfc4;
                -webkit-text-stroke: 0vw rgba(255, 255, 255,0.25);
                border-right: 2px solid #00dfc4;
                overflow: hidden;
                animation: animate 6s linear infinite;
            }

        @keyframes animate {
            0%,10%,100% {
                width: 0;
            }

            70%,90% {
                width: 100%;
            }
        }
        .Dhruv{
            position:relative;
            background: #fff;
            color:#fff;
            text-decoration:none;
            text-transform:uppercase;
            font-size:1.5em;
            letter-spacing:0.1em;
            font-weight:400;
            padding:10px 30px;
            transition:0.5s;

        }
        .Dhruv:hover{
            background:var(--clr);
            color: var(--clr);
            letter-spacing : 0.25em;
            box-shadow:0 0 35px var(--clr);

        }
        .Dhruv:before{
            content:'';
            position:absolute;
            inset:2px;
            background:#1d2b3c;
        }
        .Dhruv span{
            position:relative;
            z-index: 1;

        }
        .Dhruv i{
            position:absolute;
            inset:0;
            display:block;

        }
        .Dhruv i::before{
            content:'';
            position:absolute;
            top:0;
            left:80%;
            width:10px;
            height:4px;
            background:#1d2b3c;
            transform:translateX(-50%) skewX(325deg);
            transition:0.5s;

            
        }
        .Dhruv:hover i::before{
            width:20px;
            left:20%;
        }


        
        .Dhruv i::after{
            content:'';
            position:absolute;
            bottom:0;
            left:20%;
            width:10px;
            height:4px;
            background:#1d2b3c;
            transform:translateX(-50%) skewX(325deg);
            transition:0.5s;

            
        }
        .Dhruv:hover i::after{
            width:20px;
            left:80%;
        }




        .inputBox {
            position: relative;
            width: 250px;
        }

            .inputBox input {
                width: 100%;
                padding: 10px;
                border: 1px solid rgba(255, 255, 255,0.25);
                background: #1d2b3c;
                border-radius: 5px;
                outline: none;
                color: #fff;
                font-size: 1em;
                transition: 0.5s;
            }

            .inputBox span {
                position: absolute;
                left: 0;
                padding: 10px;
                pointer-events: none;
                font-size: 1em;
                color: rgba(255, 255, 255,0.25);
                text-transform: uppercase;
                transition: 0.5s;
            }

            .inputBox .TextBox:valid ~ span,
            .inputBox .TextBox:valid ~ span,
            .inputBox .TextBox:valid ~ span{
                color: #00dfc4;
                transform: translateX(10px) translateY(-7px);
                font-size: 0.65em;
                padding: 0 10px;
                background: #1d2b3c;
                border-left: 1px solid #00dfc4;
                border-right: 1px solid #00dfc4;
                letter-spacing: 0.2em;
            }

            .inputBox .TextBox:valid,
            .inputBox .TextBox:valid,
            .inputBox .TextBox:valid{
                border: 2px solid #00dfc4;
            }
    </style>




    <!-- ======= Intro Section ======= -->
    <div class="intro intro-carousel swiper position-relative">

        <div class="swiper-wrapper">


            <div class="swiper-slide carousel-item-a intro-item bg-image" style="background-image: url(/Content/assets/img/plan2.jpg)">
                <div class="overlay overlay-a"></div>
                <div class="intro-content display-table">
                    <div class="table-cell">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-8">
                                    <div class="intro-body">
                                        <p class="intro-title-top">
                                        </p>
                                        <h1 class="intro-title mb-4"></h1>
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
    </div>
    <!-- End Intro Section -->


    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

    <br />




    <%--    Calculator Coding--%>

    <!-- ======= Services Section ======= -->
    <section class="section-services section-t8" style="background-color: #1d2b3c">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="title-wrap d-flex justify-content-between">

                        <div class="title-box">

                            <h2 class="title-a" data-text="Calculator... "><%--<i class="fa fa-calculator"></i>--%>Calculator... </h2>
                            <hr />
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Services Section -->




    <div class="body">

        <div class="inputBox">
            <asp:TextBox CssClass="TextBox" runat="server" ID="txt1" TextMode="Number"></asp:TextBox>
           
            <span>Enter Number</span>
             <asp:Label ID="lblMessage1" runat="server" EnableViewState="false" BackColor="Red"></asp:Label>
            <div>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1"  runat="server" ErrorMessage="Please Enter Number" ControlToValidate="txt1" ValidationGroup="Answer" Display="Dynamic"></asp:RequiredFieldValidator>--%>
            </div>
        </div>
        <div class="inputBox">
            <asp:TextBox CssClass="TextBox" runat="server" ID="txt2" TextMode="SingleLine"></asp:TextBox>
            <span>Enter Operator</span>
            <asp:Label ID="lblMessage2" runat="server" EnableViewState="false" BackColor="Red"></asp:Label>
            <div>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Operator" ControlToValidate="txt2" ValidationGroup="Answe" Display="Dynamic"></asp:RequiredFieldValidator>--%>

            </div>
        </div>
        <div class="inputBox">
            <asp:TextBox CssClass="TextBox" runat="server" ID="txt3" TextMode="Number"></asp:TextBox>
            <span>Enter Number</span>
            <asp:Label ID="lblMessage3" runat="server" EnableViewState="false" BackColor="Red"></asp:Label>

        </div>
       
        
        <asp:LinkButton ID="btnSave" CssClass="Dhruv"  style="--clr:#047eed" runat="server" Text="Save"  ForeColor="#000000" OnClick="btnSave_Click" ValidationGroup="Amswer" >
            <span>Answer</span>
            <i></i>

        </asp:LinkButton>
        <asp:LinkButton ID="btnReset" CssClass="Dhruv" style="--clr:#ff0000" runat="server"   ForeColor="#000000" OnClick="btnReset_Click">
            <span>Reset</span>
            <i></i>

            

        </asp:LinkButton>
        <br />


         <div class="inputBox">
            <asp:TextBox CssClass="TextBox" runat="server" ID="txtAns"  TextMode="SingleLine" Enabled="false" ForeColor="White" Font-Bold="True" Font-Size="Large"></asp:TextBox>
            <span>Answer</span>
             <asp:Label ID="lblAns" runat="server" EnableViewState="false" ></asp:Label>

        </div>
        <br />

    </div>





</asp:Content>

