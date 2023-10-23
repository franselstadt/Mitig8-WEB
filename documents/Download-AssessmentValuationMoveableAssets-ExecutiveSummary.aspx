<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Download-AssessmentValuationMoveableAssets-ExecutiveSummary.aspx.cs" Inherits="Mitig8.documents.Download_AssessmentValuationMoveableAssets_ExecutiveSummary" %>



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

        G

        body {
            background: rgb(204,204,204);
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

   
    <style type="text/css">
   .imgLogo {
            width: 210px;
        }


        .policyDetailsTitle {
            position: absolute;
            color: #015959;
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
            color: #015959;
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
            color: #015959;
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
            color: #015959;
            font-size: 34px;
            position: absolute;
            margin-top: 30px;
            margin-left: 462px;
            font-family: arial,sans-serif-light,sans-serif;
        }
    </style>
</body>
</html>
