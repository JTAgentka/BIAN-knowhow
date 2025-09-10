# Counterparty Administration (Capability)

## Role Definition
Maintain and provide access to the counterparty reference details to support trading/payment activity. This includes SWIFT addresses, standard settlement instructions that are published. The data is typically acquired using a market feed for the default values, but the facility can support the maintenance of specific details and instructions that apply to the counterparty relationship overriding the public default

## Folder Name
Partner Management

## Core Business Object
Counterparty Administrative Plan

## Example of Use
Back office clearing and settlement references the counterparty details to assemble a funds transfer as part of an equity trade using the counterparty details to generate the associated SWIFT based payment exchange

## Executive Summary
This Service Domain maintains key counterparty reference information used in the clearing and settlement of wholesale trading

## Key Features
- Consolidate counterparty market feed data
- Qualify data and maintain counterparty directory content
- Provide access to counterparty reference records

## API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/CounterpartyAdministration/12.0.0

## Served By
- Counterparty Administrative Plan Analytics Object
- Counterparty
- Counterparty Administration_SD_Operations
- Counterparty Directory Entry_Instantiation
- Counterparty Directory Entry_Invocation
- Counterparty Directory Entry_Reporting
- Counterparty Administration_SD_Service Group

## Serves
- Partner Management

## Triggered By
(None specified)

## Triggers
(None specified)

## List of Scenarios
(None specified)

## Analytics

### Individual Analytics
- counterpartyAdministrativePlanAccumulators
- counterpartyAdministrativePlanActivityAnalysis
- counterpartyAdministrativePlanPerformanceAnalysis
- counterpartyAdministrativePlanTrends&Events

### Portfolio Analytics
- counterpartyAdministrativePlanPortfolioActivityAnalysis
- counterpartyAdministrativePlanPortfolioMake-UpAnalysis
- counterpartyAdministrativePlanPortfolioPerformanceAnalysis

## Relations
- **Aggregated By**: Wave 6, Clearing And Settlement
- **Is Part Of**: Market Data
- **Gets Input From**: Payment Execution
- **Sends Output To**: Payment Execution

## BIAN Properties
- **BIAN Life Cycle**: Registered
- **Stereotype**: ServiceDomain