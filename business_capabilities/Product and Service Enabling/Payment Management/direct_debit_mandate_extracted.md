# Direct Debit Mandate

## Capability Information
- **Capability Name**: Direct Debit Mandate
- **Folder Name**: Payment Management
- **Core Business Object**: Direct Debit Mandate Agreement (object_26.html?object=43513)

## Role Definition
Customer mandates are administered/managed that are associated with a direct debit processing facility provided for a corporate client. The individual customer mandates are registered and may be updated/amended. The mandates are referenced to confirm coverage when direct debit processing is undertaken periodically

## Example of Use
A customer completes a direct debit mandate for a corporate client that is registered

## Executive Summary
This service domains manages the customer mandates associated with direct debit processing for a corporate client

## Key Features
- Register customer direct debit mandates
- Update customer mandates
- Provide mandate details/confirm coverage

## API BIAN Portal Link
Direct Debit Mandate API (https://app.swaggerhub.com/apis/BIAN-3/DirectDebitMandate/12.0.0)

## Served By
- Corporate Current Account (object_21.html?object=34221)

## Serves
- Payment Management (object_6.html?object=130270)

## Triggered By
- Payment Initiation (object_20.html?object=29967)
- Servicing Order (object_21.html?object=32295)
- Direct Debit (object_21.html?object=32677)
- Processing Order (object_20.html?object=33179)
- Corporate Current Account (object_21.html?object=34221)
- Payment Order (object_21.html?object=35550)
- Direct Debits Service (object_21.html?object=38821)
- Credit Card (object_22.html?object=40448)
- Virtual Account (object_22.html?object=45513)
- Session Dialogue (object_23.html?object=48273)

## Triggers
- Operational Gateway (object_21.html?object=32276)
- Correspondence (object_20.html?object=32927)
- Document Directory (object_22.html?object=44708)

## List of Scenarios
- Process Notice of B2B Direct Debit Mandate Amendment from Creditor bank at Debtor Bank (views/view_54699.html)
- Process Incoming Direct Debit Instruction at Debtor Bank (views/view_54732.html)
- 5 - Process request to add account(s) (views/view_44769.html)
- Handle Request for Copy of Active Version of Mandate at Debtor Bank (views/view_55016.html)
- Handle Instruction to Terminate B2B Direct Debits Service at Creditor Bank (views/view_55197.html)
- Handle Request for Direct Debit Payments (views/view_55128.html)
- Record Direct Debit Mandate at Creditor Bank (views/view_55176.html)
- Handle Request for BNPL Financing by Bank where Buyer Is Existing Customer (views/view_55517.html)
- Handle Request to Close Corporate Current Account (views/view_55308.html)
- EXT Handle Instruction to Terminate B2B Direct Debits Service at Creditor Bank (views/view_55440.html)
- EXT Handle Request to Close Virtual Account (views/view_55455.html)
- EXT Handle Request to Close Corporate Current Account (views/view_55101.html)
- Process B2B Direct Debit Mandate Notice from Creditor bank at Debtor Bank (views/view_55544.html)
- Process Receipt of New Version of Direct Debit Mandate at Debtor Bank (views/view_55158.html)
- 15-19- Get Customer account details (views/view_36796.html)
- Handle Request for Refund of Unauthorised Incoming Direct Debit at Debtor Bank (views/view_54934.html)
- Record Amendment of Direct Debit Mandate at Creditor Bank (views/view_54720.html)
- EXT Record Core SEPA Direct Debit Mandate at Creditor Bank (views/view_54744.html)
- Process Request for Copy of Active Version of Mandate at Creditor Bank (views/view_54925.html)
- Process Internal Direct Debit Request from Creditor at Creditor Bank (views/view_54607.html)