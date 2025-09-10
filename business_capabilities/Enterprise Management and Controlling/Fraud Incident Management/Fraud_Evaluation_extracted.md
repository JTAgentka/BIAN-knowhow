# Fraud Evaluation (Capability)

## Basic Information
- **Capability Name**: Fraud Evaluation
- **Folder Name**: Fraud Incident Management
- **Core Business Object**: Fraud Evaluation

## Role Definition
This service domain handles the structured execution of fraud detection tests/routines that are used to identify possible fraud by detecting out of pattern behaviors. The tests may run in-line with production or may access transaction logs as appropriate. Detected anomalies are passed for further analysis and resolution.

## Example of Use
Card transactions are subjected to an array of fraud pattern test to detect 'out of pattern' behavior - anomalies are highlighted for analysis

## Executive Summary
The service domain executes fraud behavioral pattern tests to detect possible fraudulent transactions/activity

## Key Features
- Transaction data consolidation
- Fraud detection test execution
- Fraud analysis/diagnosis and reporting

## API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/FraudEvaluation/12.0.0

## Relationships

### Served By
- Issued Device Administration
- Card Clearing
- Card Authorization
- Underwriting
- Card Terminal Operation

### Serves
- Fraud Incident Management
- Risk Event Management

### Triggered By
- Payment Order
- Card Clearing
- Current Account
- Fraud Evaluation
- Credit Management
- Card Authorization
- Underwriting
- Transaction Authorization

### Triggers
- Fraud Evaluation
- Fraud Model

## List of Scenarios
- Process Card Clearing by Issuer (views/view_55194.html)
- Authorise Card Use by Acquirer (views/view_55588.html)
- Process Card Clearing by Acquirer (views/view_55404.html)
- Handle Request for Credit Facility (views/view_55481.html)
- Handle Incoming Request for Payment at Debtor Bank (views/view_55467.html)
- Authorise Card Use by Issuer (views/view_55275.html)
- Perform Underwriting for Corporate Loan (views/view_55254.html)
- Handle Request for Payment at Creditor Bank for External Account (views/view_55356.html)
- Perform Underwriting for Syndicated Loan (views/view_55248.html)
- Perform Underwriting Light for Buy Now Pay Later (views/view_55191.html)
- Perform Underwriting for Mortgage Loan (views/view_55392.html)
- Perform Underwriting for Uncollateralised Consumer Loan (views/view_55410.html)
- Perform Underwriting for Renewal of Uncollateralised Consumer Loan (views/view_54892.html)
- Perform Underwriting for Merchandising Loan (views/view_54854.html)
- Handle Request for Outgoing Credit Transfer Related to Request to Pay at Debtor Bank (views/view_54799.html)