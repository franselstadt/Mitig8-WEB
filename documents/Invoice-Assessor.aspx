<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Invoice-Assessor.aspx.cs" Inherits="Mitig8.documents.Invoice_Assessor" %>


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
            font-size: 28px;
            position: absolute;
            margin-top: 30px;
            margin-left: 520px;
            font-family: arial,sans-serif-light,sans-serif;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <asp:Literal runat="server" ID="litInvoice"></asp:Literal>
      
    </form>


</body>
</html>
