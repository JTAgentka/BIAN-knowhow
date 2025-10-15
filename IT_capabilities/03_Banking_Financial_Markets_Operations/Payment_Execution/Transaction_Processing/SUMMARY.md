# Transaction Processing - Summary

## Overview
The Transaction Processing capability manages various types of account transactions from BISQ (Core Banking System) including card transactions, terminal transactions, loan/credit transactions, fees, and general transactions. This service domain publishes real-time transaction events to Digital Channels for both Czech and Slovak markets through Kafka event streams.

## REST APIs

### Transactions Reconciliation API
- **Description:** REST API for reconciling transaction data by account
- **Key Operations:**
  - GET /transactions/ - Retrieve transactions for specific account
- **Parameters:**
  - accountId (required query parameter)
  - from/to dates (optional, max 90-day range)
  - X-Correlation-ID (required header)
- **Data Objects:** Various transaction types (CRD, TLM, GEN, FCP, LCP, CTI, CRD-RES)
- **Impacted Systems:** BISQ, Digital Channels CZ, Digital Channels SK
- **Initialization:** Separate initialization per transaction type; includes all historical transactions (even state "A")

## Event Stream Topics

### CRD Transaction (Card Transactions)
- **Purpose:** Real-time publication of payment card deposit and withdrawal transactions
- **Event Topics:**
  - CZ Continuous: JTB-CZ_POSITION-KEEPING_CRD-TRANSACTION_EVENT_GNR
  - CZ Reconciliation: JTB-CZ_POSITION-KEEPING_CRD-TRANSACTION_RCN_GNR
  - SK Continuous: JTB-SK_POSITION-KEEPING_CRD-TRANSACTION_EVENT_GNR
  - SK Reconciliation: JTB-SK_POSITION-KEEPING_CRD-TRANSACTION_RCN_GNR
  - Control: JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Trigger:** Card deposit or withdrawal via external SOAP interface with card provider
- **Volume:** Hundreds of events daily (CZ: 1.6M total, 232K new in 2021 | SK: 1.2M total, 161K new in 2021)

### TLM Transaction (Terminal Transactions)
- **Purpose:** Terminal-based transaction events
- **Event Topics:** Similar pattern to CRD (CZ/SK continuous and reconciliation topics)
- **Impacted Systems:** BISQ, Digital Channels CZ/SK

### GEN Transaction (General Transactions)
- **Purpose:** General banking transaction events
- **Event Topics:** Similar pattern to CRD (CZ/SK continuous and reconciliation topics)
- **Impacted Systems:** BISQ, Digital Channels CZ/SK

### FCP Transaction (Fees/Charges Processing)
- **Purpose:** Fee and charge transaction events
- **Event Topics:** Similar pattern to CRD (CZ/SK continuous and reconciliation topics)
- **Impacted Systems:** BISQ, Digital Channels CZ/SK

### LCP Transaction (Loan/Credit Processing)
- **Purpose:** Loan and credit transaction events
- **Event Topics:** Similar pattern to CRD (CZ/SK continuous and reconciliation topics)
- **Impacted Systems:** BISQ, Digital Channels CZ/SK

### CTI Transaction (Cross-Transaction Items)
- **Purpose:** Cross-transaction and internal transfer events
- **Event Topics:** Similar pattern to CRD (CZ/SK continuous and reconciliation topics)
- **Impacted Systems:** BISQ, Digital Channels CZ/SK

### CRD-RES Reservation
- **Purpose:** Card transaction reservations (not yet posted)
- **Event Topics:** Similar pattern to CRD (CZ/SK continuous and reconciliation topics)
- **Impacted Systems:** BISQ, Digital Channels CZ/SK

## Data Objects

### Transaction (Generic Structure)
- **Description:** Base transaction entity with common attributes across all transaction types
- **Key Attributes:**
  - **BID:** BOOK_ID (business identifier)
  - **BUSINESS_STATE:** STATE attribute (A=Pending/Reservation, B=Accounted, S=Storno)
  - **BCD:** EVENT_TIMESTAMP (business change date equivalent - timestamp of event insertion)
  - **Amount:** Transaction amount and currency
  - **Dates:** Transaction date, value date, accounting date
  - **Parties:** Debtor and creditor information
  - **Description:** Transaction description and purpose

### CRD Transaction
- **Description:** Card-based transaction (deposit or withdrawal)
- **Specific Attributes:** Card number, merchant details, authorization code, transaction location
- **States:**
  - A: Waiting for processing (creates reservation only - NOT published to events)
  - B: Accounted (changes account balance - published to events)
  - S: Storno (reversal - published to events)

### Transaction Volume (CZ Total 2015-2022)
- 2015: 2,092,289 transactions
- 2016: 2,263,409 transactions
- 2017: 2,854,233 transactions
- 2018: 3,221,959 transactions
- 2019: 3,462,153 transactions
- 2020: 3,693,567 transactions
- 2021: 4,269,307 transactions
- 2022: 4,414,138 transactions

## Integration Points

### Publishing Systems
- **BISQ:** Core banking system publishing all transaction types for CZ and SK markets through external SOAP interfaces and internal processing

### Consuming Systems
- **Digital Channels CZ:** Consumes all transaction event streams and reconciliation APIs for Czech market
- **Digital Channels SK:** Consumes all transaction event streams and reconciliation APIs for Slovak market

## Key Features

### Event Filtering
- Only transactions in states "B" (Accounted) and "S" (Storno) are published to event streams
- State "A" (Pending/Reservation) transactions are excluded from events as they only create reservations and do not affect account balance
- Exception: CRD-RES topic specifically handles reservation events

### Business Change Date (BCD)
- Uses EVENT_TIMESTAMP as BCD equivalent
- Timestamp has second-level precision
- Generated at event insertion into event table
- Previous limitation: BISQ date fields only had DATE precision, PC_ID had second precision only at creation

### Reconciliation Requirements
- Maximum 90-day date range per reconciliation request (validated by BISQ)
- Account-based reconciliation (accountId required)
- Separate reconciliation possible per transaction type
- Initialization includes all historical transactions including state "A"

### Technical Configuration
- 8 partitions (standard), 1 partition (for code lists)
- 3 replicas
- 6-day retention period
- Key: BOOK_ID

## Summary Statistics
- Total REST APIs: 1 (Transactions Reconciliation API supporting all transaction types)
- Total Event Streams: 14 (7 transaction types x 2 CZ/SK markets, each with continuous and reconciliation topics)
- Total Data Objects: 7+ (CRD, TLM, GEN, FCP, LCP, CTI, CRD-RES Transactions)
- Total Impacted Systems: 3 (BISQ, Digital Channels CZ, Digital Channels SK)
