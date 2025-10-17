# Partner Management

## Service Domain Capabilities

### Merchant Acquiring Facility

#### Role Definition
This service domain is the primary service domain for handling the Merchant Account and the specific terms and conditions for the merchant. It includes opening the Merchant account, performing the required setup for card acceptance, such as assigning POS terminals, maintaining the accounts payable balances for the merchant, performing periodic settlement, and handling fees and charges. When Merchants submit card payment transactions, the Acquiring Bank is responsible for paying the Merchants in accordance with the terms of the Merchant agreement, which specify when the merchant should be paid and the amount that is withheld from the payment as merchant discount or service fees.

#### Core Business Object
Merchant Agreement (object_26.html?object=37615)

#### Key Features
- Merchant facility set-up and maintenance
- Merchant POS assignment/registration
- Merchant chargeback processing
- Merchant clearing and settlement
- Merchant discount and fee processing

#### Example of Use
The Acquiring Bank signs up Merchants for accepting Card Payments and opens Merchant Accounts for them.

#### Triggered By
- Card Case (object_21.html?object=30796)
- Card Clearing (object_21.html?object=36804)
- Card Terminal Operation (object_22.html?object=45274)

#### Triggers
No triggers specified

#### List of Scenarios
- Authorise Card Use by Acquirer (views/view_55588.html)
- Process Card Clearing by Acquirer (views/view_55404.html)
- Handle Request for Information for Chargeback at Acquirer (views/view_55149.html)

#### API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/MerchantAcquiringFacility/12.0.0

---

### Corporate Relationship

#### Role Definition
Manage corporate relationships with key parties such as major clients, political and industry groups, user associations etc.

#### Core Business Object
Corporate Partner Relationship Management Plan

#### Key Features
- Corporate relationship management planning
- Performance analysis and tracking
- Portfolio activity analysis
- Relationship review scheduling
- Strategic partnership development
- Analytics and reporting capabilities

#### Example of Use
A regular relationship review is scheduled with a major multinational customer to develop business opportunities

#### Triggered By
- Asset Securitization

#### Triggers
No triggers specified

#### List of Scenarios
- Select Buyers for Securitize Assets

#### API BIAN Portal Link
https://bian.org/servicelandscape-12-0-0/object_22.html/object_41082

---

### Merchant Relations

#### Role Definition
The bank's merchant relationships are governed by the terms and conditions maintained by this service domain. Note this covers the application of legal, regulatory and operational terms agreed with the merchant and does not cover any more general aspect of relationship management

#### Core Business Object
Not specified

#### Key Features
- Establish and maintain merchant terms and conditions
- Determine the applicability of terms to specific situations
- Provide access to and explain the correct interpretation of terms

#### Example of Use
A card charge is disputed and a case raised - the case processing process references the in-force merchant terms and conditions governing the dispute resolution

#### Triggered By
No triggers specified

#### Triggers
No triggers specified

#### List of Scenarios
No scenarios specified

#### API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/MerchantRelations/12.0.0

---

### Sub Custodian Agreement

#### Role Definition
Maintain sub custodian agreement terms and track and report on sub custodian activity. Note the lead custodian role may engage a sub custodian for handling international securities outside its jurisdiction

#### Core Business Object
Sub Custodian Agreement

#### Key Features
- Establish appropriate contractual terms with agency
- Maintain and update contractual terms as necessary
- Review proposed work/assignments for compliance with agreed terms

#### Example of Use
The contractual terms are referenced during the settlement procedure for a securities trade where the sub custodian holds the associated documentation

#### Triggered By
No triggers specified

#### Triggers
No triggers specified

#### List of Scenarios
No scenarios specified

#### API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/SubCustodianAgreement/12.0.0

---

### Interbank Relationship Management

#### Role Definition
This function handles managed interbank relationships. There are a range of relationship considerations that may apply between banks covering trading arrangements, joint ventures, clearing and settlement arrangements etc. The Interbank Relationship Management function acts as a relationship planning and coordination point to facilitate interbank interactions

#### Core Business Object
InterBank Relationship (object_26.html?object=46903)

#### Key Features
- Develop the bank relationship plan/targets
- Liaise/advise bank representatives and develop the relationship
- Identify and develop mutually beneficial initiatives with the bank
- Troubleshoot production issues that arise involving the bank

#### Example of Use
A partner bank is contacted to review a major project opportunity. The interbank relationship management function is used to coordinate contacts for a joint venture marketing opportunity between the banks

#### Triggered By
- ECM And DCM (object_22.html?object=40135)
- Asset Securitization (object_23.html?object=47465)
- Loan Syndication (object_23.html?object=47935)

