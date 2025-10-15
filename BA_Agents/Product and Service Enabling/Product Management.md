# Product Management

## Capabilities Overview

### ATM Network Management

#### role_definition
Configure the allocation of products and services across the ATM network and oversee ATM access registration & controls

#### core_business_object
Not specified

#### key_features
Not specified

#### example_of_use
A new set of standalone ATM's is installed at an airport and configured with limited services to ensure high availability for cash dispensing

#### triggered_by
Not specified

#### triggers
- ATM Network Operations
- Branch Currency Management

#### list_of_scenarios
- Review ATM Float and Outage

#### api_bian_portal_link
Not specified

---

### Product Deployment

#### role_definition
Plan and administer the deployment activities for new and enhanced products and services, includes employee training, product inventory and solution deployment and coordination with systems production release, IT platform operations, production fulfillment staffing, customer servicing, marketing and sales activities

#### core_business_object
Product

#### key_features
- Define and arrange for systems enhancement production integration (development and testing handled by SD-Production Release)
- Define and arrange for IT and HR operational requirements
- Define and arrange for sales and marketing support requirements
- Define and arrange for customer servicing requirements
- Define and arrange for incremental product fulfillment and support requirements

#### example_of_use
An enhancement to an established product is rolled out across the enterprise

#### triggered_by
- Sales Planning
- Product Deployment
- Product Design

#### triggers
- Product Directory
- Product Inventory Item Management
- Sales Product
- Product Training
- Product Deployment
- Product Quality Assurance
- System Deployment
- Production Release
- Interactive Help

