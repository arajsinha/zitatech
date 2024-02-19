using ITAssetRequestFormService as service from '../../srv/service';

annotate service.Header with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'date',
            Value : date,
        },
        {
            $Type : 'UI.DataField',
            Label : 'firstName',
            Value : firstName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'lastName',
            Value : lastName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'mobileNumber',
            Value : mobileNumber,
        },
        {
            $Type : 'UI.DataField',
            Label : 'emailId',
            Value : emailId,
        },
    ]
);
annotate service.Header with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Date',
                Value : date,
            },
            {
                $Type : 'UI.DataField',
                Label : 'First Name',
                Value : firstName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Last Name',
                Value : lastName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Mobile Number',
                Value : mobileNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Email ID',
                Value : emailId,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Department Name',
                Value : departmentName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Location',
                Value : location,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Reason for Product Change (Form Factor)',
                Value : requestPurpose_id,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Request Type',
                Value : reqType_id,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Basic Asset Details',
            ID : 'BasicAssetDetails',
            Target : '@UI.FieldGroup#BasicAssetDetails',
        },
    ]
);
annotate service.Header with @(
    UI.FieldGroup #BasicAssetDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : assetDetails.assetCategory_id,
                Label : 'Asset Category',
            },{
                $Type : 'UI.DataField',
                Value : assetDetails.manufacturer_id,
                Label : 'Manufacturer',
            },{
                $Type : 'UI.DataField',
                Value : assetDetails.quantity,
                Label : 'Quantity',
            },{
                $Type : 'UI.DataField',
                Value : assetDetails.screenSize,
                Label : 'Screen Size',
            },{
                $Type : 'UI.DataField',
                Value : assetDetails.ram,
                Label : 'RAM',
            },{
                $Type : 'UI.DataField',
                Value : assetDetails.ioPorts,
                Label : 'No. of I/O Ports',
            },{
                $Type : 'UI.DataField',
                Value : assetDetails.hdd,
                Label : 'HDD',
            },{
                $Type : 'UI.DataField',
                Value : assetDetails.OS_id,
                Label : 'OS',
            },{
                $Type : 'UI.DataField',
                Value : assetDetails.location,
                Label : 'Location',
            },{
                $Type : 'UI.DataField',
                Value : assetDetails.zipCode,
                Label : 'Zip Code',
            },{
                $Type : 'UI.DataField',
                Value : assetDetails.contactNumber,
                Label : 'Contact Number',
            },{
                $Type : 'UI.DataField',
                Value : assetDetails.pickUpType,
                Label : 'Pick Up Type',
            },{
                $Type : 'UI.DataField',
                Value : assetDetails.comments,
                Label : 'Comments',
            },{
                $Type : 'UI.DataField',
                Value : assetDetails.processor,
                Label : 'Processor',
            },],
    }
);
annotate service.AssetDetails with {
    OS @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'OS',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : OS_id,
                    ValueListProperty : 'id',
                },
            ],
            Label : 'OS',
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.AssetCategory with {
    id @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};
annotate service.OS with {
    id @Common.Text : {
        $value : name,
        ![@UI.TextArrangement] : #TextOnly,
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
            ],
            Label : 'Manufacturer',
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.Manufacturer with {
    id @Common.Text : {
        $value : name,
        ![@UI.TextArrangement] : #TextOnly,
    }
};
annotate service.Header with {
    requestPurpose @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'RequestPurpose',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : requestPurpose_id,
                    ValueListProperty : 'id',
                },
            ],
            Label : 'Reason for Product Change (Form Factor)',
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.RequestPurpose with {
    id @Common.Text : {
        $value : name,
        ![@UI.TextArrangement] : #TextOnly,
    }
};
annotate service.AssetCategory with {
    name @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};
annotate service.AssetCategory with {
    descr @Common.Text : name
};
annotate service.AssetDetails with {
    assetCategory @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'AssetCategory',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : assetCategory_id,
                    ValueListProperty : 'id',
                },
            ],
            Label : 'Asset Category',
        },
        Common.ValueListWithFixedValues : true
)};
