# Customer Credit Rating (Capability)

## Role Definition
This service domain handles the derivation and maintenance of each customer's credit rating for both consumer and corporate customers. The internal rating can integrate externally provided credit details from credit scoring agencies with internal transactional data and relationship assessments. The credit rating will be maintained based on internal rules, but it is possible that a service will be offered to support an unscheduled recalculation of the credit score

## Folder Name
Customer Management

## Core Business Object
**Individual Analytics:**
- customerCreditRatingMeasurementAccumulators
- customerCreditRatingMeasurementActivityAnalysis
- customerCreditRatingMeasurementPerformanceAnalysis
- customerCreditRatingMeasurementTrends&Events

**Portfolio Analytics:**
- customerCreditRatingMeasurementPortfolioActivityAnalysis
- customerCreditRatingMeasurementPortfolioMake-UpAnalysis
- customerCreditRatingMeasurementPortfolioPerformanceAnalysis

## Example of Use
A customer calls the contact center wishing to know what mortgage offers they are eligible for. The customer servicing representative (CSR) uses the customer's internal credit assessment as one input to reference the Product Directory to retrieve the details of available products and terms

## Executive Summary
This service domain maintains and administers the bank's credit assessment for customers based on consolidated internal data and optionally by referencing external credit agency reports

## Key Features
- Access external rating agencies for customer credit reports
- Consolidate bank product use that impacts the rating
- Derive and maintain the bank's customer credit assessment

## API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/CustomerCreditRating/12.0.0

## Served By
- Customer Credit Rating Measurement Analytics Object
- Customer Credit Rating State Reporting
- Customer Credit Rating SD Operations
- Customer Credit Rating State Invocation
- Customer Credit Rating State Instantiation
- Customer Credit Rating SD Service Group
- Customer Credit Rating State

## Serves
- Customer Management

## Triggered By
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

## Triggers
- Information Provider Operation

## List of Scenarios
1. Set Up New Card for Card Application
2. Handle Request for Balance Transfer
3. Perform Regulatory KYC Analysis
4. Verify Corporate Customer
5. Perform Underwriting for Bank Guarantee
6. Handle Request for Loan that Requires Syndication
7. Process Card Account Delinquency Review
8. EXT Handle Merchandising Loan Application
9. EXT Handle Request to Open Retail Current Account
10. Handle Request for Corporate Loan
11. Verify Private Banking Customer
12. Review Borrower Financial Statements
13. Perform Underwriting for Corporate Loan
14. Perform Underwriting for Syndicated Loan
15. Perform Underwriting Light for Buy Now Pay Later
16. Handle Request for Product Selection
17. Perform Underwriting for Mortgage Loan
18. Perform Underwriting for Uncollateralised Consumer Loan
19. EXT Handle Request for Renewal of Uncollateralised Consumer Loan
20. Handle Request for Issuance of Commercial Paper
21. Perform Underwriting for Renewal of Uncollateralised Consumer Loan
22. Perform Underwriting for Merchandising Loan
23. Process Automatic Card Renewal
24. Verify Retail Customer
25. Handle Mortgage Loan Application
26. Handle Request for Modification of Corporate Loan
27. Handle Request to Replace Card