# Agreement Management - Extended Domain List

---

#### - **Customer/Product Agreement** – Framework customer contract maintenance.

##### role_definition
The Customer Agreement service domain captures and maintains the master legal terms of conditions in force for a customer (which as noted can be a complex multinational with many underlying product and service specific agreements).

##### core_business_object
CustomerMasterAgreement

##### key_features
- Set-up and maintain the customer master agreement
- Ensure legal, regulatory and corporate considerations are covered in agreement
- Determine if proposed actions are covered by the agreement

##### example_of_use
An new customer's master agreement is established prior to negotiating and setting up the underlying product specific agreements

##### triggered_by
- Party Lifecycle Management
- Payment Initiation
- Customer Relationship Management
- Mortgage Loan
- Servicing Order
- Corporate Current Account
- Payment Order
- Current Account
- Customer Offer
- Corporate Loan
- Consumer Loan
- Customer Case
- Loan Syndication

##### triggers
- Customer master agreement establishment
- Legal terms evaluation
- Regulatory compliance checks
- Corporate policy updates

##### list_of_scenarios
- Set Up New Card for Card Application
- Initiate Payment Order
- EXT Handle Request to Move Overdraft Limit between Virtual Accounts
- EXT Handle Request for High Volume Account Opening
- Execute Customer Onboarding API version
- Handle Request for Notional Pooling Agreement
- Handle Request for Loan that Requires Syndication
- Process Closing of Corporate Loan
- EXT Handle Customer Relationships Case
- Handle Request for Corporate Loan
- EXT Handle Bulk Request for Opening Salary Accounts
- Handle Request for Preferential Rates for Corporate Current Account
- EXT Handle Request for High Volume Virtual Account Opening
- Handle Request for Product Selection
- Handle Bulk Request for Opening Salary Accounts
- Process Closing of Mortgage Loan
- EXT Handle Request for Preferential Rates for Corporate Current Account
- Handle Request for Consumer Loan Checks and Options
- EXT Handle Request to Open Corporate Current Account
- EXT Handle Request to Open Virtual Account
- Handle Request to Open Corporate Current Account
- EXT Handle Request to Establish Term Deposit Agreement
- Handle Request to Establish Term Deposit Agreement

##### IT details
- REST APIs: ClientDocument, clientDocumentReconciliation 
- Key API Operations: Create/update/delete operations on contract documents (mostly via CRM API calls)
- Event Streams: JTB-CZ_DOCUMENTS_CLIENT-DOCUMENT_EVENT_GNR, JTB-SK_DOCUMENTS_CLIENT-DOCUMENT_EVENT_GNR 
- Core System: SHAREPOINT
- Data Objects: ClientDocument entity with before/after states 
- Key Systems flow: DKCZ/DKSK -> CRM -> Sharepoint -> EI KAFKA -> DKCZ/DKSK
- Data Quality: Poor - Statement processing monitored through 12 distinct states

---

#### - **Servicing Agreement** – Service provision contracts.

##### role_definition
The Servicing Mandate service domain maintains an agreement between the bank and an external party that governs/constrains the allowed access given to the bank's products and services. This access permission can be defined at two levels - overall for the service provider and at a more detailed level as applied to a specific customer.

##### core_business_object
Servicing Mandate

##### key_features
- Set-up mandate covering 3rd party access to services
- Set-up provider's customer specific servicing permissions
- Check proposed activity is covered by the mandate
- Maintain/report on 3rd party activity

##### example_of_use
A third party provider has accessed the bank on behalf of a customer to initiate payment for a purchased product. The bank checks that the service provider is permitted to perform payments in general and whether there are specific constrains for this customer

##### triggered_by
- Servicing Order
- Contact Handler
- Transaction Authorization

##### triggers
- Party Lifecycle Management

##### list_of_scenarios
- Create Customer Reports
- 1 - Initiate Consent
- 3 - Initiate Consent
- Maintain the allowed customer servicing arrangments for a service provider covering allowed general access to products and services and customer specific arrangments

