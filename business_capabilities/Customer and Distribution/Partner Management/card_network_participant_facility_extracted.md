# Card Network Participant Facility (Capability)

## Role Definition
Cards issued by banks are affiliated with one of many international Card Networks, such as Visa, Master Card, Diners, American Express. This service domain is used by the Card Network for setting up Acquiring and Issuing Bank accounts and their terms and conditions.

## Folder Name
Partner Management

## Core Business Object
Card Network Participant Agreement

## Example of Use
The Card Network signs up Acquiring Banks for recruiting and setting up accounts for merchants and Issuing Banks for issuing cards to its customers.

## Executive Summary
This service domain orchestrates the activities related to the inclusion of new Acquirers and Issuers in the Card Network, their terms and conditions and their status.

## Key Features
- Acquiring bank facility terms administration
- Issuing bank facility terms administration
- Participant bank service status maintenance

## API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/CardNetworkParticipantFacility/12.0.0

## Served By
- Card Network Participant Arrangement Analytics Object
- Arrangement_Instantiation
- Arrangement_Invocation
- Card Network Participant Facility_SD_Operations
- Arrangement_Reporting
- Card Network Participant Facility_SD_Service Group

## Serves
- Partner Management

## Triggered By
- Card Transaction Switch
- Card Case
- Processing Order
- Card Clearing

## Triggers
(None specified)

## List of Scenarios
- Handle Request for Chargeback at Acquirer
- Handle Card Chargeback at Issuer
- Handle Request for Information for Chargeback at Acquirer
- Process Authentication Request by Card Network
- Process Card Clearing by Card Network
- Authorise Card Use by Card Network

## Analytics

### Individual Analytics
- cardNetworkParticipant FulfillmentArrangementAccumulators
- cardNetworkParticipant FulfillmentArrangementActivityAnalysis
- cardNetworkParticipant FulfillmentArrangementPerformanceAnalysis
- cardNetworkParticipant FulfillmentArrangementTrends&Events

### Portfolio Analytics
- cardNetworkParticipant FulfillmentArrangementPortfolioActivityAnalysis
- cardNetworkParticipant FulfillmentArrangementPortfolioMake-UpAnalysis
- cardNetworkParticipant FulfillmentArrangementPortfolioPerformanceAnalysis

## Relations
- **Aggregated By**: Wave 2, Cards
- **Is Part Of**: Cards
- **Gets Input From**: Card Transaction Switch, Card Clearing

## BIAN Properties
- **BIAN Life Cycle**: Registered
- **Stereotype**: ServiceDomain