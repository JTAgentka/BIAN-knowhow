# Letter of Credit (Capability)

## Role Definition
Orchestrate the pricing and issuance of Letters of Credit to bank customers guaranteeing their ability to pay sellers for goods that are to be delivered at some future date. Letters of Credit are mostly used to facilitate international trade. They can be single transaction or revolving and can also be transferable and so traded (this Service Domain only covers the issuance and processing of the LoC)

## Example of Use
A bank issues an LC to a corporate customer to enable them to make a large purchase from an overseas supplier

## Executive Summary
This Service Domain handles the pricing and issuance of letters of credit to its corporate customers in support of their international trading requirements

## Key Features
- Price and issue letters of credit for bank customers
- Evaluate seller claims and make payments against the letter of credit
- Evaluate buyer delivery completion prior to releasing funds
- Recover buyer collateral against redeemed letters of credit where applicable

## Properties

### Service Domain
Letter of Credit

### API BIAN Portal
Letter of Credit API (https://app.swaggerhub.com/apis/BIAN-3/LetterofCredit/12.0.0)

### Individual Analytics
- letterOfCreditTransactionAccumulators
- letterOfCreditTransactionActivityAnalysis
- letterOfCreditTransactionPerformanceAnalysis
- letterOfCreditTransactionTrends&Events

### Portfolio Analytics
- letterOfCreditTransactionPortfolioActivityAnalysis
- letterOfCreditTransactionPortfolioMakeUpAnalysis
- letterOfCreditTransactionPortfolioPerformanceAnalysis

### Scenarios
- Receive Shipping Documents from Exporter Bank (views/view_54877.html)
- Process Letter of Credit Settlement Instructions from Importer (views/view_55582.html)
- Update Letter of Credit for Extension of Validity (views/view_55579.html)
- Handle Request to Extend Validity of Letter of Credit (views/view_55634.html)
- Handle Request to Issue Letter of Credit (views/view_55618.html)
- Initiate Letter of Credit (views/view_54819.html)

### Service Role
Orchestrate the pricing and issuance of Letters of Credit (typically associated with trade finance activity)

### BIAN Life Cycle
- Registration Status: Registered

### Stereotypes
- ServiceDomain

## Appears on
- BIAN Service Landscape V12.0 Value Chain (views/view_51705.html)
- BIAN Service Landscape V12.0 Matrix View (views/view_51891.html)
- Letter of Credit SD Overview (views/view_51900.html)

## Relations

### Aggregated by
- Wave 6 (object_25.html?object=153745)
- Trade Banking (object_25.html?object=172016)

### Gets input from
- Session Dialogue (object_23.html?object=48273)

### Is equal to
- Letter of Credit (object_37.html?object=38419)

### Is part of
- Trade Banking (object_25.html?object=130655)

### Sends output to
- Correspondence (object_20.html?object=32927)
- Financial Accounting (object_20.html?object=42346)
- Document Directory (object_22.html?object=44708)

### Serves
- Trade Finance Management (object_6.html?object=130830)

### Triggered by
- Letter of Credit (object_21.html?object=38418)

### Triggers
- Party Lifecycle Management (object_20.html?object=29780)
- Document Services (object_21.html?object=30399)
- Correspondent Bank Operations (object_21.html?object=32729)
- Correspondence (object_20.html?object=32927)
- Product Directory (object_21.html?object=34953)
- Payment Order (object_21.html?object=35550)
- Market Data Switch Operation (object_21.html?object=35659)
- Sales Product Agreement (object_21.html?object=37916)
- Letter of Credit (object_21.html?object=38418)
- Credit Facility (object_22.html?object=40622)
- Customer Product and Service Directory (object_22.html?object=41591)
- Financial Accounting (object_20.html?object=42346)
- Underwriting (object_22.html?object=44666)
- Document Directory (object_22.html?object=44708)
- Virtual Account (object_22.html?object=45513)

---
*Source: https_bian.org_servicelandscape-12-0-0_object_21.html_object_38418.pdf*