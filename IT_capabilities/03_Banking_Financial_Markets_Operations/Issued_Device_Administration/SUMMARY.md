# Issued Device Administration - Summary

## Overview
The Issued Device Administration capability manages payment cards and credit accounts through BISQ (Core Banking System) for both Czech and Slovak markets. This service domain publishes real-time events about card details, card state changes, transaction notifications, and credit account information to Digital Channels and other consuming systems.

## REST APIs

### CardDetail REST API
- **Description:** REST API for accessing card detail information
- **Key Operations:** Card detail retrieval and querying
- **Data Objects:** CardDetail with card attributes and status
- **Impacted Systems:** BISQ, Digital Channels CZ, Digital Channels SK

### CreditAccount REST API
- **Description:** REST API for credit account information
- **Key Operations:** Credit account retrieval and status checking
- **Data Objects:** CreditAccount
- **Impacted Systems:** BISQ, Digital Channels CZ, Digital Channels SK

## Event Stream Topics

### CardDetail Event Topics (CZ/SK)
- **Purpose:** Real-time publication of card detail changes including creation and updates
- **Event Topics:**
  - CZ Continuous: JTB-CZ_CARDS_CARD_DETAIL_EVENT_GNR
  - CZ Reconciliation: JTB-CZ_CARDS_CARD_DETAIL_RCN_GNR
  - SK Continuous: JTB-SK_CARDS_CARD_DETAIL_EVENT_GNR
  - SK Reconciliation: JTB-SK_CARDS_CARD_DETAIL_RCN_GNR
  - Control: JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Data Objects:** CardDetail entity
- **Impacted Systems:**
  - Publisher: BISQ
  - Subscribers: Digital Channels CZ, Digital Channels SK
- **Key:** cardId (BID)
- **Business State:** cardState
- **Filtering:** Excludes cards with dateClose older than 2015

### CardStateNotification Event Topics (CZ/SK)
- **Purpose:** Real-time notification of card state changes
- **Event Topics:** Similar pattern to CardDetail (CZ/SK continuous and reconciliation)
- **Data Objects:** CardStateNotification
- **Impacted Systems:** BISQ, Digital Channels CZ/SK
- **Use Case:** Notifies about card activation, blocking, unblocking, cancellation, expiration

### TransactionNotification Event Topics (CZ/SK)
- **Purpose:** Real-time notification of card transaction events
- **Event Topics:** Similar pattern to CardDetail (CZ/SK continuous and reconciliation)
- **Data Objects:** TransactionNotification
- **Impacted Systems:** BISQ, Digital Channels CZ/SK
- **Use Case:** Push notifications for card transactions, fraud alerts, authorization requests

### CreditAccount Event Topics (CZ/SK)
- **Purpose:** Real-time publication of credit account changes
- **Event Topics:**
  - CZ Continuous: JTB-CZ_CARDS_CREDIT_ACCOUNT_EVENT_GNR (assumed pattern)
  - CZ Reconciliation: JTB-CZ_CARDS_CREDIT_ACCOUNT_RCN_GNR (assumed pattern)
  - SK Continuous: JTB-SK_CARDS_CREDIT_ACCOUNT_EVENT_GNR (assumed pattern)
  - SK Reconciliation: JTB-SK_CARDS_CREDIT_ACCOUNT_RCN_GNR (assumed pattern)
  - Control: JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Data Objects:** CreditAccount entity
- **Impacted Systems:** BISQ, Digital Channels CZ/SK

## Data Objects

### CardDetail
- **Description:** Comprehensive card information including card type, holder, status, and limits
- **Key Attributes:**
  - cardId (BID - business identifier)
  - cardState (BUSINESS_STATE)
  - event_timestamp (BCD equivalent)
  - Card number (masked)
  - Card type and product
  - Cardholder information
  - Valid from/to dates
  - Daily/monthly limits
  - Status flags (active, blocked, expired)
  - Linked account information
- **Trigger:** Card creation or update in BISQ
- **Frequency:** Rarely (tens to low hundreds daily)

### CardStateNotification
- **Description:** Notification of card state transitions
- **Key Attributes:**
  - cardId
  - Previous state
  - New state
  - State change timestamp
  - Reason code
  - Channel that triggered change

### TransactionNotification
- **Description:** Real-time card transaction notification for push alerts
- **Key Attributes:**
  - Transaction ID
  - cardId
  - Amount and currency
  - Merchant details
  - Transaction type
  - Authorization status
  - Timestamp

### CreditAccount
- **Description:** Credit account associated with card products
- **Key Attributes:**
  - Credit account ID
  - Credit limit
  - Available credit
  - Outstanding balance
  - Payment due date
  - Interest rate
  - Linked cards

## Integration Points

### Publishing Systems
- **BISQ:** Core banking system publishing card and credit account events; manages card lifecycle and credit facilities

### Consuming Systems
- **Digital Channels CZ:** Consumes card and credit account information for Czech market
- **Digital Channels SK:** Consumes card and credit account information for Slovak market
- **Notification Service:** Consumes transaction notifications for push alerts
- **Fraud Detection:** Consumes transaction notifications for fraud monitoring

## Key Features

### Business Change Date (BCD)
- Uses event_timestamp as BCD equivalent
- Timestamp with second-level precision
- Generated at event insertion into event table
- Tracks card creation, update, and state changes

### Event Filtering
- All card states published to event stream
- Temporal filtering: Excludes cards with dateClose before 2015
- No state-based filtering (unlike transactions which filter state "A")

### Reconciliation
- Reconciliation API available
- Standard reconciliation pattern with X-Correlation-ID
- Separate topics for reconciliation and continuous events

### Event Volume
- CardDetail: Tens to low hundreds of events daily (rare occurrences)
- CardStateNotification: Variable based on customer activity
- TransactionNotification: High volume (every card transaction generates event)

## Technical Specifications

### Kafka Configuration
- 8 partitions (standard)
- 3 replicas
- 6-day retention period
- Key: cardId

### Schema
- JSON schemas stored in centralized repository
- event_timestamp for BCD tracking
- X-Correlation-ID for reconciliation flows

## Summary Statistics
- Total REST APIs: 2 (CardDetail API, CreditAccount API)
- Total Event Streams: 8 (CardDetail CZ/SK, CardStateNotification CZ/SK, TransactionNotification CZ/SK, CreditAccount CZ/SK - each with continuous and reconciliation topics)
- Total Data Objects: 4 (CardDetail, CardStateNotification, TransactionNotification, CreditAccount)
- Total Impacted Systems: 4+ (BISQ, Digital Channels CZ, Digital Channels SK, Notification Service, Fraud Detection)
