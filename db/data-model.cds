namespace zitatechitassets;

using { sap.common.CodeList } from '@sap/cds/common';

entity Header
{
    key ID : UUID;
    date : Date;
    firstName : String(100);
    lastName : String(100);
    mobileNumber : Double;
    emailId : String(100);
    departmentName : String(100);
    location : String(100);
    assetDetails : Composition of one AssetDetails on assetDetails.header = $self;
    requestPurpose : Association to one RequestPurpose;
    reqType : Association to one RequestType;
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
    key id : String(3);
}

entity AssetCategory : CodeList
{
    key id : String(3);
}
