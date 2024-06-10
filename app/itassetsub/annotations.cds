using ITAssetRequestFormService as service from '../../srv/service';

annotate service.Header {
    requestPurpose @Core.Immutable @title: 'Request Purpose'
};

annotate service.Header with @(UI.LineItem: [
    {
        $Type : 'UI.DataField',
        Value : objectId,
        Label : 'Request Number',
    },
    {
        $Type: 'UI.DataField',
        Label: 'Date',
        Value: date,
    },
    {
        $Type : 'UI.DataField',
        Value : RequestStatus_id,
    },
    {
        $Type : 'UI.DataField',
        Value : requestPurpose_id,
    },
]);

annotate service.Header with @(
    UI.FieldGroup #GeneratedGroup1: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Date',
                Value: date,
            },
            {
                $Type: 'UI.DataField',
                Label: 'First Name',
                Value: firstName,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Last Name',
                Value: lastName,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Mobile Number',
                Value: mobileNumber,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Email ID',
                Value: emailId,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Department Name',
                Value: departmentName,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Location',
                Value: location,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Request Type',
                Value: reqType_id,
            },
            {
                $Type : 'UI.DataField',
                Value : RequestStatus_id,
                Label : 'RequestStatus_id',
            },
        ],
    },
    UI.Facets                     : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet1',
            Label : 'General Information',
            Target: '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Basic Asset Details',
            ID    : 'BasicAssetDetails',
            Target: '@UI.FieldGroup#BasicAssetDetails',
        },
    ]
);

annotate service.Header with @(UI.FieldGroup #BasicAssetDetails: {
    $Type: 'UI.FieldGroupType',
    Data : [
        {
            $Type: 'UI.DataField',
            Value: assetDetails.assetCategory_id,
            Label: 'Asset Category',
        },
        {
            $Type : 'UI.DataField',
            Value : assetDetails.manufacturer_id,
        },
        {
            $Type: 'UI.DataField',
            Value: assetDetails.quantity,
            Label: 'Quantity',
        },
        {
            $Type: 'UI.DataField',
            Value: assetDetails.screenSize,
            Label: 'Screen Size',
        },
        {
            $Type: 'UI.DataField',
            Value: assetDetails.ram,
            Label: 'RAM',
        },
        {
            $Type: 'UI.DataField',
            Value: assetDetails.ioPorts,
            Label: 'No. of I/O Ports',
        },
        {
            $Type: 'UI.DataField',
            Value: assetDetails.hdd,
            Label: 'HDD',
        },
        {
            $Type: 'UI.DataField',
            Value: assetDetails.OS_id,
            Label: 'OS',
        },
        {
            $Type: 'UI.DataField',
            Value: assetDetails.location,
            Label: 'Location',
        },
        {
            $Type: 'UI.DataField',
            Value: assetDetails.zipCode,
            Label: 'Zip Code',
        },
        {
            $Type: 'UI.DataField',
            Value: assetDetails.contactNumber,
            Label: 'Contact Number',
        },
        {
            $Type: 'UI.DataField',
            Value: assetDetails.pickUpType,
            Label: 'Pick Up Type',
        },
        {
            $Type: 'UI.DataField',
            Value: assetDetails.comments,
            Label: 'Comments',
        },
        {
            $Type: 'UI.DataField',
            Value: assetDetails.processor,
            Label: 'Processor',
        },
    ],
});

annotate service.AssetDetails with {
    OS @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'OS',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: OS_id,
                ValueListProperty: 'id',
            }, ],
            Label         : 'OS',
        },
        Common.ValueListWithFixedValues: true
    )
};

annotate service.AssetCategory with {
    id @Common.Text: {
        $value                : name,
        ![@UI.TextArrangement]: #TextOnly,
    }
};

annotate service.OS with {
    id @Common.Text: {
        $value                : name,
        ![@UI.TextArrangement]: #TextOnly,
    }
};

annotate service.Header with {
    requestPurpose @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'RequestPurpose',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: requestPurpose_id,
                ValueListProperty: 'id',
            }, ],
            Label         : 'Reason for Product Change (Form Factor)',
        },
        Common.ValueListWithFixedValues: true
    )
};

annotate service.RequestPurpose with {
    id @Common.Text: {
        $value                : name,
        ![@UI.TextArrangement]: #TextOnly,
    }
};

