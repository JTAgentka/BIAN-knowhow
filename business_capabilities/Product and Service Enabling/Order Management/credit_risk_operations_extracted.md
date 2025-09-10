# Credit Risk Operations - BIAN Capability

## Overview
**Capability Name:** Credit Risk Operations  
**Folder:** Order Management  
**Core Business Object:** TradingCreditPositionMeasurement

## Role Definition
This Service Domain monitors the counterparty credit limits (CCL) used to govern trading activity to manage credit exposure. Note there may be regulatory requirements that determine allowed CCLs.

## Example of Use
A trading desk checks a proposed trade against trading counterparty credit limits

## Executive Summary
This Service Domain monitors counterparty credit limits in the trading unit

## Key Features
- Establish counterparty trading credit limits
- Monitor limits and raise alerts against limit breaches

## API Details
**BIAN Portal Link:** [https://app.swaggerhub.com/apis/BIAN-3/CreditRiskOperations/12.0.0](https://app.swaggerhub.com/apis/BIAN-3/CreditRiskOperations/12.0.0)

## Service Relationships

### Served By
- Wave 6
- Market Operations

### Serves
- Order Management

### Triggered By
- Wholesale Trading

### Triggers
- Trading Credit Position Measurement_ Analytics Object
- Trading Credit Position
- Trading Credit Position Measurement_Instantiation
- Credit Risk Operations_SD_Operations
- Trading Credit Position Measurement_Reporting
- Trading Credit Position Measurement_Invocation
- Credit Risk Operations_SD_Service Group
- Trading Counterparty Credit Limit Indicator
- Monitor

## Scenarios
| Scenario Name | Link |
|---------------|------|
| Credit Risk Operations SD Overview | views/view_51117.html |
| BIAN Service Landscape V12.0 Value Chain | views/view_51705.html |
| BIAN Service Landscape V12.0 Matrix View | views/view_51891.html |