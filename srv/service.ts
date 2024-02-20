
import cds, { ApplicationService } from '@sap/cds'
import { WorkflowInstancesApi as wfApi } from "./generated/SPA_Workflow_Runtime"

class ITAssetRequestFormService extends ApplicationService {
    async init() {
        console.log("Service JS Triggered")
        this.before("NEW", "Header.drafts", async (req: any) => {
            console.log("Header Drafts New triggered")
            req.data.assetDetails ??= {};
        });

        this.after("CREATE", "Header", async (req: any) => {
            console.log(req)
            wfApi.createV1WorkflowInstances({
                definitionId: "eu10.sap-process-automation-tfe.zitatechitassetrequest.iTAssetRequestProcess",
                context: { requestid: req.ID }
            }).skipCsrfTokenFetching()
                .execute({
                    destinationName: "sap-bpa-workflow-api",
                });
        })
        return super.init()
    };
}
module.exports = { ITAssetRequestFormService }

// import {
//     retrieveJwt,
// } from "@sap-cloud-sdk/connectivity";

// import { WorkflowInstancesApi as wfApi } from "./generated/SPA_Workflow_Runtime"


// module.exports = async function (srv: any) {
//     const {
//         Header, AssetDetails, RequestPurpose, RequestType, OS, Manufacturer, AssetCategory, PickUpType, RequestNumber
//     } = srv.entities;


//     srv.before("NEW", Header.drafts, async (req: any) => {
//         req.data.assetDetails ??= {};
//     });

//     srv.after("CREATE", Header, async (req: any) => {
//         console.log(req)
//         wfApi.createV1WorkflowInstances({
//             definitionId: "eu10.sap-process-automation-tfe.zitatechitassetrequest.iTAssetRequestProcess",
//             context: {requestid: req.ID}
//         }).skipCsrfTokenFetching()
//         .execute({
//             destinationName: "sap-bpa-workflow-api",
//         });
//     })

// }