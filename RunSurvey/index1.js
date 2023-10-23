



var storageName = "m8_";









$(document).ready(() => {
    Survey
        .StylesManager
        .applyTheme("modern");

  

  if ($('#vModeID').val() == '1')
    {

let JSONInsurer = JSON.parse($('#vJSON').val());
JSONInsurer.questionsOnPageMode = "singlePage";




    window.survey = new Survey.Model(JSONInsurer);


}
else
{
let JSONNONInsurer = JSON.parse($('#vJSON').val());
JSONNONInsurer.questionsOnPageMode = "standard";




    window.survey = new Survey.Model(JSONNONInsurer);
    
}


    survey
        .onComplete
        .add(function (result) {
            document
                .querySelector('#surveyResult')
                .textContent = "Result JSON:\n" + JSON.stringify(result.data, null, 3);
        });


    $("#surveyElement").Survey({ model: survey });


     storageName = "m8_" + $('#vSurveyID').val();
    var timerId = 0;


    survey
        .onCurrentPageChanged
        .add(function (survey, options) {
            saveState(survey);
        });
    survey
        .onComplete
        .add(function (survey, options) {
            //kill the timer
            clearInterval(timerId);
            //save the data on survey complete. You may call another function to store the final results
            saveState(survey);
        });

    survey
        .onValueChanged
        .add(function (sender, options) {

            //var el = document.getElementById(options.name);
            //if (el) {
            //    el.value = options.value;
            //}

 if ($('#vModeID').val() == '0')
    {
            $.ajax({
                url: "https://api.mitig8.co.za/Assessment/Survey/Journal?AssessmentID=" + $('#vAssessmentID').val() + "&UserID=" + $('#vUserID').val() + "&SurveyID=" + $('#vSurveyID').val() + "&Name=" + options.name,
                type: "POST",
                data: JSON.stringify(options.value),
                contentType: "text/plain",
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                },
                error: function (data, textStatus, errorThrown) {
                    console.log(data);
                }
            });
}




        });




    //Load the initial state
    loadState(survey);

    $.ajax({
        url: "https://api.mitig8.co.za/Assessment/Survey/Journal/Sync?SurveyID=" + $('#vSurveyID').val(),
        type: "GET",
        contentType: "text/plain",
        data: JSON,
        success: function (data, textStatus, jqXHR) {
            for (var x = 0; x < data.length; x++) {
                console.log(data[x].Name);
                console.log(JSON.parse(data[x].Value));

                document.getElementById(data[x].Name), value = JSON.parse(data[x].Value);
                window.survey.setValue(data[x].Name, JSON.parse(data[x].Value));

            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
        }
    });



    //save the data every 10 seconds, it is a good idea to change it to 30-60 seconds or more.
    timerId = window.setInterval(function () {
        saveState(survey);
    }, 10000);


});










