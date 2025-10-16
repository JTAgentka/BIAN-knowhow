### Servicing Event History

#### role_definition
The Servicing Event History service domain captures the details of servicing activity to support root cause analysis. The information captured can include summary details of the servicing activity, product access details and clickstream/voice records as necessary. The captured detail can be analyzed for staff assessment and training and to support procedural refinements

#### core_business_object
Servicing Event Log

#### key_features
- Log customer servicing event activity for the representative
- Log servicing issues and other activity
- Support servicing log data extracts
- Maintain activity statistics and accumulators

#### example_of_use
A servicing contact is concluded and the contact details and result is captured. In cases the call is recorded

#### triggered_by
- Branch Currency Distribution
- Point of Service
- Contact Center Operations
- Servicing Activity Analysis

#### triggers
N/A

#### list_of_scenarios
- Review Call Centre Activity for New Product
- Process Inventory of Cash and Distribution of Cash to Branches
- Perform Servicing Root Cause Analysis
- End Mobile Access Session and Update Event and Servicing and Channel History

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/ServicingEventHistory/12.0.0

---

### Customer Relationship Management

#### role_definition
This function handles managed customer relationships. There will typically be a customer development plan and budget/targets for higher value customers. The function may draw on external market insights as well as internal product and service fulfillment to track performance and trigger contact when appropriate. The function is a key source of business development providing product/service matching and awareness. As the primary point of contact the relationship manager can help in issue resolution and trouble shooting. Relationship management applies to corporate and high net-worth clients. Automated knowledge-based facilities may offer some relationship management functions at the consumer banking level in particular for sales and marketing

#### core_business_object
Customer Relationship Management Plan

#### key_features
- Develop a customer relationship plan/targets
- Liaise/advise customer, develop relationship
- Match products and services to customer needs
- Troubleshoot issues with customer

#### example_of_use
A corporate customer relationship manager reviews recent activity for a customer and notices that levels of activity are trending lower. Possible external (market) and internal (servicing/ fulfillment) activities are reviewed for possible causes. A meeting is scheduled to determine the reason and if any banking products/ services could help or are at further risk

#### triggered_by
- Customer Relationship Management
- Servicing Order
- Correspondence
- Party Asset Directory
- Corporate Current Account
- Customer Behavior Insights
- Payment Order
- Collateral Asset Administration
- Customer Offer
- Customer Campaign Execution
- Customer Product and Service Directory
- Customer Behavior Models
- Bank Guarantee
- Underwriting
- Session Dialogue

#### triggers
- Party Lifecycle Management
- Document Services
- Customer Relationship Management
- Term Deposit
- Mortgage Loan
- Product Expert Sales Support
- Investment Portfolio Management
- Servicing Order
- Customer Agreement
- Correspondence
- Legal Advisory
- Market Information Management
- Party Asset Directory
- Corporate Current Account
- Customer Workbench
- Customer Behavior Insights
- Market Research
- Product Directory
- Market Data Switch Operation
- Customer Product And Service Eligibility
- Corporate Treasury
- Current Account
- Legal Entity Directory
- Collateral Asset Administration
- Investment Portfolio Analysis
- Sales Product Agreement
- Savings Account
- Customer Offer
- ECM And DCM
- Customer Campaign Execution
- Credit Facility
- Customer Position
- Cash Concentration
- Guideline Compliance
- Investment Account
- Disbursement
- Customer Product and Service Directory
- Information Provider Operation
- Brokered Product
- Corporate Loan
- Consumer Loan
- Customer Credit Rating
- Credit Management
- Consumer Advisory Services
- Underwriting
- Product Sales Support
- Document Directory
- Product Matching
- Party Reference Data Directory
- Lead and Opportunity Management
- Legal Compliance
- Customer Case
- Collateral Allocation Management
- Customer Event History
- Session Dialogue
- Investment Portfolio Planning
- Product Fulfillment SDs

