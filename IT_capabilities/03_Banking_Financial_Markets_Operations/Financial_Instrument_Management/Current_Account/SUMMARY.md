# Current Account - Summary

## Overview
The Current Account capability manages current account master data in the BISQ core banking system. It publishes account creation, update, and closure events for both Czech and Slovak operations. The system maintains account information including account identification, ownership, balances, and account state changes through event streams and provides reconciliation capabilities via REST API.

## REST APIs

### Account Reconciliation API
- **Description:** Provides reconciliation and initialization capabilities for current account data
- **Key Operations:**
  - GET /account/ - Retrieve current account information
- **Data Objects:** Account
- **Parameters:**
  - Header (required): X-Correlation-ID
  - Query (optional): accountId, partyId, accountProductId
- **Reconciliation Logic:**
  - Returns only current states of accounts
  - Excludes accounts in state "A" (Authorized - internal state before opening)
  - Includes all historical accounts available in BISQ
- **Initialization:** Sends all accounts from BISQ history in current state (excluding state "A")
- **Impacted Systems:**
  - Source: BISQ
  - Consumers: DKCZ, DKSK (via Kafka topics)

## Event Stream Topics

### Account Event Stream
- **Purpose:** Publishes account lifecycle events (creation, update, closure) for current accounts
- **Event Types:**
  - Continuous/Ongoing events (EVENT)
  - Initialization/Reconciliation events (RCN)
  - Control events (CONTROL_STREAM)
- **Data Objects:** Account
- **Impacted Systems:**
  - **Publisher:** BISQ
  - **Subscribers:** DKCZ (Czech data warehouse), DKSK (Slovak data warehouse)

#### Topic Details:
| Topic Name | Type | Source | Target |
|------------|------|--------|--------|
| JTB-CZ_CURRENT-ACCOUNTS_ACCOUNT_EVENT_GNR | Continuous | BISQ | DKCZ |
| JTB-CZ_CURRENT-ACCOUNTS_ACCOUNT_RCN_GNR | Init/Recon | BISQ | DKCZ |
| JTB-SK_CURRENT-ACCOUNTS_ACCOUNT_EVENT_GNR | Continuous | BISQ | DKSK |
| JTB-SK_CURRENT-ACCOUNTS_ACCOUNT_RCN_GNR | Init/Recon | BISQ | DKSK |
| JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR | Control | - | DKCZ/DKSK |

## Data Objects

### Account
Master data entity representing a current account in the banking system.

**Key Attributes:**
- **accountId** (string): BISQ account internal ID - Business Identifier and KEY
- **event_timestamp** (date-time): Timestamp of insertion into BISQ event table (BCD - Business Change Date)
- **accountState** (enum): Account status (BUSINESS_STATE)
  - A: Authorized (internal state before opening - NOT sent in events)
  - OO: Open
  - OB: Open-blocked (most commonly used)
  - OC: Blocked for credit (rarely used)
  - OD: Blocked for debit
  - C: Closed
- **accountProductId** (string): Product account identifier
- **partyId** (string): Party/customer identifier
- **productKind** (enum): Type of product (CUA, CCR, LOA)
- Account details including currency, balance information, dates, etc.

**Event Filtering:**
- Only accounts in states O* (Open variants) and C (Closed) are published
- State "A" (Authorized) accounts are NOT published as events

**Source:** BISQ (Core Banking System)
**Trigger:** Account creation, update, or closure in BISQ; Also via REST API calls from ePortal or onboarding processes
**Frequency:** Rare - tens to maximum low hundreds of events daily

## Integration Points

### Publishing Systems
- **BISQ**: Core banking system that publishes account master data events for both Czech and Slovak operations. Accounts can be created via:
  - Direct BISQ operations
  - REST API calls from ePortal
  - Onboarding processes

### Consuming Systems
- **DKCZ**: Czech data warehouse consuming account events from Czech operations
- **DKSK**: Slovak data warehouse consuming account events from Slovak operations

## Technical Details

### Kafka Configuration
- **Partitions:** 8 for data topics, 1 for codebook topics
- **Replicas:** 3
- **Retention period:** 6 days

### Event Volume
- **Daily events:** Tens to low hundreds of account events
- **Total volume (May 2022):**
  - CZ: 72,189 active accounts, 11,470 closed accounts (14,165 new in 2021, 1,841 closed in 2021)
  - SK: 32,273 active accounts, 15,629 closed accounts (1,999 new in 2021, 1,070 closed in 2021)
- **Total accounts:** ~91,000 accounts (May 2022), ~78,000 open accounts

### Business Change Date (BCD)
- Uses newly created attribute "event_timestamp"
- Represents timestamp of insertion into BISQ event table
- Provides required precision to seconds level

## Summary Statistics
- **Total REST APIs:** 1 (Account Reconciliation API)
- **Total Event Streams:** 1 main stream (Account) with 5 topics
- **Total Data Objects:** 1 (Account with state management)
- **Total Impacted Systems:** 3 (BISQ as publisher, DKCZ and DKSK as consumers)
