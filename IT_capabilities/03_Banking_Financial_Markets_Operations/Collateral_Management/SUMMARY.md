# Collateral Management - Summary

## Overview
The Collateral Management capability focuses on managing reservations (RES Reservation) within the BISQ system. This includes tracking account reservations for various purposes such as payments, guarantees, client requests, court orders, and other administrative or banking needs. The system publishes reservation events for both Czech (CZ) and Slovak (SK) operations to downstream systems.

## REST APIs
### Transactions REST API
- **Description:** Provides reconciliation API for retrieving reservation transactions
- **Key Operations:** Query transactions by accountId, transactionType, date range (from, to)
- **Data Objects:** RES Reservation
- **Impacted Systems:** BISQ (source), DKCZ, DKSK (consumers)

## Event Stream Topics
### RES Reservation - Event Stream
- **Purpose:** Publishes reservation events for position keeping and balance management
- **Event Types:**
  - Continuous/Ongoing events (EVENT)
  - Initialization/Reconciliation events (RCN)
  - Control events (CONTROL_STREAM)
- **Data Objects:** RES Reservation
- **Impacted Systems:**
  - **Publisher:** BISQ
  - **Subscribers:** DKCZ (Czech operations), DKSK (Slovak operations)

#### Topic Details:
| Topic Name | Type | Source | Target |
|------------|------|--------|--------|
| JTB-CZ_POSITION-KEEPING_RES-RESERVATION_EVENT_GNR | Continuous | BISQ | DKCZ |
| JTB-CZ_POSITION-KEEPING_RES-RESERVATION_RCN_GNR | Initialization/Reconciliation | BISQ | DKCZ |
| JTB-SK_POSITION-KEEPING_RES-RESERVATION_EVENT_GNR | Continuous | BISQ | DKSK |
| JTB-SK_POSITION-KEEPING_RES-RESERVATION_RCN_GNR | Initialization/Reconciliation | BISQ | DKSK |
| JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR | Control | - | DKCZ/DKSK |

## Data Objects

### RES Reservation
A reservation entity that tracks blocked amounts on accounts for various purposes.

**Key Attributes:**
- **RES_ID** (string, max 20 chars): BISQ reservation internal ID - Business Identifier and KEY
- **EVENT_TIMESTAMP** (date-time): Date and time of inserting into event table in BISQ (used as BCD - Business Change Date)
- **ACT_ID** (string, max 20 chars): BISQ activity internal ID
- **STATE** (enum): Reservation state
  - A: Authorised
  - O: Opened
  - B: Booked
  - C: Closed
  - S: Storno (cancellation)
  - X: Deleted
- **CODE** (enum): Reservation code indicating purpose:
  - Q01: Non-fiat reservation
  - Q02: Documentary credit reservation
  - Q03: Bank guarantee reservation
  - Q04: Commission reservation
  - R01: Payment block
  - R02: Security block
  - R03: Client request block
  - R04: Financial authority request block
  - R05: Court order block
  - R06: Other administrative authority block
  - R07: Inheritance proceedings block
  - R08: Pre-registration block
  - R09: Bank block
  - R10: Foreign payment execution block
  - R11: Legal force notification block
  - V01: Account termination
- **ACT_TYPE** (string, max 8 chars): Activity type (e.g., CRD98A00, CUA01080, CUA41100, GLM06700, PTS93200, PTS94500, PTS97100, PTS97200, PTS98100, PTS98200)
- **PC_ID** (string, max 20 chars): BISQ product contract internal ID
- **PR_NUMBER** (string, 2-35 chars): Product number
- **ACC_AMOUNT** (number): Reservation amount
- **ACC_CURRENCY** (string, 3 chars): Account currency
- **RES_BEGIN** (date): Reservation begin date
- **RES_END** (date, optional): Reservation end date
- **RES_AMOUNT** (number): Activity amount
- **RES_CURRENCY** (string, 3 chars): Activity currency
- **XRATE** (array, optional): Exchange rate information
  - CURRENCY (string, 3 chars): Exchange rate currency
  - EXCHANGE_RATE (number): Exchange rate value
  - QUOTATION_UNIT (number, optional): Quotation unit
- **XRATE_DEVIATION** (number, optional): Exchange rate deviation against the ECB
- **COMMENT** (string, optional): Comment about reservation
- **PRODUCT_KIND** (enum): Product kind (CUA|CCR|LOA|RDA|NWB|CRD)
- **X-Correlation-ID** (string, optional): Correlation identifier

**Event Filtering:**
- Only events in states B (Booked) and S (Storno) are published as they affect account balances
- State A (Authorised) creates reservation but does not trigger events

## Integration Points

### Publishing Systems
- **BISQ**: Core banking system that publishes reservation events for both Czech and Slovak operations. Publishes continuous events, reconciliation events, and maintains reservation master data.

### Consuming Systems
- **DKCZ**: Czech data warehouse consuming reservation events from Czech operations
- **DKSK**: Slovak data warehouse consuming reservation events from Slovak operations

## Technical Details
- **Kafka Configuration:**
  - Partitions: 8
  - Replicas: 3
  - Replication period: 6 days
  - For reference data: 1 partition
- **Event Volume:** Hundreds of events daily
- **Historical Data (2021):**
  - CZ Total: 6,225,508 | New: 1,176,379 | Closed: 1,175,405
  - SK Total: 1,866,028 | New: 248,789 | Closed: 248,670

## Summary Statistics
- **Total REST APIs:** 1 (Transactions REST API for reconciliation)
- **Total Event Streams:** 1 main stream (RES Reservation) with 5 topics
- **Total Data Objects:** 1 (RES Reservation with 24 attributes)
- **Total Impacted Systems:** 3 (BISQ as publisher, DKCZ and DKSK as consumers)
