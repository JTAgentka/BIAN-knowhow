# Extended Domain List - Collateral Management

#### Collateral Allocation Management
Collateral allocation to products.

##### role_definition
Collateral Allocation Management oversees the allocation of a party asset when pledged as collateral to one or more loans. Specific reference details of the asset are maintained in the Party Asset Directory Service Domain. The valuation of an asset is organized by the Party Asset Directory. A valuation can be requested by the Collateral Allocation Management Service Domain. Collateral Allocation Management also determines the portion of an asset value that can be applied or can still be applied as collateral. This will depend on the asset type and specific policies of the bank.

##### core_business_object
Collateral Asset Allocation

##### key_features
- Allocate collateral
- Maintain collateral position

##### example_of_use
A customer transfers the fiduciary ownership of a consumer durable to the bank as security for a loan. Collateral Asset Management will do the allocation by linking the asset (as recorded in Party Asset Directory) to the loan product instance.

##### triggered_by
- Customer Relationship Management
- Term Deposit
- Mortgage Loan
- Syndicated Loan
- Party Asset Directory
- Syndicate Management
- Collateral Asset Administration
- Customer Offer
- Disbursement
- Merchandising Loan
- Corporate Loan
- Underwriting
- Loan Syndication
- Product Fulfillment SDs

##### triggers
- Syndicated Loan
- Legal Advisory
- Party Asset Directory
- Collateral Asset Administration
- Corporate Loan
- Party Reference Data Directory
- Limit and Exposure Management

##### list_of_scenarios
- Process Modification of Merchandising Loan
- Process Termination of Syndicated Loan-III
- Process Syndicated Loan Instalment-I
- Perform Underwriting for Bank Guarantee
- Process Invocation of Cash Management Service
- Process Closing of Syndicated Loan-I
- EXT Handle Merchandising Loan Application
- Process Termination of Syndicated Loan-II
- Retrieve Loan to Value Ratio
- Process Selection of Loans for Securitization
- Review Borrower Financial Statements
- Set Up Syndicate and Sign Agreements-I
- Process Recording and Distribution of Collateral
- Handle Request for Credit Facility
- Handle Request for Early Payback of Consumer Mortgage Loan Due to Sale of Property
- Handle Request to Sell Syndicated Loan Participation to other Bank when Lead Bank Is not Seller or Buyer-I
- Record Details of Pledgeable Borrower Assets
- Handle Request from Lead Bank to Sell Part of Its Syndicated Loan Participation to Other Lender-I
- EXT Prepare Transfer of Ownership and Title
- Handle Request to Sell Syndicated Loan Participation to Other Bank when Lead Bank Is not Seller or Buyer-III
- Process Syndicated Loan Instalment-II and III
- Set Up Syndicate and Sign Agreements-II
- Set Up Syndicate and Sign Agreements-III
- Perform Underwriting for Merchandising Loan
- Process Closing of Syndicated Loan-III
- Process Modification of Corporate Loan
- Process Closing of Syndicated Loan-II
- Disburse Syndicated Loan-II
- Conduct Corporate Loan Collateral Due Diligence
- Disburse Syndicated Loan-III
- Process Loans Instalments
- Process Termination of Syndicated Loan-I
- Handle Request for Early Closing of Term Deposit
- Handle Request for Early Renewal of Term Deposit
- EXT Handle Request for Early Closing of Term Deposit
- EXT Handle Request for Early Renewal of Term Deposit
- Disburse Corporate Loan
- Control the status of an allocation (e.g. terminate)
- Allocate a collateral asset to a lending product
- Record usage details for a collateral allocation
- Retrieve details about a collateral allocation
- Accept or reject a collateral allocation proposal
- Obtain permission for access to the collateral asset
- Record an asset provided for collateralization
- Retrieve details and status of a collateral asset and its allocation
- Update details about an allocation request and in force
- Update details and status of a collateral asset and its allocation

---

#### Collections
Collateral liquidation for unpaid accounts.

##### role_definition
Administer the recovery and/or liquidation of collateral against problem accounts

##### core_business_object
Collateral Asset Liquidation Procedure

##### key_features
- Assess account status and determine collections approach
- Collateral title and valuation assessment
- Collateral Liquidation
- Account/debt factoring

##### example_of_use
Collateral held against a failed account is valued and submitted for liquidation to recover losses

##### triggered_by
- Customer Case

##### triggers
- Legal Entity Directory
- Customer Credit Rating

