# Payment Orders - Summary

## Overview
The Payment Orders capability manages Standing Orders (recurring payments) and Direct Debit Mandates (DDM/SEPA Inkaso) for both Czech and Slovak markets. This service domain handles the full lifecycle of recurring payment instructions through REST APIs and Event Stream topics, enabling real-time synchronization between PTS (Payment Transaction System) and Digital Channels.

## REST APIs

### API-PTSCZStandingOrders
- **Description:** REST API for managing standing orders (trvalé příkazy) in the Czech market
- **Key Operations:**
  - Create Standing Order
  - Modify Standing Order (immediate changes only)
  - Cancel Standing Order
  - Get Standing Order Status
- **Data Objects:** StandingOrder with detailed payment attributes, scheduling, and execution rules
- **Impacted Systems:** PTS CZ, WSO2 API-M, Digital Channels CZ
- **Key Features:**
  - Immediate modifications only (no forward-dated changes)
  - Business state tracking instead of internal PTS states
  - Support for CZ, FIN, and SEPA payment types
  - Complex scheduling with intervals, execution rules, and exceptions

### API-PTSSKStandingOrders
- **Description:** REST API for managing standing orders in the Slovak market (similar to CZ version)
- **Key Operations:** Create, Modify, Cancel, Get Status
- **Data Objects:** StandingOrder (same data model as CZ)
- **Impacted Systems:** PTS SK, WSO2 API-M, Digital Channels SK

### API-PTSSKDirectDebitMandate
- **Description:** REST API for managing SEPA Direct Debit Mandates for Slovak market
- **Key Operations:**
  - Create DDM
  - Modify DDM
  - Cancel DDM
  - Validate DDM
  - Get DDM Status
- **Data Objects:** DirectDebitMandate with creditor/debtor information
- **Impacted Systems:** PTS SK, WSO2 API-M, Digital Channels SK
- **Key Features:**
  - Positive DDM only (not negative mandates)
  - Business Change Date (BCD) validation for optimistic locking
  - X-Correlation-ID for duplicate detection (7-day retention)

### API-standingOrdersReconciliation
- **Description:** Reconciliation API for standing order data synchronization
- **Key Operations:** Bulk retrieval of standing orders for reconciliation purposes
- **Data Objects:** StandingOrder collection with businessChangeDate
- **Impacted Systems:** PTS CZ, PTS SK, Digital Channels CZ, Digital Channels SK

### API-directDebitMandatesReconciliation
- **Description:** Reconciliation API for DDM data synchronization
- **Key Operations:** Bulk retrieval of DDM for reconciliation purposes
- **Data Objects:** DDM collection
- **Impacted Systems:** PTS SK, Digital Channels SK

## Event Stream Topics

### StandingOrder Event Topics (CZ)
- **Purpose:** Real-time publication of standing order lifecycle events for Czech market
- **Event Types:**
  - Continuous: JTB-CZ_PAYMENTS_STANDING-ORDER_EVENT_GNR
  - Reconciliation/Init: JTB-CZ_PAYMENTS_STANDING-ORDER_RCN_GNR
  - Control: JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Data Objects:** StandingOrder entity with full payment details
- **Impacted Systems:**
  - Publisher: PTS CZ
  - Subscriber: Digital Channels CZ
- **Technical Notes:**
  - Current workaround: PTS writes to *_APP topics without Schema Registry
  - Consumers read from *_GNR topics (standard)
  - 8 partitions, 3 replicas, 6-day retention
  - Key: ptsId (unique business identifier)

### StandingOrder Event Topics (SK)
- **Purpose:** Real-time publication of standing order lifecycle events for Slovak market
- **Event Types:**
  - Continuous: JTB-SK_PAYMENTS_STANDING-ORDER_EVENT_GNR
  - Reconciliation/Init: JTB-SK_PAYMENTS_STANDING-ORDER_RCN_GNR
  - Control: JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Data Objects:** StandingOrder entity (same model as CZ)
- **Impacted Systems:**
  - Publisher: PTS SK
  - Subscriber: Digital Channels SK

### DDM Event Topics (SK)
- **Purpose:** Real-time publication of Direct Debit Mandate lifecycle events for Slovak market
- **Event Types:**
  - Continuous: JTB-SK_PAYMENTS_DDM_EVENT_GNR
  - Reconciliation/Init: JTB-SK_PAYMENTS_DDM_RCN_GNR
  - Control: JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Data Objects:** DDM entity with mandate details
- **Impacted Systems:**
  - Publisher: PTS SK
  - Subscriber: Digital Channels SK
- **Technical Notes:**
  - Same technical specifications as Standing Order topics
  - Key: ptsId (part of unique business identifier)
  - Events not published for "noStatus" business state

## Data Objects

