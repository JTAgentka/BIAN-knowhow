# Credit Card

## Role Definition
This service domain handles both credit and charge card fulfillment. The main functional difference being the different re-payment and credit handling structures of the two types of card product. Note that unlike a current accounts, card products are typically fulfilled through specialised credit card companies using a card network that links issuing banks and merchant acquiring banks for authorization, clearing and settlement activities. Debit cards (i.e. devices to access a normal bank account) do not come under this Service Domain.

## Folder Name
Money Movement Management

## Core Business Object
Not specified in the document

## Example of Use
An established card customer uses his or her credit card for a purchase and settles the balance of the card account at the monthly payment cycle

## Executive Summary
This service domain orchestrates the scheduled maintenance and transactional activities associated with credit card product fulfillment

## Key Features
- Set-up a credit card account
- Process card transactions (authorizations)
- Calculate interest and fees
- Initiate and track dispute resolutions
- Initiate customer billing
- Process clearing and settlement

## API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/CreditCard/12.0.0

## Service Relationships

### Served By
- Cards (object_25.html?object=129966)
- Wave 2 (object_25.html?object=153742)
- Wave 1 (object_25.html?object=153747)
- Cards (object_25.html?object=172024)
- Product Fulfillment SDs (object_25.html?object=83652)

### Serves
- Money Movement Management (object_6.html?object=130159)

### Triggered By
- Card Case (object_21.html?object=30796)
- Servicing Order (object_21.html?object=32295)
- Processing Order (object_20.html?object=33179)
- Card Clearing (object_21.html?object=36804)
- Customer Offer (object_22.html?object=39968)
- Credit Card (object_22.html?object=40448)
- Card Collections (object_20.html?object=41869)
- Card Authorization (object_22.html?object=44578)
- Delinquent Account Handling (object_22.html?object=47264)
- Customer Case (object_22.html?object=47339)
- Credit Card Position Keeping (object_23.html?object=48362)

### Triggers
- Customer Access Entitlement (object_20.html?object=30136)
- Issued Device Tracking (object_20.html?object=30205)
- Issued Device Administration (object_21.html?object=30905)
- Direct Debit (object_21.html?object=32677)
- Customer Behavior Insights (object_21.html?object=34917)
- Card Transaction Capture (object_21.html?object=35397)
- Payment Order (object_21.html?object=35550)
- Account Recovery (object_21.html?object=35767)
- Sales Product Agreement (object_21.html?object=37916)
- Direct Debits Service (object_21.html?object=38821)
- Credit Card (object_22.html?object=40448)
- Customer Behavior Models (object_22.html?object=41791)
- Card Collections (object_20.html?object=41869)
- Customer Billing (object_20.html?object=42033)
- Financial Accounting (object_20.html?object=42346)
- Customer Credit Rating (object_22.html?object=43153)
- Direct Debit Mandate (object_22.html?object=46204)
- Delinquent Account Handling (object_22.html?object=47264)
- Session Dialogue (object_23.html?object=48273)
- Credit Card Position Keeping (object_23.html?object=48362)

## List of Scenarios
- Set Up New Card for Card Application (views/view_55052.html)
- Handle Request for Balance Transfer (views/view_55031.html)
- Handle Request for Card Activation (views/view_55025.html)
- Process Authentication Request by Issuer (views/view_54669.html)
- Process Card Account Delinquency Review (views/view_55269.html)
- Handle Request for Direct Debit Payments (views/view_55128.html)
- Handle Card Chargeback at Issuer (views/view_55464.html)
- Process Card Billing (views/view_55651.html)
- Process Transaction Booking (views/view_55666.html)
- Handle Request to Block Card (views/view_55104.html)
- Process Periodic Review of Collection Actions (views/view_55302.html)
- Authorise Card Use by Issuer (views/view_55275.html)
- Process Direct Debit Payments (views/view_54962.html)
- Process Automatic Card Renewal (views/view_54729.html)
- Process Card Collection (views/view_54910.html)
- Handle Request for Token Assurance (views/view_54761.html)
- Handle Request to Replace Card (views/view_54613.html)