#### Triggers
No triggers specified

#### List of Scenarios
- Select Buyers for Securitize Assets (views/view_54717.html)
- Process Sales Marketing and Closing (views/view_55605.html)
- Handle Request for Issuance of Commercial Paper (views/view_54869.html)
- Negotiate Mandate Letter and Term Sheets (views/view_54880.html)

#### API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/InterbankRelationshipManagement/12.0.0

---

### Card Network Participant Facility

#### Role Definition
Cards issued by banks are affiliated with one of many international Card Networks, such as Visa, Master Card, Diners, American Express. This service domain is used by the Card Network for setting up Acquiring and Issuing Bank accounts and their terms and conditions.

#### Core Business Object
Card Network Participant Agreement

#### Key Features
- Acquiring bank facility terms administration
- Issuing bank facility terms administration
- Participant bank service status maintenance

#### Example of Use
The Card Network signs up Acquiring Banks for recruiting and setting up accounts for merchants and Issuing Banks for issuing cards to its customers.

#### Triggered By
- Card Transaction Switch
- Card Case
- Processing Order
- Card Clearing

#### Triggers
No triggers specified

#### List of Scenarios
- Handle Request for Chargeback at Acquirer
- Handle Card Chargeback at Issuer
- Handle Request for Information for Chargeback at Acquirer
- Process Authentication Request by Card Network
- Process Card Clearing by Card Network
- Authorise Card Use by Card Network

#### API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/CardNetworkParticipantFacility/12.0.0

---

### Correspondent Bank Operations

#### Role Definition
This Service Domain handles incoming and outgoing payment clearing and settlement messages to the bank's correspondent banking partners. The actual message transmission is delegated to the Financial Message Gateway service domain. Correspondent Bank administers the mirror accounting for interbank payments undertaking the underlying account reconciliation tasks.

#### Core Business Object
Settlement Account (object_26.html?object=41416)

#### Key Features
- Handle correspondent payment transactions
- Maintain and reconcile shadow accounting
- Generate and process SWIFT messages

#### Example of Use
Transfer funds from a customer account with the bank to an account with another bank.

#### Triggered By
- Financial Gateway (object_20.html?object=29241)
- Direct Debit (object_21.html?object=32677)
- Correspondent Bank Operations (object_21.html?object=32729)
- Payment Order (object_21.html?object=35550)
- Letter of Credit (object_21.html?object=38418)
- Payment Execution (object_21.html?object=39023)
- Bank Guarantee (object_22.html?object=44405)

#### Triggers
- Financial Gateway (object_20.html?object=29241)
- Position Keeping (object_20.html?object=30315)
- Financial Message Analysis (object_21.html?object=30650)
- Direct Debit (object_21.html?object=32677)
- Correspondent Bank Operations (object_21.html?object=32729)
- Payment Order (object_21.html?object=35550)

#### List of Scenarios
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

#### API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/CorrespondentBankOperations/12.0.0

---

### Counterparty Administration

#### Role Definition
Maintain and provide access to the counterparty reference details to support trading/payment activity. This includes SWIFT addresses, standard settlement instructions that are published. The data is typically acquired using a market feed for the default values, but the facility can support the maintenance of specific details and instructions that apply to the counterparty relationship overriding the public default

#### Core Business Object
Counterparty Administrative Plan

#### Key Features
- Consolidate counterparty market feed data
- Qualify data and maintain counterparty directory content
- Provide access to counterparty reference records

#### Example of Use
Back office clearing and settlement references the counterparty details to assemble a funds transfer as part of an equity trade using the counterparty details to generate the associated SWIFT based payment exchange

#### Triggered By
No triggers specified

#### Triggers
No triggers specified

#### List of Scenarios
No scenarios specified

#### API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/CounterpartyAdministration/12.0.0

---

### Corporate Alliance and Stake Holder

#### Role Definition
Manage key alliance and stake holder relationship - define tasks needed to develop and maintain contact and ensure relevant information is shared as appropriate

#### Core Business Object
Alliance Partner Relationship Management Plan

#### Key Features
- Alliance relationship management
- Stakeholder relationship management
- Information sharing coordination
- Contact development and maintenance
- Strategic partnership alignment

#### Example of Use
Corporate strategy is communicated and aligned with a product alliance partner

#### Triggered By
No triggers specified

#### Triggers
No triggers specified

#### List of Scenarios
No scenarios specified

#### API BIAN Portal Link
Not specified

---

### Syndicate Management

#### Role Definition
Manage the membership and administration of syndicates in compliance with the agreed syndicate charter and operating agreements. This combines the application of eligibility requirements to establish membership and the subsequent ensuring of compliance with performance obligations defined under the membership