function saveSurveyToPdf(filename, surveyModel, saveType) {
    var surveyPDF = new SurveyPDF.SurveyPDF(JSON.parse($('#vJSONDOWNLOAD').val()),
        {
            
            "orientation":"l",
            fontSize: 12
    
    }
        
        
        );


   surveyPDF.mode = "display";


    surveyPDF
        .onRenderQuestion
        .add(function (survey, options) {





        });

    surveyPDF
        .onRenderQuestion
        .add(function (survey, options) {

            try {
                options.controller.fontSize = 12;
            } catch (rc) { }
          //  options.controller.fontSize *= 1.9;



        });

    //    surveyPDF
    //    .onRenderHeader
    //    .add(function (survey, canvas) {
    //        canvas.drawImage({
    //            base64: 'iVBORw0KGgoAAAANSUhEUgAAAWwAAAFlCAYAAADPkNJxAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAACdgSURBVHhe7Z15uFVl2cab1CY0tUzFyhwaxMiSpEEDByYHEBWLirI0UAQBQRRFCEwIxQERzECR1NA0M80Btfy+r/mPzMw+QwUV9BMNJ0YBYX3rOb47Ge4Da++9nvW+z/vev+u6rwvP2Wc9zzv9PBzOXuttGSGEEBNQ2IQQYgQKmxBCjEBhE0KIEShsQggxAoVNzPLqq69m8+fPz/7yl7+0RP4sHyMkVihsEjzPPPNMNm3atKxz587Z/vvvn+22227ZNttsk73tbW+Dkc/Ja+S18jXytXINQqxDYZMgefjhh7PJkye3CBdJuZHIteSacm1CLEJhk2BYvXp1Nn369Kxjx45QuGVGakgtqUmIFShs4p3XXnstu/TSS7N27dpBuWpGakpt6YGQ0KGwiTcWL16cTZgwIdt7772hTKuM9CC9SE+EhAqFTbwwc+bMrG3btlCePiM9SW+EhAiFTSpn1KhRUJYhRXokJDQobFIpJ554IhRkiJFeCQkJCptURocOHaAYQ470TEgoUNikEnbccUcoRAuR3gkJAQqbqIMkaDGE+Ia7kKiCxGc5hPiEO5CogYQXQwjxBXcfUQGJLqYQ4gPuPFI6SHAxhpCq4a4jpYLEFnMIqRLuOFIaSGgphJCq4G4jpYBEllIIqQLuNNI0SGAphhBtuMtIUyBxpRxCNOEOIw2DhFV1dt999+zAAw9sifwZvabqEKIFdxdpCCSqKrLLLrtkgwcPzu6++27XyebI5+Q18lp0jSpCiAbcWaRukKCqyJAhQ7IFCxa4LraOvFa+Bl2rihBSNtxVpC6QmLTTvn37bO7cua6D+pGvlWuga2uHkDLhjiKFQULSTp8+fUp5zqJcQ66FamiHkLLgbiKFQCLSzgknnOCql4dcE9XSDiFlwJ1EtgoSkHY0ZF2D0iZW4S4iWwSJRzvHH3+8q66H1EC1tUNIM3AHkVZBwtHOcccd56rrI7VQD9ohpFG4ewgEiUY7Vcq6BqVNLMGdQzYDCUY7vXv3dtWrR2qjnrRDSL1w15CNQGLRzrHHHuuq+0N6QL1ph5B64I4h/wEJRTshyLoGpU1Ch7uFtIBEop1evXq56uEgPaFetUNIEbhTCBSIdkKUdQ1Km4QKd0niIHFop2fPnq56uEiPqHftELIluEMSBglDO8ccc4yrHj7SKxqDdghpDe6OREGi0I4lWdegtElIcGckCBKEdo4++mhX3R7SOxqTdgjZFO6KxEBi0M5RRx3lqttFxoDGph1CNoQ7IiGQELQTg6xrUNrEN9wNiYBEoJ0jjzzSVY8HGRMaq3YIEbgTEgAJQDs9evRw1eNDxobGrB1CuAsiBx187cQs6xqUNvEBd0DEoAOvne7du7vq8SNjRXOgHZIuXP1IQQddOynJugalTaqEKx8h6IBrp1u3bq56esjY0Zxoh6QHVz0y0MHWTteuXV31dJE5QHOjHZIWXPGIQAdaO5T1W1DaRBuudiSgg6ydLl26uOqkhswJmivtkDTgSkcAOsDaOeKII1x1sikyN2jOtEPih6tsHHRwtUNZbx1Km2jAFTYMOrDaOfzww111sjVkrtAcaofEC1fXKOigauewww5z1UlRZM7QXGqHxAlX1iDogGqHsm4cSpuUBVfVGOhgaufQQw911UmjyByiudUOiQuuqCHQgdQOZV0elDZpFq6mEdBB1E7nzp1ddVIWMqdorrVD4oAraQB0ALXTqVMnV52UjcwtmnPtEPtwFQMHHTztUNb6UNqkEbiCAYMOnHa++tWvuupEG5lrtAbaIXbh6gUKOmjaOeSQQ1x1UhUy52gttENswpULEHTAtENZ+4PSJkXhqgUGOljaOfjgg111g6xbmWWvL3oz8mejyBqgtdEOsQVXLCDQgdKOSVkveyTLFt+YZQvGZNm/Tts48jH53PJ/uhfbgdImW4OrFQjoIGnnK1/5iqtuhFULs+zZ6ZtLurU8f737QjvImqC10g6xAVcqANAB0s6Xv/xlV90I61Zn2RMjsZi3lAXj3AXsIGuD1kw7JHy4Sp5BB0c75mSdrccyridyDUNQ2gTBFfIIOjDa+dKXvuSqW2EdFnAjkWsZQtYKraF2SLhwdTyBDop2vvjFL7rqRlj/BhZvM5FrGkLWDK2ldkiYcGU8gA6IduzJei0WbhmRaxuC0iY1uCoVgw6Gdjp27OiqG2H9GizaMiM1DCFriNZWOyQsuCIVgg6Edg466CBX3Qjy2yBIsBqRWoaQtURrrB0SDlyNikAHQTv2ZP06FqtmpKYhKO204UpUADoA2vnCF77gqhth3Sos1CoitQ0ha4vWXDvEP1wFZdDG1449Wa/EIq0yxu5DQmmnCVdAEbThtdOhQwdX3QhvrMAC9RHpxRCy1mgPaIf4g7OvBNro2jnwwANddSO8sQyL02ekJ0PImqO9oB3iB868AmiDa8eerJdiYYYQ6c0QlHY6cNZLBm1s7Xz+85931Y2w9jUsypAiPRpC9gDaG9oh1cIZLxG0obXzuc99zlU3wtpXsSBDjPRqCNkLaI9oh1QHZ7sk0EbWjj1Zv4LFGHKkZ0NQ2nHDmS4BtIG1c8ABB7jqRlj7MhaihUjvhpC9gfaMdog+nOUmQRtXO5/97GdddSOseQmL0FJkDIaQPYL2jnaILpzhJkAbVjv2ZL0EC9BiZCyGoLTjg7PbIGijaqd9+/auuhHW/BuLz3JkTIaQPYP2knaIDpzZBkAbVDvmZL36RSy8GCJjMwSlHQ+c1TpBG1M7n/nMZ1x1I6x+AYsupsgYDSF7CO0t7ZBy4YzWAdqQ2tl///1ddSOsXowFF2NkrIaQvYT2mHZIeXA2C4I2onbsyfp5LDbtPDfjzaDPaUfGbAhK2zacyQKgDaiddu3auepGeP3/sNC0I6Ku4UvaMnZDyN5Ce047pHk4i1sBbTzt7Lfffq66EV5/FotMOxvKuoY3aedzYAjZY2jvaYc0B2dwC6ANpx17sl6EBaYdJOsa3qSdz4UhKG17cPZaAW007Xz605921Y3w+kIsLu1sSdY1vEk7nxNDyJ5De1E7pDE4cwC0wbTzqU99ylU3wqpnsLC0U0TWNXxJW+bGELL30J7UDqkfztomoI2lHXuyfhqLSjv1yLqGN2nnc2QIStsGnLENQBtKO5/85CdddSOsegoLSjuNyLqGN2nnc2UI2Ytoj2qHFIez5UAbSTvmZL1yARaTdpqRdQ1f0pY5MwSlHTacqRy0gbTziU98wlU3wsr5WEjaKUPWNbxJO587Q8jeRHtWO2TrJD9LaONoZ99993XVjbDySSwi7ZQp6xrepJ3PoSFkj6K9qx2yZZKeIbRhtGNP1k9gAWlHQ9Y1vEk7n0tDUNrhkezsoI2inX322cdVN8KKx7F4tKMp6xq+pC1zagjZs2gva4dgkpwZtEG0s/fee7vqRlgxDwtHO1XIuoY3aedzawjZu2hPa4dsTnKzgjaGduzJ+l9YNNqpUtY1vEk7n2NDUNphkNSMoA2hnb322stVN8Lyx7BgtOND1jV8SVvm2hCyl9Ee1w55i2RmA20E7Xz84x931Y2w/J9YLNrxKesa3qSdz7khZE+jva4d8iZJzATaANqxJ+tHsVC0E4Ksa3iTdj73hqC0/RH9LKCF186ee+7pqhth+T+wSLQTkqxreJN2vgaGkD2O9r52UifqGUALrh1zsl72CBaIdkKUdQ1f0pa1MASlXT3Rjh4ttHY+9rGPuepGWPZ3LA7thCzrGt6kna+JIWTPo7OgnVSJcuRogbXz0Y9+1FU3wrKHsTC0Y0HWNbxJO18bQ8jeR2dCOykS3ajRwmrHnqz/hkWhHUuyruFN2vkaGYLSroaoRowWVDsf+chHXHUjLH0IC0I7FmVdw5e0Za0MIWcBnRHtpEQ0o0ULqZ099tjDVTcCfwzSON6+07b14xE5E+isaCcVohgpWkDtmJP12leybME4LAXNxCDrGj6kLWsma2cISlsP86NEC6edtm3buuqGeP56LATNxCTrGj6kLWtnDDkj6OxoJ3ZMjxAtmHZMytrHW85jlHUNH9I29hZ2gdIuH7OjQwulnd13391VN8bzs7EEtBKzrGtULW1ZQ4PImUFnSTuxYnJkaIG0s9tuu7nqBpk/GktAIynIukaV0pY1NIqcHXSmtBMj5kaFFkY7pmW9biUWgEZSknWNKqUta2kUSrscTI0ILYh2dt11V1fdKK8vwoe/7KQo6xpVSVvW0jByltAZ005MmBkNWgjtfPjDH3bVDUNh60NhF0bOFDpr2okFEyNBC6CdKGQt8EciulQla4nhH4lsCKXdOMGPAk28dnbZZRdXPRIWjMEC0EhK0q5S1rKGESFnDJ097Vgn6BGgCdfOhz70IVc9IhbfiCWglRSkXaWsJbKGkSFnDZ1B7Vgm2O7RRGsnSlkLPh5SELO0q5a1xNjDDYpCaddHkJ2jCdbOBz/4QVc9Up6djkWgmRil7UPWsnYRI2cPnUntWCS4rtHEaid6WQsr5mEZaCcmafuQtUTWLnIo7WIE1TGaUO3svPPOrnoCUNqNQ1mrI2cRnVHtWCKYbtFEamennXZy1RNixeNYDNqxLG1vss7XKjHkTKKzqh0rBNEpmkDtJCnrGiufwILQjkVp+5K1rFGiUNqt471LNHHa2XHHHV31hFn5JBaFdixJ25us87VJHDmj6OxqJ3S8dogmTDsf+MAHXHWSrZyPhaEdC9L2Jut8TUgLclbRGdZOyHjrDk2UdihrwMoFWBzaCVna3mSdrwXZCEp7Y7x0hiZIOzvssIOrTjZj1VNYINoJUdq+ZC1rQCBydtGZ1k6IVN4VmhjtbL/99q46aZVVT2ORaCckaXuTdT73ZIvIGUZnWzuhUWlHaEK0Q1nXwapnsFC0E4K0vck6n3NSCEq7QmGjidBOmzZtXHVSmBS/0+Z31maQM43OunZCoZJO0ARoh7JugpSkTVmbI2Vpq3eBBq6d97///a46aZgU/iHSm6z5D4zNImccnX3t+Ea1AzRg7bzvfe9z1UnTrIr4V/68yZq/ulcWctaRA7TjE7XqaKDaoawViPH3tH3Jmr9nXTqpSVulMhqgdt773ve66qR0YnpHpDdZ8x2MWsjZR07Qjg9Kr4oGpp33vOc9rjpRIwZpU9bRIg5AbtBO1ZRasUOHDnBQmqGsK8TyDaO8yZo3cqoKH9IW51VJacIeNWoUHJBm3v3ud7vqpDIs3prVm6zTvUWqL8QJyBWaEfdVRSnCnjVrFhyIZrbbbjtXnVSOJWlT1skhbkDO0Iw4sAqaFvbcuXPhADRDWQeAhSfX+JJ1gk+KCQ0f0hYXatOUsB955JFszz33hM1rZdttt3XViXdCfkakN1mn8wzG0BFXIIdoRVwoTtSkKWGfdNJJsHGtUNYBEqK0KWviqFra4kRNGhb2Aw88ABvWyjbbbOMqk+BY8S8sMO0gaXuTdT4HJEjEHcgpWhE3atGwsHv16gWb1ci73vUuV5UEy4rHsMi0s6G0vck6HzsJGnEIcotGxI1aNCTsW265BTaqEcraED6lTVmTrVCltMWRGjQk7E6dOsEmy8473/lOV5GYYfn/YrHFGBkrMYU4Bbmm7IgjNahb2DNmzIANlp13vOMdriIxx/J/YsHFFBkjMYm4BTmn7Igry6ZuYffo0QM2V2Yo6wiIWdqUtXmqkLa4smzqEvbChQthY2Xm7W9/u6tGzLP8USw8y5ExkSgQ1yAHlRlxZpnUJeypU6fCpsoMiYyYpE1ZRwdyUJkRZ5ZJXYbU/nEIiZTl/8ACtBQZA4kS5KKyUvaPRQpbcsWKFbChsvLkk7wNZdQsewSL0EKkdxIt4h7kpLIi7iyLwsKeM2cObKaM3Hbbba4KiRqL0qask0AchNxURsSdZVFY2CNHjoTNNJu+ffu6CiQJlv0dizHESK8kGcRFyFHNRtxZFoWFffLJJ8Nmms2f//xnV4Ekw7KHsSBDivRIkkJchBzVbMSdZVFY2Mceeyxsppkccsgh7uokOUKWNmWdLO3atYOuaibizrIoLGyRK2qmmfzgBz9wVydJsuxvWJg+Iz2RZOnTpw90VTMp8xvTwsLW+D/PH//4R3d1kixLH8Li9BHphSTNhAkToKuaibizLAoLe9ddd4XNNJOnnnrKXZ0kTQjSpqxJjsbzacWdZVFY2Bo3AV+9erW7OkmepX/FIq0iUpuQHI1n1Jb58JXCwt5hhx1gM81kyZIl7uokeXzdz1oitQnJufXWW6Grmom4sywKC3uvvfaCzTQT7QdWEgusz4X5EyzSKiM9SC8kaTTulyTuLIvCwj7ooINgM81E/m9GUmZdLsqrsUB9RHqRnkiyDB8+HLqqmYg7y6KwsI888kjYTDPRfsIwCZj1uRifDUjWtUhP0htJks6dO0NXNRNxZ1kUFna/fv1gM81k5513zhYtWuQqkGRY/0Yuxh9jYYYQ6U16JEkhLmrTpg10VTMRd5ZFYWEPGzYMNtNsRowY4SqQJFi/NhfiVViUIUV6lF5JMoiLkKOajbizLAoLe9q0abCZZrPttttmf/0rf60qCazIuhZKOxnEQeIi5KhmI+4si8LCfu6552AzZaTMdwKRQFm/JhfgdCzGkCM9S+8kajTeyV2LuLMsCgtb0PiBfC2UdsSsX52LL/8uAwnRQqR3GQOJEk1ZizPLpC5hT5kyBTZVVsoeHAmAdbnoFhmWdS0yBhkLiYrDDjsMuqisiDPLpC5hP/roo7CpMnPooYe6asQ8617PRXclFqDFyFhkTCQKjjjiCOigMiPOLJO6hC0cfPDBsLEyI//XI8ZZtyouWdfSIu18bMQ03bp1g+4pM+LKsqlb2HIPa9Rc2Tn88MNdRWKOFllPxcKLITI2StssGm8CRNG433/dwpYbNu2zzz6wwbIjf2Uhxli3MhfaFVh0MUXGKGMlpjjmmGOga8qOOFLj5nZ1C1u4/PLLYZMa6dKli6tKgmfdijRkXUuLtPMxExNoPOawtYgjNWhI2OvWrcs6dOgAG9VI165dXWUSLG/k4lo4BYtNNQPfvJ91y/208z/D1yhGxixjJ0Fz/PHHQ7doRNwojtSgIWELs2fPhs1qRf6RgATKG8tzceXfUSChaWbe6Rs/KUb+LB9Dr9WMjF3mgATJiSeeCJ2iFXGjFg0LW5AfV6CGtdK9e3dXmQSDN1kPygUNHpgrH5PPoa/RDKUdJH379oUu0Yr2j3CbEvYdd9wBm9ZMjx49XHXinTeW5aK6DAtMMyLkZQ+7JgDyOS/SzudC5oQEwbe+9S3oEM2IEzVpStjC+PHjYeOaKfP+sqRB3liaC+pSLC7NzBu8ZVnXaJF2/lp0Dc3InMjcEK985zvfge7QjLhQm6aFLVT9MyLJUUcd5aqTyvEm6zNyEf/dNVEAea18DbqWZihtr3z3u9+FztCMOLAKShG2sN9++8GBaOboo4921UllrH0ty565BItKM/OG5AJu4Bmg8jXyteiampE5krkilXLKKadAV2hG3FcVpQl7xYoVcDDakV+EJxWx9lU/sn58aC7ef7gmGkC+Vq6Brq2ZFmnnc0YqYcCAAdAR2hH3VUVpwhYeeughOCDt9OzZ03VA1GiR9WQsJs2IaJeXcAMduYYXaedzRmmrM3DgQOgG7YjzqqRUYQsPPvggHJh2evXq5TogpbP2lVw8F2MhaebxYeXIukaLtPNrolqakbmTOSQqDB48GDpBO+K6qild2MJvf/tbOEDtyFtPScmsfdmTrM/MBftP10SJyDXl2qimZlqknc8lKZWhQ4dCF2jHh6wFFWELvqTdu3dv1wFpmhZZX4QFpJknhudi/V/XhAJybamBamtG5pLSLo3hw4dDB2jHl6wFNWELlLZh1ryUZU9PwuLRjIh0xWOuCUWkhg9py5zK3JKmGDlyJDz72vEpa0FV2MJvfvMbOHDtHHfcca4DUjdrlniS9YhcpP9yTVSA1JKaqBfNtEi7/FtvpsKoUaPgmdeOb1kL6sIWfElb7tBF6qRF1j/CotHME2dVK+saLdLOa6OeNCNzTGnXzejRo+FZ104IshYqEbbwwAMPwInQzgknnOA6IFtlzb9zkUzEgtHMEyNzcc5zTXhAaksPqDfNyFzLnJNCjBkzBp5x7YQia6EyYQu+pN2nTx/XAWkVr7J+3DXhEemB0g6Wqh5NuGlCkrVQqbCF+++/H06Mdqp6r79J1ryYi2MCFopmnjw7y1Y+4ZoIAOlFekK9akbmXtaAQCjrt6hc2IIvaX/ta19zHZD/sPqFLHvqQiwSzTx5Ti7IJ10TASE9SW+oZ83IGshakI2grDfGi7CF++67D06Udr7+9a+7Dog/WY8KU9Y1WqSd94h61wylvRGU9eZ4E7bgS9ryFIrkWb04F8QPsTg08+S5uRDnuyYCRnqUXtEYNCNrImuTOL5kLe8dCRmvwhbmzp0LJ0473/jGN1wHCbL6eY+yXuCaMID06k3a+Rp54uc//7n7kx98yVp+KSJ0vAtb8CXtb37zm66DhGiR9QVYFJqZf16WrXrKNWEI6Vl6R2PSjKyRJ2mLMOfMmeP+q1p8yVr+tm+BIIQt3HvvvXAitSPPfUuG1f+Xi2A8FoRm5o/Oxfe0a8Ig0ruMAY1NM7JWsmYVU5PmDTfc4D5SDb5kLe6xQjDCFnxJu1+/fq6DyFl0JRaDZuafnwvvGdeAYWQMMhY0Rs3ImlXMhuKcPXu2+6guvmR99913uw5sEJSwhXvuuQdOrHa+/e1vuw4i5d+/xkLQTCyyruFL2rJ2FbKpPGfNmuU+o4MvWf/619XOaxkEJ2zBl7TlSctR8nr+1+qqb9y/YEwuuIWugYiQMcnY0Ji1Imsna1gRSKAzZ850ny0XX7K+4447XAe2CFLYgvxVBU20dk466STXQUS8cAsWgVYWjM0Fs8gVjxAZm4wRjV0rsoYV0ZpEr776aveKcvAl69tvv911YI9ghS34krY8Jj8qqnxzzIIf5EJ71hWOGBmjjBXNgUZkDStiSyK96qqr3Kuaw5esb7vtNteBTYIWtnDXXXfBidfO9773PdeBcdavwQLQyIJxuciec4UTQMYqY0ZzoRFZywrYmkyvvLK5fwj1Jetbb73VdWCX4IUt+JL2ySef7DowjLxrDh3+spOarGtUKe2K3gFZRKhXXHGFe3V9+JK17zcDlYUJYQvyL7poIbRzyimnuA6MIu/WQ4e/7FT8mwxBUdVv4FT0LtGiUr3sssvcVxTDl6xvvvlm14F9zAhb8CXt73//+64Dg8hDX9Hh10iK0q7y1yUreoBvPWKdPHmy+6ot40vWvt6xqYUpYQuUdgOgw6+VlKRdpawlFVGvXC+66CL3lRhfsr7xxhtdB/FgTtjCnXfeCRdIO/3793cdGKPqdzimIO2qZV3hOx4bEezEiRPdV2+ML1lff/31roO4MClswZe0BwwY4DowRNVykcQs7cjns1HJXnjhxr966EvWVb2d3gdmhS3Iu5XQgmnn1FNPdR0YYd0qPzd9ilHaPmQtaydrWBHNiHb8+LzXJq/RTLTfRu8b08IWfEn7tNPyg2SJV/+EZaCdmKTtQ9YSWbsKaVa2vmR9zTXXuBHEi3lhC7/61a/gAmpn4MCBrgMj+BJODNJOaO58CbeZzJgxw3UfN1EIW/Al7dNPP911YIQld2ExaMeytH3JWtbKA9aEXfY9TkImGmELclMXtKDaGTRokOvACJR2cRKTtWBJ2GXd28QKUQlb8CXtwYMHuw6MsORuLArtWJK2N1n7vam+FWFPmzbNdZwO0Qlb+OUvfwkXWDtnnHGG68AIS+7BwtCOBWl7k3W+Jp6xIOypU6e6btMiSmELvqQ9ZMgQ14ERltyLxaGdkKXtTdZhPFswdGFPmTLFdZoe0QpbkHvfogXXztChQ10HRnhpLhaIdkKUti9ZyxoEQsjCrveGU7ERtbAFX9IeNmyY68AIlDZl7QhV2JdcconrMF2iF7bwi1/8Am4A7Zx55pmuAyO8dB8WinZCkLY3WedzHhghCvviiy923aVNEsIWfEl7+PDhrgMjvHQ/Fot2fErbm6zzuQ6Q0IQ9adIk1xlJRtiCPCIIbQjtjBgxwnVghJcfwILRjg9p+5K1zHGghCTs1u4CmCpJCVvwJe2zzjrLdWCEl3+DRaOdKqXtTdb53AZMKMLe9O5/JEFhC7fccgvcINoZOXKk68AIMUubsm6VEIR9wQUXuG7IhiQpbMGXtM8++2zXgRFe/i0Wj3Y0pe1N1vlcGsC3sMeNG+c6IZuSrLAFeZIy2jDaOeecc1wHRnj5QSwg7WhI25us8zk0gk9hS23SOkkLW6C0C/LKf2ERaadMafuStcydIXx/h01pt07ywhZ8SXvUqFGuAyO88t9YSNopQ9reZJ3PmTF8C1tCaWMobMfNN98MN452zj33XNeBESxKm7KuixCELaG0N4fC3gBf0j7vvPNcB0Z45X+woLTTiLS9yTqfI6OEImwJpb0xFPYm3HTTTXDjaGf06NGuAyO88jssKu3UI21vss7nxjAhCVtCab8FhQ3wJe3zzz/fdWCEkL/T5nfWDROasCWU9ptQ2K0wZ84cuHG0M2bMGNeBEUKUNmXdFCEKW0JpU9hbxJe0x44d6zowQkj/EOlN1jb/gRERqrAlqUubwt4KP/vZz+DG0Y65jRmCtCnrUghZ2JKUpU1hF4DSLojPN9d4k7WtN8UUIXRhS1KVNoVdkBtvvBFuHO1Q2gEnQlkLFoQtSVHaFHYdUNoF8XXvkSpj6N4g9WJF2JLUpE1h18kNN9wAN452KO2AErGsBUvClqQkbQq7ASjtgvi6NatmjNwitRmsCVuSirQp7Aa5/vrr4cbRDqXtMQnIWrAobEkK0qawm4DSLoivJ9eUGQNPiimLBx980HRihsJukp/+9KdQqtqhtCtMQrImYUNhlwClXRBfT2NvJgE/3ZykB4VdErNnz4ZS1Y45ab90PxZjiJFeCQkICrtEKO2CWJA2ZU0ChMIumeuuuw5KVTv2pH0fFmUIkd4ICRAKWwFKuyAhSpuyJgFDYStBaRfkpblYnD4ivRASMBS2IrNmzYJS1Q6l3UAoa2IAClsZSrsgL92LRVpFpDYhBqCwK+Daa6+FUtWOOWkv8SBtqUmIESjsiqC0C7LkHixWjUgtQgxBYVfINddcA6WqHUobhLImBqGwK4bSLsiSu7Foy4hcmxCDUNgemDlzJpSqdijtPEZlPW/evJan+E+cODG76qqrsnvu4d8QUoTC9gSlXZAld2HxNhK5liFeeOGFln3SuXNnuJY77bRTNnjw4Ox3v/ud+woSOxS2R2bMmAEPonaSlLYxWY8dOzZr06YNXD+U3r17u68kMUNhe4bSLsi/f41FXCTytYYYM2YMXLOtpW3btu4KJFYo7AD4yU9+Ag+gdsxJe/mjWfb0BCxlFHmtfI0hzj//fLhWRdO1a1d3JRIjFHYgUNoFWb/2zXcmzj8PS1oin5PXyGsNMXr0aLhG9cbcmpLCUNgBcfXVV8MDqB2zB3zpX9/8cceGkY8Z5LzzzoNr00i233777NFHbf3NghSDwg4MSjs9zj33XLgmzWTo0KHu6iQmKOwA+fGPfwwPoXYo7eoZNWoUXItmc8ABB7gKJCYo7EChtOPnnHPOgWtQVlatWuUqkVigsANG3tGGDqJ2KG19zj77bDj3Zeaxxx5z1UgsUNiBQ2nHx8iRI+Gcl50//elPriKJBQrbANOnT4cHUjuUdvmcddZZcK418vzzz7uqJBYobCNQ2vYZMWIEnGONyH1GSHxQ2IagtO1Spawlffv2dZVJTFDYxpg2bRo8oNqhtBtn+PDhcE41I3f5I/FBYRuE0rbDmWeeCedSM926dXPVSWxQ2Ea58sor4WHVDqVdnGHDhsE51Mx2223H+2NHDIVtGEo7XOSt4WjutHPJJZe4DkiMUNjGmTp1Kjy42qG0W2fIkCFwzrQjDz0gcUNhRwClHQ5nnHEGnCvtyEMPSPxQ2JFwxRVXwIOsHUr7LeT5imiOtCMPPSBpQGFHBKXtj0GDBsG50Y489ICkA4UdGVOmTIEHWzspS/v000+Hc6IdeegBSQsKO0Io7eoYOHAgnAvtyEMPSHpQ2JFy+eWXw4OunZSkfdppp8E50I489ICkCYUdMZS2Hqeeeiocu3bkoQckXSjsyLnsssvgwddOzNIeMGAAHLN25KEHJG0o7ASgtMujf//+cKzakYceEEJhJ8Kll14KRaCdmKTt68cg8tADQgQKOyEo7cbx9Q+Mch9tQmpQ2IkhNwdCYtCOZWn7+j1ruY82IRtCYScIpV0cX+9glPtoE7IpFHaiTJ48GYpCO5ak7etGTnIfbUIQFHbCUNqt4+sWqXIfbUJag8JOHEp7c3w8KUYi/5MgZEtQ2CS7+OKLoUC0E6K0fTyDUSI/fiFka1DYpAVK28/TzSXyD5uEFIHCJv/hoosugkLRTgjSljenoN60I78ySEhRKGyyESlKW972jXrSjtyalZB6oLDJZkyaNAkKRjs+pC13v0O9aEfeOUlIvVDYBJKCtOW+0qgH7cg9SQhpBAqbtMqPfvQjKBztVCFtebwWqq0duTUrIY1CYZMtEqO05cG1qKZ25NashDQDhU22ysSJE6GAtKMh7TFjxsBa2uF31qQMKGxSiBikPXbsWFhDO/yZNSkLCpsUZsKECVBI2unXr1+2ePFi10VjiPjRtbXDX90jZUJhk7rwJe327dtns2fPdl0U5w9/+EOL8NE1tcM3xZCyobBJ3Vx44YVQUFWke/fu2bXXXpu9+OKLrpvNkc/Ja3r37g2vUUUGDx7suiGkPChs0hA+pV1L586ds759+7bcA0Qif5aPoddWGd7IiWhBYZOG+eEPfwiFlXJ4P2uiCYVNmoLSfit8rBfRhsImTXPBBRdAgaUUPjCXVAGFTUohZWnLrVkJqQIKm5TG+PHjodBijtyalZCqoLBJqaQkbbk1KyFVQmGT0klB2nJrVkKqhsImKowbNw6KLobIrVkJ8QGFTdSIUdpya1ZCfEFhE1V83XRJI3JrVkJ8QmETdWKQttyalRDfUNikEu68804oQguR3gkJAQqbVMa8efOyPfbYA0oxxEiv0jMhoUBhk0pZunRpy131kCBDivQovRISEhQ28YLcewOJMoTwviAkVChs4o3bb78969atG5Smj0gv0hMhoUJhE+/cdNNNWadOnaBEq4jUlh4ICR0KmwTDddddl3Xs2BFKVSNSS2oSYgUKmwTHnDlzsv79+2f77rsvFG0zkWvKtaUGIdagsEnQPPTQQ9mkSZOyLl26QAEXiXytXEOuRYhlKGxiioULF2a///3vW75DFgkPGjQo69mzZ0vkz/Ix+Zy8Rl5LSExQ2IQQYgQKmxBCjEBhE0KIEShsQggxAoVNCCFGoLAJIcQIFDYhhBiBwiaEECNQ2IQQYgQKmxBCjEBhE0KIEShsQggxAoVNCCFGoLAJIcQIFDYhhJggy/4fyRFC3JAHQyAAAAAASUVORK5CYII=',
    //            horizontalAlign: 'left',
    //            width: (canvas.rect.yBot - canvas.rect.yTop) * 0.6,
    //            height: (canvas.rect.yBot - canvas.rect.yTop) * 0.6,
    //            margins: {
    //                left: (canvas.rect.yBot - canvas.rect.yTop) * 0.2
    //            }
    //        });
    //    });
    //surveyPDF
    //    .onRenderFooter
    //    .add(function (survey, canvas) {
    //        canvas.drawText({text: 'Generated by Mitig8 (Pty) Ltd.', fontSize: 10});
    //        canvas.drawText({
    //            text: canvas.pageNumber + '/' + canvas.countPages,
    //            fontSize: 10,
    //            horizontalAlign: 'right',
    //            margins: {
    //                right: 12
    //            }
    //        });
    //    });

    surveyPDF.data = surveyModel.data;



    


    //if (saveType === "saveAsFile") {
        surveyPDF.save(filename);
    //} else if (saveType === "saveAsString") {
    //    surveyPDF
    //        .raw()
    //        .then(function (text) {
    //            var file = new Blob([text], {type: "application/pdf"});
    //            var a = document.createElement("a");
    //            a.href = URL.createObjectURL(file);
    //            a.download = filename;
    //            document
    //                .body
    //                .appendChild(a);
    //            a.click();
    //        });
    //} else if (saveType === "saveAsBlob") {
    //    surveyPDF
    //        .raw("bloburl")
    //        .then(function (bloburl) {
    //            var a = document.createElement("a");
    //            a.href = bloburl;
    //            a.download = filename;
    //            document
    //                .body
    //                .appendChild(a);
    //            a.click();
    //        });
    //} else {
    //    var oldFrame = document.getElementById("pdf-preview-frame");
    //    if (oldFrame) 
    //        oldFrame
    //            .parentNode
    //            .removeChild(oldFrame);
    //    surveyPDF
    //        .raw("dataurlstring")
    //        .then(function (dataurl) {
    //            var pdfEmbed = document.createElement("embed");
    //            pdfEmbed.setAttribute("id", "pdf-preview-frame");
    //            pdfEmbed.setAttribute("type", "application/pdf");
    //            pdfEmbed.setAttribute("style", "width:100%");
    //            pdfEmbed.setAttribute("height", 200);
    //            pdfEmbed.setAttribute("src", dataurl);
    //            var previewDiv = document.getElementById("pdf-preview");
    //            previewDiv.appendChild(pdfEmbed);
    //        });
    //}
}






function loadState(survey) {
    //Here should be the code to load the data from your database
    var storageSt = $('#vState').val();

    var res = {};
    if (storageSt) 
    {
        res = JSON.parse(storageSt); 
    }
    
    //Set the loaded data into the survey.
    if (res.currentPageNo) 
        survey.currentPageNo = res.currentPageNo;
    if (res.data) 
        survey.data = res.data;
    }

function saveState(survey) {
    var res = {
        currentPageNo: survey.currentPageNo,
        data: survey.data
    };
 
    syncSurvey(JSON.stringify(res));
}


function syncSurvey(JSON) {


 if ($('#vModeID').val() == '0')
    {
    $.ajax({
        url: "https://api.mitig8.co.za/Assessment/Survey/Set?SurveyID=" + $('#vSurveyID').val() + "&UserID=" + $('#vUserID').val(),
        type: "POST",
        contentType: "text/plain",
        data: JSON,
        success: function (data, textStatus, jqXHR) {
        },
        error: function (jqXHR, textStatus, errorThrown) {
        }
    });
}

}


