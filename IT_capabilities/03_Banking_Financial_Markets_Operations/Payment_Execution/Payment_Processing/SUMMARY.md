# Payment Processing - Summary

## Overview
The Payment Processing capability manages the execution and lifecycle of payment transactions for both Czech and Slovak markets through PTS (Payment Transaction System) and BISQ (Core Banking System for SEPA transactions). This service domain handles real-time payment processing, state management, and event publication for various payment types including domestic, SEPA, cross-border, internal, and instant payments.

## REST APIs

### API-PTSCZPayments
- **Description:** REST API for Czech market payment processing
- **Key Operations:**
  - Validate Payment
  - Create Payment (with automatic instant payment fallback)
  - Get Payment Status
  - Process payment instructions
- **Data Objects:** Payment with comprehensive party, amount, and execution details
- **Impacted Systems:** PTS CZ, WSO2 API-M, Digital Channels CZ, Czech National Bank (CNB)
- **Key Features:**
  - Automatic fallback from instant to standard domestic payments
  - Priority handling (INST/NORM/HIGH)
  - Business state tracking
  - Support for payment types: DMCT, DICT, ESCT, EXCT, IBCT, NXCT, XBCT

### API-PTSSKPayments
- **Description:** REST API for Slovak market payment processing
- **Key Operations:**
  - Validate Payment (SEPA, SWIFT, Internal)
  - Create Payment
  - Get Payment Status
  - Exchange rate handling
- **Data Objects:** Payment with exchange rate attributes
- **Impacted Systems:** PTS SK, WSO2 API-M, Digital Channels SK

### API-paymentsReconciliation (CZ/SK)
- **Description:** Reconciliation APIs for payment data synchronization
- **Key Operations:** Bulk payment retrieval for reconciliation purposes
- **Data Objects:** Payment collection with businessChangeDate
- **Impacted Systems:** PTS CZ, PTS SK, Digital Channels CZ, Digital Channels SK

## Event Stream Topics

### Payment Event Topics (CZ)
- **Purpose:** Real-time publication of payment lifecycle events for Czech market
- **Event Types:**
  - Continuous: JTB-CZ_PAYMENTS_PAYMENT_EVENT_GNR
  - Reconciliation/Init: JTB-CZ_PAYMENTS_PAYMENT_RCN_GNR
  - Control: JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Data Objects:** Payment entity with full transaction details
- **Impacted Systems:**
  - Publisher: PTS CZ
  - Subscriber: Digital Channels CZ
- **Technical Notes:**
  - Workaround: PTS writes to *_APP topics without Schema Registry
  - Consumers read from *_GNR topics
  - 8 partitions, 3 replicas, 6-day retention
  - Key: ptsId

### Payment Event Topics (SK)
- **Purpose:** Real-time publication of payment lifecycle events for Slovak market
- **Event Types:**
  - Continuous: JTB-SK_PAYMENTS_PAYMENT_EVENT_GNR
  - Reconciliation/Init: JTB-SK_PAYMENTS_PAYMENT_RCN_GNR
  - Control: JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Data Objects:** Payment entity (same model as CZ with additional exchange rate data)
- **Impacted Systems:**
  - Publisher: PTS SK
  - Subscriber: Digital Channels SK

### SEPA Transaction Event Topics (CZ/SK)
- **Purpose:** Publication of SEPA transaction events from BISQ core banking system
- **Event Types:**
  - CZ Continuous: JTB-CZ_POSITION-KEEPING_SEPA-TRANSACTION_EVENT_GNR
  - CZ Reconciliation: JTB-CZ_POSITION-KEEPING_SEPA-TRANSACTION_RCN_GNR
  - SK Continuous: JTB-SK_POSITION-KEEPING_SEPA-TRANSACTION_EVENT_GNR
  - SK Reconciliation: JTB-SK_POSITION-KEEPING_SEPA-TRANSACTION_RCN_GNR
  - Control: JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Data Objects:** SEPA Transaction
- **Impacted Systems:**
  - Publisher: BISQ
  - Subscribers: Digital Channels CZ, Digital Channels SK
- **Key Features:**
  - Filters transactions in state "B" (accounted) and "S" (storno)
  - Excludes state "A" (waiting for processing - reservation only)
  - EVENT_TIMESTAMP used as business change date equivalent

## Data Objects

