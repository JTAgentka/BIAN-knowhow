# Customer Management

### Mergers and Acquisitions Advisory

#### role_definition
A fee or commission based project providing advice, execution, pricing and deal coordination and placement for M&A, IPO, MBO, LBO type transactions

#### core_business_object
Not specified in the PDF

#### key_features
- Fee or commission based project execution
- Pricing and deal coordination
- Placement for M&A, IPO, LBO type transactions
- Advisory services for complex transactions

#### example_of_use
A corporate customer engages an investment bank to lead an M&A transaction on its behalf

#### triggered_by
- Not specified in the PDF

#### triggers
- Not specified in the PDF

#### list_of_scenarios
- Individual Analytics: mergers&AcquisitionFulfillmentArrangementAccumulators
- Individual Analytics: mergers&AcquisitionFulfillmentArrangementActivityAnalysis
- Individual Analytics: mergers&AcquisitionFulfillmentArrangementPerformanceAnalysis
- Individual Analytics: mergers&AcquisitionFulfillmentArrangementTrends&Events
- Portfolio Analytics: mergers&AcquisitionFulfillmentArrangementPortfolioActivityAnalysis
- Portfolio Analytics: mergers&AcquisitionFulfillmentArrangementPortfolioMake-UpAnalysis
- Portfolio Analytics: mergers&AcquisitionFulfillmentArrangementPortfolioPerformanceAnalysis

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/MergersandAcquisitionsAdvisory/12.0.0

---

### Party Routing Profile

#### role_definition
The customer profile service domain is used to tune the customer experience during any real-time interaction with the bank. A collection of status indicators, ratings and alerts can be maintained that are then used to influence the routing and servicing decisions that govern the customer interaction. For example a status indicator could include a warning that the account is in distress which would limit sales activity and might result in routing a contact to a specialist account recovery servicing facility.

#### core_business_object
Individual Analytics: partyMeasurementAccumulators partyMeasurementActivityAnalysis partyMeasurementPerformanceAnalysis partyMeasurementTrends&Events; Portfolio Analytics: partyMeasurementPortfolioActivityAnalysis partyMeasurementPortfolioMake-UpAnalysis partyMeasurementPortfolioPerformanceAnalysis

#### key_features
- Track and provide customer status flags (e.g. in arrears)
- Track and provide customer ratings (e.g. credit rating)
- Track and provide customer alerts (e.g. possible fraud activity)

#### example_of_use
The identity and active status of a customer is checked as they present themselves on-line to access their bank account

#### triggered_by
- Customer Behavior Insights
- Customer Campaign Execution
- Contact Handler
- Party Reference Data Directory
- Lead and Opportunity Management
- Session Dialogue

#### triggers
- Customer Offer
- Lead and Opportunity Management