#### list_of_scenarios
- Handle Request for Windfall Investment
- Perform Customer Eligibility Profile Update
- Process Internal Upsell Campaign
- Process Bank Internal Instruction to Block Corporate Current Account
- 1b - Retrieved ASPSP Account Information Trigger NBP
- Handle Request to Issue Guarantee on Request of Another Bank
- Process End of Daily Booking Window for Account Dormancy
- Process Closing of Corporate Loan
- Process Performance Review
- Process Disbursement for Modification of Corporate Loan
- Handle Request for Corporate Loan
- Retrieve Loan to Value Ratio
- Handle Request for Product Support
- Handle Request for Investment Plan
- Process Internal Customer Upgrade
- Handle Request for Credit Facility
- Assess Customer Behaviour Model Performance
- Process Portfolio Rebalancing
- Develop Customer Insights
- Handle Request from Investor for Loan Portfolio Servicing Agreement
- Handle Request for Preferential Rates for Corporate Current Account
- Execute Internal Campaign
- Conduct Relationship Development Planning
- Perform Underwriting for Corporate Loan
- Handle Request for Product Selection
- Handle Request for Power of Attorney
- Perform Customer Relationship Development Planning
- 6 - Trigger and recalculate product eligibility
- EXT Handle Request for Preferential Rates for Corporate Current Account
- Handle Request for Issuance of Commercial Paper
- Handle Request for Corporate Sweep Agreement Considering Inter-Company Loan Agreements
- Process Opening of Loan Servicing Account
- Process Modification of Corporate Loan
- Handle Request for Internal Credit Transfer Requiring Second Line Authorisation
- Conduct Corporate Loan Collateral Due Diligence
- Handle Request for Modification of Corporate Loan

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/CustomerRelationshipManagement/12.0.0

---

### Corporate Relationship

#### role_definition
Manage corporate relationships with key parties such as major clients, political and industry groups, user associations etc.

#### core_business_object
Corporate Partner Relationship Management Plan

#### key_features
- Manage corporate relationships with key parties
- Handle major clients relationships
- Manage political and industry group relationships
- Manage user associations relationships

#### example_of_use
A regular relationship review is scheduled with a major multinational customer to develop business opportunities

#### triggered_by
- Asset Securitization

#### triggers
N/A

#### list_of_scenarios
- Select Buyers for Securitize Assets

#### api_bian_portal_link
Not specified in the document

---

### Servicing Activity Analysis

#### role_definition
Analyze customer servicing position activity, including teller, case/contact center traffic and VoIP activity. Analysis includes captured call/channel/device type, activity, onward routing and resolution decisions for operational and procedural insights and facility/process and training improvement (Root Cause Analysis)

#### core_business_object
Servicing Event

#### key_features
- Analyze servicing activity for root causes
- Consolidate and present data to support analysis
- Recommend remedial actions that might mitigate the root cause for detected issues

#### example_of_use
Contact center management reviews servicing activity analysis in order to identify areas where additional training and guidance is needed to improve the customer experience

#### triggered_by
- Contact Center Operations
- Servicing Activity Analysis

#### triggers
- Servicing Event History
- Management Manual
- Product Design
- Servicing Activity Analysis

#### list_of_scenarios
- Review Call Centre Activity for New Product
- Adjust Call Centre Position Assignments
- Perform Servicing Root Cause Analysis

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/ServicingActivityAnalysis/12.0.0

---

### Customer Event History

#### role_definition
The service domain captures a wide range of customer events to build a comprehensive history of customer activity that can support subsequent behavioral analysis. This includes key sales/proposal events, relationship management events, product delivery events, detected customer triggers (typically gleaned during servicing dialogues) and possibly externally sourced customer activity. The assembled data is made available for behavioral analysis and for more general reference (as might be used for relationship management for example)

#### core_business_object
Customer Event Log

#### key_features
- Log customer sales/marketing and relationship development events
- Log customer servicing events
- Log detected life events (from interactions or external research)
- Log product fulfillment events and alerts

#### example_of_use
A customer contacts the call center to enquire about account transactions and during the dialogue the servicing representative detects a life event (e.g. the customer is moving house). The contact details and life event are captured in the customer history

#### triggered_by
- Customer Relationship Management
- Customer Behavior Insights
- Customer Behavior Models
- Customer Case
- Session Dialogue
- Product Fulfillment SDs

#### triggers
- Product Fulfillment SDs

