<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExecutiveReport.aspx.cs" Inherits="Mitig8.documents.ExecutiveReport" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link href="https://fonts.googleapis.com/css?family=Libre+Barcode+128&display=swap" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/././plugins/fontawesome-free/css/all.min.css">
     <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha256-4+XzXVhsDmqanXGHaHvgh1gMQKX40OUvDEBTu8JcmNs=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

    <!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
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

        page {
            background: white;
            display: block;
            margin: 0 auto;
            margin-bottom: 0.30cm;
            box-shadow: 0 0 0.5cm rgba(0,0,0,0.5);
        }

            page[size="A4"] {
                width: 21cm;
                height: 33.5cm;
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

    <style type="text/css">
        * {
            box-sizing: border-box;
        }

        .fab-wrapper {
            position: fixed;
            bottom: 3rem;
            right: 3rem;
        }

        .fab-checkbox {
            display: none;
        }

        .fab {
            cursor:pointer !important;
            position: absolute;
            bottom: -1rem;
            right: -1rem;
            width: 4rem;
            height: 4rem;
            background: #ffc107;
            border-radius: 50%;
            background: #ffc107;
            box-shadow: 0px 5px 20px#ffc107;
            transition: all 0.3s ease;
            z-index: 1;
            border-bottom-right-radius: 6px;
            border: 1px solid #ffc107;
        }

            .fab:before {
                content: "";
                position: absolute;
                width: 100%;
                height: 100%;
                left: 0;
                top: 0;
                border-radius: 50%;
                background-color: rgba(255, 255, 255, 0.1);
            }

        .fab-checkbox:checked ~ .fab:before {
            width: 90%;
            height: 90%;
            left: 5%;
            top: 5%;
            background-color: rgba(255, 255, 255, 0.2);
        }

        .fab:hover {
            background: #ffc107;
            box-shadow: 0px 5px 20px 5px #ffc107;
        }

        .fab-dots {
            position: absolute;
            height: 8px;
            width: 8px;
            border-radius: 50%;
            top: 40%;
            margin-left:25px;
            opacity: 1;
            animation: blink 3s ease infinite;
            transition: all 0.3s ease;
        }

        .fab-dots-1 {
            left: 15px;
            animation-delay: 0s;
        }

        .fab-dots-2 {
            left: 50%;
            transform: translateX(-50%) translateY(-50%);
            animation-delay: 0.4s;
        }

        .fab-dots-3 {
            right: 15px;
            animation-delay: 0.8s;
        }

        .fab-checkbox:checked ~ .fab .fab-dots {
            height: 6px;
        }

        .fab .fab-dots-2 {
            transform: translateX(-50%) translateY(-50%) rotate(0deg);
        }

        .fab-checkbox:checked ~ .fab .fab-dots-1 {
            width: 32px;
            border-radius: 10px;
            left: 50%;
            transform: translateX(-50%) translateY(-50%) rotate(45deg);
        }

        .fab-checkbox:checked ~ .fab .fab-dots-3 {
            width: 32px;
            border-radius: 10px;
            right: 50%;
            transform: translateX(50%) translateY(-50%) rotate(-45deg);
        }

        @keyframes blink {
            50% {
                opacity: 0.25;
            }
        }

        .fab-checkbox:checked ~ .fab .fab-dots {
            animation: none;
        }

        .fab-wheel {
            position: absolute;
            bottom: 0;
            right: 0;
            border: 1px solid #;
            width: 10rem;
            height: 10rem;
            transition: all 0.3s ease;
            transform-origin: bottom right;
            transform: scale(0);
        }

        .fab-checkbox:checked ~ .fab-wheel {
            transform: scale(1);
        }

        .fab-action {
            position: absolute;
            background: #ffc107;
            width: 3rem;
            height: 3rem;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: black;
            box-shadow: 0 0.1rem 1rem #ffc107;
            transition: all 1s ease;
            opacity: 0;
        }

        .fab-checkbox:checked ~ .fab-wheel .fab-action {
            opacity: 1;
        }

        .fab-action:hover {
            background-color: #ffc107;
        }

        .fab-wheel .fab-action-1 {
            right: -1rem;
            top: 0;
        }

        .fab-wheel .fab-action-2 {
            right: 3.4rem;
            top: 0.5rem;
        }

        .fab-wheel .fab-action-3 {
            left: 0.5rem;
            bottom: 3.4rem;
        }

        .fab-wheel .fab-action-4 {
            left: 0;
            bottom: -1rem;
        }


        .sv-container-modern__title h3 {
            color: black;
        }

        .sv-root-modern .sv-container-modern__title {
            color: #ffc107;
        }

        .sv-root-modern .sv-footer__next-btn {
            color: black;
            background-color: #ffc107;
        }

        .sv-root-modern .sv-boolean__switch {
            color: black;
            background-color: #ffc107;
        }

        .sv-root-modern .sv-footer__prev-btn {
            color: black;
            background-color: #ffc107;
        }

        .sv-root-modern .sv-matrixdynamic__add-btn {
            color: black;
            background-color: #ffc107;
        }
    </style>
</head>
<body>
    <script>
        $(document).ready(() => {
                $('.fab-wrapper').click(() => {

                    setTimeout(() => {

                        $('#<%=btnInitializeAddReviewMessage.ClientID.ToString()%>').click();
                    }, 200);
        });

        });
    
        

    </script>
    
    <form id="frmAssessmentDetails" runat="server">
        <asp:ScriptManager runat="server" ID="scmExecutiveReport"></asp:ScriptManager>
        <div class="fab-wrapper" runat="server" id="fabSpecialist">
        <input id="fabCheckbox" type="checkbox" class="fab-checkbox">
        <label class="fab" for="fabCheckbox">
          <%--  <span class="fab-dots fab-dots-1"></span>
            <span class="fab-dots fab-dots-2"></span>
            <span class="fab-dots fab-dots-3"></span>--%>


            <i class="fab-dots fas fa-check-double"></i>
        </label>
        <%--   <div class="fab-wheel">
              <a id="btnRequirements" class="fab-action fab-action-1">
                <i class="fas fa-clipboard-list"></i>
             </a>
              <a id="btnJournal" class="fab-action fab-action-2">
                <i class="fas fa-book"></i>
              </a>
                  <a id="btnSaveSurvey" class="fab-action fab-action-3">
                    <i class="far fa-save"></i>
              </a>
                  <a id="btnSupport" class="fab-action fab-action-4">
                    <i class="fas fa-headset"></i>
              </a>--%>
            </div>
    </div>
        <div class="modal" id="mdlAddReviewMessage"  style="top: 50px;">
    <div class="modal-dialog" style="min-width: 550px !important"">
        <div class="modal-content" >
            <asp:UpdatePanel runat="server" ID="UpdatePanel8" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:Button runat="server" style="display:none" ID="btnInitializeAddReviewMessage" OnClick="btnInitializeAddReviewMessage_Click" />
                    <asp:HiddenField runat="server" ID="vAssessmentReviewID" />
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="far fa-comment-dots"></i>&nbsp;<asp:Literal runat="server" ID="lblAddReviewMessageTitle" Text="Add Review"></asp:Literal></h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <span>Survey Category</span>
                            <asp:DropDownList runat="server" Width="100%" Height="28px" ID="cmbReviewSurveyCategory" ></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <span>Review</span>
                            <asp:TextBox runat="server" TextMode="MultiLine" Width="100%" Height="185px" ID="txtReviewText" placeholder="Please add your comments here..."></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer"> 
                        <asp:Button style="float:left !important" data-dismiss="modal" runat="server" CssClass="btn btn-warning pull-right" Text="Close" />
                        <asp:Button style="float:left !important"  runat="server" CssClass="btn btn-success pull-right" Text="Add" ID="btnAddReview" OnClick="btnAddReview_Click" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->


        <div>
        <asp:Literal runat="server" ID="litExecutiveReport"></asp:Literal>

            </div>











-





    </form>

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