#### Core Business Object
Not specified

#### Key Features
- Overall membership maintenance and reporting
- Individual membership enrolment
- Apply eligibility clauses
- Enforce compliance obligations

#### Example of Use
A major project funding initiative assembles a syndicate of investors

#### Triggered By
- Asset Securitization (object_23.html?object=47465)
- Loan Syndication (object_23.html?object=47935)

#### Triggers
- Syndicated Loan (object_21.html?object=31921)
- Correspondence (object_20.html?object=32927)
- Legal Advisory (object_20.html?object=32993)
- Term Deposit Framework Agreement (object_20.html?object=33675)
- Corporate Current Account (object_21.html?object=34221)
- Customer Product and Service Directory (object_22.html?object=41591)
- Party Reference Data Directory (object_22.html?object=45230)
- Collateral Allocation Management (object_23.html?object=47470)

#### List of Scenarios
- Handle Request for Loan that Requires Syndication (views/view_55083.html)
- Process Closing of Syndicated Loan-I (views/view_55185.html)
- Set Up Syndicate and Sign Agreements-I (views/view_55508.html)
- Process Recording and Distribution of Collateral (views/view_55299.html)
- Handle Request to Sell Syndicated Loan Participation to other Bank when Lead Bank Is not Seller or Buyer-I (views/view_55550.html)
- Handle Request from Lead Bank to Sell Part of Its Syndicated Loan Participation to Other Lender-I (views/view_55559.html)
- Handle Request to Sell Syndicated Loan Participation to Other Bank when Lead Bank Is not Seller or Buyer-III (views/view_55251.html)
- Set Up Syndicate and Sign Agreements-II (views/view_54678.html)
- Set Up Syndicate and Sign Agreements-III (views/view_54895.html)
- Process Closing of Syndicated Loan-III (views/view_54831.html)
- Process Closing of Syndicated Loan-II (views/view_54738.html)

#### API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/SyndicateManagement/12.0.0

---

### Correspondent Bank Directory

#### Role Definition
This service domain maintains reference details specific to a correspondent banking partner covering payment terms and preferences and security keys. It also consolidates transactional activity as might be needed to track reciprocity with the correspondent bank. Any specific arrangements and terms (e.g. SSIs) that might override market directory details are maintained here as part of the data record.

#### Core Business Object
Correspondent Banking Agreement

#### Key Features
- Maintain correspondent bank reference data
- Maintain specific correspondent settlement instructions
- Track correspondent bank's service reciprocity

#### Example of Use
Correspondent bank (reciprocal) activity is consolidated to support periodic correspondent banking relationship reviews

#### Triggered By
- Payment Order

#### Triggers
No triggers specified

#### List of Scenarios
- Handle Request for Outgoing Credit Transfer
- Handle Request for Outgoing FCY Credit Transfer via SWIFT

#### API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/CorrespondentBankDirectory/12.0.0

---

### Product Broker Agreement

#### Role Definition
This service domain administers the contractual, operational and financial aspects of the relationship with a 3rd party product or service provider. Note that other service domains handle different aspects of broker relations such as relationship management, commissions, billing and payments and operational support

#### Core Business Object
Product Broker Agreement (object_25.html?object=42120)

#### Key Features
- Establish and maintain broker service terms and conditions
- Track relationship activity for compliance with contractual limits/goals
- Provide confirmation that proposed actions are covered

#### Example of Use
A monthly assessment is made of the performance of a broker against service levels and projected business volumes

#### Triggered By
- Issued Device Administration (object_21.html?object=30905)
- Session Dialogue (object_23.html?object=48273)

#### Triggers
No triggers specified

#### List of Scenarios
- Handle Customer Request for User Access Token Using Bank Authorization Grant and its Client Secret within Active Contact (views/view_54913.html)
- Handle TPP Request for Registration with Bank and Exchange of 'Client Identifier' and 'Client Secret' for Later Reference (views/view_55320.html)

#### API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/ProductBrokerAgreement/12.0.0

---

### Correspondent Bank Relationship Management

#### Role Definition
Handle the negotiation, development and tracking of reciprocity with correspondent bank relationships

#### Core Business Object
Not specified

#### Key Features
- Track and assess correspondent bank activity for reciprocity
- Identify and develop business opportunities with the correspondent bank
- Oversee the resolution of production issues as might arise

#### Example of Use
A bank establishes and maintains a correspondent relationship for international payments and trade finance representation in a foreign country

#### Triggered By
No triggers specified

#### Triggers
No triggers specified

#### List of Scenarios
No scenarios specified

#### API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/CorrespondentBankRelationshipManagement/12.0.0

---
