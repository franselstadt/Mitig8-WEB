<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserReport.aspx.cs" Inherits="Mitig8.documents.UserReport" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Invoice</title>
    <link href="https://fonts.googleapis.com/css?family=Libre+Barcode+128&display=swap" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/././plugins/fontawesome-free/css/all.min.css">
    <style type="text/css">
        .imgLogo {
            width: 210px;
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
            margin-top: 100px;
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
            margin-left: 550px;
            font-family: arial,sans-serif-light,sans-serif;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <page size="A4">



            <div class="imgLogoContainer"><img class="imgLogo" src="/././images/logo-full-black.png" /></div>
            <p class="assessmentTitle2"><i class="fas fa-gem"></i>&nbsp;Invoice: 1</p>  
                        <p style="position: absolute;margin-top: 70px;margin-left: 600px;" class="assessmentTitle4">Reference: xxxxx</p>  

            <p class="assessmentTitle1">With us, hard work is rewarded</p>
            <p class="assessmentTitle3">immediately!</p>

        <div runat="server" id="invoiceContainer" class="container" style="margin-top: 225px;position: absolute;width: 805px;">
            <div class="card">
                <div class="card-header">
                    <strong>Date:</strong>
                    2020/04/04


                   <span style="margin-left: 125px;"><strong>Transaction:</strong>48798589</span>

                    <span class="float-right"><strong>Status:</strong>Payment Pending</span>

                </div>
                <div class="card-body">
                    <div class="row mb-4">
                        <div class="col-sm-6">
                            <h6 class="mb-3">From:</h6>
                            <div>
                                <strong>John Foxx Surveyors</strong>
                                <div><i>2003/57878545/54</i></div>
                                <div><i>VAT 45898458</i></div>
                            </div>
                            <br />
                            <div><i class="fas fa-map-marker-alt"></i> 11 Tuple Street</div>
                            <div><i class="fas fa-map-marker-alt"></i> Muizenberg, Western Cape</div>
                            <div><i class="far fa-envelope"></i> Email:  john@wizards.co.za</div>
                            <div><i class="fas fa-phone-alt"></i> Phone:  082 014 4784</div>
                            <div><i class="fas fa-wallet"></i> Wallet: 5914569783</div>
                        </div>

                      <div class="col-sm-6">
                            <h6 class="mb-3">To:</h6>
                            <div>
                                <strong>Mitig8 (Pty) Ltd.</strong>
                                <div><i>2019/57878545/54</i></div>
                                <div><i>VAT 154889785</i></div>
                            </div>
                            <br />
                            <div><i class="fas fa-map-marker-alt"></i> Durban North</div>
                            <div><i class="fas fa-map-marker-alt"></i> Durban, KwaZulu-Natal</div>
                            <div><i class="far fa-envelope"></i> Email:  billing@mitig8.co.za</div>
                            <div><i class="fas fa-phone-alt"></i> Phone:  111 111 1111</div>
                            <div><i class="fas fa-wallet"></i> Wallet: 1456987562</div>
                        </div>



                    </div>

                    <div class="table-responsive-sm">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Assessment</th>
                                    <th>Description</th>
                                                                        <th class="right">Date Complete</th>

                                    <th class="right">Service Cost</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="left strong">14</td>
                                    <td class="left">Comercial Property</td>
                                                                        <td class="left">2020/04/03</td>

                                    <td class="right">R10000.00</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 col-sm-5">
                        </div>

                        <div class="col-lg-4 col-sm-5 ml-auto">
                            <table class="table table-clear">
                                <tbody>
                                    <tr>
                                        <td class="left">
                                            <strong>VAT (15%)</strong>
                                        </td>
                                        <td class="right">R1500</td>
                                    </tr>
                                    <tr>
                                        <td class="left">
                                            <strong>Total</strong>
                                        </td>
                                        <td class="right">
                                            <strong>R11500</strong>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                        </div>

                    </div>

                </div>
            </div>
        </div>
            </page>

    </form>


</body>
</html>