#### list_of_scenarios
- Process Internal Upsell Campaign (views/view_55064.html)
- 1b - Retrieved ASPSP Account Information Trigger NBP (views/view_54959.html)
- Execute Interactive Retention Campaign (views/view_55098.html)
- Perform Customer Product Matching and Selection (views/view_55621.html)
- Handle Request for Product Support (views/view_55511.html)
- Execute Internal Campaign (views/view_55350.html)
- Conduct Relationship Development Planning (views/view_55535.html)
- 2 - Customer Sees the NBP Offer and Decides if to Apply (views/view_55585.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/PartyRoutingProfile/12.0.0

---

### Customer Credit Rating

#### role_definition
This service domain handles the derivation and maintenance of each customer's credit rating for both consumer and corporate customers. The internal rating can integrate externally provided credit details from credit scoring agencies with internal transactional data and relationship assessments. The credit rating will be maintained based on internal rules, but it is possible that a service will be offered to support an unscheduled recalculation of the credit score

#### core_business_object
Individual Analytics: customerCreditRatingMeasurementAccumulators, customerCreditRatingMeasurementActivityAnalysis, customerCreditRatingMeasurementPerformanceAnalysis, customerCreditRatingMeasurementTrends&Events; Portfolio Analytics: customerCreditRatingMeasurementPortfolioActivityAnalysis, customerCreditRatingMeasurementPortfolioMake-UpAnalysis, customerCreditRatingMeasurementPortfolioPerformanceAnalysis

#### key_features
- Access external rating agencies for customer credit reports
- Consolidate bank product use that impacts the rating
- Derive and maintain the bank's customer credit assessment

#### example_of_use
A customer calls the contact center wishing to know what mortgage offers they are eligible for. The customer servicing representative (CSR) uses the customer's internal credit assessment as one input to reference the Product Directory to retrieve the details of available products and terms

#### triggered_by
- Party Lifecycle Management
- Customer Relationship Management
- Servicing Order
- Customer Offer
- Credit Card
- Corporate Loan
- Underwriting
- Regulatory Compliance
- Delinquent Account Handling
- Loan Syndication

#### triggers
- Information Provider Operation

#### list_of_scenarios
- Set Up New Card for Card Application
- Handle Request for Balance Transfer
- Perform Regulatory KYC Analysis
- Verify Corporate Customer
- Perform Underwriting for Bank Guarantee
- Handle Request for Loan that Requires Syndication
- Process Card Account Delinquency Review
- EXT Handle Merchandising Loan Application
- EXT Handle Request to Open Retail Current Account
- Handle Request for Corporate Loan
- Verify Private Banking Customer
- Review Borrower Financial Statements
- Perform Underwriting for Corporate Loan
- Perform Underwriting for Syndicated Loan
- Perform Underwriting Light for Buy Now Pay Later
- Handle Request for Product Selection
- Perform Underwriting for Mortgage Loan
- Perform Underwriting for Uncollateralised Consumer Loan
- EXT Handle Request for Renewal of Uncollateralised Consumer Loan
- Handle Request for Issuance of Commercial Paper
- Perform Underwriting for Renewal of Uncollateralised Consumer Loan
- Perform Underwriting for Merchandising Loan
- Process Automatic Card Renewal
- Verify Retail Customer
- Handle Mortgage Loan Application
- Handle Request for Modification of Corporate Loan
- Handle Request to Replace Card

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/CustomerCreditRating/12.0.0

---

### Party Lifecycle Management

#### role_definition
This service domain tracks the state of a party relationship with the bank from the initial checks made when establishing a new business relationship with a customer or partner and then that are performed as necessary over the duration of the relationship. The checks and the maintenance requirements will vary by party type (e.g. individual, company, partner) and jurisdiction. The checks cover bank specific and legal and regulatory considerations and may be updated based on a standard schedule or by request in specific circumstances.

#### core_business_object
PartyRelationshipManagement

#### key_features
- Perform party qualification/confirmation checks
- Maintain a schedule and perform periodic re-assessments
- Provide status reports and process status update notifications

#### example_of_use
A prospective customer has been identified and the bank undertakes a collection of checks to confirm this is a new relationship and to verify the relationship in compliance with bank, legal and regulatory requirements. Note that for different customer types (non consumer in particular) many different checks will be required.

#### triggered_by
- Party Lifecycle Management
- Customer Relationship Management
- Term Deposit
- Mortgage Loan
- Servicing Order
- Corporate Payroll Services
- Processing Order
- Term Deposit Framework Agreement
- Standing Order
- Party Asset Directory
- Corporate Current Account
- Servicing Mandate
- Current Account
- Collateral Asset Administration
- Letter of Credit
- Savings Account
- Customer Offer
- Credit Facility
- Contact Handler
- Corporate Loan
- Bank Guarantee
- Prospect Campaign Execution
- Session Dialogue
- Transaction Authorization

#### triggers
- Party Lifecycle Management
- Document Services
- Issued Device Administration
- Customer Agreement
- Correspondence
- Legal Entity Directory
- Regulatory Reporting
- Customer Offer
- Guideline Compliance
- Customer Credit Rating
- Document Directory
- Location Data Management
- Party Reference Data Directory
- Legal Compliance
- Regulatory Compliance
- Session Dialogue

#### list_of_scenarios
- EXT Handle Request for Overdraft Limit on Virtual Account
- Handle Request for Windfall Investment
- EXT Handle Request to Add Account to Sweep Agreement
- Process Notice of B2B Direct Debit Mandate Amendment from Creditor bank at Debtor Bank
- Perform Regulatory KYC Analysis
- EXT Handle Request to Move Overdraft Limit between Virtual Accounts
- Verify Corporate Customer
- Process Bank Internal Instruction to Block Corporate Current Account
- EXT Handle Request for High Volume Account Opening
- 1b - Retrieved ASPSP Account Information Trigger NBP
- Handle Request to Issue Guarantee on Request of Another Bank
- Execute Customer Onboarding API version
- Handle Request for Notional Pooling Agreement
- Handle Request to Use Direct Debits as Payment Instrument
- Handle Request for Loan that Requires Syndication
- Handle Instruction to Terminate B2B Direct Debits Service at Creditor Bank
- Process Invocation of Cash Management Service
- Handle Request to Add Account to Sweep Agreement
- EXT Handle Merchandising Loan Application
- EXT Handle Request to Open Retail Current Account
- Execute External Campaign
- Perform Customer Product Matching and Selection
- Verify Completion of Customer Updates
- Handle Request to Reactivate Dormant Corporate Current Account
- Handle Request to Open Savings Account
- Handle Request for Corporate Loan
- Verify Private Banking Customer
- EXT Handle Request to Reactivate Dormant Corporate Current Account
- Handle Request for Cash Withdrawal from Savings Account
- EXT Handle Request to Change Corporate Current Account Ownership
- Handle Request for Investment Plan
- Process Internal Customer Upgrade
- Handle Request for Credit Facility

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/PartyLifecycleManagement/12.0.0

---

### Customer Tax Handling

#### role_definition
There are different tax tracking and reporting obligations for products and services in different locations and jurisdictions. This service domain handles the consolidation and reporting of tax related activity as necessary for a customer. Note that this service domain is only responsible for the consolidation and reporting of tax related activity - other service domains will be required to handle actual tax processing obligations as may apply for certain products and services

#### core_business_object
Customer Tax Report; Individual Analytics: customerTaxObligationFulfillmentArrangementAccumulators customerTaxObligationFulfillmentArrangementActivityAnalysis customerTaxObligationFulfillmentArrangementPerformanceAnalysis customerTaxObligationFulfillmentArrangementTrends&Events; Portfolio Analytics: customerTaxObligationFulfillmentArrangementPortfolioActivityAnalysis customerTaxObligationFulfillmentArrangementPortfolioMake-UpAnalysis customerTaxObligationFulfillmentArrangementPortfolioPerformanceAnalysis

#### key_features
- Maintain the customer tax reporting obligations
- Consolidate product/service tax related activity/transaction details
- Analyse financial activity and assemble customer tax reports

#### example_of_use
A consumer customer is provided with a year end tax report for products and services provided by the bank

#### triggered_by
- Servicing Order

#### triggers
(Empty list)

#### list_of_scenarios
- Create Customer Reports (views/view_55419.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/CustomerTaxHandling/12.0.0

---

### Customer Portfolio

#### role_definition
Maintain a portfolio of view of the customer base with key customer data and consolidated activity details to support profitability and performance analysis across many possible customer segment dimensions

#### core_business_object
Customer Portfolio

#### key_features
- Consolidate customer relationship performance data
- Obtain comparative market research on customer relationship profitability
- Conduct analysis of customer segment performance
- Propose initiatives to improve customer segment performance

#### example_of_use
Business development review customer segment performance in order to target customer relationship management priorities

#### triggered_by
- Business Development

#### triggers
(Empty list)

#### list_of_scenarios
- Analyse Customer Segment Performance

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/CustomerPortfolio/12.0.0

---

### Customer Access Entitlement

#### role_definition
This profile is used for servicing and fulfillment controls covering products, services and channel/device usage entitlements. It is referenced for channel access control and utilization limits that may span multiple products. For example there can be a limit on total ATM withdrawals for a customer for all active products over a 24 hour period.

#### core_business_object
Not specified in the PDF

#### key_features
- Maintain customers' channel/device access profiles (allowed uses and limits)
- Maintain customers' channel/device usage preferences
- Check/confirm allowed access for customer contacts

#### example_of_use
A consumer customer contacts the call center and her access profile is used to determine what products and services can be accessed through this channel

#### triggered_by
- Servicing Order
- Processing Order
- Credit Card
- Contact Handler
- Session Dialogue
- Transaction Authorization

#### triggers
- Not specified in the PDF

#### list_of_scenarios
- Process Authentication Request by Issuer
- Develop Opportunity
- Authorise Card Use by Issuer
- Check Customer Channel Access History and Access Entitlements
- Handle Request for Token Assurance

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/CustomerAccessEntitlement/12.0.0

---

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
- Not specified in the PDF

#### list_of_scenarios
- Review Call Centre Activity for New Product
- Process Inventory of Cash and Distribution of Cash to Branches
- Perform Servicing Root Cause Analysis
- End Mobile Access Session and Update Event and Servicing and Channel History

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/ServicingEventHistory/12.0.0

---

### Customer Product And Service Eligibility

#### role_definition
This Service Domain maintains a list of products and services for which a customer is eligible. This could include products and services that the customer has had in the past. In order to update the list, periodically or at certain events, the Service Domain calls Product Matching to find additional products for which the customer is eligible. Once a customer acquires a product or a service, this is removed from the current list and added to the customer's recording in Customer Products and Services.

#### core_business_object
Individual Analytics: customerEligibilityAssessmentAccumulators customerEligibilityAssessmentActivityAnalysis customerEligibilityAssessmentPerformanceAnalysis customerEligibilityAssessmentTrends&Events; Portfolio Analytics: customerEligibilityAssessmentPortfolioActivityAnalysis customerEligibilityAssessmentPortfolioMake-UpAnalysis customerEligibilityAssessmentPortfolioPerformanceAnalysis

#### key_features
- Provide a list of products and services for which a customer is eligible
- Update the list of products and services for which a customer is eligible, based on a request from customer relationship management and with the help of Product Matching

#### example_of_use
Customer Relationship Management re-asseses the eligibility of a customer during a periodical customer analysis.

#### triggered_by
- Customer Relationship Management
- Servicing Order
- Corporate Current Account
- Customer Product And Service Eligibility
- Customer Offer
- Product Matching
- Loan Syndication
- Session Dialogue

#### triggers
- Product Directory
- Customer Product And Service Eligibility
- Customer Position
- Customer Product and Service Directory
- Consumer Advisory Services
- Product Matching

#### list_of_scenarios
- Set Up New Card for Card Application (views/view_55052.html)
- Perform Customer Eligibility Profile Update (views/view_55074.html)
- EXT Handle Request for High Volume Account Opening (views/view_54681.html)
- 1b - Retrieved ASPSP Account Information Trigger NBP (views/view_54959.html)
- Handle Customer Request for User Access Token Using Bank Authorization Grant and its Client Secret within Active Contact (views/view_54913.html)
- Handle Request to Use Direct Debits as Payment Instrument (views/view_55659.html)
- Handle Request for Loan that Requires Syndication (views/view_55083.html)
- EXT Handle Request to Open Retail Current Account (views/view_55487.html)
- Perform Customer Product Matching and Selection (views/view_55621.html)
- Handle Request to Open Savings Account (views/view_55628.html)
- Handle Request for Corporate Loan (views/view_55212.html)
- Handle Request for Product Support (views/view_55511.html)
- Process Internal Customer Upgrade (views/view_55263.html)
- Handle Request for Credit Facility (views/view_55481.html)
- Handle Request to Open Retail Current Account (views/view_55365.html)
- Handle Request for BNPL Financing by Bank where Buyer Is Existing Customer (views/view_55517.html)
- Conduct Relationship Development Planning (views/view_55535.html)
- 1a - Retrieved ASPSP Account Information Triggers NBP (views/view_55684.html)
- Handle Request for Product Selection (views/view_55673.html)
- Handle Request for BNPL Financing-II (views/view_55329.html)
- Perform Customer Relationship Development Planning (views/view_55161.html)
- Handle Request for Bank Guarantee (views/view_55341.html)
- 6 - Trigger and "recalculate product eligibility" (views/view_35566.html)
- Handle Request for Consumer Loan Checks and Options (views/view_54741.html)
- EXT Handle Request to Open Term Deposit Agreement for Retail Customer (views/view_55007.html)
- Handle Request to Open Term Deposit Agreement (views/view_55179.html)
- Handle Request to Issue Letter of Credit (views/view_55618.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/CustomerProductAndServiceEligibility/12.0.0

---

### Party Reference Data Directory

#### role_definition
The party reference data directory service domain maintains a potentially wide range of party reference data that might be used in any interaction between the bank and the party including relationship development, sales/marketing, servicing and product delivery. This can include general reference and contact details, party associations, demographic details and some servicing preferences. Different information may be maintained for different party types such as individuals, corporates, partners

#### core_business_object
PartyRegistryEntry

#### key_features
- Maintain party reference information
- Maintain party demographic indicators
- Maintain party roles, associations and relationships
- Maintain customer bank contacts

#### example_of_use
Party reference details are accessed to pre-populate an application form for a new product opportunity with a customer

#### triggered_by
- Party Lifecycle Management
- Payment Initiation
- Customer Relationship Management
- Investment Portfolio Management
- Servicing Order
- Party Asset Directory
- Customer Behavior Insights
- Current Account
- Syndicate Management
- Collateral Asset Administration
- Payment Instruction
- Customer Offer
- Contact Handler
- Brokered Product
- Corporate Loan
- Underwriting
- Asset Securitization
- Collateral Allocation Management
- Loan Syndication
- Session Dialogue

#### triggers
- Party Routing Profile

#### list_of_scenarios
- Set Up New Card for Card Application
- Process request to add account(s)
- Verify Corporate Customer
- Execute Customer Onboarding API version
- Handle Request for Notional Pooling Agreement
- Select Buyers for Securitize Assets
- Process Sales Marketing and Closing
- Handle Request to Close Savings Account
- EXT Handle Request to Open Retail Current Account
- Process Performance Review
- Verify Completion of Customer Updates
- Handle Request to Open Savings Account
- Verify Private Banking Customer
- Process Selection of Loans for Securitization
- EXT Handle Request to Change Corporate Current Account Ownership
- Handle Request for Investment Plan
- Process Internal Customer Upgrade
- Set Up Syndicate and Sign Agreements-I
- Process Recording and Distribution of Collateral
- EXT Handle Request to Pre-Open Corporate Current Account
- Handle Incoming Request for Payment at Debtor Bank
- Handle Request to Open Retail Current Account
- Handle Request for Corporate Sweep Agreement
- Perform other Regulatory Assessments
- EXT Prepare Transfer of Ownership and Title
- Handle Request for Payment at Creditor Bank for External Account
- Process Access Request by TPP on Behalf of Customer
- Handle Request for Account Statement and Balances
- Handle Request for Power of Attorney
- Perform Customer Due Diligence Assessment
- Perform Underwriting for Uncollateralised Consumer Loan
- EXT Handle Request to Close Corporate Current Account
- EXT Handle Request for Renewal of Uncollateralised Consumer Loan
- Get Customer account details
- Get customer account beneficiaries
- Handle Request to Close Retail Current Account
- Process Prospect Management
- Handle Request for Corporate Sweep Agreement Considering Inter-Company Loan Agreements
- Set Up Syndicate and Sign Agreements-II
- Set Up Syndicate and Sign Agreements-III
- EXT Handle Request for Account Statement and Balances
- Handle Request for Consumer Loan Checks and Options
- Process Customer Access Request and Authentication
- Verify Retail Customer
- Conduct Customer Centric Product Manufacturing
- Negotiate Mandate Letter and Term Sheets
- Handle Request for Early Closing of Term Deposit
- EXT Handle Request to Open Term Deposit Agreement for Retail Customer
- Handle Request for Early Renewal of Term Deposit
- Handle Request to Change Term Deposit Agreement Conditions
- Handle Request to Open Term Deposit Agreement
- EXT Handle Request for Early Closing of Term Deposit

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/PartyReferenceDataDirectory/12.0.0

---

### Customer Relationship Management

#### role_definition
This function handles managed customer relationships. There will typically be a customer development plan and budget/targets for higher value customers. The function may draw on external market insights as well as internal product and service fulfillment to track performance and trigger contact when appropriate. The function is a key source of business development providing product/service matching and awareness. As the primary point of contact the relationship manager can help in issue resolution and trouble shooting. Relationship management applies to corporate and high net-worth clients. Automated knowledge-based facilities may offer some relationship management functions at the consumer banking level in particular for sales and marketing

#### core_business_object
Not specified in the PDF

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

### Legal Entity Directory

#### role_definition
Maintain the legal entity structure including ownership, subsidiaries and partnership details

#### core_business_object
Legal Entry Directory; Individual Analytics: partyDirectoryEntryAccumulators partyDirectoryEntryActivityAnalysis partyDirectoryEntryPerformanceAnalysis partyDirectoryEntryTrends&Events; Portfolio Analytics: partyDirectoryEntryPortfolioActivityAnalysis partyDirectoryEntryPortfolioMake-UpAnalysis partyDirectoryEntryPortfolioPerformanceAnalysis

#### key_features
- Maintain legal entity reference details for bank customers
- Track/update legal entity details based on market research and reports
- Process legal entity detail updates from customers/bank sources
- Confirm/provide legal entity details for transaction processing tasks

#### example_of_use
Party legal entity details are checked for the financial booking of a major loan

#### triggered_by
- Party Lifecycle Management
- Customer Relationship Management
- Servicing Order
- Party Asset Directory
- Collateral Asset Administration
- Customer Offer
- Regulatory Compliance
- Loan Syndication

#### triggers
(Empty list)

#### list_of_scenarios
- Perform Regulatory KYC Analysis (views/view_55013.html)
- Verify Corporate Customer (views/view_55019.html)
- Handle Request for Loan that Requires Syndication (views/view_55083.html)
- Handle Request for Corporate Loan (views/view_55212.html)
- EXT Handle Request to Change Corporate Current Account Ownership (views/view_55493.html)
- Record Details of Pledgeable Borrower Assets (views/view_55642.html)
- Handle Request for Corporate Sweep Agreement (views/view_55200.html)
- EXT Handle Request to Change Virtual Account Ownership (views/view_55562.html)
- Perform Customer Due Diligence Assessment (views/view_55502.html)
- Handle Request for Issuance of Commercial Paper (views/view_54869.html)
- Handle Request for Corporate Sweep Agreement Considering Inter-Company Loan Agreements (views/view_54604.html)
- Conduct Corporate Loan Collateral Due Diligence (views/view_54660.html)
- EXT Handle Request to Open Virtual Account (views/view_54790.html)
- Handle Request to Open Corporate Current Account (views/view_54919.html)
- Handle Request to Establish Term Deposit Agreement (views/view_54907.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/LegalEntityDirectory/12.0.0

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

### Contribution Models

#### role_definition
Develop and refine contribution models to detect underdeveloped business relationships and other opportunities

#### core_business_object
Not specified in the PDF

#### key_features
- Develop contribution models
- Refine contribution models
- Detect underdeveloped business relationships
- Identify business opportunities

#### example_of_use
Financial engineers evaluate the relative business performance of customers and products to identify patterns that highlight business development opportunities from increased sales, usage activity and/or pricing

#### triggered_by
- Not specified in the PDF

#### triggers
- Not specified in the PDF

#### list_of_scenarios
- Individual Analytics: contributionModelSpecificationAccumulators
- Individual Analytics: contributionModelSpecificationActivityAnalysis
- Individual Analytics: contributionModelSpecificationPerformanceAnalysis
- Individual Analytics: contributionModelSpecificationTrends&Events
- Portfolio Analytics: contributionModelSpecificationPortfolioActivityAnalysis
- Portfolio Analytics: contributionModelSpecificationPortfolioMake-UpAnalysis
- Portfolio Analytics: contributionModelSpecificationPortfolioPerformanceAnalysis

#### api_bian_portal_link
Not specified in the PDF

---

### Customer Position

#### role_definition
Individual products will maintain different financial views for the customer. This service domain consolidates financial details from all in-force products and services in order to derive a consolidated financial view which can include current (real-time) positions and projected/estimated values. The consolidated customer position can cover aspects such as cash flows/balances, credit and collateral positions and may derive actual and estimated/projected values

#### core_business_object
Individual Analytics: customerPositionAnalysisAccumulators customerPositionAnalysisActivityAnalysis customerPositionAnalysisPerformanceAnalysis customerPositionAnalysisTrends&Events; Portfolio Analytics: customerPositionAnalysisPortfolioActivityAnalysis customerPositionAnalysisPortfolioMake-UpAnalysis customerPositionAnalysisPortfolioPerformanceAnalysis

#### key_features
- Consolidate product and service financial activity
- Derive consolidated cash flow/balance positions (current and projected)
- Derive consolidated credit exposure (current and projected)
- Derive consolidated collateral positions (current and projected)

#### example_of_use
The banks maintains and analyses the consolidated position for a customer across all accounts products and services

#### triggered_by
- Customer Relationship Management
- eBranch Operations
- Investment Portfolio Management
- Servicing Order
- Customer Product And Service Eligibility
- Current Account
- Contact Handler
- Brokered Product
- Underwriting
- Loan Syndication
- Session Dialogue
- Product Fulfillment SDs

#### triggers
- Product Directory
- Brokered Product
- Consumer Advisory Services

#### list_of_scenarios
- Handle Request for Windfall Investment (views/view_55037.html)
- 5 - Process request to add account(s) (views/view_44769.html)
- 1b - Retrieved ASPSP Account Information Trigger NBP (views/view_54959.html)
- Create Customer Reports (views/view_55419.html)
- Perform Underwriting for Bank Guarantee (views/view_55245.html)
- Handle Request for Loan that Requires Syndication (views/view_55083.html)
- Handle Request for Corporate Loan (views/view_55212.html)
- Handle Request for Investment Plan (views/view_55514.html)
- 1a - Retrieved ASPSP Account Information Triggers NBP (views/view_55684.html)
- Perform Underwriting for Corporate Loan (views/view_55254.html)
- Perform Underwriting for Syndicated Loan (views/view_55248.html)
- Perform Underwriting Light for Buy Now Pay Later (views/view_55191.html)
- Handle Request for Product Selection (views/view_55673.html)
- Perform Underwriting for Mortgage Loan (views/view_55392.html)
- Handle Request for BNPL Financing-II (views/view_55329.html)
- Perform Underwriting for Uncollateralised Consumer Loan (views/view_55410.html)
- Handle Request for Bank Guarantee (views/view_55341.html)
- 6 - Trigger and "recalculate product eligibility" (views/view_35566.html)
- 6&7 - Retrieve accounts and consent details (views/view_35037.html)
- 13 - Get customer account balances (views/view_30223.html)
- Perform Underwriting for Renewal of Uncollateralised Consumer Loan (views/view_54892.html)
- Perform Underwriting for Merchandising Loan (views/view_54854.html)
- 3 - Periodically the TPP Bank Request Account Updates (views/view_54916.html)
- 20 - Get customer account transactions (views/view_39221.html)
- Conduct Customer Centric Product Manufacturing (views/view_54849.html)
- Handle Request for Modification of Corporate Loan (views/view_54654.html)
- Handle Request to Extend Validity of Letter of Credit (views/view_55634.html)
- Handle Request to Issue Letter of Credit (views/view_55618.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/CustomerPosition/12.0.0

---

### Customer Event History

#### role_definition
The service domain captures a wide range of customer events to build a comprehensive history of customer activity that can support subsequent behavioral analysis. This includes key sales/proposal events, relationship management events, product delivery events, detected customer triggers (typically gleaned during servicing dialogues) and possibly externally sourced customer activity. The assembled data is made available for behavioral analysis and for more general reference (as might be used for relationship management for example)

#### core_business_object
Not specified

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

### Customer Behavior Models

#### role_definition
This service domain handles the development, maintenance and continual assessment and refinement of the collection of customer behavior models that are deployed across the bank. This includes more general analyses for sales, operational behavior, relationship development and specific behaviors such as credit and fraud detection. Customer can cover consumer, corporate and merchant behavior for some behavioral models/scanners

#### core_business_object
Individual Analytics: customerBehaviorModelSpecificationAccumulators customerBehaviorModelSpecificationActivityAnalysis customerBehaviorModelSpecificationPerformanceAnalysis customerBehaviorModelSpecificationTrends&Events; Portfolio Analytics: customerBehaviorModelSpecificationPortfolioActivityAnalysis customerBehaviorModelSpecificationPortfolioMake-UpAnalysis customerBehaviorModelSpecificationPortfolioPerformanceAnalysis

#### key_features
- Determine desired type/coverage for behavior analysis
- Source, define and develop behavior models
- Publish, process feedback and refine/tune models

#### example_of_use
A customer 'propensity to buy model' algorithm is updated to take account of additional transaction utilization data that is available

#### triggered_by
- Business Development
- Channel Activity Analysis
- Customer Behavior Insights
- Credit Card

#### triggers
- Customer Relationship Management
- Customer Behavior Insights
- Savings Account
- Customer Offer
- Customer Event History

#### list_of_scenarios
- Process Card Account Delinquency Review (views/view_55269.html)
- Assess Customer Behaviour Model Performance (views/view_55371.html)
- Flag Bots Acting as Customers or TPPs (views/view_55049.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/CustomerBehaviorModels/12.0.0

---

### Session Dialogue

#### role_definition
The customer contact dialogue handling capability can provide highly structured orchestration to streamline a customer interaction by consolidating and presenting customer related data in context. It can also use the session to gather additional customer intelligence. In a more advance implementation the customer interaction capabilities can be integrated into an automated self/service context in addition to the more conventional assisted service model. The structured customer dialogue can include tasks to check for other business activities that can be built into the exchange for example, delivering pending communications, sales/marketing attempts, capturing intelligence/triggers, updating relationship status/details, product fulfillment (such as synchronizing customer-side data). The facility can be designed to support multi-channel/multi-device deployments

#### core_business_object
CustomerContactProcess

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
- Update status of the consent to authorized and get authentication code
- EXT Handle Request to Move Overdraft Limit between Virtual Accounts
- Handle Request for Card Activation
- Customer Relationship Case Initiation
- Process Authentication Request by Issuer
- EXT Handle Request for High Volume Account Opening
- Handle Request for Withdrawal from Consumer Loan
- Handle Request for Copy of Active Version of Mandate at Debtor Bank
- Retrieve a list of connected ASPSB banks
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

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/SessionDialogue/12.0.0
