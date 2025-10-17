# Payment Management

## Service Domains

### Payment Initiation

#### role_definition
This service domain supports payment services for consumer and business customers. Payments are made to other accounts within the bank, other banks and possibly internationally using whatever payments mechanism is suited to the transaction (See Payments Order/Execution). The service domain can support single transactions, or manage repeating/scheduled payments if requested

#### core_business_object
Payment Instruction (object_26.html?object=44763)

#### key_features
- Capture payment instruction details
- Verify/validate payment transaction (check funds available)
- Initiation payment order processing
- Retain, apply and update repeating remittances

#### example_of_use
An established customer transfers an amount from their current account to an overseas account for a family member. As this is a recurring transaction, the details are maintained and updated as necessary

#### triggered_by
- Payment Initiation (object_20.html?object=29967)
- Correspondence (object_20.html?object=32927)
- Session Dialogue (object_23.html?object=48273)

#### triggers
- Payment Initiation (object_20.html?object=29967)
- Direct Debit (object_21.html?object=32677)
- Customer Agreement (object_20.html?object=32862)
- Corporate Current Account (object_21.html?object=34221)
- Customer Workbench (object_21.html?object=34733)
- Payment Order (object_21.html?object=35550)
- Market Data Switch Operation (object_21.html?object=35659)
- Information Provider Operation (object_20.html?object=42204)
- Party Reference Data Directory (object_22.html?object=45230)
- Direct Debit Mandate (object_22.html?object=46204)
- Session Dialogue (object_23.html?object=48273)
- Transaction Authorization (object_23.html?object=48811)

#### list_of_scenarios
- Handle Request for Outgoing Credit Transfer (views/view_55383.html)
- Handle Request for Outgoing FCY Credit Transfer via SWIFT (views/view_55095.html)
- Handle Request for Payment at Creditor Bank for External Account (views/view_55356.html)
- Handle Request for Internal Credit Transfer from Savings Account (views/view_54764.html)
- EXT Handle Request for Account Statement and Outgoing Credit Transfer (views/view_54747.html)
- Handle Request for Internal Credit Transfer Requiring Second Line Authorisation (views/view_54643.html)
- Handle Customer Request for Payment Order during Active Mobile Access Session (views/view_55010.html)
- Handle Request for Internal Credit Transfer between Corporate Current Accounts (views/view_54802.html)

