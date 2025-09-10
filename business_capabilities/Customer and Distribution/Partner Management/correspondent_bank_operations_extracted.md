# Correspondent Bank Operations (Capability)

## Role Definition
This Service Domain handles incoming and outgoing payment clearing and settlement messages to the bank's correspondent banking partners. The actual message transmission is delegated to the Financial Message Gateway service domain. Correspondent Bank administers the mirror accounting for interbank payments undertaking the underlying account reconciliation tasks.

## Folder Name
Partner Management

## Core Business Object
Settlement Account (object_26.html?object=41416)

## Example of Use
Transfer funds from a customer account with the bank to an account with another bank.

## Executive Summary
This service domain fulfils correspondent banking arrangements between the bank and its correspondent banking partners. This includes handling the clearing and settlement of payments to/from the correspondent banks, typically using the SWIFT payment network.

## Key Features
- Handle correspondent payment transactions
- Maintain and reconcile shadow accounting
- Generate and process SWIFT messages

## API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/CorrespondentBankOperations/12.0.0

## Served By
- None listed

## Serves
- Partner Management (object_6.html?object=130509)

## Triggered By
- Financial Gateway (object_20.html?object=29241)
- Direct Debit (object_21.html?object=32677)
- Correspondent Bank Operations (object_21.html?object=32729)
- Payment Order (object_21.html?object=35550)
- Letter of Credit (object_21.html?object=38418)
- Payment Execution (object_21.html?object=39023)
- Bank Guarantee (object_22.html?object=44405)

## Triggers
- Financial Gateway (object_20.html?object=29241)
- Position Keeping (object_20.html?object=30315)
- Financial Message Analysis (object_21.html?object=30650)
- Direct Debit (object_21.html?object=32677)
- Correspondent Bank Operations (object_21.html?object=32729)
- Payment Order (object_21.html?object=35550)

## List of Scenarios
- Process Incoming Direct Debit Instruction at Debtor Bank (views/view_54732.html)
- Handle Request to Issue Guarantee on Request of Another Bank (views/view_54980.html)
- Handle Request for Refund of Incoming Direct Debit at Debtor Bank (views/view_55452.html)
- Handle Request for Outgoing Credit Transfer (views/view_55383.html)
- Process Clearing Error for Outgoing Credit Transfer (views/view_55167.html)
- Handle Request for Outgoing FCY Credit Transfer via SWIFT (views/view_55095.html)
- Handle Incoming Credit Transfer (views/view_55395.html)
- Initiate Bank Guarantee (views/view_55496.html)
- Process Receipt of Payment for Outgoing Direct Debit at Creditor Bank (views/view_55676.html)
- Receive Shipping Documents from Exporter (views/view_55596.html)
- Process Request for Refund of Outgoing Direct Debit at Creditor Bank (views/view_54637.html)
- Process Rejection Message for Outgoing Direct Debit at Creditor Bank (views/view_54628.html)
- Process Salary Payments for External Accounts (views/view_54595.html)
- Process Incoming Credit Transfer for Letter of Credit (views/view_55656.html)
- Update Letter of Credit for Extension of Validity (views/view_55579.html)
- Handle Request to Extend Validity of Letter of Credit (views/view_55634.html)
- Review Letter of Credit and Pass on to Exporter (views/view_54793.html)
- Initiate Letter of Credit (views/view_54819.html)
- Handle Incoming FCY Credit Transfer for LCY Account (views/view_54977.html)