<%@ Page Language="C#" AutoEventWireup="true" CodeFile="x.aspx.cs" Inherits="Mitig8.RunSurvey.Survey" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
        <title>Mitig8</title>
        <meta name="viewport" content="width=device-width"/>
        <script src="https://unpkg.com/jquery"></script>
        <script src="survey.jquery.js"></script>
        <link href="modern.css" type="text/css" rel="stylesheet"/>
        <script src="jspdf.min.js"></script>
        <script src="survey.pdf.js"></script>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css" integrity="sha384-Bfad6CLCknfcloXFOyFnlgtENryhrpZCe29RTifKEixXQZ38WheV+i/6YWSzkz3V" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" integrity="sha384-1CmrxMRARb6aLqgBO7yyAxTOQE2AKb9GfXnEo760AUcUmFx3ibVJJAzGytlQcNXd" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

    </head>
<body>
        <script>
        $(document).ready(() => {
                $('#fabSpecialist').click(() => {

                    setTimeout(() => {

                        $('#<%=btnInitializeAddReviewMessage.ClientID.ToString()%>').click();
                    }, 200);
        });

        });
    
        

    </script>
    <form id="form1" runat="server">
                <asp:ScriptManager runat="server" ID="scmExecutiveReport"></asp:ScriptManager>

       <button onclick="saveSurveyToPdf('Assessment<%=vAssessmentID.Value.ToString() %>.pdf', survey, 'saveAsString');return false;" style="margin:10px">Save as File</button>
          <%--<button id="saveAsStringBtn" style="margin:10px">Save as String</button>
        <button id="saveAsBlobBtn" style="margin:10px">Save as Blob</button>
        <button id="pdfPreviewBtn" style="margin:10px">PDF Preview</button> --%>
        <img src="http://web.mitig8.co.za/images/logo-full.png" style="
        width: 260px;
        padding: 20px;
        margin-left: 40%;
        margin-right: auto;
    ">       
    
                <asp:HiddenField Value="0" runat="server" ID="vModeID" />

        <asp:HiddenField runat="server" ID="vSurveyID" />
        <asp:HiddenField runat="server" ID="vAssessmentID" />
        <asp:HiddenField runat="server" ID="vUserID" />
        <asp:HiddenField runat="server" ID="vJSON" />
            <asp:HiddenField runat="server" ID="vJSONDOWNLOAD" />
                <asp:HiddenField runat="server" ID="vState" />



        <div id="pdf-preview"></div>
        <div id="surveyElement" style="display:inline-block;width:100%;"></div>
        <div id="surveyResult"></div>







                <div class="fab-wrapper" runat="server" id="fabSpecialist">
        <input id="fabCheckbox-2" type="checkbox" class="fab-checkbox">
        <label class="fab" for="fabCheckbox-2">
          <%--  <span class="fab-dots fab-dots-1"></span>
            <span class="fab-dots fab-dots-2"></span>
            <span class="fab-dots fab-dots-3"></span>--%>


            <i class="fab-dots-specialist fas fa-check-double"></i>
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



    </div>





                <div class="fab-wrapper" runat="server" id="fabAssessor">
            <input id="fabCheckbox-1" type="checkbox" class="fab-checkbox" />
            <label class="fab" for="fabCheckbox-1">
              <span class="fab-dots fab-dots-1"></span>
              <span class="fab-dots fab-dots-2"></span>
              <span class="fab-dots fab-dots-3"></span>
            </label>
            <div class="fab-wheel">
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
              </a>
            </div>
          </div>

          <div id="mdlRequirements" class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h6 class="modal-title"><i class="fas fa-clipboard-list"></i>&nbsp; Requirements and Recommendations</h6>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <span>Area of Observation</span>
                        <input name="Assessment$RequirementAndRecommendations$txtAreaOfObservation" type="text" id="Assessment_RequirementAndRecommendations_txtAreaOfObservation" class="form-control" style="height:28px;width:100%;">
                    </div>
                    <div class="form-group">
                        <span>Priority</span>
                        <select name="Assessment$RequirementAndRecommendations$cmbRiskRating" id="Assessment_RequirementAndRecommendations_cmbRiskRating" class="form-control select2-hidden-accessible"  tabindex="-1" aria-hidden="true">
    <option value="1" data-select2-id="155">High Priority</option>
    <option value="2" data-select2-id="156">Severe Priority</option>
    <option value="3">Moderate Priority</option>
    <option value="4">Low Priority</option>