#### api_bian_portal_link
Payment Initiation API (https://app.swaggerhub.com/apis/BIAN-3/PaymentInitiation/12.0.0)

##### IT details
- REST APIs:  validatePayment
- Key API Operations: FE validation controls (valid IBAN, ...)
- Event Streams:  
- Core System: DKCZ/DKSK
- Data Objects:  PaymentOrder
- Key Systems flow: DKCZ/DKSK -> ESBW -> PTS
- Data Quality: 

---

### Payment Order

#### role_definition
Payment Order handles the internal bank and compliance checks and processing of funds transfers prior to initiating the actual mechanics of transfer which is handled by the service domain Payment Execution. This includes watch-list and other regulatory checks and applying any counterparty specific limits and payment preferences. It may also oversee payment netting arrangements between the bank and other counterparties

#### core_business_object
PaymentOrderProcedure

#### key_features
- Perform bank and regulatory checks on the payee and payer
- Retrieve counterparty payment preferences
- Structure payment execution requests to match preferences
- Oversee counterparty netting arrangements

#### example_of_use
A customer transaction results in the generation of a payment order to transfer funds to an account in another bank

#### triggered_by
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

#### triggers
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

#### list_of_scenarios
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

#### api_bian_portal_link
Payment Order API (https://app.swaggerhub.com/apis/BIAN-3/PaymentOrder/12.0.0)

##### IT details
- REST APIs:  PTSCZStandingOrders, PTSSKStandingOrders, PTSCZPayments, PTSSKPayments
- Key API Operations: Create/Modify/Cancel/Validate/Get Payment (Standing) Order
- Event Streams:  JTB-CZ_PAYMENTS_STANDING-ORDER_EVENT_GNR, JTB-SK_PAYMENTS_STANDING-ORDER_EVENT_GNR, JTB-CZ_PAYMENTS_PAYMENT_EVENT_GNR, JTB-SK_PAYMENTS_PAYMENT_EVENT_GNR
- Core System: PTSCZ and PTSSK
- Data Objects:  StandingOrder, PaymentOrder > DMCT (domestic), DICT (domestic instant), ESCT (SEPA), EXCT (cross-border EEP), IBCT (internal), NXCT (cross-border non-EEP), XBCT (cross-border)
- Key Systems flow: DKCZ/DKSK → PTS ↔ BISQ → DKCZ, DKSK
- Data Quality: 

---

### Payment Execution

#### role_definition
Payment Execution handles the back-end processing of a movement funds from a debtor account to a creditor account. Payments need to have been authorized and validated against customer/bank agreements before being instructed to Payment Execution. Payment Execution then determines whether debtor and creditor accounts are held within the bank and if not selects the appropriate payment mechanism/channel to use to complete the transfer. It is responsible for ensuring that both (or neither) sides of the exchange are completed successfully

#### core_business_object
Payment Execution Procedure

#### key_features
- Determine the appropriate payment mechanism
- Retrieve counterparty payment instructions/preferences
- Generate creditor and debtor instructions
- Confirm (and report) both legs of the movement are completed

#### example_of_use
Funds are transferred from a customer's account with the bank to a payee account held at another bank

#### triggered_by
- Payment Order (object_21.html?object=35550)
- Payment Execution (object_21.html?object=39023)

#### triggers
- Position Keeping (object_20.html?object=30315)
- Correspondent Bank Operations (object_21.html?object=32729)
- Corporate Current Account (object_21.html?object=34221)
- ACH Operations (object_21.html?object=36614)
- Current Account (object_21.html?object=37122)
- Payment Execution (object_21.html?object=39023)
- Payment Rail Operations (object_22.html?object=40093)
- Consumer Loan (object_22.html?object=42931)
- Product Fulfillment SDs (object_25.html?object=83652)

#### list_of_scenarios
- Initiate Payment Order (views/view_54825.html)
- Process Salary Payments for Internal Accounts (views/view_54998.html)
- Handle Request for Refund of Incoming Direct Debit at Debtor Bank (views/view_55452.html)
- Handle Request for Outgoing Credit Transfer (views/view_55383.html)
- Handle Request for Chargeback at Acquirer (views/view_55230.html)
- Process Clearing Error for Outgoing Credit Transfer (views/view_55167.html)
- Handle Request for Outgoing FCY Credit Transfer via SWIFT (views/view_55095.html)
- Handle Request for Cash Withdrawal from Savings Account (views/view_55359.html)
- Handle Incoming Credit Transfer (views/view_55395.html)
- Handle Incoming Request for Payment at Debtor Bank (views/view_55467.html)
- Handle Request for Refund of Internal Direct Debit (views/view_55239.html)
- Record Debit Booking (views/view_55631.html)
- Handle Request for Payment at Creditor Bank for External Account (views/view_55356.html)
- Process Receipt of Payment for Outgoing Direct Debit at Creditor Bank (views/view_55676.html)
- Handle Request for Internal Credit Transfer from Savings Account (views/view_54764.html)
- Process Request for Refund of Outgoing Direct Debit at Creditor Bank (views/view_54637.html)
- Process Interest Settlement for Corporate Current Account (views/view_54874.html)
- Process Interest Settlement Savings Account (views/view_54622.html)
- EXT Handle Request for Account Statement and Outgoing Credit Transfer (views/view_54747.html)
- Process Notification to Remove Amount Block (views/view_54828.html)
- Handle Request for Internal Credit Transfer Requiring Second Line Authorisation (views/view_54643.html)
- Handle Request for Outgoing Credit Transfer Related to Request to Pay at Debtor Bank (views/view_54799.html)
- Process Rejection Message for Outgoing Direct Debit at Creditor Bank (views/view_54628.html)
- Process Salary Payments for External Accounts (views/view_54595.html)
- Process Incoming Credit Transfer at Creditor Bank towards Outgoing Request for Payment (views/view_54705.html)
- Record Credit Booking (views/view_54775.html)
- Process Internal Direct Debit Request from Creditor at Creditor Bank (views/view_54607.html)
- Handle Request for Internal Credit Transfer between Corporate Current Accounts (views/view_54802.html)
- Process Incoming Credit Transfer for Letter of Credit (views/view_55656.html)
- Handle Incoming FCY Credit Transfer for LCY Account (views/view_54977.html)

#### api_bian_portal_link
Payment Execution API (https://app.swaggerhub.com/apis/BIAN-3/PaymentExecution/12.0.0)

##### IT details
- REST APIs:  batch integration
- Key API Operations: Create/Modify/Cancel/Validate/Get Payment (Standing) Instruction
- Event Streams:  batch integration
- Core System: PTSCZ and PTSSK
- Data Objects:  StandingOrder, PaymentOrder > DMCT (domestic), DICT (domestic instant), ESCT (SEPA), EXCT (cross-border EEP), IBCT (internal), NXCT (cross-border non-EEP), XBCT (cross-border)
- Key Systems flow:  PTS ↔ BISQ 
- Data Quality: 

---

### Transaction Engine

#### role_definition
The Service Domain provides a utility/background operational support service to orchestrate a schedule of payment transaction and reporting activities for the fulfillment of certain long term instruments or structured facilities. The Service Domain maintains a link to the associated fulfillment Service Domain and the applicable product instance for reporting and processing issues that may arise.

#### core_business_object
Transaction Schedule Arrangement (object_26.html?object=35225)

#### key_features
- Establish the processing schedule for a product instance
- Process transaction and reporting tasks as necessary
- Escalate issues to the product fulfillment Service Domain as necessary
- Report on transaction fulfillment activity

#### example_of_use
The mortgage fulfillment Service Domain delegates repayment processing to the Transaction Engine for its active mortgage product instances

#### triggered_by
[]

#### triggers
[]

#### list_of_scenarios
[]

#### api_bian_portal_link
Transaction Engine API (https://app.swaggerhub.com/apis/BIAN-3/TransactionEngine/12.0.0)

##### IT details
##### IT details
- REST APIs:  
- Key API Operations: 
- Event Streams:  
            JTB-CZ_POSITION-KEEPING_CRD-TRANSACTION_EVENT_GNR,
            JTB-SK_POSITION-KEEPING_CRD-TRANSACTION_EVENT_GNR,
            JTB-CZ_POSITION-KEEPING_TLM-TRANSACTION_EVENT_GNR,
            JTB-SK_POSITION-KEEPING_TLM-TRANSACTION_EVENT_GNR,
            JTB-CZ_POSITION-KEEPING_GEN-TRANSACTION_EVENT_GNR,
            JTB-SK_POSITION-KEEPING_GEN-TRANSACTION_EVENT_GNR,
            JTB-CZ_POSITION-KEEPING_FCP-TRANSACTION_EVENT_GNR,
            JTB-SK_POSITION-KEEPING_FCP-TRANSACTION_EVENT_GNR,
            JTB-CZ_POSITION-KEEPING_LCP-TRANSACTION_EVENT_GNR,
            JTB-SK_POSITION-KEEPING_LCP-TRANSACTION_EVENT_GNR,
            JTB-CZ_POSITION-KEEPING_CTI-TRANSACTION_EVENT_GNR,
            JTB-SK_POSITION-KEEPING_CTI-TRANSACTION_EVENT_GNR,
            JTB-CZ_POSITION-KEEPING_CRD-RES-TRANSACTION_EVENT_GNR,
            JTB-SK_POSITION-KEEPING_CRD-RES-TRANSACTION_EVENT_GNR,
            JTB-CZ_POSITION-KEEPING_SEPA-RES-TRANSACTION_EVENT_GNR,
            JTB-SK_POSITION-KEEPING_SEPA-RES-TRANSACTION_EVENT_GNR
- Core System: 
- Data Objects:  
            Transaction - Base transaction entity with common attributes across all transaction types,
            CRD Transaction (Card Transactions) - Real-time publication, of payment card deposit and withdrawal transactions,
            TLM Transaction - Terminal-based transaction events,
            GEN Transaction - General banking transaction events,
            FCP Transaction - (Fees/Charges Processing),
            LCP Transaction - Loan and credit transaction events,
            CTI Transaction - Cross-transaction and internal transfer events,
            CRD-RES Reservation - Card transaction reservations,
            SEPA Reservation - SEPA transactions 
- Key Systems flow: PTS ↔ BISQ → DKCZ, DKSK
- Data Quality: Questor CZ and Questor SK

---

### Disbursement

#### role_definition
This service domain handles the disbursement of funds typically for different loan facilities. Though typically a rather simple service it is modeled as a discrete service center as many banks handle disbursements from a specialist unit

#### core_business_object
Disbursement

#### key_features
- Handle disbursements for new loans
- Report on disbursement activity/status

#### example_of_use
A disbursement is processed at the closing of a new loan

#### triggered_by
- Customer Relationship Management (object_21.html?object=30437)
- Mortgage Loan (object_21.html?object=31825)
- Syndicated Loan (object_21.html?object=31921)
- Merchandising Loan (object_22.html?object=41553)
- Corporate Loan (object_20.html?object=42505)
- Consumer Loan (object_22.html?object=42931)
- Product Fulfillment SDs (object_25.html?object=83652)

#### triggers
- Correspondence (object_20.html?object=32927)
- Party Asset Directory (object_21.html?object=34169)
- Corporate Current Account (object_21.html?object=34221)
- Customer Workbench (object_21.html?object=34733)
- Payment Order (object_21.html?object=35550)
- Current Account (object_21.html?object=37122)
- Collateral Asset Administration (object_21.html?object=37744)
- Customer Billing (object_20.html?object=42033)
- Corporate Loan (object_20.html?object=42505)
- Collateral Allocation Management (object_23.html?object=47470)

#### list_of_scenarios
- EXT Process Closing of Merchandising Loan (views/view_54723.html)
- Disburse Uncollateralised Consumer Loan (views/view_54974.html)
- Process Closing of Corporate Loan (views/view_55458.html)
- Process Disbursement for Modification of Corporate Loan (views/view_55401.html)
- EXT Disburse Renewed Uncollateralised Consumer Loan (views/view_55413.html)
- Perform Closing of Uncollateralised Consumer Loan (views/view_55478.html)
- Process Closing of Mortgage Loan (views/view_55134.html)
- Disburse Syndicated Loan-I (views/view_55040.html)
- EXT Process Closing for Renewal of Uncollateralised Consumer Loan (views/view_54770.html)
- Process Closing of Syndicated Loan-III (views/view_54831.html)
- Process Modification of Corporate Loan (views/view_54822.html)
- Process Closing of Syndicated Loan-II (views/view_54738.html)
- Disburse Syndicated Loan-II (views/view_54942.html)
- EXT Disburse Merchandising Loan (views/view_54860.html)
- Disburse Syndicated Loan-III (views/view_54696.html)
- Disburse Mortgage Loan (views/view_54693.html)
- Disburse Corporate Loan (views/view_54601.html)

#### api_bian_portal_link
Disbursement API (https://app.swaggerhub.com/apis/BIAN-3/Disbursement/12.0.0)

---

### Direct Debit

#### role_definition
This service domain processes the creditor side of direct debit processing. Typically a creditor will submit a batch of direct debit requests. The process checks the required service mandates are in place and initiates the payment processing. It tracks payment and reports on completion or other processing issues that might arise (such as insufficient funds available).

#### core_business_object
Direct Debit Instruction (object_26.html?object=31882)

#### key_features
- Confirm direct debit mandates are in place
- Confirm funds available
- Initiate direct debit payment
- Track direct debit (include customer acceptance if required)
- Report on direct debit processing

#### example_of_use
A corporate customer submits a batch of direct debit instructions for customers with accounts held at the bank

#### triggered_by
- Payment Initiation (object_20.html?object=29967)
- Servicing Order (object_21.html?object=32295)
- Direct Debit (object_21.html?object=32677)
- Correspondent Bank Operations (object_21.html?object=32729)
- ACH Operations (object_21.html?object=36614)
- Direct Debits Service (object_21.html?object=38821)
- Credit Card (object_22.html?object=40448)
- Customer Billing (object_20.html?object=42033)

#### triggers
- Direct Debit (object_21.html?object=32677)
- Correspondent Bank Operations (object_21.html?object=32729)
- Correspondence (object_20.html?object=32927)
- Payment Order (object_21.html?object=35550)
- ACH Operations (object_21.html?object=36614)
- Direct Debit Mandate (object_22.html?object=46204)
- Regulatory Compliance (object_22.html?object=46420)

#### list_of_scenarios
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

#### api_bian_portal_link
Direct Debit API (https://app.swaggerhub.com/apis/BIAN-3/DirectDebit/12.0.0)

##### IT details
- REST APIs: PTSSKDirectDebitMandate, PTSCZDirectDebitMandate 
- Key API Operations: Create Direct Debit Mandate, Modify Direct Debit Mandate, Cancel Direct Debit Mandate, Validate DDM, Get DDM Status
- Event Streams:  JTB-SK_PAYMENTS_DDM_EVENT_GNR 
- Core System: PTSCZ and PTS SK
- Data Objects:  DirectDebitMandate, MandateStatus, CreditorInformation, DebtorInformation
- Key Systems flow: DKCZ, DKSK → ESB WSO2 → PTS → EI KAFKA →  DKCZ, DKSK
- Data Quality: 


---



### Direct Debit Mandate

#### role_definition
Customer mandates are administered/managed that are associated with a direct debit processing facility provided for a corporate client. The individual customer mandates are registered and may be updated/amended. The mandates are referenced to confirm coverage when direct debit processing is undertaken periodically

#### core_business_object
Direct Debit Mandate Agreement (object_26.html?object=43513)

#### key_features
- Register customer direct debit mandates
- Update customer mandates
- Provide mandate details/confirm coverage

#### example_of_use
A customer completes a direct debit mandate for a corporate client that is registered

#### triggered_by
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

#### triggers
- Operational Gateway (object_21.html?object=32276)
- Correspondence (object_20.html?object=32927)
- Document Directory (object_22.html?object=44708)

#### list_of_scenarios
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

#### api_bian_portal_link
Direct Debit Mandate API (https://app.swaggerhub.com/apis/BIAN-3/DirectDebitMandate/12.0.0)

---
