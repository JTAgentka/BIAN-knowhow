# Advanced Voice Services Operations

## Role Definition
This service domain handles the operation of the PBX/telephony infrastructure which can include embedded IVR capabilities. The PBX system will have close integration with the call center and E-Branch capabilities depending on the degree of computer telephony integration (CTI) and cross channel support

## Folder Name
Channel Management

## Core Business Object
Voice Channel Session (object_26.html?object=36697)

## Example of Use
The numeric menu is adjusted to increase self-serve activity during a period of peak loading (this could be implemented in the IVR in a more sophisticated set-up)

## Executive Summary
This service domain operates the telephone channel infrastructure, including the IVR and any other automated devices as appropriate. This includes handling default routing rules and intra-day/session adjustments to deal with peak load or other operational variations

## Key Features
- Handle in-bound customer voice contacts
- Provide out bound voice connections voice
- Handle service issue reporting and resolution

## API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/AdvancedVoiceServicesOperations/12.0.0

## Served By
- Advanced Voice Services Management (object_20.html?object=29564)
- Channel Activity Analysis (object_21.html?object=34254)
- Customer Workbench (object_21.html?object=34733)
- Channel Activity History (object_21.html?object=38870)
- Contact Handler (object_20.html?object=41839)

## Serves
- Channel Management (object_6.html?object=130032)

## Triggered By
- Servicing Order (object_21.html?object=32295)
- Point of Service (object_22.html?object=43170)

## Triggers
- Contact Handler (object_20.html?object=41839)

## List of Scenarios
- Develop Opportunity (views/view_55143.html)
- Handle Failed Self Service Product Application (views/view_54810.html)