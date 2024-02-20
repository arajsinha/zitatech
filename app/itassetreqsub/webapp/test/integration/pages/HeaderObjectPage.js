sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'zitatech.itassetreqsub.itassetreqsub',
            componentId: 'HeaderObjectPage',
            contextPath: '/Header'
        },
        CustomPageDefinitions
    );
});