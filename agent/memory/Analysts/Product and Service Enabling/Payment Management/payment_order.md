### Payment Order - Domain Expertise
You have mastery-level understanding in following business and IT aspect of this capability. Your expertise is limited only to provided information below.



#### Capability Information
- **Capability Name**: Payment Order
- **Folder Name**: Payment Management
- **Core Business Object**: PaymentOrderProcedure

#### Role Definition
Payment Order handles the internal bank and compliance checks and processing of funds transfers prior to initiating the actual mechanics of transfer which is handled by the service domain Payment Execution. This includes watch-list and other regulatory checks and applying any counterparty specific limits and payment preferences. It may also oversee payment netting arrangements between the bank and other counterparties

#### Example of Use
A customer transaction results in the generation of a payment order to transfer funds to an account in another bank

#### Executive Summary
This service domain handles the bank-side processing of funds transfers, making the necessary bank and regulatory checks on the involved parties and applying their payment preferences where appropriate

#### Key Features
- Perform bank and regulatory checks on the payee and payer
- Retrieve counterparty payment preferences
- Structure payment execution requests to match preferences
- Oversee counterparty netting arrangements

#### API BIAN Portal Link
Payment Order API (https://app.swaggerhub.com/apis/BIAN-3/PaymentOrder/12.0.0)

#### Served By
- Payment Initiation (object_20.html?object=29967)
- Term Deposit (object_21.html?object=30653)
- Card Case (object_21.html?object=30796)
- Mortgage Loan (object_21.html?object=31825)
- Syndicated Loan (object_21.html?object=31921)
- Servicing Order (object_21.html?object=32295)
- Corporate Payroll Services (object_21.html?object=32364)
- Direct Debit (object_21.html?object=32677)
- Correspondent Bank Operations (object_21.html?object=32729)
- Term Deposit Framework Agreement (object_20.html?object=33675)
- Standing Order (object_21.html?object=34129)
- Party Asset Directory (object_21.html?object=34169)
- Corporate Current Account (object_21.html?object=34221)
- Card Financial Settlement (object_21.html?object=34230)
- Payment Order (object_21.html?object=35550)
- Card Clearing (object_21.html?object=36804)
- Current Account (object_21.html?object=37122)
- Collateral Asset Administration (object_21.html?object=37744)
- Letter of Credit (object_21.html?object=38418)
- Direct Debits Service (object_21.html?object=38821)
- Savings Account (object_21.html?object=38858)
- Payment Instruction (object_21.html?object=39133)
- ECM And DCM (object_22.html?object=40135)
- Credit Card (object_22.html?object=40448)
- Credit Facility (object_22.html?object=40622)
- Cash Concentration (object_22.html?object=41205)
- Disbursement (object_22.html?object=41459)
- Corporate Loan (object_20.html?object=42505)
- Consumer Loan (object_22.html?object=42931)
- Bank Guarantee (object_22.html?object=44405)
- Underwriting (object_22.html?object=44666)
- Virtual Account (object_22.html?object=45513)
- Customer Case (object_22.html?object=47339)
- Session Dialogue (object_23.html?object=48273)
- Notional Pooling (object_23.html?object=48546)
- Product Fulfillment SDs (object_25.html?object=83652)

#### Serves
- Payment Management (object_6.html?object=130270)

#### Triggered By
- Payment Initiation (object_20.html?object=29967)
- Term Deposit (object_21.html?object=30653)
- Card Case (object_21.html?object=30796)
- Mortgage Loan (object_21.html?object=31825)
- Syndicated Loan (object_21.html?object=31921)
- Servicing Order (object_21.html?object=32295)
- Corporate Payroll Services (object_21.html?object=32364)
- Direct Debit (object_21.html?object=32677)
- Correspondent Bank Operations (object_21.html?object=32729)
- Term Deposit Framework Agreement (object_20.html?object=33675)
- Standing Order (object_21.html?object=34129)
- Party Asset Directory (object_21.html?object=34169)
- Corporate Current Account (object_21.html?object=34221)
- Card Financial Settlement (object_21.html?object=34230)
- Payment Order (object_21.html?object=35550)
- Card Clearing (object_21.html?object=36804)
- Current Account (object_21.html?object=37122)
- Collateral Asset Administration (object_21.html?object=37744)
- Letter of Credit (object_21.html?object=38418)
- Direct Debits Service (object_21.html?object=38821)
- Savings Account (object_21.html?object=38858)
- Payment Instruction (object_21.html?object=39133)
- ECM And DCM (object_22.html?object=40135)
- Credit Card (object_22.html?object=40448)
- Credit Facility (object_22.html?object=40622)
- Cash Concentration (object_22.html?object=41205)
- Disbursement (object_22.html?object=41459)
- Corporate Loan (object_20.html?object=42505)
- Consumer Loan (object_22.html?object=42931)
- Bank Guarantee (object_22.html?object=44405)
- Underwriting (object_22.html?object=44666)
- Virtual Account (object_22.html?object=45513)
- Customer Case (object_22.html?object=47339)
- Session Dialogue (object_23.html?object=48273)
- Notional Pooling (object_23.html?object=48546)
- Product Fulfillment SDs (object_25.html?object=83652)

#### Triggers
- Customer Relationship Management (object_21.html?object=30437)
- Correspondent Bank Operations (object_21.html?object=32729)
- Customer Agreement (object_20.html?object=32862)
- Corporate Current Account (object_21.html?object=34221)
- Payment Order (object_21.html?object=35550)
- Market Data Switch Operation (object_21.html?object=35659)
- ACH Operations (object_21.html?object=36614)
- Current Account (object_21.html?object=37122)
- Savings Account (object_21.html?object=38858)
- Payment Execution (object_21.html?object=39023)
- Fraud Evaluation (object_22.html?object=39639)
- Direct Debit Mandate (object_22.html?object=46204)
- Regulatory Compliance (object_22.html?object=46420)
- Internal Bank Account (object_22.html?object=46477)
- Correspondent Bank Directory (object_23.html?object=48674)

#### List of Scenarios
- EXT Handle Request to Add Account to Sweep Agreement (views/view_55061.html)
- Set Up New Card for Card Application (views/view_55052.html)
- Handle Request for Balance Transfer (views/view_55031.html)
- Initiate Payment Order (views/view_54825.html)
- Process Incoming Direct Debit Instruction at Debtor Bank (views/view_54732.html)
- Process Salary Payments for Internal Accounts (views/view_54998.html)
- Process End of Daily Booking Window for Syndicated Loan Payments-III (views/view_54983.html)
- EXT Handle Request to Move Overdraft Limit between Virtual Accounts (views/view_54989.html)
- EXT Handle Request for High Volume Account Opening (views/view_54681.html)
- Disburse Uncollateralised Consumer Loan (views/view_54974.html)
- Handle Request for Withdrawal from Consumer Loan (views/view_54840.html)
- Process Termination of Syndicated Loan-III (views/view_54904.html)
- Handle Request to Issue Guarantee on Request of Another Bank (views/view_54980.html)
- Handle Request for Notional Pooling Agreement (views/view_54592.html)
- Create Customer Reports (views/view_55419.html)
- Handle Request to Use Direct Debits as Payment Instrument (views/view_55659.html)
- Perform Underwriting for Bank Guarantee (views/view_55245.html)
- Handle Instruction to Terminate B2B Direct Debits Service at Creditor Bank (views/view_55197.html)
- Handle Request to Cancel Credit Transfer Standing Order on Corporate Current Account (views/view_55362.html)
- Handle Request for Refund of Incoming Direct Debit at Debtor Bank (views/view_55452.html)
- Handle Request to Add Account to Sweep Agreement (views/view_55314.html)
- Handle Request to Close Savings Account (views/view_55416.html)
- Handle Request for Outgoing Credit Transfer (views/view_55383.html)
- Record Collateral Insurance Details (views/view_55323.html)
- EXT Handle Request to Open Retail Current Account (views/view_55487.html)
- Handle Request for Chargeback at Acquirer (views/view_55230.html)
- Process Disbursement for Modification of Corporate Loan (views/view_55401.html)
- Process Settlement by Acquirer (views/view_55526.html)
- EXT Handle Customer Relationships Case (views/view_55529.html)
- EXT Disburse Renewed Uncollateralised Consumer Loan (views/view_55413.html)
- Process Termination of Syndicated Loan-II (views/view_55119.html)
- Handle Request to Open Savings Account (views/view_55628.html)
- Verify Payment of Taxes on Property (views/view_55332.html)
- Process Clearing Error for Outgoing Credit Transfer (views/view_55167.html)
