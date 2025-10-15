# Deposits - Summary

## Overview
The Deposits capability manages term deposit products including both regular term deposits and VVL (vkladový vkladní list - deposit certificates) within the BISQ core banking system. It publishes deposit lifecycle events for Czech and Slovak operations through event streams and provides reconciliation via REST API. Deposits can be created through ePortal requests or directly in BISQ.

## REST APIs

### Deposits Reconciliation API
- **Description:** Provides reconciliation and initialization capabilities for deposit product data
- **Key Operations:**
  - Query deposit information for reconciliation
- **Data Objects:** Term Deposit (including VVL)
- **Parameters:** Based on REST API standard (businessChangeDateStart, businessChangeDateEnd)
- **Reconciliation Logic:**
  - Returns only current states of deposits
  - Excludes deposits in state "A" (Authorized)
- **Initialization:** Sends all deposits from BISQ history in current state
- **Impacted Systems:**
  - Source: BISQ
  - Consumers: DKCZ, DKSK

## Event Stream Topics

### Deposits Event Stream
- **Purpose:** Publishes deposit product lifecycle events (creation, update, maturity, closure)
- **Event Types:**
  - Continuous/Ongoing events (EVENT)
  - Initialization/Reconciliation events (RCN)
  - Control events (CONTROL_STREAM)
- **Data Objects:** Deposits (Term deposits and VVL)
- **Impacted Systems:**
  - **Publisher:** BISQ
  - **Subscribers:** DKCZ, DKSK

#### Topic Details:
| Topic Name | Type | Source | Target |
|------------|------|--------|--------|
| JTB-CZ_DEPOSITS_DEPOSIT_EVENT_GNR | Continuous | BISQ | DKCZ |
| JTB-CZ_DEPOSITS_DEPOSIT_RCN_GNR | Init/Recon | BISQ | DKCZ |
| JTB-SK_DEPOSITS_DEPOSIT_EVENT_GNR | Continuous | BISQ | DKSK |
| JTB-SK_DEPOSITS_DEPOSIT_RCN_GNR | Init/Recon | BISQ | DKSK |
| JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR | Control | - | DKCZ, DKSK |

## Data Objects

### Deposits (Term Deposit & VVL)
Represents term deposit products and deposit certificates.

**Key Attributes:**
- **depositId** (string): BISQ deposit internal ID - Business Identifier and KEY
- **EVENT_TIMESTAMP** (date-time): Timestamp of insertion into BISQ event table (BCD)
- **status** (enum): Deposit status (BUSINESS_STATE)
  - A: Authorized (NOT sent in events)
  - OO: Open
  - OB: Open-blocked (most commonly used)
  - OC: Blocked for credit (rarely used)
  - OD: Blocked for debit
  - C: Closed
- Principal amount, interest rate, maturity date, currency, and other deposit-specific attributes

**Event Filtering:**
- Only deposits in states O* (Open variants) and C (Closed) are published
- State "A" (Authorized) deposits are NOT published

**Source:** BISQ
**Trigger:**
- **Term Deposits:** Created via ePortal requests (data pump) or directly in BISQ desktop application; requires approval
- **VVL:** Created via ePortal or BISQ; typically no approval needed (exceptions: insufficient funds)
**Frequency:** Hundreds of events daily

## Integration Points

### Publishing Systems
- **BISQ**: Core banking system publishing deposit product events. Deposits created via:
  - ePortal requests (processed via data pump, requires approval)
  - Direct BISQ desktop application entry
  - Automatic processes at end of day (closure system, DWH, reporting, accounting)

### Consuming Systems
- **DKCZ**: Czech data warehouse for Czech deposit analytics
- **DKSK**: Slovak data warehouse for Slovak deposit analytics

## Technical Details

### Kafka Configuration
- **Partitions:** 8 for data topics, 1 for codebook
- **Replicas:** 3
- **Retention period:** 6 days

### Event Volume
- **Daily events:** Hundreds of deposit events
- **Total volume (February 2022):**
  - **CZ Term Deposits:** ~63,000
  - **CZ VVL:** 26,372 active, 41,392 closed (9,910 new in 2021, 8,073 closed in 2021)
  - **CZ VVL Terminations:** 1,052 active, 88,392 closed (31,736 in 2021)
  - **CZ VVL Statistics:** Max 185 terminations per 1 VVL, Average 1.3, 935 VVL with >10 terminations
  - **SK VVL:** 3,209 active, 15,366 closed (1,048 new in 2021, 2,750 closed in 2021)
  - **SK VVL Terminations:** 388 active, 22,582 closed (3,065 in 2021)
  - **SK VVL Statistics:** Max 148 terminations per 1 VVL, Average 1.24, 147 VVL with >10 terminations
  - **SK Term Deposits:** ~35,000

## Summary Statistics
- **Total REST APIs:** 1 (Deposits Reconciliation API)
- **Total Event Streams:** 1 main stream (Deposits) with 5 topics
- **Total Data Objects:** 1 (Deposits - covering both Term Deposits and VVL)
- **Total Impacted Systems:** 3 (BISQ as publisher, DKCZ and DKSK as consumers)
