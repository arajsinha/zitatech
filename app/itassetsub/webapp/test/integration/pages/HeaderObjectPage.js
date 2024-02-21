sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'zitatech.itassetreq.sub.itassetsub',
            componentId: 'HeaderObjectPage',
            contextPath: '/Header'
        },
        CustomPageDefinitions
    );
});