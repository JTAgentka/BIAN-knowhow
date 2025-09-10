# Delinquent Account Handling (Capability)

## Role Definition
This service domain determines and executes strategies for eliciting payment from high risk accounts. These strategies may include communicating with the customer through text messages, emails or phone calls. The account may continue to maintain some facilities at this stage. Eventually it can be necessary to reduce the credit line or block the account to prevent further increase in risk, or to cancel the account and transfer it to Collections.

## Folder Name
Task Management

## Core Business Object
*Not specified in the document*

## Example of Use
When a Card Account is assessed to be at a high risk of default, such as a Charge Card Account with high out of pattern outstandings or a Credit Card Account with significant aged balances, attempts are made to elicit the payment of the outstanding amounts or to limit further increase in risk through optimal strategies for contacting the customer and inducing payment of the outstanding amount.

## Executive Summary
This service domain handles delinquent accounts (typically for active credit/charge cards) for follow-up of payments due through periodic review and contacts. This process ends when the account is cancelled and is transferred to Collections

## Key Features
- Delinquent account assessment
- Account owner contact
- Account payment processing
- Delinquent account resolution (re-instated or passed to collections)

## API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/DelinquentAccountHandling/12.0.0

## Served By
- Wave 2 (object_25.html?object=153742)
- Operational Services (object_25.html?object=171737)

## Serves
- Task Management (object_6.html?object=130474)

## Triggered By
- Open Item Management (object_21.html?object=31686)
- Credit Card (object_22.html?object=40448)
- Delinquent Account Handling (object_22.html?object=47264)
- Customer Case (object_22.html?object=47339)

## Triggers
- Correspondence (object_20.html?object=32927)
- Credit Card (object_22.html?object=40448)
- Customer Credit Rating (object_22.html?object=43153)
- Document Directory (object_22.html?object=44708)
- Delinquent Account Handling (object_22.html?object=47264)

## Scenarios
1. [Process Consumer Loan Delinquency First Stage](views/view_55407.html)
2. [Process Card Account Delinquency Review](views/view_55269.html)
3. [Process Card Collection](views/view_54910.html)