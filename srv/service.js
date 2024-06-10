

const cds = require('@sap/cds/lib')

// import cds, { ApplicationService } from '@sap/cds'


const { WorkflowInstancesApi } = require("./generated/SPA_Workflow_Runtime/workflow-instances-api");
const { SELECT, UPDATE } = require('@sap/cds/lib/ql/cds-ql');

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
                let count = await SELECT.one.from(Header).columns('count(ID) as val');
                console.log(count);
                const counter = count.val + 1
                const req_id = req.data.requestPurpose_id
                req.data.objectId = req_id.toUpperCase() + '-' + counter;
                // req.data.objectId = count;
                req.data.RequestStatus_id = "inp";
            }
            catch (error) {
                console.error("Error:", error);
            }
        });

        this.before("NEW", "Header.drafts", async (req) => {
            console.log(req.data)
            req.data.assetDetails ??= {};
            const req_id = req.data.requestPurpose_id;
            req.data.objectId = req_id.toUpperCase() + '-$';
            req.data.RequestStatus_id = "new";
        });

        this.after("CREATE", "Header", async (req) => {
            // console.log(req)
            await WorkflowInstancesApi.createV1WorkflowInstances({
                definitionId: "eu10.sap-process-automation-tfe.npidemoapi.nPIMainWorkflow",
                context: { objectid: req.ID }
            }).skipCsrfTokenFetching()
                .execute({
                    destinationName: "sap-bpa-workflow-api",
                });
        });

        this.on("approve", "Header", async (req) => {
            const materialreq = await cds.connect.to('zitatech_metadata');
            // const result1 = await materialreq.run(SELECT.from('MATERIAL_HEADERSet'));
            let resultUpdate = await UPDATE(Header, req.params[0].ID).with({ "RequestStatus_id": "app"});

            // const result = await materialreq.run(INSERT.into('MATERIAL_HEADERSet').entries(
            //     {
            //         "Matnr": "2868",
            //         "Ersda": "2024-02-02T00:00:00",
            //         "Ernam": "ZITATECH",
            //         "Pstat": "KVEDLC",
            //         "Mtart": "AUTO",
            //         "Mbrsh": "M",
            //         "Matkl": "01",
            //         "Bismt": "OLD MATNR Test BTP",
            //         "Meins": "EA",
            //         "Mfrpn": "Part number",
            //         "Mfrnr": "643266",
            //         "Maktx": "Odata Test",
            //         'NP_MatDetails': [{
            //             "Matnr": "2868",
            //             "Class": "AUTO_SPECS",
            //             "Atnam": "BODY_COLOR",
            //             "Atwrt": "DARK RED"
            //         }, {
            //             "Matnr": "2868",
            //             "Class": "AUTO_SPECS",
            //             "Atnam": "ENGINE_TYPE",
            //             "Atwrt": "HYBRID"
            //         }
            //         ]
            //     }
            // )).catch(error => {
            //     // console.error('An error occurred:', error);
            // });
            // console.log(result)
        });

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