##### list_of_scenarios
- Update details relating to Debt Factoring
- Retrieve details about any aspect of Collections Assessment
- Update details relating to Collateral Liquidation
- Request manual intervention or a decision with respect to Collateral Asset Liquidation Procedure
- Instantiate a new Collections Assessment
- Accept, verify, etc. aspects of Collateral Asset Liquidation Procedure processing
- Update details relating to Collateral Asset Liquidation Procedure
- Retrieve details about any aspect of Collateral Valuation
- Instantiate a new Collateral Valuation
- Update details relating to Collateral Valuation
- Retrieve details about any aspect of Collateral Liquidation
- Instantiate a new Collateral Liquidation
- Update details relating to Collections Assessment
- Retrieve details about any aspect of Collateral Asset Liquidation Procedure
- Accept, verify, etc. aspects of Collateral Valuation processing
- Retrieve details about any aspect of Debt Factoring
- Accept, verify, etc. aspects of Collateral Liquidation processing
- Retrieve details about any aspect of Collections Account Update
- Execute an available automated action for Collateral Asset Liquidation Procedure
- Instantiate a new Collateral Asset Liquidation Procedure
- Accept, verify, etc. aspects of Debt Factoring processing
- Update details relating to Collections Account Update
- Control the processing of Collateral Asset Liquidation Procedure
- Instantiate a new Debt Factoring

---

#### Collateral Asset Administration
Collateral asset administration.

##### role_definition
This service domain handles the oversight, administration and confirmation of maintenance tasks associated with different types of collateral items. This includes arranging for scheduled and ad-hoc collateral valuations, item status/documentation and title checks and tracking upkeep actions that the item owner is obliged to undertake (such as insuring a house)

##### core_business_object
Collateral Asset Administrative Plan

##### key_features
- Record and classify collateral assets
- Obtain collateral asset valuations
- Confirm the maintenance and status of collateral assets

##### example_of_use
A back office unit determines which collateral items are due for a valuation review and documentation check and schedules the activities accordingly

##### triggered_by
- Customer Relationship Management
- Mortgage Loan
- Customer Offer
- Disbursement
- Merchandising Loan
- Corporate Loan
- Underwriting
- Collateral Allocation Management
- Product Fulfillment SDs

##### triggers
- Party Lifecycle Management
- Customer Relationship Management
- Mortgage Loan
- Product Expert Sales Support
- Correspondence
- Customer Workbench
- Payment Order
- Current Account
- Legal Entity Directory
- Credit Facility
- Information Provider Operation
- Corporate Loan
- Document Directory
- Party Reference Data Directory
- Legal Compliance
- Collateral Allocation Management
- Session Dialogue

##### list_of_scenarios
- Retrieve details about an valuation task
- Retrieve details about a maintenance task
- Accept or reject the results of a maintenance task
- Create a collateral asset administrative plan for a new item
- Update details of the administrative plan
- Update details for a valuation
- Request an ad-hoc valuation (override the schedule)
- Retrieve details about an active collateral asset administrative plan
- Request an ad-hoc maintenance task (override the schedule)
- Create a valuation for a collateral asset
- Create a maintenance task for a collateral asset
- Update details for a maintenance task

---

#### Consumer Loan
Consumer loans.

*No JSON file found for this domain*

---

#### Mortgage Loan
Mortgage loans.

*No JSON file found for this domain*

---

#### Collateral Registration
Collateral registration.

*No JSON file found for this domain*

---

## Additional Domain Found

#### Leasing Item Administration
Track the status of the assets underlying leasing agreements as they represent collateral items that could be accessed in the event of account recovery.

##### role_definition
This service domain handles the oversight, administration and confirmation that any required maintenance tasks that are associated with a leased item that is the subject of a leasing agreement financed through the bank. This can include scheduled and ad-hoc item valuations, status/documentation and title checks and tracking upkeep actions that the item owner is obliged to undertake (such as obtaining certification and insurance)

##### core_business_object
Leasing Item Administrative Plan

##### key_features
- Record and classify leased items
- Oversee/review leased item status and valuation checks
- Confirm the maintenance, certification and insurance arrangements are in place

##### example_of_use
The bank reviews the maintenance schedule for a major piece of equipment leased by a customer with bank financing to confirm that preventative maintenance has been undertaken as required and that the equipment is being used as intended

##### triggered_by
- Leasing Item Administrative Plan_Instantiation
- Leasing Item Administrative Plan_Invocation

##### triggers
- Leasing Item Administrative Plan_Analytics Object
- Leasing Item Administrative Plan_Reporting
- Leasing Item Administration_SD_Operations

##### list_of_scenarios
- Instantiate a new Valuation
- Capture Assurance activity or event related information
- Control the processing of Leasing Item Administrative Plan
- Update details relating to Valuation
- Update details relating to Assurance
- Accept, verify, etc. aspects of Leasing Item Administrative Plan processing
- Capture Valuation activity or event related information
- Instantiate a new Assurance
- Obtain permission to act in relation to Leasing Item Administrative Plan
- Instantiate a new Leasing Item Administrative Plan
- Retrieve details about any aspect of Leasing Item Administrative Plan
- Update details relating to Registration
- Retrieve details about any aspect of Valuation
- Capture Registration activity or event related information
- Retrieve details about any aspect of Assurance
- Retrieve details about any aspect of Registration
- Request manual intervention or a decision with respect to Leasing Item Administrative Plan
- Update details relating to Leasing Item Administrative Plan
- Instantiate a new Registration
- Capture Leasing Item Administrative Plan activity or event related information
