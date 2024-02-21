sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'zitatech.itassetreq.sub.itassetsub',
            componentId: 'HeaderList',
            contextPath: '/Header'
        },
        CustomPageDefinitions
    );
});