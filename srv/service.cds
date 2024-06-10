using zitatechitassets from '../db/data-model';

service ITAssetRequestFormService {
    @odata.draft.enabled
    entity Header         as projection on zitatechitassets.Header {
        *,
        cast(mobileNumber as String) as mobileNumberS: String
    }
    actions {
        action approve();
    }

    entity AssetDetails   as projection on zitatechitassets.AssetDetails;
    entity AssetCategory  as projection on zitatechitassets.AssetCategory;
    entity Manufacturer   as projection on zitatechitassets.Manufacturer;
    entity OS             as projection on zitatechitassets.OS;
    entity RequestPurpose as projection on zitatechitassets.RequestPurpose;
    entity RequestType as projection on zitatechitassets.RequestType;
}
