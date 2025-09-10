# Card Authorization

## Role Definition
The proposed card transaction is requested by a merchant and routed through the Acquirer and Card Network to the Issuer. The authorization decision is automated and can be extremely complex. Transactions may be passed for manual checks by on-line service representatives for out of pattern purchases. Note that authorized transaction amounts may vary from the actual final amount (e.g. pre authorized hotel/car hire and charged meals excluding tips) and in cases there will be no financial transaction for an authorized transaction if the customer chooses to pay using a different card/cash. While this function is primarily performed by the Issuer, Acquirers and Card Networks may perform Stand-in Authorization and forward the results to the Issuer for recording.

## Folder Name
Money Movement Management

## Core Business Object
Card Payment Authorisation (object_26.html?object=47528)

## Example of Use
A credit card customer makes a large purchase, the card authorization triggers a verbal check of the customer details for security and the authorization is given

## Executive Summary
This service domain is responsible for the real time card authorization decisions for credit/charge cards.

## Key Features
- Card device verification checks
- Card member identity verification
- Credit checks
- Fraud detection checks

## API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/CardAuthorization/12.0.0

## Service Relationships

### Served By
- Cards (object_25.html?object=129966)
- Wave 2 (object_25.html?object=153742)
- Wave 1 (object_25.html?object=153747)
- Cards (object_25.html?object=172024)

### Serves
- Money Movement Management (object_6.html?object=130159)
- Card Transaction Capture (object_21.html?object=35397)

### Triggered By
- Card Transaction Switch (object_20.html?object=29401)
- Card Clearing (object_21.html?object=36804)
- Card Authorization (object_22.html?object=44578)
- Card Terminal Operation (object_22.html?object=45274)

### Triggers
- Card Transaction Switch (object_20.html?object=29401)
- Issued Device Tracking (object_20.html?object=30205)
- Customer Behavior Insights (object_21.html?object=34917)
- Card Transaction Capture (object_21.html?object=35397)
- Fraud Evaluation (object_22.html?object=39639)
- Credit Card (object_22.html?object=40448)
- Party Authentication (object_22.html?object=40912)
- Card Authorization (object_22.html?object=44578)
- Credit Card Position Keeping (object_23.html?object=48362)

## List of Scenarios
- Process Card Clearing by Issuer (views/view_55194.html)
- Authorise Card Use by Acquirer (views/view_55588.html)
- Process Card Clearing by Acquirer (views/view_55404.html)
- Authorise Card Use by Issuer (views/view_55275.html)
- Authorise Card Use by Card Network (views/view_54886.html)