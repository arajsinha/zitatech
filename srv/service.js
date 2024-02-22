

const cds = require('@sap/cds/lib')

// import cds, { ApplicationService } from '@sap/cds'


const { WorkflowInstancesApi } = require("./generated/SPA_Workflow_Runtime/workflow-instances-api");

module.exports = class ITAssetRequestFormService extends cds.ApplicationService {
    async init() {
        console.log("Service JS Triggered")
        const { Header, AssetDetails } = cds.entities;
        const logger = cds.log('srv');

        // this.before(["PATCH","PUT"], AssetDetails.drafts, async(req)=> {
        //     let assetDetailExisting = await SELECT.one.from(AssetDetails).where({ID: req.data.ID, IsActiveEntity: false});
        //     if(assetDetailExisting[0].assetCategory_id != req.data.assetCategory_id){
        //         req.data.manufacturer_id = '';
        //     }
        //     console.log('========>',req.data)
        //     logger.info('==========>', req.data)
        // });

        this.before("CREATE", "Header", async (req) => {
            try {
                // const {res} = await SELECT.one.from(req.target.projection.from.ref[0]).columns('ID as id')
                // console.log(res)
                let count =  await SELECT.one.from(Header).columns('count(ID) as val');
                console.log(count);
                const counter = count.val+1
                const req_id = req.data.requestPurpose_id
                req.data.objectId = req_id.toUpperCase() + '-' + counter;
                // req.data.objectId = count;
            }
            catch (error) {
                console.error("Error:", error);
            }
        });

        this.before("NEW", "Header.drafts", async (req) => {
            console.log(req.data)
            req.data.assetDetails ??= {};
            const req_id = req.data.requestPurpose_id
            req.data.objectId = req_id.toUpperCase() + '-$'
        });

        this.after("CREATE", "Header", async (req) => {
            // console.log(req)
            await WorkflowInstancesApi.createV1WorkflowInstances({
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