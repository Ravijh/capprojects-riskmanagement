sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'riskmanagementdevspa/risks/test/integration/FirstJourney',
		'riskmanagementdevspa/risks/test/integration/pages/RisksList',
		'riskmanagementdevspa/risks/test/integration/pages/RisksObjectPage'
    ],
    function(JourneyRunner, opaJourney, RisksList, RisksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('riskmanagementdevspa/risks') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheRisksList: RisksList,
					onTheRisksObjectPage: RisksObjectPage
                }
            },
            opaJourney.run
        );
    }
);