sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'zitatech/itassetreqsub/itassetreqsub/test/integration/FirstJourney',
		'zitatech/itassetreqsub/itassetreqsub/test/integration/pages/HeaderList',
		'zitatech/itassetreqsub/itassetreqsub/test/integration/pages/HeaderObjectPage'
    ],
    function(JourneyRunner, opaJourney, HeaderList, HeaderObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('zitatech/itassetreqsub/itassetreqsub') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheHeaderList: HeaderList,
					onTheHeaderObjectPage: HeaderObjectPage
                }
            },
            opaJourney.run
        );
    }
);