</select>

                    </div>


                    <div class="form-group">
                        <span>Deadline</span>
                        <select name="Assessment$RequirementAndRecommendations$cmbRiskRating" id="Assessment_RequirementAndRecommendations_cmbRiskRating" class="form-control select2-hidden-accessible"  tabindex="-1" aria-hidden="true">
    <option value="1" data-select2-id="155">1 Week</option>
    <option value="2" data-select2-id="156">1 Month</option>
    <option value="2" data-select2-id="157">3 Months</option>
    <option value="2" data-select2-id="158">6 Months</option>
    <option value="2" data-select2-id="158">1 Year</option>
</select>

                    </div>
                    <div class="form-group">
                        <span>Detail of Requirement/Recommendation</span>
                        <textarea name="Assessment$RequirementAndRecommendations$txtDetail" rows="2" cols="20" id="Assessment_RequirementAndRecommendations_txtDetail" class="form-control" style="height:65px;width:100%;"></textarea>
                    </div>


                    <form ">
                      <label for="myfile">Select picture or document:</label>
                      <input type="file" id="myfile" name="myfile" multiple><br><br>
                    </form>
                    

                </div>
                <div class="modal-footer">
                  <button id="btnAddRequirement" type="button" class="btn btn-primary">Add</button>
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
              </div>
            </div>
          </div>


        <script type="text/javascript" src="./index.js"></script>

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
                background-color: black;
                border-radius: 50%;
                top: 50%;
                transform: translateX(0%) translateY(-50%) rotate(0deg);
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

        .fab-dots-specialist {
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
        </style>

        <script type="text/javascript">
            $(document).ready(() => {
                $('#btnRequirements').click(() => {
                    $('#mdlRequirements').modal('show');
                });


                $('#btnSaveSurvey').click(() => {
                    let timerInterval
                    Swal.fire({
                        title: 'Saving survey',
                        html: 'sync in progress',
                        timer: 5000,
                        timerProgressBar: true,
                        onBeforeOpen: () => {
                            Swal.showLoading()
                            timerInterval = setInterval(() => {
                                const content = Swal.getContent()
                                if (content) {
                                    const b = content.querySelector('b')
                                    if (b) {
                                        b.textContent = Swal.getTimerLeft()
                                    }
                                }
                            }, 100)
                        },
                        onClose: () => {
                            clearInterval(timerInterval)
                        }
                    }).then((result) => {
                        /* Read more about handling dismissals below */
                        if (result.dismiss === Swal.DismissReason.timer) {
                            console.log('I was closed by the timer')
                        }
                    });

                    setTimeout(() => {
                        Swal.fire(
                            'Saved successfully!',
                            'Your survey was saved successfully',
                            'success'
                        );
                    }, 5500);

                });
            });



            $('#btnJournal').click(() => {
                Swal.fire('Comming soon');

            });

            $('#btnSupport').click(() => {
                Swal.fire('Comming soon');

            });

            $('#btnAddRequirement').click(() => {
                let timerInterval
                Swal.fire({
                    title: 'Saving reccomendation',
                    html: 'syncing with database',
                    timer: 1500,
                    timerProgressBar: true,
                    onBeforeOpen: () => {
                        Swal.showLoading()
                        timerInterval = setInterval(() => {
                            const content = Swal.getContent()
                            if (content) {
                                const b = content.querySelector('b')
                                if (b) {
                                    b.textContent = Swal.getTimerLeft()
                                }
                            }
                        }, 100)
                    },
                    onClose: () => {
                        clearInterval(timerInterval)
                    }
                }).then((result) => {
                    /* Read more about handling dismissals below */
                    if (result.dismiss === Swal.DismissReason.timer) {
                        console.log('I was closed by the timer')
                    }
                });

                setTimeout(() => {
                    $('#mdlRequirements').modal('hide');
                    Swal.fire(
                        'Recommendation captured successfully!',
                        'Your recommendation will appear under the risk management tab.',
                        'success'
                    );
                }, 1800);

            });

        </script>
    </form>
</body>
</html>
