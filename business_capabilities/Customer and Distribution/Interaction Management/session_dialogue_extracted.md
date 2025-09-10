# Session Dialogue (Capability)

## Role Definition
The customer contact dialogue handling capability can provide highly structured orchestration to streamline a customer interaction by consolidating and presenting customer related data in context. It can also use the session to gather additional customer intelligence. In a more advance implementation the customer interaction capabilities can be integrated into an automated self/service context in addition to the more conventional assisted service model. The structured customer dialogue can include tasks to check for other business activities that can be built into the exchange for example, delivering pending communications, sales/marketing attempts, capturing intelligence/triggers, updating relationship status/details, product fulfillment (such as synchronizing customer-side data). The facility can be designed to support multi-channel/multi-device deployments

## Example of Use
A customer dials into the contact center with a current account balance request. The customer identity is checked by the servicing representative (using a Party Profile Service Domain call). After the customer initial query has been addressed the dialogue is structured to attempt a sales pitch for an internal campaign that the customer has been pre-approved for as flagged in their Party Profile record

## Executive Summary
This service domain handles/structures the customer narrative during an interactive session. It consolidates and presents pertinent customer information and provides servicing guidelines with standard dialogue/scripting as appropriate. It can include the capability to provoke questions to capture key relationship and sales triggers. It also ensures the correct sequencing, dialogue content and actions are performed/initiated during the customer interaction. It may further leverage the session by passing on customer notifications, status updates and triggering sales/marketing efforts.

## Key Features
- Consolidate customer reference and product usage details
- Structure the dialogue based on identified topic - process customer queries
- Access context specific guidance/help text
- Orchestrate product/service access
- Initiate additional customer authentication when needed
- Initiate sales and relationship development actions when appropriate

## Properties
- **Folder Name**: Interaction Management
- **Core Business Object**: Customer Contact Session Procedure
- **API BIAN Portal**: https://app.swaggerhub.com/apis/BIAN-3/SessionDialogue/12.0.0

## Relationships
### Serves
- Customer Management
- Interaction Management

### Triggered By
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

### Triggers
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

## List of Scenarios
The Session Dialogue capability supports a comprehensive list of over 180 banking scenarios including account management, payments, lending, customer onboarding, and various banking services. Some key scenarios include:
- Handle Request for Account Statement
- Execute Customer Onboarding API version
- Handle Request for Corporate Loan
- Process Internal Customer Upgrade
- Handle Request for Investment Plan
- Execute Interactive Retention Campaign
- Handle Request for Product Support
- Process Contact setup and start TPP Servicing Dialogue
- Handle Request for Credit Facility
- Handle Customer Request for Payment Order during Active Mobile Access Session
- Handle Mortgage Loan Application
- Handle Request for Bank Guarantee
- Handle Request for Power of Attorney
- And many more banking transaction and service scenarios