#### list_of_scenarios
- Product Deployment SD Overview (views/view_51192.html)
- BIAN Service Landscape V12.0 Value Chain (views/view_51705.html)
- BIAN Service Landscape V12.0 Matrix View (views/view_51891.html)
- Launch New Sales Product (views/view_54616.html)
- Create New Product (views/view_55146.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/ProductDeployment/12.0.0

---

### Product Quality Assurance

#### role_definition
The service domain maintain and execute a portfolio of product quality assurance tests and if appropriate certifications to apply to new and updated production applications. These tests can be applied to any specific aspects of product sales, servicing and fulfillment as might be appropriate

#### core_business_object
Product and Service Assessment

#### key_features
- Select assurance target area
- Apply assurance tests
- Analyze testing results to determine root cause for error rates/issues

#### example_of_use
Quality assurance tests are applied to evaluate a newly released product processing to determine whether error and issue rates are acceptable and support root cause analysis

#### triggered_by
- Product Portfolio
- Product Deployment

#### triggers
- Contact Center Management

#### list_of_scenarios
- Product Quality Assurance SD Overview (views/view_50782.html)
- BIAN Service Landscape V12.0 Value Chain (views/view_51705.html)
- BIAN Service Landscape V12.0 Matrix View (views/view_51891.html)
- Launch New Sales Product (views/view_54616.html)
- Review Call Centre Activity for New Product (views/view_55164.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/ProductQualityAssurance/12.0.0

---

### Brokered Product

#### role_definition
Administer 3rd party coordination for the production delivery of 'brokered' products and services that are offered through the bank, possibly in combination with the bank's own product and service offerings

#### core_business_object
Not specified

#### key_features
- Monitor and assess production and service delivery quality
- Oversee and assure 3rd party conformance with agreed service levels
- Oversee the troubleshooting or production issues

#### example_of_use
Access to a bank approved insurance broker is facilitated by a customer's relationship manager

#### triggered_by
- Customer Relationship Management
- Customer Position
- Session Dialogue

#### triggers
- Issued Device Administration
- Operational Gateway
- Customer Position
- Customer Product and Service Directory
- Contact Handler
- Party Reference Data Directory

#### list_of_scenarios
- 2 - Retrieve a list of connected ASPSB banks
- 1 - Initiate Consent
- 3 - Initiate consent authorization
- 12 - Get customer account details
- 2 - Create account consent
- 20 - Get customer account transactions
- 11 - Get list of customer accounts
- 2 - Retrieve a list of ASPSB banks from the OB Directory

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/BrokeredProduct/12.0.0

---

### Product Inventory Distribution

#### role_definition
The service domains administer the provisioning and distribution of product inventory across the branch network and/or organizing distribution direct to customers (e.g. using mail services) where appropriate. The administration function keeps track of inventory holdings and administers a provisioning schedule to acquire replacement inventory as needed to meet requirements

#### core_business_object
Product Inventory Distribution Administrative Plan

#### key_features
- Product inventory tracking
- Replacement inventory provisioning
- Inventory distribution across the branch network
- Inventory distribution through bulk correspondence

#### example_of_use
The distribution of 'take-one' product marketing materials distributed through the branch network is administered in support of a product sales campaign. Brochures are ordered and distributed to ensure branches are supplied with sufficient inventory to meet customer demand

#### triggered_by
- Product Inventory Item Management

#### triggers
Not specified

#### list_of_scenarios
- Product Inventory Distribution SD Overview (views/view_50674.html)
- BIAN Service Landscape V12.0 Value Chain (views/view_51705.html)
- BIAN Service Landscape V12.0 Matrix View (views/view_51891.html)
- Launch New Sales Product (views/view_54616.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/ProductInventoryDistribution/12.0.0

---

### Products and Services Direction

#### role_definition
Develop and communicate product and service policies and adapt in response to changing needs and to practical experience

#### core_business_object
Not specified

#### key_features
Not specified

#### example_of_use
Senior product and service management assess performance and define the policies governing product and service delivery

#### triggered_by
Not specified

#### triggers
Not specified

#### list_of_scenarios
Not specified

#### api_bian_portal_link
Not specified

---

### Product Combination

#### role_definition
The Product Combination service domain allows a bank to assemble a composite product from two or more existing products. The combination framework implements necessary functional constraints on the 'contained products' and handles considerations such as transfer pricing where the profitability of embedded products may be compromised to ensure management analysis is not distorted

#### core_business_object
Product Combination Facility

#### key_features
- Embedded product constrained operation configuration
- Transfer pricing/inter product performance compensation handling
- Combined product fulfillment facilities

#### example_of_use
A current account product instance is bundled with an investment portfolio product instance to create a combined "margin trading" product. The performance evaluation of the embedded current account that has constrained capabilities is amended to reflect its contribution to the combined product performance

#### triggered_by
- Business Unit Management
- Business Development
- Sales Product
- Session Dialogue

#### triggers
- Current Account
- Sales Product
- Loan

#### list_of_scenarios
- Product Combination SD Overview (views/view_50985.html)
- BIAN Service Landscape V12.0 Value Chain (views/view_51705.html)
- BIAN Service Landscape V12.0 Matrix View (views/view_51891.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/ProductCombination/12.0.0

---

### Discount Pricing

#### role_definition
Maintain a current price list (with ranges and optional terms) by product/customer type for exceptional pricing conditions that override standard pricing as would be derived from the standard product specification

#### core_business_object
Not specified

#### key_features
Not specified

#### example_of_use
A short term discount (waived fees) is put in place for a product at selected university campus locations as part of an effort to attract new student customers

#### triggered_by
Not specified

#### triggers
Not specified

#### list_of_scenarios
Not specified

#### api_bian_portal_link
Not specified

---

### Product Design

#### role_definition
Design and refine bank product and service specifications. This addresses multiple aspects including the core product specification definition, legal, tax and regulatory compliance, pricing, risk and performance assessments, testing and supporting systems and production requirements definition

#### core_business_object
Product

#### key_features
- Consolidate desired product/service features and requirements
- Define and develop product/service specifications
- Deploy, process feedback and refine/tune product/service specifications

#### example_of_use
Product management identifies an opportunity to amend key features of a product to target a market segment

#### triggered_by
- Investment Portfolio Management
- Product Portfolio
- Product Design
- Servicing Activity Analysis

#### triggers
- Correspondence
- Product Directory
- Product Inventory Item Management
- Current Account
- Sales Product Agreement
- Product Deployment
- System Development
- Financial Accounting
- Intellectual Property Portfolio
- Product Design
- Regulatory Compliance

#### list_of_scenarios
- Product Design SD Overview (views/view_50872.html)
- BIAN Service Landscape V12.0 Value Chain (views/view_51705.html)
- BIAN Service Landscape V12.0 Matrix View (views/view_51891.html)
- Create New Sales Product Bundle (views/view_55028.html)
- Review Call Centre Activity for New Product (views/view_55164.html)
- Create New Product (views/view_55146.html)
- Create New Sales Product Single (views/view_55221.html)
- Perform Servicing Root Cause Analysis (views/view_54750.html)
- Conduct Customer Centric Product Manufacturing (views/view_54849.html)
- Change Operational Current Account Product (views/view_54857.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/ProductDesign/12.0.0

---

### Product Sales Support

#### role_definition
Administer the allocation of specialist support to advise on specific products and services

#### core_business_object
Product Sales Support Administrative Plan

#### key_features
Not specified

#### example_of_use
An established corporate customer arranges a meeting with a specialist to discuss short term funding options

#### triggered_by
- Customer Relationship Management
- Product Expert Sales Support

#### triggers
- Product Expert Sales Support

#### list_of_scenarios
- Product Sales Support SD Overview (views/view_50815.html)
- BIAN Coreless 2.0 Wireframe (views/view_50878.html)
- Relationship Development (views/view_51270.html)
- BIAN Service Landscape V12.0 Value Chain (views/view_51705.html)
- BIAN Service Landscape V12.0 Matrix View (views/view_51891.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/ProductSalesSupport/12.0.0

---

### Product Directory

#### role_definition
The product directory service domain provides a central service to reference product specifications and related details. The broad range of specification information available includes: product feature descriptions; pricing and eligibility requirements used in sales and on-boarding; servicing support and guidelines; and operational and production requirements

#### core_business_object
Product

#### key_features
- Maintain product/service operational requirements
- Maintain product/service sales/marketing rules and guidelines
- Maintain product/service suitability and eligibility requirements
- Maintain product/service servicing guidelines and diagnosis
- Maintain product/service production requirements
- Provide structured access to the product directory

#### example_of_use
A customer accesses the product directory to obtain product feature descriptions, eligibility and pricing guidelines

#### triggered_by
- Customer Relationship Management
- Term Deposit
- Sales Planning
- Mortgage Loan
- Servicing Order
- Term Deposit Framework Agreement
- Corporate Current Account
- Customer Product And Service Eligibility
- Card Clearing
- Current Account
- Sales Product
- Letter of Credit
- Direct Debits Service
- Savings Account
- Customer Offer
- Product Deployment
- Customer Position
- Cash Concentration
- Corporate Loan
- Product Design
- Bank Guarantee
- Product Matching
- Customer Case
- Loan Syndication
- Session Dialogue
- Investment Portfolio Planning
- Notional Pooling

#### triggers
- Consumer Advisory Services

#### list_of_scenarios
- Set Up New Card for Card Application
- Perform Customer Eligibility Profile Update
- Create New Sales Product Bundle
- EXT Handle Request to Move Overdraft Limit between Virtual Accounts
- EXT Handle Request for High Volume Account Opening
- Launch New Sales Product
- Handle Request to Issue Guarantee on Request of Another Bank
- Handle Request for Notional Pooling Agreement
- Handle Request for Consumer Loan Verify Documentation and Offer Process
- Handle Request to Use Direct Debits as Payment Instrument
- Process Request for Amount Block
- Handle Request for Loan that Requires Syndication
- Create New Product
- Process Closing of Syndicated Loan-I
- EXT Handle Merchandising Loan Application
- Process Card Clearing by Issuer
- EXT Handle Request to Open Retail Current Account
- Process Closing of Corporate Loan
- Perform Customer Product Matching and Selection
- EXT Handle Customer Relationships Case
- Handle Request to Open Savings Account
- Handle Request for Corporate Loan
- EXT Handle Request to Change Corporate Current Account Ownership
- Handle Request for Investment Plan
- Handle Request for Credit Facility
- EXT Handle Request to Pre-Open Corporate Current Account
- EXT Handle Request to Add Signatory to Corporate Current Account
- Handle Request for Early Payback of Consumer Mortgage Loan Due to Sale of Property
- Handle Request to Detach Account from Corporate Payroll Service Agreement
- EXT Handle Request to Use Direct Debits as Payment Instrument
- Handle Request to Open Retail Current Account
- Handle Request for Corporate Sweep Agreement
- Handle Request from Investor for Loan Portfolio Servicing Agreement
- Handle Request to Establish Corporate Payroll Service Agreement
- Initiate Bank Guarantee
- Phase Out Sales Product Current Account
- 1a - Retrieved ASPSP Account Information Triggers NBP
- EXT Handle Request to Change Virtual Account Ownership
- EXT Handle Request for High Volume Virtual Account Opening
- Handle Request for Product Selection
- Handle Request for Account Statement and Balances
- Process End of Daily Booking Window for Interest Accrual Savings Account
- Handle Request for BNPL Financing-II
- Handle Request for Power of Attorney
- Handle Request for Bank Guarantee
- Create New Sales Product Single
- Process Closing of Mortgage Loan
- EXT Handle Request for Renewal of Uncollateralised Consumer Loan
- Process Card Clearing by Card Network
- EXT Handle Request to Detach Account from Corporate Payroll Service Agreement
- Handle Request for Corporate Sweep Agreement Considering Inter-Company Loan Agreements
- Process Modification of Corporate Loan
- Handle Request for Consumer Loan Checks and Options
- Process Closing of Syndicated Loan-II
- EXT Handle Request to Open Corporate Current Account
- Handle Request for Uncollateralised Consumer Loan
- Determine Dynamically Calculated Available Balance
- Handle Mortgage Loan Application
- EXT Handle Request to Open Virtual Account
- Conduct Customer Centric Product Manufacturing
- Change Operational Current Account Product
- Negotiate Mandate Letter and Term Sheets
- Handle Request for Modification of Corporate Loan
- Handle Request to Open Corporate Current Account
- Handle Request for Early Closing of Term Deposit
- EXT Handle Request to Open Term Deposit Agreement for Retail Customer
- Handle Request to Open Term Deposit under Term Deposit Agreement for Retail Customer
- Handle Request for Corporate Debit Cards Service
- EXT Handle Request to Open Term Deposit under Term Deposit Agreement for Retail Customer
- Handle Request to Open Term Deposit under Term Deposit Agreement for Corporate Customer
- EXT Handle request for Corporate Debit Cards Service
- Handle Request for Early Renewal of Term Deposit
- EXT Handle Request to Open Term Deposit under Term Deposit Agreement for Corporate Customer
- Handle Request to Open Term Deposit Agreement
- Update Letter of Credit for Extension of Validity
- Handle Request to Issue Letter of Credit
- EXT Handle Request to Establish Term Deposit Agreement
- Initiate Letter of Credit
- EXT Handle Request for Early Closing of Term Deposit
- EXT Handle Request for Early Renewal of Term Deposit
- Handle Request to Establish Term Deposit Agreement
- EXT Handle Request for Modification of Merchandising Loan

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/ProductDirectory/12.0.0

---

### Product Matching

#### role_definition
The service domain implements a decision service (that might be interactive) to isolate the preferred product(s) for which a customer is eligible in a specific servicing situation. The product selection logic will balance factors including customer indicated desired product type/features, customer type/profile, solicitation/retention/enquiry servicing situation, prevailing campaigns/bank preferred products. The decision logic improves product selection to optimize the customer interaction and support business development

#### core_business_object
Product/ Customer Combination Assessment

#### key_features
- Determine customer product interest
- Isolate eligible products
- Consider context to filter/prioritize products
- Apply broader campaign/bank preferences

#### example_of_use
A customer servicing representative initiates a product matching dialogue after resolving a disputed payment in favor of the customer, hoping to leverage the positive contact situation to generate additional business opportunities

#### triggered_by
- Customer Relationship Management
- Investment Portfolio Management
- Customer Product And Service Eligibility

#### triggers
- Product Directory
- Customer Product And Service Eligibility

#### list_of_scenarios
- Product Matching SD Overview (views/view_50740.html)
- BIAN Coreless 2.0 Wireframe (views/view_50878.html)
- Relationship Development (views/view_51270.html)
- BIAN Coreless 3.0 Wireframe (views/view_51594.html)
- BIAN Service Landscape V12.0 Value Chain (views/view_51705.html)
- TPP Backend (views/view_51723.html)
- BIAN Service Landscape V12.0 Matrix View (views/view_51891.html)
- Perform Customer Eligibility Profile Update (views/view_55074.html)
- 1b - Retrieved ASPSP Account Information Trigger NBP (views/view_54959.html)
- Handle Request for Corporate Loan (views/view_55212.html)
- Process Internal Customer Upgrade (views/view_55263.html)
- Conduct Customer Centric Product Manufacturing (views/view_54849.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/ProductMatching/12.0.0

---

### Special Pricing Conditions

#### role_definition
This service domain allows the bank to apply special pricing terms and conditions that override standard price calculations. These override facilities are to be used in specific situations where a bank level decision is taken to amend prices or pricing terms in response to some major event or business development action

#### core_business_object
Special Pricing Conditions Directory Entry

#### key_features
- Capture authorized override bank pricing terms
- Broadcast special terms to interested parties
- Confirm terms applied as required in production

#### example_of_use
The bank suspends certain product fees during a major brand awareness campaign

#### triggered_by
Not specified

#### triggers
Not specified

#### list_of_scenarios
- Special Pricing Conditions SD Overview (views/view_50728.html)
- BIAN Service Landscape V12.0 Value Chain (views/view_51705.html)
- BIAN Service Landscape V12.0 Matrix View (views/view_51891.html)

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/SpecialPricingConditions/12.0.0

---

### Product Inventory Item Management

#### role_definition
Maintain the available central product materials inventory in coordination with distribution activities and new product/materials ordering, receipt and warehousing

#### core_business_object
Product Inventory

#### key_features
- Maintain product inventory
- Administer the distribution of inventory
- Request stock replenishment

#### example_of_use
Newly developed product inventory is distributed as part of a product deployment project

#### triggered_by
- Product Deployment
- Product Design

#### triggers
- Product Inventory Distribution

#### list_of_scenarios
- Create New Sales Product Bundle
- Launch New Sales Product
- Create New Sales Product Single

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/ProductInventoryItemManagement/12.0.0

---

### Product Portfolio

#### role_definition
Maintain a portfolio of view of the bank's products with key product performance data and consolidated activity details to support profitability and performance analysis across the product portfolio

#### core_business_object
Product Analysis

#### key_features
- Consolidate product performance data
- Obtain comparative market research on competitor product activity/profitability
- Conduct analysis of product performance
- Propose initiatives to improve product profitability/performance

#### example_of_use
Business development review product performance in order to target product design, marketing, sales, pricing and delivery priorities

#### triggered_by
- Business Development

#### triggers
- Sales Product
- Product Quality Assurance
- Product Design

#### list_of_scenarios
- Create New Sales Product Bundle
- Review Call Centre Activity for New Product
- Create New Product
- Phase Out Sales Product Current Account
- Create New Sales Product Single
- Change Operational Current Account Product
- Analyse Product Portfolio Performance

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/ProductPortfolio/12.0.0

---

### Sales Product

#### role_definition
A sales product defines specific constraints and terms that augment the features of the base product it 'wraps'. It is used to support customization or core products to address specific market needs and opportunities with more narrowly targeted products

#### core_business_object
Product and Service Agreement

#### key_features
- Link to core/underlying product instance
- Support specific product constraints/processing terms
- Enable/link to additional service features

#### example_of_use
A bank packages its Current Account product with features suited to students as part of a prospect campaign

#### triggered_by
- Investment Portfolio Management
- Product Portfolio
- Sales Product
- Customer Offer
- Product Deployment

#### triggers
- Product Directory
- Current Account
- Sales Product
- Product Fulfillment SDs

#### list_of_scenarios
- Launch New Sales Product
- Phase Out Sales Product Current Account
- Conduct Customer Centric Product Manufacturing

#### api_bian_portal_link
https://app.swaggerhub.com/apis/BIAN-3/SalesProduct/12.0.0

---
