<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="download-executivereport.aspx.cs" Inherits="Mitig8.documents.download_executivereport" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://fonts.googleapis.com/css?family=Libre+Barcode+128&display=swap" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/././plugins/fontawesome-free/css/all.min.css">

    <title></title>
    <style type="text/css">
        g text {
            font-size: 12px !important;
        }

        body {
            font-family: Arial;
        }

        

        body {
            background: rgb(204,204,204);
        }

        page {
            background: white;
            display: block;
            /*margin: 0 auto;*/
            /*margin-bottom: 0.30cm;*/
            box-shadow: 0 0 0.5cm rgba(0,0,0,0.5);
        }

            page[size="A4"] {
                width: 21cm;
                height: 29.5cm;
            }

                page[size="A4"][layout="landscape"] {
                    width: 29.7cm;
                    height: 21cm;
                }

            page[size="A3"] {
                width: 29.7cm;
                height: 42cm;
            }

                page[size="A3"][layout="landscape"] {
                    width: 42cm;
                    height: 29.7cm;
                }

            page[size="A5"] {
                width: 14.8cm;
                height: 21cm;
            }

                page[size="A5"][layout="landscape"] {
                    width: 21cm;
                    height: 14.8cm;
                }

        @media print {
            body, page {
                margin: 0;
                box-shadow: 0;
            }
        }
    </style>
</head>
<body>


        <form id="frmAssessmentDetails" runat="server">

           <asp:Literal runat="server" ID="litExecutiveReport"></asp:Literal>
            </form>

    <%--<form id="frmAssessmentDetails" runat="server">

        <page size="A4">    

<img class="imgLogo" src="/././images/logo-full-black.png" style="
    position: absolute;
    margin-left: 154px;
    width: 450px;
    margin-top: 130px;
">
             <p style="
    position: absolute;
    margin-top: 404px;
    margin-left: 269px;
    font-size: 24px;
">Assessment Risk Survey</p>


                     <p style="
    position: absolute;
    margin-top: 454px;
    margin-left: 269px;
    font-size: 24px;
    color:red;
"><i>PROVISIONAL DEMO</i></p>

<img src="https://www.pngitem.com/pimgs/m/105-1054301_skyline-silhouette-city-high-rise-building-photography-high.png" style="
    position: absolute;
    width: inherit;
    bottom: -305px;
">
             </page>


        <page size="A4">      

           <i style="color:red;position: absolute;margin-top: 15px;margin-left: 350px;">SAMPLE</i>
            <div class="imgLogoContainer"><img class="imgLogo" src="/././images/logo-full-black.png"></div>
            <p class="assessmentTitle2"><i class="fas fa-microscope"></i>&nbsp;Assessment: 3</p>  
            <p class="assessmentTitle1">Assessment Risk Survey</p>
            <p class="assessmentTitle3">Summary </p>
<img src="http://lmsapp.citylogistics.co.za/encode/qrcode.aspx?data=PDF_ASD~3" style="
    position: absolute;
    width: 150px;
    margin-left: 628px;
    margin-top: 99px;
">

<div class="verticalLine1"></div>
            <p class="generalinformationTitle"><i class="fas fa-info-circle"></i>&nbsp;General Information</p>
            <div class="verticalLine2"></div>

            <table class="table table-striped" style="width: 727px;margin-top: 286px;position: absolute;margin-left: 28px;">
                                <tbody><tr>
                    <td>Date Created</td>
                    <td>29 April 2020 11:43AM</td>
                </tr>
                <tr>
                    <td>Insurer Name</td>
                    <td>Hollard Group</td>
                </tr>
                                <tr>
                    <td>Insurer Contact Person</td>
                    <td>John Doe</td>
                </tr>
                                <tr>
                    <td>Insurer Contact Number</td>
                    <td>0861 000 107</td>
                </tr>
                                                <tr>
                    <td>Insurance Policy Number</td>
                    <td>87004761313</td>
                </tr>
                <tr>
                    <td>Broker Number</td>
                    <td>Joe Soap</td>
                </tr>
                <tr>
                    <td>Broker Contact Number</td>
                    <td>076 951 7050</td>
                </tr>
                <tr>
                    <td>Insured Name</td>
                    <td>McDonald's Umhlanga</td>
                </tr>
                 <tr>
                    <td>Insured Contact Number</td>
                    <td>031 569 6964</td>
                </tr>
                 <tr>
                    <td>Insured Industry Sector</td>
                    <td>Hospitality</td>
                </tr>
            </tbody></table>


            <div class="verticalLine3"></div>
            <p class="riskaddressesTitle"><i class="fas fa-map-marked-alt"></i>&nbsp;Risk Address</p>
            <div class="verticalLine4"></div>


             <table class="table table-striped" style="width: 727px;margin-top: 841px;position: absolute;margin-left: 28px;">                <tbody><tr>
                    <td><i class="fas fa-map-marker-alt"></i> 317 Umhlanga Rocks Dr, Umhlanga Ridge, Umhlanga, 4319</td>
                </tr>                   
                     
            </tbody></table>

<div style="
    margin-top: 905px;
    position: absolute;
    margin-left: 27px;
