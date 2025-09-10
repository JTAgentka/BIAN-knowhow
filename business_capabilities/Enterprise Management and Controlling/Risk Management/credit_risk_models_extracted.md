# Credit Risk Models (Capability)

## Role Definition
This service domain handles the development, maintenance and continual assessment and refinement of the collection of credit models that are deployed across the bank. This includes individual credit assessments and more complex analyses for merchants and companies/corporations. The models are used to derive credit scoring and support more involved credit analysis/insight development

## Folder Name
Risk Management

## Core Business Object
Credit Risk Model Specification

## Example of Use
A credit model is used to analyze product activity in order to refine then banks credit assessment of a customer

## Executive Summary
This service domain handles the design and maintenance of a portfolio of credit models that are used in all aspects of customer credit assessments

## Key Features
- Determine desired type/coverage for credit analysis
- Source, define and develop credit models
- Publish, process feedback and refine/tune models
- Individual credit assessments
- Complex analyses for merchants and companies/corporations
- Credit scoring derivation
- Credit analysis/insight development support

## API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/CreditRiskModels/12.0.0

## Served By
- Credit Risk Model Specification_ Analytics Object
- Credit Risk Model
- Credit Risk Model Specification_Invocation
- Credit Risk Model Specification_Reporting
- Credit Risk Models_SD_Operations
- Credit Risk Model Specification_Instantiation
- Credit Risk Models_SD_Service Group

## Serves
- Risk Management

## Triggered By
- Corporate Loan
- Credit Management
- Underwriting
- Asset Securitization

## Triggers
- Credit model specification processes
- Credit risk assessments
- Model testing and validation
- Production deployment of models

## List of Scenarios
- Select Buyers for Securitize Assets
- Perform Underwriting for Bank Guarantee
- Process Selection of Loans for Securitization
- Review Borrower Financial Statements
- Handle Request for Credit Facility
- Perform Underwriting for Corporate Loan
- Perform Underwriting for Syndicated Loan
- Perform Underwriting Light for Buy Now Pay Later
- Perform Underwriting for Mortgage Loan
- Perform Underwriting for Uncollateralised Consumer Loan
- Perform Underwriting for Renewal of Uncollateralised Consumer Loan
- Perform Underwriting for Merchandising Loan

## Properties
- **Service Domain**: ServiceDomain
- **Service Role**: Develop and maintain models for counterparty, issuer, and portfolio risk for all contracts, instruments and (sub-)portfolios respectively.
- **BIAN Life Cycle**: Registered
- **Stereotypes**: ServiceDomain
- **Aggregated By**: Models, Wave 5, Models And Analytics

### Individual Analytics
- creditRiskModelSpecificationAccumulators
- creditRiskModelSpecificationActivityAnalysis
- creditRiskModelSpecificationPerformanceAnalysis
- creditRiskModelSpecificationTrends&Events

### Portfolio Analytics
- creditRiskModelSpecificationPortfolioActivityAnalysis
- creditRiskModelSpecificationPortfolioMake-UpAnalysis
- creditRiskModelSpecificationPortfolioPerformanceAnalysis