#### list_of_scenarios
- Execute Interactive Retention Campaign
- EXT Handle Customer Relationships Case
- Process Internal Customer Upgrade
- Assess Customer Behaviour Model Performance
- Develop Customer Insights
- Conduct Relationship Development Planning
- Perform Customer Relationship Development Planning
- End Mobile Access Session and Update Event and Servicing and Channel History

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/CustomerEventHistory/12.0.0

---

### Session Dialogue

#### role_definition
The customer contact dialogue handling capability can provide highly structured orchestration to streamline a customer interaction by consolidating and presenting customer related data in context. It can also use the session to gather additional customer intelligence. In a more advance implementation the customer interaction capabilities can be integrated into an automated self/service context in addition to the more conventional assisted service model. The structured customer dialogue can include tasks to check for other business activities that can be built into the exchange for example, delivering pending communications, sales/marketing attempts, capturing intelligence/triggers, updating relationship status/details, product fulfillment (such as synchronizing customer-side data). The facility can be designed to support multi-channel/multi-device deployments

#### core_business_object
Customer Contact Session Procedure

#### key_features
- Consolidate customer reference and product usage details
- Structure the dialogue based on identified topic - process customer queries
- Access context specific guidance/help text
- Orchestrate product/service access
- Initiate additional customer authentication when needed
- Initiate sales and relationship development actions when appropriate

#### example_of_use
A customer dials into the contact center with a current account balance request. The customer identity is checked by the servicing representative (using a Party Profile Service Domain call). After the customer initial query has been addressed the dialogue is structured to attempt a sales pitch for an internal campaign that the customer has been pre-approved for as flagged in their Party Profile record

#### triggered_by
- Party Lifecycle Management
- Payment Initiation
- Customer Relationship Management
- Term Deposit
- Investment Portfolio Management
- Servicing Order
- Processing Order
- Standing Order
- Party Asset Directory
- Collateral Asset Administration
- Customer Offer
- Credit Card
- Contact Handler
- Consumer Loan
- Point of Service
- Bank Guarantee
- Document Directory
- Session Dialogue

#### triggers
- Service Provider Operations
- Party Lifecycle Management
- Payment Initiation
- Customer Access Entitlement
- Customer Relationship Management
- Issued Device Administration
- Party Routing Profile
- Servicing Order
- Correspondence
- Servicing Issue
- Standing Order
- Customer Workbench
- Product Directory
- Payment Order
- Customer Product And Service Eligibility
- Current Account
- Customer Offer
- Customer Campaign Execution
- Product Broker Agreement
- Party Authentication
- Customer Position
- Customer Product and Service Directory
- Contact Handler
- Brokered Product
- Consumer Loan
- Point of Service
- Consumer Advisory Services
- Party Reference Data Directory
- Card Terminal Operation
- Lead and Opportunity Management
- Service Directory
- Direct Debit Mandate
- Customer Case
- Customer Event History
- Session Dialogue
- Transaction Authorization
- Product Fulfillment SDs