---

#### - **Lease** – Leasing contracts.

##### role_definition
The Service Domain fulfills a general leasing arrangement for a single leased product or facility. The bank will take a collateral interest in the leased item to underwrite the associated loan/lease arrangement

##### core_business_object
Leasing Facility

##### key_features
- Evaluate proposed leasing arrangement
- Review collateral value and title of leased item
- Price/structure the leasing arrangement
- Negotiate and agree leasing arrangement
- Initiate and maintain the leasing arrangement through term

##### example_of_use
A customer requests a leasing arrangement to support the acquisition of equipment

##### triggered_by
(empty)

##### triggers
(empty)

##### list_of_scenarios
- Accept, verify, etc. aspects of Fees processing
- Instantiate a new Fees
- Accept, verify, etc. aspects of Lien processing
- Accept, verify, etc. aspects of Sweep processing
- Update details relating to Fees
- Update details relating to Corporate Action
- Retrieve details about any aspect of Fees
- Retrieve details about any aspect of Lien
- Instantiate a new Collateral
- Request manual intervention or a decision with respect to Fees
- Retrieve Interest
- Update details relating to Deposits
- Request manual intervention or a decision with respect to Collateral
- Retrieve details about any aspect of Withdrawals
- Instantiate a new Corporate Action
- Instantiate a new Financial Instrument
- Update details relating to Financial Instrument
- Update details relating to Sweep
- Update details relating to Withdrawals
- Retrieve details about any aspect of Issued Device
- Accept, verify, etc. aspects of Payments processing
- Retrieve details about any aspect of Payments
- Update details relating to Payments
- Update details relating to Collateral
- Update details relating to Lien
- Instantiate a new Payments
- Instantiate a new Sweep
- Control the processing of Leasing Facility
- Instantiate a new Issued Device
- Instantiate a new Lien
- Instantiate a new Deposits
- Retrieve details about any aspect of Collateral
- Retrieve details about any aspect of Deposits
- Update details relating to Clearing and Settlement
- Execute an available automated action for Leasing Facility
- Update details relating to Issued Device
- Instantiate a new Leasing Facility
- Update Interest
- Instantiate a new Withdrawals
- Accept, verify, etc. aspects of Leasing Facility processing
- Retrieve details about any aspect of Clearing and Settlement
- Retrieve details about any aspect of Sweep
- Retrieve details about any aspect of Corporate Action
- Retrieve details about any aspect of Financial Instrument
- Update details relating to Leasing Facility
- Retrieve details about any aspect of Leasing Facility
- Request manual intervention or a decision with respect to Leasing Facility

---

#### - **Credit Line** – Credit lines.

##### role_definition
The Credit Facility Service Domain manages the Credit Facilities that a Corporate Customer has with the bank. A Credit Facility is an agreement between the bank and a (corporate) customer to allow the customer to acquire asset products from the bank up to the limit of the credit facility without the need for a full due diligence and underwriting for each of these products. Credit Facilities can have a hierarchy and they come under the overall Credit Limit for the customer, which is the bank-internal maximum credit exposure that the bank is willing to have with the customer.

##### core_business_object
Credit Facility Agreement

##### key_features
- Set up a credit facility agreement with a corporate customer
- Open a credit facility under the customer's credit limit or under an existing credit facility
- Attach a banking product to a an existing credit facility

##### example_of_use
Credit Facilties can typically be used to attach trade financing products and also overdrafts in current account where quick processing is demanded by the customer. A Credit Facility is with one customer, but the overall Credit Limit under which Credit Facilities come, can be for more than one customer, typically belonging to one customer group. Credit Facilities within a Credit Facility hierarchy can be for different, but usually related, customers.

##### triggered_by
- Customer Relationship Management
- Term Deposit
- Party Asset Directory
- Corporate Current Account
- Collateral Asset Administration
- Letter of Credit
- Credit Facility
- Corporate Loan
- Bank Guarantee
- Underwriting