// annotate service.AssetCategory with {
//     name @Common.Text: {
//         $value                : descr,
//         ![@UI.TextArrangement]: #TextOnly,
//     }
// };

// annotate service.AssetCategory with {
//     descr @Common.Text: name
// };

annotate service.AssetDetails with {
    assetCategory @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'AssetCategory',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: assetCategory_id,
                ValueListProperty: 'id',
            }, ],
            Label         : 'Asset Category',
        },
        Common.ValueListWithFixedValues: false
    )
};
annotate service.Header with {
    requestPurpose @Common.Text : {
        $value : requestPurpose.name,
        ![@UI.TextArrangement] : #TextOnly,
    }
};
annotate service.Header with {
    reqType @Common.Text : {
            $value : reqType.name,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.AssetDetails with {
    assetCategory @Common.Text : {
            $value : assetCategory.name,
            ![@UI.TextArrangement] : #TextOnly,
        }
};

annotate service.AssetDetails with {
    OS @Common.Text : {
        $value : OS.name,
        ![@UI.TextArrangement] : #TextOnly,
    }
};
annotate service.Header with @(
    UI.HeaderInfo : {
        Description : {
            $Type : 'UI.DataField',
            Value : requestPurpose_id,
        },
        TypeName : '',
        TypeNamePlural : '',
        Title : {
            $Type : 'UI.DataField',
            Value : objectId,
        },
    }
);
annotate service.Header with {
    reqType @Common.ValueListWithFixedValues : true
};
annotate service.RequestType with {
    id @Common.Text : {
        $value : name,
        ![@UI.TextArrangement] : #TextOnly,
    }
};
annotate service.Header with {
    requestPurpose @Common.FieldControl : #Mandatory
};

// annotate service.Header @(
//     Common.SideEffects #RefreshManufact:{
//         SourceProperties :[ assetDetails.assetCategory_id ],
//         TargetProperties: [ assetDetails.manufacturer_id ]
//     }
// );


annotate service.Header with {
    mobileNumber @Common.Text: {
        $value: mobileNumberS,
        ![@UI.TextArrangement] : #TextOnly
    }
} ;
annotate service.Header with {
    firstName @Common.FieldControl : #ReadOnly
};
annotate service.Header with {
    lastName @Common.FieldControl : #ReadOnly
};
annotate service.Header with {
    mobileNumberS @Common.FieldControl : #ReadOnly
};
annotate service.Header with {
    emailId @Common.FieldControl : #ReadOnly
};
annotate service.Header with {
    mobileNumber @Common.FieldControl : #ReadOnly
};
annotate service.Header with {
    departmentName @Common.FieldControl : #ReadOnly
};
annotate service.Header with {
    location @Common.FieldControl : #ReadOnly
};
annotate service.Header with {
    RequestStatus @Common.Text : {
            $value : RequestStatus.name,
            ![@UI.TextArrangement] : #TextFirst,
        }
};
annotate service.AssetDetails with {
    manufacturer @Common.Text : {
            $value : manufacturer.name,
            ![@UI.TextArrangement] : #TextOnly,
        }
};

annotate service.Manufacturer with {
    id @Common.Text: {
        $value                : name,
        ![@UI.TextArrangement]: #TextOnly,
    }
};

annotate service.AssetDetails with {
    manufacturer @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Manufacturer',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : manufacturer_id,
                    ValueListProperty : 'id',
                },
                {
                    $Type : 'Common.ValueListParameterIn',
                    ValueListProperty : 'assetCategory_id',
                    LocalDataProperty : header.assetDetails.assetCategory_id,
                },
            ],
        },
        Common.ValueListWithFixedValues : false
)};

annotate service.Header with @(
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ITAssetRequestFormService.approve',
            Label : 'Approve',
        },
    ]
);
annotate service.Header with {
    RequestStatus @Common.FieldControl : #ReadOnly
};
// annotate service.Header with @(
//     Common.SideEffects #RefreshMfg : {
//         $Type : 'Common.SideEffectsType',
//         SourceEntities : [
//             assetDetails
//         ],
//         TargetEntities : [
//             assetDetails
//         ],
//     }
// );

// annotate service.AssetDetails with @(
//     Common.SideEffects #RefreshMfg : {
//         $Type : 'Common.SideEffectsType',
//         SourceProperties : [x
//             assetCategory_id
//         ],
//         TargetProperties : [
//             manufacturer_id
//         ]
//     }
// );

