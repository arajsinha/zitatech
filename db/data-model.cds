namespace zitatechitassets;

using { sap.common.CodeList } from '@sap/cds/common';

entity Header
{
    key ID : UUID;
    date : Date;
    firstName : String(100);
    lastName : String(100);
    mobileNumber : Integer64
        @assert.range : [1000000000, 9999999999];
    emailId : String(100);
    departmentName : String(100);
    location : String(100);
    assetDetails : Composition of one AssetDetails on assetDetails.header = $self;
    requestPurpose : Association to one RequestPurpose;
    reqType : Association to one RequestType;
    objectId : String(14);
}

entity AssetDetails
{
    key ID : UUID;
    quantity : Integer;
    screenSize : Integer;
    ram : Integer;
    ioPorts : Integer;
    hdd : Integer;
    location : String(100);
    zipCode : Integer;
    contactNumber : Double;
    pickUpType : String(100);
    comments : String(100);
    processor : String(100);
    header : Association to one Header;
    assetCategory : Association to one AssetCategory;
    OS : Association to one OS;
    manufacturer : Association to one Manufacturer;
    assetSrNo : String(100);
    osDetails : String(100);
    hardwareTrack : String(100);
    model : String(100);
    scheduleDeliveryDate : Date;
    mfgSpecUrl : String(100);
    shippingAddress : String(100);
    trackingNumber : String(100);
}

entity RequestPurpose : CodeList
{
    key id : String(3);
}

entity RequestType : CodeList
{
    key id : String(3);
}

entity OS : CodeList
{
    key id : String(3);
}

entity Manufacturer : CodeList
{
    key id : String(15);
    key assetCategory : Association to one AssetCategory;
}

entity AssetCategory : CodeList
{
    key id : String(3);
}
