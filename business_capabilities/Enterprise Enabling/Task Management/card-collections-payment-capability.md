# Card Collections Payment

## Description

Business service for managing payment transactions made against card collections accounts, including acceptance, verification, and processing. This service handles payments specifically related to delinquent card accounts and collections procedures.

## Service Domain Information

- **Name**: Card Collections
- **Type**: Business Service
- **Related Services**: 
  - Card Collections Procedure_Invocation
  - Delinquent Account Procedure_Invocation

## Control Records

### Primary Control Record
- **CardCollectionsPaymentRecord**: Main record for managing card collections payment transactions

## Behavioral Patterns

- **Payment Transaction Processing**: Systematic handling of payment transactions for collections accounts
- **Collections Account Management**: Comprehensive management of delinquent card account data
- **Payment Verification and Validation**: Quality assurance for payment transactions

## Service Operations

### ExchangePaymentWorksteps
- **User Description**: accept, verify, etc. a payment transaction made against the account
- **Technical Name**: ExchangePaymentWorksteps
- **Identification**: accept, verify, etc. a payment transaction made against the account

## Asset Types

- **Card Collections Payment Records**: Core payment transaction data for collections accounts
- **Account Transaction Logs**: Historical transaction data and audit trails
- **Payment Verification Results**: Outcomes of payment validation processes
- **Collections Status Updates**: Current status information for collections accounts

## Functional Requirements

- **Real-time payment transaction processing for collections accounts**: Immediate processing of payments against delinquent accounts
- **Payment verification against account balances**: Validation of payment amounts and account standing
- **Integration with collections procedures**: Seamless connection to collections workflow systems
- **Delinquent account payment handling**: Specialized processing for overdue account payments

## Source Information

**Source File**: https_bian.org_servicelandscape-12-0-0_object_22.html_object_47264.mhtml

---

*This documentation was generated from the JSON capability file and represents the Card Collections Payment business service structure and operations.*