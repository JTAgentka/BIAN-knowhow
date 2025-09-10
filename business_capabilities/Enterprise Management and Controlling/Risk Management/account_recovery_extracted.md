# Account Recovery

## Capability Overview
**Folder Name:** Risk Management  
**Core Business Object:** Account Recovery Procedure  
**API BIAN Portal Link:** https://app.swaggerhub.com/apis/BIAN-3/AccountRecovery/12.0.0

## Role Definition
Handles the recovery of distressed accounts that have exceeded standard late/payment handling but have not yet been fully written off and passed to collections. The restructuring can involve partial write downs and leveraging any tax or other program of assistance that can be applied. The situation is managed until the account is recovered or a decision made to pass the account over to collections

## Example of Use
A non-performing customer account is handed over for recovery after the normal relationship management efforts have failed. Additional authority is provided to renegotiate/structure the account to enable the customer to attempt recovery. This restructuring can result in write downs that need to be booked appropriately

## Executive Summary
This service domain handles the restructuring of a distressed account (loan) after standard recovery procedures have been exhausted

## Key Features
- Account status assessment
- Account recovery planning
- Customer agreement/negotiation
- Account terms amendment/restructuring

## Service Relationships

### Served By
- Customer Management

### Serves
- Financial Account Management
- Risk Management
- Risk Event Management

### Triggered By
- Credit Card issues
- Customer Case escalations
- Failed standard recovery procedures

### Triggers
- Corporate Current Account actions
- Account restructuring processes
- Collection procedures

## List of Scenarios
1. accountRecoveryProcedureAccumulators
2. accountRecoveryProcedureActivityAnalysis
3. accountRecoveryProcedurePerformanceAnalysis
4. accountRecoveryProcedureTrends&Events
5. accountRecoveryProcedurePortfolioActivityAnalysis
6. accountRecoveryProcedurePortfolioMake-UpAnalysis
7. accountRecoveryProcedurePortfolioPerformanceAnalysis
8. Process Request for Amount Block
9. Process Periodic Review of Collection Actions

## Analytics Categories

### Individual Analytics
- accountRecoveryProcedureAccumulators
- accountRecoveryProcedureActivityAnalysis
- accountRecoveryProcedurePerformanceAnalysis
- accountRecoveryProcedureTrends&Events

### Portfolio Analytics
- accountRecoveryProcedurePortfolioActivityAnalysis
- accountRecoveryProcedurePortfolioMake-UpAnalysis
- accountRecoveryProcedurePortfolioPerformanceAnalysis

## Recovery Process Flow
1. **Account Assessment** - Evaluate the distressed account status
2. **Recovery Planning** - Develop restructuring strategy
3. **Customer Negotiation** - Engage with customer for agreement
4. **Terms Amendment** - Modify account terms and conditions
5. **Implementation** - Execute the recovery plan
6. **Monitoring** - Track progress until resolution or escalation to collections