#### list_of_scenarios
- EXT Handle Request for Overdraft Limit on Virtual Account
- Handle Request for Windfall Investment
- EXT Handle Request to Add Account to Sweep Agreement
- Set Up New Card for Card Application
- Handle Request for Balance Transfer
- Initiate Payment Order
- 9 - Update status of the consent to authorized and get authentication code
- EXT Handle Request to Move Overdraft Limit between Virtual Accounts
- Handle Request for Card Activation
- Customer Relationship Case Initiation
- Process Authentication Request by Issuer
- EXT Handle Request for High Volume Account Opening
- Handle Request for Withdrawal from Consumer Loan
- Handle Request for Copy of Active Version of Mandate at Debtor Bank
- 2 - Retrieve a list of connected ASPSB banks
- Execute Customer Onboarding API version
- Handle Request for Notional Pooling Agreement
- Handle Customer Request for User Access Token Using Bank Authorization Grant and its Client Secret within Active Contact
- Create Customer Reports
- Handle Request to Use Direct Debits as Payment Instrument
- Handle Request for Loan that Requires Syndication
- Handle Instruction to Terminate B2B Direct Debits Service at Creditor Bank
- Handle Request to Cancel Credit Transfer Standing Order on Corporate Current Account
- Handle Request for Direct Debit Payments
- Handle Request for Refund of Incoming Direct Debit at Debtor Bank
- Handle Request for Account Statement
- Handle Request to Add Account to Sweep Agreement
- EXT Handle Merchandising Loan Application
- Handle Request to Close Savings Account
- Handle Request for Outgoing Credit Transfer
- EXT Handle Request to Open Retail Current Account
- Execute Interactive Retention Campaign
- Authorise Card Use by Acquirer
- Process Performance Review
- Perform Customer Product Matching and Selection
- EXT Handle Customer Relationships Case
- Handle Request to Reactivate Dormant Corporate Current Account
- Handle Request to Open Savings Account
- Handle Request for Corporate Loan
- Handle Request for Outgoing FCY Credit Transfer via SWIFT
- EXT Handle Request to Reactivate Dormant Corporate Current Account
- Handle Request for Cash Withdrawal from Savings Account
- Handle Request for Product Support
- Process Contact setup and start TPP Servicing Dialogue
- EXT Handle Request to Change Corporate Current Account Ownership
- Handle Request for Investment Plan
- Develop Opportunity
- Handle Card Chargeback at Issuer
- Process Internal Customer Upgrade
- Handle Request for Credit Facility
- EXT Handle Request to Pre-Open Corporate Current Account
- EXT Handle Request to Add Signatory to Corporate Current Account
- EXT Process B2B Direct Debit Mandate Notice from Creditor Bank at Debtor Bank
- EXT Handle Bulk Request for Opening Salary Accounts
- Handle Request for Early Payback of Consumer Mortgage Loan Due to Sale of Property
- Handle Request to Block Card
- Handle Request to Establish Credit Transfer Standing Order on Corporate Current Account
- Handle TPP Request for Registration with Bank and Exchange of Client Identifier and Client Secret for Later Reference
- Handle Request to Detach Account from Corporate Payroll Service Agreement
- EXT Handle Request to Use Direct Debits as Payment Instrument
- Handle Request to Sell Syndicated Loan Participation to other Bank when Lead Bank Is not Seller or Buyer-I
- Handle Request for Combined Account Statement
- Process Portfolio Rebalancing
- Handle Request for Refund of Internal Direct Debit
- Handle Request to Open Retail Current Account
- Handle Request for Corporate Sweep Agreement
- Get Customer Request and Show Account Balance
- EXT Handle Request to Terminate Sweep Agreement
- Handle Request for BNPL Financing by Bank where Buyer Is Existing Customer
- Handle Request for Preferential Rates for Corporate Current Account
- Handle Request to Establish Corporate Payroll Service Agreement
- Handle Request from Lead Bank to Sell Part of Its Syndicated Loan Participation to Other Lender-I
- Handle Request to Close Corporate Current Account
- EXT Handle Instruction to Terminate B2B Direct Debits Service at Creditor Bank
- Handle Request for Payment at Creditor Bank for External Account
- EXT Handle Request to Change Virtual Account Ownership
- 2 - Customer Sees the NBP Offer and Decides if to Apply
- Perform Closing of Uncollateralised Consumer Loan
- EXT Handle Request to Close Virtual Account
- EXT Handle Request for High Volume Virtual Account Opening
- Handle Request for Product Selection
- Handle Request for Account Statement and Balances
- Handle Request for BNPL Financing-II
- Handle Request for Power of Attorney
- Handle Request from Debtor to Debtor Bank for Advance Refusal of Direct Debit Collection
- Handle Request to Sell Syndicated Loan Participation to Other Bank when Lead Bank Is not Seller or Buyer-III
- Handle Request to Get Customer Account Balance
- EXT Handle Request to Close Corporate Current Account
- Handle Request for Bank Guarantee
- Process Request from Creditor to Creditor Bank for Reversal of Direct Debit Collection
- EXT Handle Request for Combined Account Statement
- EXT Handle Request for Renewal of Uncollateralised Consumer Loan
- 15-19- Get Customer account details
- EXT Handle Request to Detach Account from Corporate Payroll Service Agreement
- 14 - Get customer account beneficiaries
- 4a - Get and store authentication token, trigger a request to transfer account
- 3 - Initiate consent authorization
- 12 - Get customer account details
- Handle Request to Close Retail Current Account
- EXT Handle Request for Preferential Rates for Corporate Current Account
- Handle Request for Refund of Unauthorised Incoming Direct Debit at Debtor Bank
- 6&7 - Retrieve accounts and consent details
- 13 - Get customer account balances
- End Mobile Access Session and Update Event and Servicing and Channel History
- Process Prospect Management
- Handle Request for Internal Credit Transfer from Savings Account
- Handle Request to Change Sweep Sequence
- Handle Request for Issuance of Commercial Paper
- Handle Request for Early Payback of Consumer Mortgage Loan Due to Sale of Property for Bank as Servicer
- Handle Request for Corporate Sweep Agreement Considering Inter-Company Loan Agreements
- EXT Handle Request for Account Statement and Outgoing Credit Transfer
- Handle Customer Request to Log On to Bank to Authenticate and to Authorise Client Access to Their Account
- Get Available Current Account Balance in Preparation of Deposit into Loan
- Handle Failed Self Service Product Application
- Process Notification to Remove Amount Block
- EXT Handle Request for Account Statement and Balances
- Handle Request for Consumer Loan Checks and Options
- Handle Request to Add Related Party to Corporate Current Account
- Handle Request for Internal Credit Transfer Requiring Second Line Authorisation
- EXT Handle Request to Change Sweep Sequence
- EXT Record Core SEPA Direct Debit Mandate at Creditor Bank
- 3 - Periodically the TPP Bank Request Account Updates
- 20 - Get customer account transactions
- Handle Request for Outgoing Credit Transfer Related to Request to Pay at Debtor Bank
- EXT Handle Request to Open Corporate Current Account
- Handle Request for Uncollateralised Consumer Loan
- Handle Customer Request for Payment Order during Active Mobile Access Session
- 8 - Save selected accounts
- 10 - Get access token, refresh access token
- Handle Request to Terminate Sweep Agreement
- Handle Mortgage Loan Application
- EXT Handle Request to Open Virtual Account
- Conduct Customer Centric Product Manufacturing
- Handle Request for Modification of Corporate Loan
- Handle Request for Consumer Loan Financial Analysis Reports
- Handle Request to Open Corporate Current Account
- Handle Request for Token Assurance
- Handle Request for Internal Credit Transfer between Corporate Current Accounts
- 2 - Retrieve a list of ASPSB banks from the OB Directory
- Handle Request for Early Closing of Term Deposit
- EXT Handle Request to Open Term Deposit Agreement for Retail Customer
- Handle Request to Change Term Deposit Attached Current Account
- EXT Handle Request to Change Term Deposit Agreement Conditions
- Handle Request to Open Term Deposit under Term Deposit Agreement for Retail Customer
- Handle Request for Corporate Debit Cards Service
- EXT Handle Request to Open Term Deposit under Term Deposit Agreement for Retail Customer
- Handle Request to Open Term Deposit under Term Deposit Agreement for Corporate Customer
- EXT Handle Request to Change Term Deposit Attached Corporate Current Account
- Handle Request to Change Term Deposit Attached Corporate Current Account
- EXT Handle request for Corporate Debit Cards Service
- Handle Request for Early Renewal of Term Deposit
- EXT Handle Request to Open Term Deposit under Term Deposit Agreement for Corporate Customer
- Handle Request to Change Term Deposit Agreement Conditions
- Handle Request to Open Term Deposit Agreement
- Handle Request to Extend Validity of Letter of Credit
- Handle Request to Issue Letter of Credit
- EXT Handle Request to Establish Term Deposit Agreement
- EXT Handle Request for Early Closing of Term Deposit
- EXT Handle Request for Early Renewal of Term Deposit
- Handle Request to Establish Term Deposit Agreement
- Handle Request to Establish Credit Transfer Standing Order on Retail Current Account
- EXT Handle Request to Establish Credit Transfer Standing Order on Corporate Current Account
- Handle Request to Replace Card
- EXT Handle Request for Modification of Merchandising Loan
- Initiate Customer Relationship Case

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/SessionDialogue/12.0.0