### StandingOrder
- **Description:** Comprehensive recurring payment instruction with scheduling and execution rules
- **Key Attributes:**
  - **Identification:** ptsId (BID), instructionIdentification, operationId, alias
  - **Type:** type (CZ/FIN/SEPA), isInternal
  - **Scheduling:** requestedExecutionDate, lastExecutionDate, nextDueDate, interval (DAILY/WEEKLY/MONTHLY/BI_MONTHLY/QUARTERLY/ONCE_PER_FOUR_MONTHS/HALFYEARLY/YEARLY)
  - **Amount:** instructedAmount {value, currency}
  - **Execution Rules:** mode (UNTIL_DATE/UNTIL_CANCELLATION), modeDue (DUE_DAY/DUE_OR_BEFORE_DAY/DUE_OR_NEXT_DAY/LAST_DAY_OF_INTERVAL), intervalDue
  - **Exceptions:** stoppages (skip months), break (breakFrom, breakTo)
  - **Status:** businessState, businessChangeDate (BCD), isAuthorized, executionCount, lastPaymentDate
  - **Parties:** debtor {account, bank, name, postalAddress, note}, creditor {account, bank, name, postalAddress, note}
  - **Ultimate Parties:** ultimateDebtor, ultimateCreditor (with identification details)
  - **Payment Details:** endToEndIdentification, chargeBearer, purpose {code, proprietary}
  - **CZ Specific:** symbols {variableSymbol, constantSymbol, specificSymbol}

### DirectDebitMandate (DDM)
- **Description:** SEPA Direct Debit Mandate authorization for recurring debit transactions
- **Key Attributes:**
  - **Identification:** ptsId, mandateId, mandateReference
  - **Status:** businessState, businessChangeDate
  - **Parties:** creditor {creditorId, name, account}, debtor {debtorId, name, account}
  - **Mandate Details:** signatureDate, validFrom, validTo, maximumAmount, frequency, mandateType
  - **SEPA Specific:** sequenceType, amendmentIndicator

### BusinessChangeDate (BCD)
- **Description:** Business timestamp tracking entity state changes
- **Purpose:** Used for optimistic locking, event publication triggering, and reconciliation
- **Format:** date-time (ISO 8601)
- **Behavior:** Updates on any business state change regardless of channel (API, internal system, batch)

## Integration Points

### Publishing Systems
- **PTS CZ:** Publishes CZ standing order events and data; provides REST APIs for CZ standing orders
- **PTS SK:** Publishes SK standing order and DDM events and data; provides REST APIs for SK standing orders and DDM

### Consuming Systems
- **Digital Channels CZ:** Consumes standing order APIs and event streams for Czech market
- **Digital Channels SK:** Consumes standing order and DDM APIs and event streams for Slovak market
- **WSO2 API-M:** API Gateway providing security, routing, and monitoring

## Key Features

### Event-Driven Architecture
- Business state changes trigger event publication to continuous topic
- Events contain X-Correlation-ID for reconciliation/initialization flows
- No events published for "noStatus" business state
- Automatic initialization required when entity moves from "noStatus" to active state

### Business State Management
- Business states mapped from internal PTS states
- Referenced in StandingOrderState and DDM state code lists (external reference)
- Business state attribute naming clearly distinguishes from internal states
- businessChangeDate automatically updated on state transitions

### Reconciliation & Initialization
- Separate reconciliation topics for bulk data synchronization
- X-Correlation-ID tracking for request-response pairing
- Reconciliation API for on-demand data retrieval
- Support for both API-driven and predefined initialization scenarios

### Standardization Requirements
- **Error Handling:** J&T standard (version 1 for CZ/SK payments, version 2 for DDM)
- **Tracing:** traceparent header (W3C Trace Context standard)
- **Duplicate Detection:** X-Correlation-ID for create/update/delete operations
- **API Versioning:** MAJOR.MINOR.PATCH format with changelog in OpenAPI
- **Security:** Separate CZ/SK API instances to prevent cross-market access

### Standing Order Execution Rules
- **Intervals:** Daily, weekly, monthly, bi-monthly, quarterly, once per four months, half-yearly, yearly
- **Execution Modes:**
  - Until specific date
  - Until cancellation
- **Execution Rules:**
  - Execute on due day
  - Execute on or before due day
  - Execute on or next available day
  - Last day of interval
- **Exceptions:**
  - Skip specific months (stoppages)
  - Break periods (temporary suspension)
- **Counters:** Tracks number of executions and last payment date

### Payment Type Support
- **CZ:** Czech domestic payments with variable/constant/specific symbols
- **FIN:** Foreign (international) payments
- **SEPA:** SEPA payments within Eurozone
- **Internal:** Internal bank transfers between J&T accounts

## Technical Specifications

### Kafka Topics Configuration
- **Partitions:** 8 (standard), 1 (for code lists)
- **Replicas:** 3
- **Retention Period:** 6 days
- **Key Strategy:** ptsId as Kafka key for consistent partitioning

### Schema Registry
- JSON schemas stored in centralized schema repository
- Same schema for CZ and SK instances
- Version-controlled schema evolution

### Workaround Note
Currently PTS writes to *_APP topics without Schema Registry integration due to connection issues. This is a temporary workaround. Consumers still read from standard *_GNR topics which are expected to be the final implementation.

## Summary Statistics
- Total REST APIs: 5 (2 Standing Order CZ/SK, 1 DDM SK, 2 Reconciliation)
- Total Event Streams: 6 (2 CZ Standing Order, 2 SK Standing Order, 2 SK DDM - each has continuous and reconciliation topics)
- Total Data Objects: 3 (StandingOrder, DDM, BusinessChangeDate)
- Total Impacted Systems: 6 (PTS CZ, PTS SK, WSO2 API-M, Digital Channels CZ, Digital Channels SK, Kafka/Schema Registry)
