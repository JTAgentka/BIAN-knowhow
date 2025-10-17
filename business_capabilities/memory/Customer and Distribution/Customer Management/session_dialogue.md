### Session Dialogue - Domain Expertise
You have mastery-level understanding in following business and IT aspect of this capability. Your expertise is limited only to provided information below.



#### Role Definition
The customer contact dialogue handling capability can provide highly structured orchestration to streamline a customer interaction by consolidating and presenting customer related data in context. It can also use the session to gather additional customer intelligence. In a more advance implementation the customer interaction capabilities can be integrated into an automated self/service context in addition to the more conventional assisted service model. The structured customer dialogue can include tasks to check for other business activities that can be built into the exchange for example, delivering pending communications, sales/marketing attempts, capturing intelligence/triggers, updating relationship status/details, product fulfillment (such as synchronizing customer-side data). The facility can be designed to support multi-channel/multi-device deployments

#### Folder Name
Customer Management

#### Core Business Object
CustomerContactProcess

#### Example of Use
A customer dials into the contact center with a current account balance request. The customer identity is checked by the servicing representative (using a Party Profile Service Domain call). After the customer initial query has been addressed the dialogue is structured to attempt a sales pitch for an internal campaign that the customer has been pre-approved for as flagged in their Party Profile record

#### Executive Summary
This service domain handles/structures the customer narrative during an interactive session. It consolidates and presents pertinent customer information and provides servicing guidelines with standard dialogue/scripting as appropriate. It can include the capability to provoke questions to capture key relationship and sales triggers. It also ensures the correct sequencing, dialogue content and actions are performed/initiated during the customer interaction. It may further leverage the session by passing on customer notifications, status updates and triggering sales/marketing efforts.

#### Key Features
- Consolidate customer reference and product usage details
- Structure the dialogue based on identified topic - process customer queries
- Access context specific guidance/help text
- Orchestrate product/service access
- Initiate additional customer authentication when needed
- Initiate sales and relationship development actions when appropriate

#### API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/SessionDialogue/12.0.0

#### Served By
- Customer Contact Session Procedure Analytics Object
- Session Dialogue SD Service Group
- Customer Contact Session Procedure Instantiation
- Customer Contact Session Procedure Reporting
- Session Dialogue SD Operations
- Customer Contact Session Procedure Invocation

#### Serves
- Customer Management
- Interaction Management

#### Triggered By
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

#### Triggers
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

#### List of Scenarios
1. EXT Handle Request for Overdraft Limit on Virtual Account
2. Handle Request for Windfall Investment
3. EXT Handle Request to Add Account to Sweep Agreement
4. Set Up New Card for Card Application
5. Handle Request for Balance Transfer
6. Initiate Payment Order
7. Update status of the consent to authorized and get authentication code
8. EXT Handle Request to Move Overdraft Limit between Virtual Accounts
9. Handle Request for Card Activation
10. Customer Relationship Case Initiation
11. Process Authentication Request by Issuer
12. EXT Handle Request for High Volume Account Opening
13. Handle Request for Withdrawal from Consumer Loan
14. Handle Request for Copy of Active Version of Mandate at Debtor Bank
15. Retrieve a list of connected ASPSB banks
16. Execute Customer Onboarding API version
17. Handle Request for Notional Pooling Agreement
18. Handle Customer Request for User Access Token Using Bank Authorization Grant and its Client Secret within Active Contact
19. Create Customer Reports
20. Handle Request to Use Direct Debits as Payment Instrument
21. Handle Request for Loan that Requires Syndication
22. Handle Instruction to Terminate B2B Direct Debits Service at Creditor Bank
23. Handle Request to Cancel Credit Transfer Standing Order on Corporate Current Account
24. Handle Request for Direct Debit Payments
25. Handle Request for Refund of Incoming Direct Debit at Debtor Bank
26. Handle Request for Account Statement
27. Handle Request to Add Account to Sweep Agreement
28. EXT Handle Merchandising Loan Application
29. Handle Request to Close Savings Account
30. Handle Request for Outgoing Credit Transfer
31. EXT Handle Request to Open Retail Current Account
32. Execute Interactive Retention Campaign
33. Authorise Card Use by Acquirer
