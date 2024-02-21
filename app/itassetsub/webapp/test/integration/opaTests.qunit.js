sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'zitatech/itassetreq/sub/itassetsub/test/integration/FirstJourney',
		'zitatech/itassetreq/sub/itassetsub/test/integration/pages/HeaderList',
		'zitatech/itassetreq/sub/itassetsub/test/integration/pages/HeaderObjectPage'
    ],
    function(JourneyRunner, opaJourney, HeaderList, HeaderObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('zitatech/itassetreq/sub/itassetsub') + '/index.html'
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