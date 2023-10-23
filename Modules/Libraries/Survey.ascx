<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Survey.ascx.cs" Inherits="Mitig8.Modules.Libraries.Survey" %>

<!-- Content Wrapper. Contains page content -->
<div id="modSurvey" class="content-wrapper">

    <div id="surveyContainer">
            <div id="creatorElement"></div>
        </div>

</div>
<!-- /.content-wrapper -->

<script type="text/javascript">
    var options = {
        showLogicTab: true
    };
    var creator = new SurveyCreator.SurveyCreator("creatorElement", options);
    SurveyCreator
        .StylesManager
        .applyTheme("stone");
    var creatorOptions = {};
    var creator = new SurveyCreator.SurveyCreator("creatorElement", creatorOptions);
    $('.svd_commercial_container').hide();
    $(document).ready(function () {
        $('.svd_commercial_container').hide();

    });
    setTimeout(() => {
        $('.svd_commercial_container').hide();

    }, 500);
</script>