### Payment
- **Description:** Comprehensive payment transaction with lifecycle states and processing information
- **Key Attributes:**
  - **Identification:** ptsId (BID), instructionIdentification, endToEndIdentification, operationId
  - **Type & Priority:** type (DMCT/DICT/ESCT/EXCT/IBCT/NXCT/XBCT), instructionPriority (INST/NORM/HIGH)
  - **Status:** businessState (mapped from PaymentStatus code list), businessChangeDate
  - **Amount:** instructedAmount {value, currency}
  - **Parties:** debtor {account, bank, name, postalAddress}, creditor {account, bank, name, postalAddress}
  - **Ultimate Parties:** ultimateDebtor, ultimateCreditor (with identification details)
  - **Payment Details:** chargeBearer, purpose, remittanceInformation
  - **Exchange Rate (SK):** rate {value, isIndividualRate}
  - **CZ Specific:** symbols {variableSymbol, constantSymbol, specificSymbol}
  - **Execution:** requestedExecutionDate, actualExecutionDate

### SEPA Transaction
- **Description:** SEPA transaction from BISQ core banking system
- **Key Attributes:**
  - **Identification:** BOOK_ID (BID)
  - **Status:** accountState (BUSINESS_STATE), EVENT_TIMESTAMP (BCD equivalent)
  - **Transaction Details:** Amount, currency, transaction date
  - **States:** B (Accounted), S (Storno), A (Reserved - not published)

### Payment State Diagrams
- **Description:** Business states mapped from internal PTS states per PaymentStatus code list
- **State Types:**
  - Outgoing payments (standard and instant)
  - Incoming payments (standard and instant)
  - Internal instant payments
- **Key States:** Referenced in external PaymentStatus code list with mapping to internal PTS states

## Integration Points

### Publishing Systems
- **PTS CZ:** Publishes CZ payment events; provides REST APIs for CZ payments
- **PTS SK:** Publishes SK payment events; provides REST APIs for SK payments
- **BISQ:** Publishes SEPA transaction events from core banking
- **Czech National Bank (CNB):** Provides instant payment availability information

### Consuming Systems
- **Digital Channels CZ:** Consumes payment APIs and event streams for Czech market
- **Digital Channels SK:** Consumes payment APIs and event streams for Slovak market
- **WSO2 API-M:** API Gateway for security, routing, and monitoring

## Key Features

### Instant Payment Processing
- Automatic fallback from instant (INST) to standard (NORM) for domestic Czech payments
- Real-time state updates for internal, incoming, and outgoing instant payments
- Integration with CNB for instant payment availability checks
- ePortal notification mechanism (to be replaced by event streams for Digital Channels)

### Payment Type Support
- **DMCT:** Domestic standard Czech payment
- **DICT:** Domestic instant Czech payment
- **ESCT:** SEPA payment within Eurozone
- **EXCT:** Cross-border payment within EEP
- **IBCT:** Internal bank transfer between J&T accounts
- **NXCT:** Cross-border payment outside EEP
- **XBCT:** Cross-border payment (general)

### Business State Management
- Business states defined in PaymentStatus code list
- Mapped from internal PTS states
- businessChangeDate triggers event publication
- No events for "noStatus" state
- Initialization required when moving from "noStatus"

### Daily Processing Volumes
Payment events per day (approximate):
- **CZ Incoming:** 3,200 payments/day
- **CZ Outgoing:** 1,510 payments/day
- **SK Incoming:** 590 payments/day
- **SK Outgoing:** 530 payments/day
- Multiple events per payment based on state transitions

### SEPA Transaction Volumes (BISQ)
Account creation/changes (rare occurrences):
- **CZ Total Accounts:** 164,257 (39,617 new in 2021)
- **SK Total Accounts:** 1,229,524 (221,302 new in 2021)

### Standardization Requirements
- **Error Handling:** J&T standard (version 1)
- **Tracing:** traceparent header (W3C Trace Context)
- **Duplicate Detection:** X-Correlation-ID for create/update/delete
- **API Versioning:** MAJOR.MINOR.PATCH with changelog
- **Security:** Separate CZ/SK API instances

## Summary Statistics
- Total REST APIs: 3 (PTSCZPayments, PTSSKPayments, paymentsReconciliation CZ/SK versions)
- Total Event Streams: 6 (2 CZ Payment, 2 SK Payment, 2 CZ/SK SEPA Transaction - each has continuous and reconciliation topics)
- Total Data Objects: 2 (Payment, SEPA Transaction)
- Total Impacted Systems: 7 (PTS CZ, PTS SK, BISQ, WSO2 API-M, Digital Channels CZ, Digital Channels SK, CNB)