" class="mapouter"><div class="gmap_canvas"><iframe width="700" height="200" id="gmap_canvas" src="https://maps.google.com/maps?q=%20317%20Umhlanga%20Rocks%20Dr%2C%20Umhlanga%20Ridge%2C%20Umhlanga%2C%204319&t=&z=17&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe><a href="https://www.divi-discount.com/en/">divi discount</a></div><style>
                                                                                                                                                                                                                                                                                                                                                                                                    .mapouter {
                                                                                                                                                                                                                                                                                                                                                                                                        position: relative;
                                                                                                                                                                                                                                                                                                                                                                                                        text-align: right;
                                                                                                                                                                                                                                                                                                                                                                                                        height: 200px;
                                                                                                                                                                                                                                                                                                                                                                                                        width: 710px;
                                                                                                                                                                                                                                                                                                                                                                                                    }

                                                                                                                                                                                                                                                                                                                                                                                                    .gmap_canvas {
                                                                                                                                                                                                                                                                                                                                                                                                        overflow: hidden;
                                                                                                                                                                                                                                                                                                                                                                                                        background: none !important;
                                                                                                                                                                                                                                                                                                                                                                                                        height: 200px;
                                                                                                                                                                                                                                                                                                                                                                                                        width: 710px;
                                                                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                                                                </style></div>        </page>



        <page size="A4">


                    <div class="verticalLine5"></div>
            <p class="policyDetailsTitle"><i class="fas fa-umbrella"></i>&nbsp;Policy Details</p>
            <div class="verticalLine6"></div>
			
             <table class="table table-striped" style="width: 727px;margin-top: 66px;position: absolute;margin-left: 28px;">
                 <thead>
                                                <tr>
                                                    <th>Risk</th>
                                                    <th>Element</th>
                                                    <th>Covered</th>
                                                    <th>Sums Insured</th>
                                                </tr>
                                            </thead>
                 <tbody><tr>
                              <td><i class="fas fa-fire-extinguisher"></i>&nbsp;Fire</td>
                    <td>Plant and Machinery</td>
                    <td>Yes</td>
                    <td>R85000.33</td>
</tr><tr>
                                  <td><i class="fas fa-fire-extinguisher"></i>&nbsp;Fire</td>

                    <td>Building(s)</td>
                    <td>Yes</td>
                    <td>R144856.37</td>
</tr><tr>


                                      <td><i class="fas fa-city"></i>&nbsp;Buildings Combined</td>

                    <td>Building(s)</td>
                    <td>Yes</td>
                    <td>R144856.37</td>
</tr><tr>
                                      <td><i class="fas fa-city"></i>&nbsp;Buildings Combined</td>

                    <td>Inflation</td>
                    <td>Yes</td>
                    <td>R78000.00</td>
</tr><tr>
                                          <td><i class="fas fa-radiation-alt"></i>&nbsp; Business Interruption</td>

                    <td>PUB/Utilities</td>
                    <td>Yes</td>
                    <td>R689754.07</td>
</tr><tr>

                                              <td><i class="fas fa-clipboard-list"></i>&nbsp; Other</td>

    


                    <td>BAR (Business All Risk)</td>
                    <td>Yes</td>
                    <td>R18000.00</td>
</tr><tr>
                                                  <td><i class="fas fa-clipboard-list"></i>&nbsp; Other</td>

                    <td>Machinery Breakdown</td>
                    <td>Yes</td>
                    <td>R94499.62</td>
</tr>         



<tr>
                     <td><i class="fas fa-calculator"></i>&nbsp; Total</td>
        <td></td><td></td>
                    <td>R1254966.76</td>
</tr>   



                 </tbody>
            </table>




            
<div style="box-shadow: 0 0 1px rgba(0,0,0,.125), 0 1px 3px rgba(0,0,0,.2);position: absolute;margin-top: 70px;margin-left: 25px;zoom: 133%;width: 545px;height: 317px;margin-top: 387px;">
                                <span style="margin: 5px;"><i class="fas fa-chart-pie"></i>&nbsp; % Sums Insured By Risk </span>
            <img src="http://web.mitig8.co.za/documents/images/pie1.png" style="
    width: 537px;
">
    </div>

               </page>








        <page size="A4">

                                 <div class="verticalLine5"></div>
            <p class="policyDetailsTitle"><i class="fas fa-running"></i>&nbsp;General Risk Summary<span style="font-size: 12px;float: right;margin-left: 192px;"><i class="fas fa-diagnoses"></i> Assessed by John Foxx Assessors on 29-04-2020</span></p>
            <div class="verticalLine6"></div>





<div style="box-shadow: 0 0 1px rgba(0,0,0,.125), 0 1px 3px rgba(0,0,0,.2);position: absolute;margin-top: 60px;margin-left: 25px;zoom: 133%;width: 545px;height: 250px;">
                                <span style="margin: 5px; "><i class="fas fa-superscript"></i>&nbsp;Maximum Possible Loss</span>
                                <div style="width: 100%; height: 100%; position: relative; left: 0.195343px; top: 0.42189px;"><svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" role="group" style="margin-left: 72px;margin-top:7px;width: 100%; height: 100%; overflow: hidden;"><defs><clipPath id="id-3357"><rect width="403" height="180"></rect></clipPath><linearGradient id="gradient-id-3380" x1="1%" x2="99%" y1="59%" y2="41%"><stop stop-color="#474758" offset="0"></stop><stop stop-color="#474758" stop-opacity="1" offset="0.75"></stop><stop stop-color="#3cabff" stop-opacity="1" offset="0.755"></stop></linearGradient><filter id="filter-id-3389" filterUnits="objectBoundingBox" width="200%" height="200%" x="-50%" y="-50%"></filter><clipPath id="id-3459"><path d=" M-120,0  L-145,0  a145,145,0,0,1,290,0 L120,0  a120,120,0,0,0,-240,0 L-120,0 " r="0"></path></clipPath><filter id="filter-id-3362" filterUnits="objectBoundingBox" width="200%" height="200%" x="-50%" y="-50%"><feGaussianBlur result="blurOut" in="SourceGraphic" stdDeviation="1.5"></feGaussianBlur><feOffset result="offsetBlur" dx="1" dy="1"></feOffset><feFlood flood-color="#000000" flood-opacity="0.5"></feFlood><feComposite in2="offsetBlur" operator="in"></feComposite><feMerge><feMergeNode></feMergeNode><feMergeNode in="SourceGraphic"></feMergeNode></feMerge></filter><filter id="filter-id-3377" filterUnits="objectBoundingBox" width="120%" height="120%" x="-10%" y="-10%"><feColorMatrix type="saturate" values="0"></feColorMatrix></filter></defs><g><g fill="#ffffff" fill-opacity="0"><rect width="403" height="180"></rect></g><g><g role="region" clip-path="url(&quot;#id-3357&quot;)" opacity="1" aria-describedby="id-3328-description"><g transform="translate(15,15)"><g><g><g><g><g><g><g transform="translate(0,0)"><g fill="#ffffff" fill-opacity="0" transform="translate(0,0)"><rect width="373" height="150"></rect></g><g><g transform="translate(186.5,135)"><g><g opacity="0"></g><g><g></g></g><g aria-hidden="true"><g><g><g><g><g><g fill="#67b7dc" fill-opacity="1" style="pointer-events: none;"><path d=" M-95,0  L-120,0  a120,120,0,0,1,120,-120 L0,-95  a95,95,0,0,0,-95,95 L-95,0 "></path></g><g fill="#6771dc" fill-opacity="1" style="pointer-events: none;"><path d=" M0,-95  L0,-120  a120,120,0,0,1,97.082,49.4658 L76.8566,-55.8396  a95,95,0,0,0,-76.8566,-39.1604 L0,-95 "></path></g><g fill="#a367dc" fill-opacity="1" style="pointer-events: none;"><path d=" M76.8566,-55.8396  L97.082,-70.5342  a120,120,0,0,1,22.918,70.5342 L95,0  a95,95,0,0,0,-18.1434,-55.8396 L76.8566,-55.8396 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none" display="none"><path d=" M-76.8566,55.8396  L-97.082,70.5342 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none" display="none"><path d=" M-90.3504,29.3566  L-114.1268,37.082 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M-95,0  L-120,0 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M-90.3504,-29.3566  L-114.1268,-37.082 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M-76.8566,-55.8396  L-97.082,-70.5342 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M-55.8396,-76.8566  L-70.5342,-97.082 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M-29.3566,-90.3504  L-37.082,-114.1268 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M0,-95  L0,-120 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M29.3566,-90.3504  L37.082,-114.1268 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M55.8396,-76.8566  L70.5342,-97.082 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M76.8566,-55.8396  L97.082,-70.5342 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M90.3504,-29.3566  L114.1268,-37.082 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M95,0  L120,0 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none" display="none"><path d=" M90.3504,29.3566  L114.1268,37.082 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M-95,0  L-120,0 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M0,-95  L0,-120 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M76.8566,-55.8396  L97.082,-70.5342 "></path></g><g fill-opacity="0" stroke-opacity="0" stroke="#000000" stroke-width="1"><path d=" M-120,0  L-125,0 "></path></g><g fill-opacity="0" stroke-opacity="0" stroke="#000000" stroke-width="1"><path d=" M0,-120  L0,-125 "></path></g><g fill-opacity="0" stroke-opacity="0" stroke="#000000" stroke-width="1"><path d=" M97.082,-70.5342  L101.1271,-73.4732 "></path></g></g></g><g fill="#000000" fill-opacity="0" opacity="0" stroke-opacity="0" style="pointer-events: none;" transform="translate(-139.5,0)"><g transform="translate(-4.5,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>L</tspan></text></g></g><g fill="#000000" transform="translate(-117.712,85.229)" display="none"><g transform="translate(-10.5,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>-20</tspan></text></g></g><g fill="#000000" transform="translate(-138.379,44.807)" display="none"><g transform="translate(-10.5,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>-10</tspan></text></g></g><g fill="#000000" transform="translate(-139,0)"><g transform="translate(-4,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>0</tspan></text></g></g><g fill="#000000" transform="translate(-136.001,-44.807)"><g transform="translate(-8,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>10</tspan></text></g></g><g fill="#000000" transform="translate(-115.689,-85.229)"><g transform="translate(-8,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>20</tspan></text></g></g><g fill="#000000" transform="translate(-84.053,-117.307)"><g transform="translate(-8,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>30</tspan></text></g></g><g fill="#000000" transform="translate(-44.189,-137.904)"><g transform="translate(-8,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>40</tspan></text></g></g><g fill="#000000" transform="translate(0,-145)"><g transform="translate(-8,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>50</tspan></text></g></g><g fill="#000000" transform="translate(44.189,-137.904)"><g transform="translate(-8,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>60</tspan></text></g></g><g fill="#000000" transform="translate(84.053,-117.307)"><g transform="translate(-8,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>70</tspan></text></g></g><g fill="#000000" transform="translate(115.689,-85.229)"><g transform="translate(-8,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>80</tspan></text></g></g><g fill="#000000" transform="translate(136.001,-44.807)"><g transform="translate(-8,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>90</tspan></text></g></g><g fill="#000000" transform="translate(147,0)"><g transform="translate(-12,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>100</tspan></text></g></g><g fill="#000000" transform="translate(139.806,44.807)" display="none"><g transform="translate(-12,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>110</tspan></text></g></g><g fill="#000000" transform="translate(-135,0)"><g display="none"></g></g><g fill="#000000" transform="translate(0,-135)"><g display="none"></g></g><g fill="#000000" transform="translate(109.217,-79.351)"><g display="none"></g></g><g fill="#000000" stroke="#000000" transform="translate(0,0) rotate(291.6)"><g><g><circle r="5"></circle></g><g transform="translate(0,-2.5)"><path d=" M0,0  L120,2  L120,3  L0,5 "></path></g></g></g><g><g></g></g></g></g><g fill="#000000"><g display="none"></g></g><g stroke="#000000" stroke-opacity="0.15" fill="none"><path transform="translate(-0.5,-0.5)"></path></g><g stroke="#000000" stroke-opacity="0" fill="none" style="pointer-events: none;"><path d=" M-120,0  a120,120,0,0,1,240,0" transform="translate(-0.5,-0.5)"></path></g></g></g><g><g></g></g><g clip-path="url(&quot;#id-3459&quot;)"><g></g></g></g></g><g><g></g></g><g role="button" focusable="true" tabindex="0" opacity="0" visibility="hidden" aria-hidden="true" transform="translate(333,-3)" aria-labelledby="id-3343-title"><g fill="#6794dc" stroke="#ffffff" fill-opacity="1" stroke-opacity="0" transform="translate(0,8)"><path d="M17,0 L18,0 a17,17 0 0 1 17,17 L35,17 a17,17 0 0 1 -17,17 L17,34 a17,17 0 0 1 -17,-17 L0,17 a17,17 0 0 1 17,-17 Z"></path></g><g transform="translate(9,9)"><g stroke="#ffffff" style="pointer-events: none;" transform="translate(0,8)"><path d=" M0,0  L11,0 " transform="translate(2.5,7.5)"></path></g><g fill="#000000" style="pointer-events: none;" transform="translate(17,8)"><g display="none"></g></g></g><title id="id-3343-title">Zoom Out</title></g></g></g><g><g></g></g><g transform="translate(373,0)"><g></g></g></g></g><g><g></g></g><g transform="translate(0,150)"><g></g></g></g></g></g></g></g><desc id="id-3328-description">Chart</desc></g><g><g><g role="tooltip" visibility="hidden" opacity="0"><g fill="#ffffff" fill-opacity="0.9" stroke-width="1" stroke-opacity="1" stroke="#ffffff" filter="url(&quot;#filter-id-3362&quot;)" style="pointer-events: none;" transform="translate(0,6)"><path d="M3,0 L3,0 L0,-6 L13,0 L21,0 a3,3 0 0 1 3,3 L24,8 a3,3 0 0 1 -3,3 L3,11 a3,3 0 0 1 -3,-3 L0,3 a3,3 0 0 1 3,-3"></path></g><g><g fill="#ffffff" style="pointer-events: none;" transform="translate(12,6)"><g transform="translate(0,7)" display="none"></g></g></g></g><g visibility="hidden" display="none"><g fill="#ffffff" opacity="1"><rect width="403" height="180"></rect></g><g><g><g><g stroke-opacity="1" fill="#f3f3f3" fill-opacity="0.8"><g><g><path d=" M53,0  a53,53,0,0,1,-106,0 a53,53,0,0,1,106,0 M42,0  a42,42,0,0,0,-84,0 a42,42,0,0,0,84,0 L42,0 "></path></g></g></g><g stroke-opacity="1" fill="#000000" fill-opacity="0.2"><g><g><path d=""></path></g></g></g><g fill="#000000" fill-opacity="0.4"><g display="none"></g></g></g></g></g>
                                <g role="tooltip" visibility="hidden" opacity="0" transform="translate(105.24265601702925,78.3444089456793)"></g><g fill="#000000" fill-opacity="1" stroke-width="1" stroke-opacity="1" stroke="#000000" style="pointer-events: none;" transform="translate(-10,-15)"><path d="M0,0 L20,0 a0,0 0 0 1 0,0 L20,10 a0,0 0 0 1 -0,0 L20,10 L15,10 L10,15 L5,10 L0,10 a0,0 0 0 1 -0,-0 L0,0 a0,0 0 0 1 0,-0"></path></g><g><g fill="#ffffff" style="pointer-events: none;" transform="translate(0,-15)"><g transform="translate(0,5)" display="none"></g></g></g></g></g></g></g></g></svg></div>
               
                <p style="
    position: absolute;
    margin-top: -76px;
    margin-left: 225px;
    font-size: 24px;
">62% MPL</p>

                            </div>



                            <div style="box-shadow: 0 0 1px rgba(0,0,0,.125), 0 1px 3px rgba(0,0,0,.2);position: absolute;margin-top: 332px;margin-left: 25px;zoom: 133%;width: 545px;height: 250px;" >
                                <span style="margin: 5px;"><i class="fas fa-square-root-alt"></i>&nbsp;Estimated Maximum Loss</span>
<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" role="group" style="width: 100%; height: 100%; overflow: visible;margin-left:72px;margin-top:7px;"><defs><clipPath id="id-3258"><rect width="404" height="180"></rect></clipPath><linearGradient id="gradient-id-3281" x1="1%" x2="99%" y1="59%" y2="41%"><stop stop-color="#474758" offset="0"></stop><stop stop-color="#474758" stop-opacity="1" offset="0.75"></stop><stop stop-color="#3cabff" stop-opacity="1" offset="0.755"></stop></linearGradient><filter id="filter-id-3290" filterUnits="objectBoundingBox" width="200%" height="200%" x="-50%" y="-50%"></filter><clipPath id="id-3460"><path d=" M-120,0  L-145,0  a145,145,0,0,1,290,0 L120,0  a120,120,0,0,0,-240,0 L-120,0 " r="0"></path></clipPath><filter id="filter-id-3263" filterUnits="objectBoundingBox" width="200%" height="200%" x="-50%" y="-50%"><feGaussianBlur result="blurOut" in="SourceGraphic" stdDeviation="1.5"></feGaussianBlur><feOffset result="offsetBlur" dx="1" dy="1"></feOffset><feFlood flood-color="#000000" flood-opacity="0.5"></feFlood><feComposite in2="offsetBlur" operator="in"></feComposite><feMerge><feMergeNode></feMergeNode><feMergeNode in="SourceGraphic"></feMergeNode></feMerge></filter><filter id="filter-id-3278" filterUnits="objectBoundingBox" width="120%" height="120%" x="-10%" y="-10%"><feColorMatrix type="saturate" values="0"></feColorMatrix></filter></defs><g><g fill="#ffffff" fill-opacity="0"><rect width="404" height="180"></rect></g><g><g role="region" clip-path="url(&quot;#id-3258&quot;)" opacity="1" aria-describedby="id-3229-description"><g transform="translate(15,15)"><g><g><g><g><g><g><g transform="translate(0,0)"><g fill="#ffffff" fill-opacity="0" transform="translate(0,0)"><rect width="374" height="150"></rect></g><g><g transform="translate(187,135)"><g><g opacity="0"></g><g><g></g></g><g aria-hidden="true"><g><g><g><g><g><g fill="#67b7dc" fill-opacity="1" style="pointer-events: none;"><path d=" M-95,0  L-120,0  a120,120,0,0,1,120,-120 L0,-95  a95,95,0,0,0,-95,95 L-95,0 "></path></g><g fill="#6771dc" fill-opacity="1" style="pointer-events: none;"><path d=" M0,-95  L0,-120  a120,120,0,0,1,97.082,49.4658 L76.8566,-55.8396  a95,95,0,0,0,-76.8566,-39.1604 L0,-95 "></path></g><g fill="#a367dc" fill-opacity="1" style="pointer-events: none;"><path d=" M76.8566,-55.8396  L97.082,-70.5342  a120,120,0,0,1,22.918,70.5342 L95,0  a95,95,0,0,0,-18.1434,-55.8396 L76.8566,-55.8396 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none" display="none"><path d=" M-76.8566,55.8396  L-97.082,70.5342 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none" display="none"><path d=" M-90.3504,29.3566  L-114.1268,37.082 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M-95,0  L-120,0 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M-90.3504,-29.3566  L-114.1268,-37.082 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M-76.8566,-55.8396  L-97.082,-70.5342 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M-55.8396,-76.8566  L-70.5342,-97.082 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M-29.3566,-90.3504  L-37.082,-114.1268 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M0,-95  L0,-120 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M29.3566,-90.3504  L37.082,-114.1268 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M55.8396,-76.8566  L70.5342,-97.082 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M76.8566,-55.8396  L97.082,-70.5342 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M90.3504,-29.3566  L114.1268,-37.082 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M95,0  L120,0 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none" display="none"><path d=" M90.3504,29.3566  L114.1268,37.082 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M-95,0  L-120,0 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M0,-95  L0,-120 "></path></g><g stroke="#ffffff" stroke-opacity="0.3" fill="none"><path d=" M76.8566,-55.8396  L97.082,-70.5342 "></path></g><g fill-opacity="0" stroke-opacity="0" stroke="#000000" stroke-width="1"><path d=" M-120,0  L-125,0 "></path></g><g fill-opacity="0" stroke-opacity="0" stroke="#000000" stroke-width="1"><path d=" M0,-120  L0,-125 "></path></g><g fill-opacity="0" stroke-opacity="0" stroke="#000000" stroke-width="1"><path d=" M97.082,-70.5342  L101.1271,-73.4732 "></path></g></g></g><g fill="#000000" fill-opacity="0" opacity="0" stroke-opacity="0" style="pointer-events: none;" transform="translate(-139.5,0)"><g transform="translate(-4.5,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>L</tspan></text></g></g><g fill="#000000" transform="translate(-117.712,85.229)" display="none"><g transform="translate(-10.5,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>-20</tspan></text></g></g><g fill="#000000" transform="translate(-138.379,44.807)" display="none"><g transform="translate(-10.5,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>-10</tspan></text></g></g><g fill="#000000" transform="translate(-139,0)"><g transform="translate(-4,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>0</tspan></text></g></g><g fill="#000000" transform="translate(-136.001,-44.807)"><g transform="translate(-8,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>10</tspan></text></g></g><g fill="#000000" transform="translate(-115.689,-85.229)"><g transform="translate(-8,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>20</tspan></text></g></g><g fill="#000000" transform="translate(-84.053,-117.307)"><g transform="translate(-8,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>30</tspan></text></g></g><g fill="#000000" transform="translate(-44.189,-137.904)"><g transform="translate(-8,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>40</tspan></text></g></g><g fill="#000000" transform="translate(0,-145)"><g transform="translate(-8,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>50</tspan></text></g></g><g fill="#000000" transform="translate(44.189,-137.904)"><g transform="translate(-8,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>60</tspan></text></g></g><g fill="#000000" transform="translate(84.053,-117.307)"><g transform="translate(-8,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>70</tspan></text></g></g><g fill="#000000" transform="translate(115.689,-85.229)"><g transform="translate(-8,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>80</tspan></text></g></g><g fill="#000000" transform="translate(136.001,-44.807)"><g transform="translate(-8,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>90</tspan></text></g></g><g fill="#000000" transform="translate(147,0)"><g transform="translate(-12,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>100</tspan></text></g></g><g fill="#000000" transform="translate(139.806,44.807)" display="none"><g transform="translate(-12,-10)" style="user-select: none;"><text x="0" y="20.390625" dy="-5.505"><tspan>110</tspan></text></g></g><g fill="#000000" transform="translate(-135,0)"><g display="none"></g></g><g fill="#000000" transform="translate(0,-135)"><g display="none"></g></g><g fill="#000000" transform="translate(109.217,-79.351)"><g display="none"></g></g><g fill="#000000" stroke="#000000" transform="translate(0,0) rotate(248.4)"><g><g><circle r="5"></circle></g><g transform="translate(0,-2.5)"><path d=" M0,0  L120,2  L120,3  L0,5 "></path></g></g></g><g><g></g></g></g></g><g fill="#000000"><g display="none"></g></g><g stroke="#000000" stroke-opacity="0.15" fill="none"><path transform="translate(-0.5,-0.5)"></path></g><g stroke="#000000" stroke-opacity="0" fill="none" style="pointer-events: none;"><path d=" M-120,0  a120,120,0,0,1,240,0" transform="translate(-0.5,-0.5)"></path></g></g></g><g><g></g></g><g clip-path="url(&quot;#id-3460&quot;)"><g></g></g></g></g><g><g></g></g><g role="button" focusable="true" tabindex="0" opacity="0" visibility="hidden" aria-hidden="true" transform="translate(334,-3)" aria-labelledby="id-3244-title"><g fill="#6794dc" stroke="#ffffff" fill-opacity="1" stroke-opacity="0" transform="translate(0,8)"><path d="M17,0 L18,0 a17,17 0 0 1 17,17 L35,17 a17,17 0 0 1 -17,17 L17,34 a17,17 0 0 1 -17,-17 L0,17 a17,17 0 0 1 17,-17 Z"></path></g><g transform="translate(9,9)"><g stroke="#ffffff" style="pointer-events: none;" transform="translate(0,8)"><path d=" M0,0  L11,0 " transform="translate(2.5,7.5)"></path></g><g fill="#000000" style="pointer-events: none;" transform="translate(17,8)"><g display="none"></g></g></g><title id="id-3244-title">Zoom Out</title></g></g></g><g><g></g></g><g transform="translate(374,0)"><g></g></g></g></g><g><g></g></g><g transform="translate(0,150)"><g></g></g></g></g></g></g></g><desc id="id-3229-description">Chart</desc></g><g><g><g role="tooltip" visibility="hidden" opacity="0"><g fill="#ffffff" fill-opacity="0.9" stroke-width="1" stroke-opacity="1" stroke="#ffffff" filter="url(&quot;#filter-id-3263&quot;)" style="pointer-events: none;" transform="translate(0,6)"><path d="M3,0 L3,0 L0,-6 L13,0 L21,0 a3,3 0 0 1 3,3 L24,8 a3,3 0 0 1 -3,3 L3,11 a3,3 0 0 1 -3,-3 L0,3 a3,3 0 0 1 3,-3"></path></g><g><g fill="#ffffff" style="pointer-events: none;" transform="translate(12,6)"><g transform="translate(0,7)" display="none"></g></g></g></g><g visibility="hidden" display="none"><g fill="#ffffff" opacity="1"><rect width="404" height="180"></rect></g><g><g><g><g stroke-opacity="1" fill="#f3f3f3" fill-opacity="0.8"><g><g><path d=" M53,0  a53,53,0,0,1,-106,0 a53,53,0,0,1,106,0 M42,0  a42,42,0,0,0,-84,0 a42,42,0,0,0,84,0 L42,0 "></path></g></g></g><g stroke-opacity="1" fill="#000000" fill-opacity="0.2"><g><g><path d=""></path></g></g></g><g fill="#000000" fill-opacity="0.4"><g display="none"></g></g></g></g></g></g><g opacity="0.3" aria-labelledby="id-3278-title" filter="url(&quot;#filter-id-3278&quot;)" style="cursor: pointer;" transform="translate(0,159)"><g fill="#ffffff" opacity="0"><rect width="66" height="21"></rect></g><g><g shape-rendering="auto" fill="none" stroke-opacity="1" stroke-width="1.7999999999999998" stroke="#3cabff"><path d=" M15,15  C17.4001,15 22.7998,15.0001 27,15 C31.2002,14.9999 33.2999,6 36,6 C38.7001,6 38.6999,10.5 40.5,10.5 C42.3001,10.5 42.2999,6 45,6 C47.7001,6 50.9999,14.9999 54,15 C57.0002,15.0001 58.7999,15 60,15"></path></g><g shape-rendering="auto" fill="none" stroke-opacity="1" stroke-width="1.7999999999999998" stroke="url(&quot;#gradient-id-3281&quot;)"><path d=" M6,15  C8.2501,15 9.7498,15.0001 15,15 C20.2502,14.9999 20.7748,3.6 27,3.6 C33.2252,3.6 33.8998,14.9999 39.9,15 C45.9002,15.0001 45.9748,15 51,15 C56.0252,15 57.7499,15 60,15"></path></g></g><title id="id-3278-title">Chart created using amCharts library</title></g><g role="tooltip" visibility="hidden" opacity="0" transform="translate(105.65769356035767,78.45868333689927)"><g fill="#000000" fill-opacity="1" stroke-width="1" stroke-opacity="1" stroke="#000000" style="pointer-events: none;" transform="translate(-10,-15)"><path d="M0,0 L20,0 a0,0 0 0 1 0,0 L20,10 a0,0 0 0 1 -0,0 L20,10 L15,10 L10,15 L5,10 L0,10 a0,0 0 0 1 -0,-0 L0,0 a0,0 0 0 1 0,-0"></path></g><g><g fill="#ffffff" style="pointer-events: none;" transform="translate(0,-15)"><g transform="translate(0,5)" display="none"></g></g></g></g></g></g></g></g></svg>               
                <p style="
    position: absolute;
    margin-top: -76px;
    margin-left: 225px;
    font-size: 24px;
">38% EML</p>

                            </div>




                                      <div style="box-shadow: 0 0 1px rgba(0,0,0,.125), 0 1px 3px rgba(0,0,0,.2);position: absolute;margin-top: 605px;margin-left: 25px;zoom: 133%;width: 545px;height: 210px;" >
<span style="margin: 5px; "><i class="far fa-lightbulb"></i>&nbsp;Assessor's General Comments</span>
                                          <p style="padding:10px;font-size:12px">McDonalds does whatever it can (whatever is  'sensibly practicable ') to guarantee its laborers, customers and other individuals are not hurt by its exercises. McDonald’s is proud to be one of the most recognized brands in the world, with restaurants in over 100 countries and billions of customers served each year. As the global leader in the food service industry, we have a legacy of innovation and hard work that continues to drive us. Today, we are growing with velocity and are focused on modernizing our experiences, not to make a different McDonald’s, but to build a better McDonald’s </p>
                            </div>

             </page>







        <page size="A4">

                                 <div class="verticalLine5"></div>
            <p class="policyDetailsTitle"><i class="fas fa-ruler-combined"></i>&nbsp; Risk Classification Summary
                
                <span style="font-size: 12px;float: right;margin-left: 130px;"><i class="fas fa-diagnoses"></i> Assessed by John Foxx Assessors on 29-04-2020</span></p>
            <div class="verticalLine6"></div>

            	
             <table class="table table-striped" style="width: 727px;margin-top: 66px;position: absolute;margin-left: 28px;">
                 <thead>
                                                <tr>
                                                    <th>Factor</th>
                                                    <th>Rating</th>
                                                    <th>Reason</th>
                                                </tr>
                                            </thead>
                 <tbody>
                     
                     <tr>
                              <td><i class="fas fa-fire-extinguisher"></i>&nbsp;Fire</td>
                    <td><i class="fas fa-thermometer-three-quarters"></i> High Risk</td>
                    <td>Due to lack of inception.</td>
</tr>


                                          <tr>
                              <td><i class="fas fa-smog"></i>&nbsp;Smoke</td>
                    <td><i class="fas fa-thermometer-three-quarters"></i> High Risk</td>
                    <td>Due to contents of building.</td>
</tr>


                                                               <tr>
                              <td><i class="fas fa-bomb"></i>&nbsp;Explosion</td>
                    <td><i class="fas fa-thermometer-empty"></i> Low Risk</td>
                    <td>Due to pressurized cylinders on premises.</td>
</tr>

                                                               <tr>
                              <td><i class="fas fa-bomb"></i>&nbsp;Explosion</td>
                    <td><i class="fas fa-thermometer-empty"></i> Low Risk</td>
                    <td>Due to pressurized cylinders on premises.</td>
</tr>


                                                                                    <tr>
                              <td> <i class="fas fa-bolt"></i>&nbsp;Lightning</td>
                    <td><i class="fas fa-thermometer-empty"></i> Low Risk</td>
                    <td>Due to ground flash density of 0.4 in Umhlanga</td>
</tr>


                                                                                                         <tr>
                              <td> <i class="fas fa-cloud-showers-heavy"></i>&nbsp;Flood</td>
                    <td><i class="fas fa-thermometer-empty"></i> Low Risk</td>
                    <td>Due to high level above ocean and draining systems.</td>
</tr>


                                                                                                                              <tr>
                              <td> <i class="fas fa-cloud-showers-heavy"></i>&nbsp;Storm</td>
                    <td><i class="fas fa-thermometer-empty"></i> Low Risk</td>
                    <td>Due to good construction of building.</td>
</tr>





                                                                                                                                                                        <tr>
                              <td> <i class="fas fa-cloud-showers-heavy"></i>&nbsp;Electric</td>
                    <td><i class="fas fa-thermometer-half"></i> Moderate Risk</td>
                    <td>Due to no surge protection.</td>
</tr>


                                                                                                                                                                                             <tr>
                              <td> <i class="fas fa-shopping-basket"></i>&nbsp;Goods</td>
                    <td><i class="fas fa-thermometer-half"></i> Moderate Risk</td>
                    <td>Due to public setting and walk in customers.</td>
</tr>


                                                                                                                                                                                                                  <tr>
                              <td> <i class="fas fa-tree"></i>&nbsp;Falling Trees </td>
                    <td><i class="fas fa-thermometer-empty"></i> Low Risk</td>
                    <td>Due to no trees close to facility.</td>
</tr>
             
                     
                                                                                                                                                                                                                                       <tr>
                              <td> <i class="fas fa-hammer"></i>&nbsp;Malicious Damage</td>
                    <td><i class="fas fa-thermometer-full"></i> Severe Risk</td>
                    <td>Due to high crime rate in area. </td>
</tr>


                                                                                                                                                                                                                                                            <tr>
                              <td> <i class="fas fa-theater-masks"></i>&nbsp;Theft</td>
                    <td><i class="fas fa-thermometer-full"></i> Severe Risk</td>
                    <td>Due to high crime rate in area.</td>
</tr>
                    
                     
                                                                                                                                                                                                                                                                   <tr>
                              <td> <i class="fas fa-water"></i>&nbsp;Dams/Rivers</td>
                    <td><i class="fas fa-thermometer-empty"></i> Low Risk</td>
                    <td>No dams in area.</td>
</tr>

                 </tbody>
            </table>




         <div style="box-shadow: 0 0 1px rgba(0,0,0,.125), 0 1px 3px rgba(0,0,0,.2);position: absolute;margin-top: 565px;margin-left: 23px;zoom: 133%;width: 265px;height: 250px;">
                                <span style="margin: 5px;"><i class="fas fa-balance-scale-left"></i>&nbsp;Average Risk Rating</span>
                                            <div style="position:absolute;height:50px;width: 167px;margin-left: 40px;background:whitesmoke;margin-top: 28px;height: 160px;border-radius: 20px;"></div>
<i class="fas fa-thermometer-half" style="
    position: absolute;
    margin-top: 65px;
    font-size: 90px;
    margin-left: -80px;
"></i>

                                            <p style="position:absolute;margin-top: 140px;margin-left: 74px;">Moderate Risk</p>





                                        </div>



            <div style="box-shadow: 0 0 1px rgba(0,0,0,.125), 0 1px 3px rgba(0,0,0,.2);position: absolute;margin-top: 565px;margin-left: 300px;zoom: 133%;width: 265px;height: 250px;">
                                <span style="margin: 5px;"><i class="fas fa-atlas"></i>&nbsp;Risk Comparison</span>


              <div style="position:absolute;height:50px;width: 167px;margin-left: 40px;background:whitesmoke;margin-top: 28px;height: 160px;border-radius: 20px;"></div>
<i class="far fa-thumbs-up" style="
    position: absolute;
    margin-top: 65px;
    font-size: 90px;
    margin-left: -68px;
"></i>

                                            <p style="position:absolute;margin-top: 140px;margin-left: 58px;"><i style="color:green" class="fas fa-caret-down"></i> 14% Lower Risk</p>


                                        </div>



              </page>










        <page size="A4">

                                 <div class="verticalLine5"></div>
            <p class="policyDetailsTitle"><i class="fas fa-balance-scale-right"></i>&nbsp;Financial Risk<span style="font-size: 12px;float: right;margin-left: 284px;"><i class="fas fa-diagnoses"></i> Assessed by John Foxx Assessors on 29-04-2020</span></p>
            <div class="verticalLine6"></div>



            <div style="box-shadow: 0 0 1px rgba(0,0,0,.125), 0 1px 3px rgba(0,0,0,.2);margin: 10px;margin-top: 74px;position: absolute;width: 738px;margin-left: 27px;">
                                                
                                                <div>
                                                    <legend style="padding: 5px"><i class="fas fa-fire-extinguisher"></i>&nbsp; Fire</legend>
                                                    <table class="table table-striped" id="tblPolicyDetailsFire" style="zoom: 100% !important">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 350px">Elements</th>
                                                                <th style="width: 350px">Covered</th>
                                                                <th style="width: 350px">Sums Insured</th>
                                                                <th style="width: 350px">MPL</th>
                                                                <th style="width: 350px">EML</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>Plant and Machinery</td>
                                                                <td>Yes
                                                                </td>
                                                                <td>R85000.33
                                                                </td>
                                                                <td>R52700.73
                                                                </td>
                                                                <td>R31577.44
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Building(s)</td>
                                                                <td>Yes
                                                                </td>
                                                                <td>R144856.37
                                                                </td>
                                                                <td>R89810.73
                                                                </td>
                                                                <td>R49405.36
                                                                </td>
                                                            </tr>
                                                           
                                                        </tbody>
                                                    </table>
                                                </div>

                                                 
                                                <div>
                                                    <legend style="padding: 5px"><i class="fas fa-city"></i>&nbsp;Buildings Combined</legend>
                                                    <table class="table table-striped" id="tblBuildingsCombined" style="zoom: 100% !important">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 350px">Elements</th>
                                                                <th style="width: 350px">Covered</th>
                                                                <th style="width: 350px">Sums Insured</th>
                                                                <th style="width: 350px">MPL</th>
                                                                <th style="width: 350px">EML</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
 <tr>
                                                                <td>Building(s)</td>
                                                                <td>Yes
                                                                </td>
                                                                <td>R144856.37
                                                                </td>
                                                                <td>R89810.73
                                                                </td>
                                                                <td>R49405.36
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td>Inflation</td>
                                                               <td>Yes
                                                                </td>
                                                                <td>R78000.00
                                                                </td>
                                                                <td>R48360.00
                                                                </td>
                                                                <td>R45175.33
                                                                </td>
                                                            </tr>

                                                        </tbody>
                                                    </table>
                                                
                                            </div>

                      <div>
<legend style="padding: 5px"><i class="fas fa-radiation-alt"></i>&nbsp; Business Interruption</legend>
                          <table class="table table-striped" id="tblBuildingsCombined" style="zoom: 100% !important">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 350px">Elements</th>
                                                                <th style="width: 350px">Covered</th>
                                                                <th style="width: 350px">Sums Insured</th>
                                                                <th style="width: 350px">MPL</th>
                                                                <th style="width: 350px">EML</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>PUB / Utilities</td>
                                                                <td>Yes
                                                                </td>
                                                                <td>R14586.55
                                                                </td>
                                                                <td>R81749.22
                                                                </td>
                                                                <td>R5476.11
                                                                </td>
                                                            </tr>
                                                            
                                                        </tbody>
                                                    </table>
                                                
                                            </div>

                   <div>
<legend style="padding: 5px"><i class="fas fa-clipboard-list"></i>&nbsp; Other</legend>
                       <table class="table table-striped" id="tblBuildingsCombined" style="zoom: 100% !important">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 350px">Elements</th>
                                                                <th style="width: 350px">Covered</th>
                                                                <th style="width: 350px">Sums Insured</th>
                                                                <th style="width: 350px">MPL</th>
                                                                <th style="width: 350px">EML</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>BAR (Business All Risk)</td>
                                                                <td>Yes
                                                                </td>
                                                                <td>R689754.07
                                                                </td>
                                                                <td>R485987.37
                                                                </td>
                                                                <td>R262543.21
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Machinery Breakdown	</td>
                                                                 <td>Yes
                                                                </td>
                                                                <td>R78000.00
                                                                </td>
                                                                <td>427647.00
                                                                </td>
                                                                <td>R293974.33
                                                                </td>
                                                            </tr>
                                                           
                                                        </tbody>
                                                    </table>
                                            </div>


                                   <div>
<legend style="padding: 5px"><i class="fas fa-calculator"></i>&nbsp; Total</legend>
                       <table class="table table-striped" id="tblBuildingsCombined" style="zoom: 100% !important">
                                                       
                                                        <tbody>
                                                            <tr>
                                                                <td>Total</td>
                                                                <td style="width: 195px;">
                                                                </td>
                                                                <td>R1254966.76
                                                                </td>
                                                                <td>R778079,40
                                                                </td>
                                                                <td>R401589.21
                                                                </td>
                                                            </tr>
                                                            
                                                        </tbody>
                                                    </table>
                                            </div>




                                        </div>




             </page>


        <div style="width: 29.7cm; height: 21cm; background: white; display: block; margin: 0 auto; margin-bottom: 0.30cm; box-shadow: 0 0 0.5cm rgba(0,0,0,0.5);">

            <div class="verticalLine5" style="width: 1075px;">
            </div>
            <p class="policyDetailsTitle">
                <i class="fas fa-clipboard-list"></i>&nbsp; Requirements and Recommendations
                
                <span style="font-size: 12px; float: right; margin-left: 380px;"><i class="fas fa-diagnoses"></i>Assessed by John Foxx Assessors on 29-04-2020</span>
            </p>
            <div class="verticalLine6" style="width: 1075px;">
            </div>


            <table class="table table-striped" style="width: 1073px; margin-top: 66px; position: absolute; margin-left: 28px;">
                <thead>
                    <tr>
                        <th style="width: 228px;"><i class="fas fa-eye"></i>&nbsp;Area Of Observation</th>
                        <th style="width: 108px;"><i class="fas fa-tachometer-alt"></i>&nbsp;Priority</th>
                        <th><i class="far fa-clipboard"></i>&nbsp;Detail</th>
                        <th style="width: 118px;"><i class="fas fa-business-time"></i>&nbsp;Deadline</th>
                    </tr>
                </thead>
                <tbody>

                    <tr>
                        <td>GAS INSTALLATIONS</td>
                        <td><i style="color: red" class="far fa-hand-point-up"></i>HIGH</td>
                        <td>It is recommended that a separate Gas
Cage be constructed and that all empty
gas bottles be housed in a separate area.   
                        </td>
                        <td>One Month
                        </td>
                    </tr>



                    <tr>
                        <td>FIRE</td>
                        <td><i style="color: red" class="far fa-hand-point-up"></i>HIGH</td>
                        <td>Fire Drills should be continued and carried
out at least every two months and all staff aware of risks associated and equipped with expertise to minimise fire in the event of occurrence. Staff admitted they've never did fire drill training.
 
                        </td>
                        <td>One Week
                        </td>
                    </tr>


                    <tr>
                        <td>PARKING</td>
                        <td><i style="color: red" class="far fa-hand-point-up"></i>HIGH</td>
                        <td>Customers are parking to close to the glass wall. There need be clear parking indicators for customers.
 
                        </td>
                        <td>One Month
                        </td>
                    </tr>

                    <tr>
                        <td>OCCUPATIONAL HEALTH</td>
                        <td><i style="color: red" class="far fa-hand-point-up"></i>HIGH</td>
                        <td>Staff don't wash their hands. If a customer eat dirty food, customer can get sick. Also no place for eye washing if staff touches chilli powder then eyes.
 
                        </td>
                        <td>One Month
                        </td>
                    </tr>

                    <tr>
                        <td>COVID19 Distance Markers</td>
                        <td><i style="color: green" class="far fa-hand-point-down"></i>LOW</td>
                        <td>There is no markers to keep staff in line.
 
                        </td>
                        <td>Six Months
                        </td>
                    </tr>







                </tbody>
            </table>





        </div>



        <div style="width: 29.7cm; height: 21cm; background: white; display: block; margin: 0 auto; margin-bottom: 0.30cm; box-shadow: 0 0 0.5cm rgba(0,0,0,0.5);">

            <div class="verticalLine5" style="width: 1075px;">
            </div>
            <p class="policyDetailsTitle">
                <i class="far fa-images"></i>&nbsp; Gallery
                
                <span style="font-size: 12px; float: right; margin-left: 695px;"><i class="fas fa-diagnoses"></i>Assessed by John Foxx Assessors on 29-04-2020</span>
            </p>
            <div class="verticalLine6" style="width: 1075px;">
            </div>


            <style>
                div.gallery {
                    margin: 5px;
                    border: 1px solid #ccc;
                    float: left;
                    width: 200px;
                }

                    div.gallery:hover {
                        border: 1px solid #777;
                    }

                    div.gallery img {
                        width: 100%;
                        height: auto;
                    }

                div.desc {
                    padding: 15px;
                    text-align: center;
                }
            </style>


            <div style="position: absolute; margin-top: 109px; margin-left: 26px;">

                <div class="gallery">
                    <a target="_blank" href="img_5terre.jpg">
                        <img src="https://live.staticflickr.com/2149/2203214089_bdd09b18c4_b.jpg" alt="Cinque Terre" width="650" height="450">
                    </a>
                    <div class="desc">Store</div>
                </div>

                <div class="gallery">
                    <a target="_blank" href="img_forest.jpg">
                        <img src="https://worldcowgirl.files.wordpress.com/2011/08/img_1246.jpg" alt="Forest" width="650" height="450">
                    </a>
                    <div class="desc">Store</div>
                </div>

                <div class="gallery">
                    <a target="_blank" href="img_lights.jpg">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ5jRrMjgWBL7d1K0rFRLVrMwnd6Coj8xuUIjTFxqjoTMzsSDs5&usqp=CAU" alt="Northern Lights" width="650" height="450">
                    </a>
                    <div class="desc">Kitchen</div>
                </div>

                <div class="gallery">
                    <a target="_blank" href="img_mountains.jpg">
                        <img src="https://media.glassdoor.com/l/c3/a7/74/cd/kitchen.jpg" alt="Mountains" width="650" height="450">
                    </a>
                    <div class="desc">Kitchen</div>
                </div>

                <div class="gallery">
                    <a target="_blank" href="img_mountains.jpg">
                        <img src="data:image/jpeg;base64,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" alt="Mountains" width="650" height="450">
                    </a>
                    <div class="desc">Outside</div>
                </div>

            </div>



            <div style="position: absolute; margin-top: 309px; margin-left: 26px;">

                <div class="gallery">
                    <a target="_blank" href="img_5terre.jpg">
                        <img src="https://live.staticflickr.com/2149/2203214089_bdd09b18c4_b.jpg" alt="Cinque Terre" width="650" height="450">
                    </a>
                    <div class="desc">Store</div>
                </div>

                <div class="gallery">
                    <a target="_blank" href="img_forest.jpg">
                        <img src="https://worldcowgirl.files.wordpress.com/2011/08/img_1246.jpg" alt="Forest" width="650" height="450">
                    </a>
                    <div class="desc">Store</div>
                </div>

                <div class="gallery">
                    <a target="_blank" href="img_lights.jpg">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ5jRrMjgWBL7d1K0rFRLVrMwnd6Coj8xuUIjTFxqjoTMzsSDs5&usqp=CAU" alt="Northern Lights" width="650" height="450">
                    </a>
                    <div class="desc">Kitchen</div>
                </div>

                <div class="gallery">
                    <a target="_blank" href="img_mountains.jpg">
                        <img src="https://media.glassdoor.com/l/c3/a7/74/cd/kitchen.jpg" alt="Mountains" width="650" height="450">
                    </a>
                    <div class="desc">Kitchen</div>
                </div>

                <div class="gallery">
                    <a target="_blank" href="img_mountains.jpg">
                        <img src="data:image/jpeg;base64,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" alt="Mountains" width="650" height="450">
                    </a>
                    <div class="desc">Outside</div>
                </div>

            </div>


            <div style="position: absolute; margin-top: 509px; margin-left: 26px;">

                <div class="gallery">
                    <a target="_blank" href="img_5terre.jpg">
                        <img src="https://live.staticflickr.com/2149/2203214089_bdd09b18c4_b.jpg" alt="Cinque Terre" width="650" height="450">
                    </a>
                    <div class="desc">Store</div>
                </div>

                <div class="gallery">
                    <a target="_blank" href="img_forest.jpg">
                        <img src="https://worldcowgirl.files.wordpress.com/2011/08/img_1246.jpg" alt="Forest" width="650" height="450">
                    </a>
                    <div class="desc">Store</div>
                </div>

                <div class="gallery">
                    <a target="_blank" href="img_lights.jpg">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ5jRrMjgWBL7d1K0rFRLVrMwnd6Coj8xuUIjTFxqjoTMzsSDs5&usqp=CAU" alt="Northern Lights" width="650" height="450">
                    </a>
                    <div class="desc">Kitchen</div>
                </div>

                <div class="gallery">
                    <a target="_blank" href="img_mountains.jpg">
                        <img src="https://media.glassdoor.com/l/c3/a7/74/cd/kitchen.jpg" alt="Mountains" width="650" height="450">
                    </a>
                    <div class="desc">Kitchen</div>
                </div>

                <div class="gallery">
                    <a target="_blank" href="img_mountains.jpg">
                        <img src="data:image/jpeg;base64,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" alt="Mountains" width="650" height="450">
                    </a>
                    <div class="desc">Outside</div>
                </div>

            </div>






        </div>



        <div class="aspNetHidden">

            <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="A9D2CA6C">
        </div>

    </form>--%>
    <style type="text/css">
        .imgLogo {
            width: 210px;
        }


        .policyDetailsTitle {
            position: absolute;
            color: black;
            margin-top: 23px;
            font-size: 22px;
            margin-left: 28px;
        }

        .verticalLine5 {
            height: 2px;
            width: 729px;
            background: gold;
            position: absolute;
            margin-top: 20px;
            margin-left: 28px;
        }



        .verticalLine6 {
            height: 2px;
            width: 729px;
            background: gold;
            position: absolute;
            margin-top: 58px;
            margin-left: 28px;
        }

        .riskaddressesTitle {
            position: absolute;
            color: black;
            margin-top: 11px;
            font-size: 22px;
            margin-left: 28px;
        }

        .verticalLine3 {
         height: 2px;
    width: 1062px;
    background: gold;
    position: absolute;
    margin-top: 10px;
    margin-left: 28px;
        }



        .verticalLine4 {
              height: 2px;
    width: 1062px;
    background: gold;
    position: absolute;
    margin-top: 45px;
    margin-left: 28px;
        }


        .generalinformationTitle {
            position: absolute;
            color: black;
            margin-top: 240px;
            font-size: 22px;
            margin-left: 28px;
        }

        .verticalLine1 {
            height: 2px;
            width: 729px;
            background: gold;
            position: absolute;
            margin-top: 238px;
            margin-left: 28px;
        }



        .verticalLine2 {
            height: 2px;
            width: 729px;
            background: gold;
            position: absolute;
            margin-top: 273px;
            margin-left: 28px;
        }


        .imgLogoContainer {
            position: absolute;
            width: auto;
            margin-top: 20px !important;
            margin-left: 20px;
        }

        .assessmentTitle1 {
            color: gold;
            font-size: 44px;
            position: absolute;
            margin-top: 110px;
            margin-left: 28px;
            font-family: arial,sans-serif-light,sans-serif;
        }


        .assessmentTitle3 {
            color: gray;
            font-size: 44px;
            position: absolute;
            margin-top: 160px;
            margin-left: 30px;
            font-family: arial,sans-serif-light,sans-serif;
        }

        .assessmentTitle2 {
            color: black;
            font-size: 34px;
            position: absolute;
            margin-top: 30px;
            margin-left: 462px;
            font-family: arial,sans-serif-light,sans-serif;
        }
    </style>
</body>
</html>
