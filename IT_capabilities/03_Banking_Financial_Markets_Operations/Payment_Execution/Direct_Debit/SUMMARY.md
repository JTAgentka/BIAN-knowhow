# Direct Debit - Summary

## Overview
The Direct Debit capability manages SEPA Direct Debit Mandates (DDM) for both Czech (CZ) and Slovak (SK) markets. This service domain handles the creation, modification, cancellation, validation, and status tracking of direct debit mandates through REST API interfaces integrated with the PTS (Payment Transaction System).

## REST APIs

### API-PTSSKDirectDebitMandate
- **Description:** REST API for managing SEPA Direct Debit Mandates for Slovak market
- **Key Operations:**
  - Create Direct Debit Mandate
  - Modify Direct Debit Mandate
  - Cancel Direct Debit Mandate
  - Validate DDM
  - Get DDM Status
- **Data Objects:** DirectDebitMandate, MandateStatus, CreditorInformation, DebtorInformation
- **Impacted Systems:** PTS, WSO2 API-M, Digital Channels (FE)
- **URLs:**
  - AKC: https://apitest.jtfg.com/PTSSKDirectDebitMandatesUAT/v1
  - INT: https://apitest.jtfg.com/PTSSKDirectDebitMandatesUAT/v1

### API-PTSCZPayments (Direct Debit Components)
- **Description:** Payment API for Czech market including direct debit payment processing
- **Key Operations:**
  - Validate Payment
  - Create Payment
  - Get Payment Status
  - Process Instant Payments with fallback to standard domestic payments
- **Data Objects:** Payment, PaymentTypeInformation, InstructionPriority, ServiceLevel
- **Impacted Systems:** PTS, WSO2 API-M, Digital Channels (FE), Czech National Bank (CNB) for instant payment availability

### API-PTSSKPayments
- **Description:** Payment API for Slovak market with SEPA, SWIFT, and internal payment support
- **Key Operations:**
  - Validate Payment (SEPA, SWIFT, Internal)
  - Create Payment
  - Get Payment Status
  - Exchange rate handling (standard and individual rates)
- **Data Objects:** Payment, PaymentTypeInformation, ExchangeRate, IndividualExchangeRate
- **Impacted Systems:** PTS, WSO2 API-M, Digital Channels (FE)

### API-directDebitMandatesReconciliation
- **Description:** Reconciliation API for synchronizing direct debit mandate data
- **Key Operations:** Reconciliation data retrieval for DDM synchronization
- **Data Objects:** ReconciliationData, MandateSnapshot
- **Impacted Systems:** PTS, Digital Channels (FE)

### API-paymentsReconciliation
- **Description:** Reconciliation API for payment data synchronization
- **Key Operations:** Reconciliation data retrieval for payment synchronization (CZ and SK versions)
- **Data Objects:** PaymentReconciliationData
- **Impacted Systems:** PTS, Digital Channels (FE)

## Event Stream Topics
Not specified in documentation - DDM Event Stream referenced but definition not included in analyzed files.

## Data Objects

### DirectDebitMandate
- **Description:** SEPA Direct Debit Mandate with creditor and debtor information
- **Key Attributes:** mandateId, creditorId, debtorAccountId, mandateStatus, signatureDate, validFrom, validTo, maximumAmount, frequency

### Payment
- **Description:** Payment instruction with type classification and processing information
- **Key Attributes:**
  - ptsId: Technical payment identifier
  - instructionPriority: INST (instant), NORM (standard), HIGH (priority)
  - serviceLevel: DMCT (domestic), DICT (domestic instant), ESCT (SEPA), EXCT (cross-border EEP), IBCT (internal), NXCT (cross-border non-EEP), XBCT (cross-border)
  - businessStatus: Business state of payment (replaces PSD2 status)
  - paymentTypeInformation: Detailed payment type data

### ExchangeRate
- **Description:** Exchange rate information for foreign currency payments
- **Key Attributes:**
  - rate: Exchange rate value
  - isIndividualRate: Boolean flag indicating individual exchange rate

### MandateStatus
- **Description:** Business status of direct debit mandate
- **Key Attributes:** statusCode, statusDescription, businessChangeDate (BCD)

## Integration Points

### Publishing Systems
- **PTS (Payment Transaction System):** Publishes payment and DDM events, processes payment instructions, manages mandate lifecycle
- **Czech National Bank (CNB):** Provides instant payment availability information for domestic Czech payments

### Consuming Systems
- **Digital Channels CZ:** Consumes payment and DDM APIs for Czech market
- **Digital Channels SK:** Consumes payment and DDM APIs for Slovak market
- **WSO2 API-M:** API Gateway managing API access, security, and routing

## Key Features

### Standardization Requirements
- **Error Handling:** Implementation of J&T standard error handling (version 1 for payments, version 2 for DDM)
- **Tracing:** traceparent header parameter according to W3C Trace Context standard
- **Duplicate Detection:** X-Correlation-ID for duplicate request handling (7-day retention minimum)
- **Versioning:** MAJOR.MINOR.PATCH format with changelog in OpenAPI definition
- **BCD Validation:** Business Change Date validation for optimistic locking on modifications

### Payment Priority Handling
- Automatic fallback from instant (INST) to standard (NORM) for domestic Czech payments when instant payment not available
- Priority remains undefined during processing, determined at completion
- Validation response indicates current instant payment capability (DICT) but may change before execution

### Security
- Separate CZ and SK API instances to prevent cross-market data access
- BID (Business ID) as path parameter for entity modifications
- Business state instead of internal/PSD2 states for transparency

## Summary Statistics
- Total REST APIs: 5
- Total Event Streams: 0 (referenced but not defined in available files)
- Total Data Objects: 4
- Total Impacted Systems: 5 (PTS, WSO2 API-M, Digital Channels CZ, Digital Channels SK, CNB)