##### triggers
- Party Lifecycle Management
- Correspondence
- Payment Order
- Sales Product Agreement
- Credit Facility
- Guideline Compliance
- Customer Product and Service Directory
- Financial Accounting
- Document Directory

##### list_of_scenarios
- Maintain the availability and allocation of a negotiated credit line or facility for a corporate customer, including subsidiary allocations where appropriate

---

#### - **Commercial Loan** – Commercial loans.

##### role_definition
The corporate loan product may include different properties/features depending on a bank's preferences and policies. The loan is targeted at corporate customers and may be associated with a type of product and may or may not be secured by collateral.

##### core_business_object
Loan Agreement

##### key_features
- Set-up a corporate loan facility
- Handle deposits and withdrawals
- Provide statements and assessment reports on the loan
- Support loan restructuring

##### example_of_use
A corporate customer applies for and gets a loan to purchase new equipment.

##### triggered_by
- Customer Relationship Management
- Syndicated Loan
- Party Asset Directory
- Collateral Asset Administration
- ECM And DCM
- Disbursement
- Corporate Loan
- Asset Securitization
- Collateral Allocation Management

##### triggers
- Party Lifecycle Management
- Position Keeping
- Document Services
- Syndicated Loan
- Customer Agreement
- Correspondence
- Corporate Current Account
- Product Directory
- Payment Order
- Corporate Treasury
- Collateral Asset Administration
- Sales Product Agreement
- Credit Facility
- Guideline Compliance
- Disbursement
- Customer Product and Service Directory
- Customer Billing
- Information Provider Operation
- Financial Accounting
- Corporate Loan
- Customer Credit Rating
- Financial Statement Assessment
- Document Directory
- Party Reference Data Directory
- Regulatory Compliance
- Credit Risk Models
- Collateral Allocation Management

##### list_of_scenarios
- Process End of Daily Booking Window for Syndicated Loan Payments-III
- Process Termination of Syndicated Loan-III
- Process Sales Marketing and Closing
- Process Invocation of Cash Management Service
- Process Closing of Syndicated Loan-I
- Process Closing of Corporate Loan
- Process Disbursement for Modification of Corporate Loan
- Process Termination of Syndicated Loan-II
- Handle Request for Corporate Loan
- Process Cash Management Payments
- Process Selection of Loans for Securitization
- Review Borrower Financial Statements
- Process End of Period Reporting to Investor
- Handle Request from Investor for Loan Portfolio Servicing Agreement
- Process Syndicated Loan Instalment-II and III
- Handle Request for Issuance of Commercial Paper
- Process Opening of Loan Servicing Account
- Process Closing of Syndicated Loan-III
- Process Modification of Corporate Loan
- Process Closing of Syndicated Loan-II
- Conduct Corporate Loan Collateral Due Diligence
- Handle Request for Modification of Corporate Loan
- Process Termination of Syndicated Loan-I
- Disburse Corporate Loan

---

#### - **Equipment Lease** – Equipment leasing.

##### role_definition
The Service Domain provides the financing support to support corporate customers with leasing arrangements for property and equipment. The bank will take a collateral interest in the leased items to underwrite the associated loan(s)

##### core_business_object
Not specified

##### key_features
- Establish corporate leasing facility
- Process leases under the facility
- Report, analyze and structure leasing arrangements to optimize the customers financial position

##### example_of_use
A corporate customer establishes a corporate leasing facility with the bank to acquire critical production equipment and facilities under lease

##### triggered_by
- Not specified in document

##### triggers
- Correspondence
- Corporate Treasury
- Legal Entity Directory
- Customer Billing
- Financial Accounting
- Document Directory
- Collateral Allocation Management
- Customer Event History

##### list_of_scenarios
- Fulfillment of a range of loan products for corporate clients for the purpose of leasing
