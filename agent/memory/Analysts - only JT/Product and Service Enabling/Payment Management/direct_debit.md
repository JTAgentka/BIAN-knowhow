### Direct Debit - Domain Expertise
You have mastery-level understanding in following business and IT aspect of this capability. Your expertise is limited only to provided information below.



#### Capability Information
- **Capability Name**: Direct Debit
- **Folder Name**: Payment Management
- **Core Business Object**: Direct Debit Instruction (object_26.html?object=31882)

#### Role Definition
This service domain processes the creditor side of direct debit processing. Typically a creditor will submit a batch of direct debit requests. The process checks the required service mandates are in place and initiates the payment processing. It tracks payment and reports on completion or other processing issues that might arise (such as insufficient funds available).

#### Example of Use
A corporate customer submits a batch of direct debit instructions for customers with accounts held at the bank

#### Executive Summary
Fulfils a direct debit agreement. Handles the creditor side of direct debits.

#### Key Features
- Confirm direct debit mandates are in place
- Confirm funds available
- Initiate direct debit payment
- Track direct debit (include customer acceptance if required)
- Report on direct debit processing

#### API BIAN Portal Link
Direct Debit API (https://app.swaggerhub.com/apis/BIAN-3/DirectDebit/12.0.0)

#### Served By
- Payment Initiation (object_20.html?object=29967)
- Servicing Order (object_21.html?object=32295)
- Direct Debit (object_21.html?object=32677)
- Correspondent Bank Operations (object_21.html?object=32729)
- ACH Operations (object_21.html?object=36614)
- Direct Debits Service (object_21.html?object=38821)
- Credit Card (object_22.html?object=40448)
- Customer Billing (object_20.html?object=42033)

#### Serves
- Payment Management (object_6.html?object=130270)

#### Triggered By
- Payment Initiation (object_20.html?object=29967)
- Servicing Order (object_21.html?object=32295)
- Direct Debit (object_21.html?object=32677)
- Correspondent Bank Operations (object_21.html?object=32729)
- ACH Operations (object_21.html?object=36614)
- Direct Debits Service (object_21.html?object=38821)
- Credit Card (object_22.html?object=40448)
- Customer Billing (object_20.html?object=42033)

#### Triggers
- Direct Debit (object_21.html?object=32677)
- Correspondent Bank Operations (object_21.html?object=32729)
- Correspondence (object_20.html?object=32927)
- Payment Order (object_21.html?object=35550)
- ACH Operations (object_21.html?object=36614)
- Direct Debit Mandate (object_22.html?object=46204)
- Regulatory Compliance (object_22.html?object=46420)

#### List of Scenarios
- Handle Request for Refund of Incoming Direct Debit at Debtor Bank (views/view_55452.html)
- Handle Request for Refund of Internal Direct Debit (views/view_55239.html)
- Process Receipt of Payment for Outgoing Direct Debit at Creditor Bank (views/view_55676.html)
- Handle Request from Debtor to Debtor Bank for Advance Refusal of Direct Debit Collection (views/view_55681.html)
- Process Request from Debtor Bank for Refund of Unauthorised Transaction at Creditor Bank (views/view_55690.html)
- Process Request from Creditor to Creditor Bank for Reversal of Direct Debit Collection (views/view_55693.html)
- Process Response from Creditor Bank for Refund of Unauthorised Transaction at Debtor Bank (views/view_55687.html)
- Handle Request for Refund of Unauthorised Incoming Direct Debit at Debtor Bank (views/view_54934.html)
- Process Incoming Direct Debit Reversal at Debtor Bank (views/view_54796.html)
- Process Request for Refund of Outgoing Direct Debit at Creditor Bank (views/view_54637.html)
- Process Rejection Message for Outgoing Direct Debit at Creditor Bank (views/view_54628.html)
- Process Loans Instalments (views/view_54986.html)
- Process Internal Direct Debit Request from Creditor at Creditor Bank (views/view_54607.html)
