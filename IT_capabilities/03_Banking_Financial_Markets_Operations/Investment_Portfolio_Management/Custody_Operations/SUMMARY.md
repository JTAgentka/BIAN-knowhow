# Custody Operations - Summary

## Overview
Custody Operations capability manages collection accounts for investment portfolios, including cash transaction processing, account valuation, and accrued interest calculations. The system provides real-time balance information and supports both Czech and Slovak operations through eBroker.

## REST APIs

### CollAccountTransaction - REST API
- **Description:** Reconciliation and initialization API for collection account cash transactions
- **Key Operations:**
  - POST /collAccountTransaction/query - Query and reconcile collection account transactions
  - Support for time-based filtering (businessChangeDateStart, businessChangeDateEnd)
  - Portfolio and owner-based filtering
  - Historical data initialization from 01.01.2015
- **Data Objects:** CollAccountTransaction
- **Impacted Systems:** eBroker (source), WSO2 API-M (gateway), KStreams (consumer), DKCZ, DKSK

### CollAccountValuationInstant - REST API
- **Description:** Reconciliation and initialization API for instant collection account valuations
- **Key Operations:**
  - POST /collAccountValuationInstant/query - Query and reconcile account valuations
  - Support for time-based filtering
  - Portfolio and owner-based filtering
  - Historical data initialization from 01.01.2015
- **Data Objects:** CollAccountValuationInstant
- **Impacted Systems:** eBroker (source), WSO2 API-M (gateway), KStreams (consumer), DKCZ, DKSK

### Collection Account Disponible Balance - CRUD API
- **Description:** Returns disponible (available) balance for collection accounts including buy power calculations
- **Key Operations:**
  - GET /disponibleBalance/{referenceSystem}/{portfolioId} - Get available balance and buy power
  - Integrates with AccountBalances and ClientRiskInfo APIs
  - Calculates presettled balances across all accounts
  - Provides buy power for all defined currencies
- **Data Objects:** Portfolio balances, Account balances, Buy power information
- **Impacted Systems:** eBroker (Trading API, MRM WebService), WSO2 API-M

### Collection Account Transfer - CRUD API
- **Description:** Transfer operations between collection accounts
- **Key Operations:** Not specified in documentation
- **Data Objects:** Collection account transfer details
- **Impacted Systems:** eBroker

## Event Stream Topics

### CollAccountTransaction - Event Stream
- **Purpose:** Publishes cash transaction events on collection accounts
- **Event Types:**
  - Continuous Topics: JTB-HQ_INVESTMENTS_COLL-ACCOUNT-TRANSACTION_SYNC_APP, JTB-CZ_INVESTMENTS_COLL-ACCOUNT-TRANSACTION_STREAM_GNR, JTB-SK_INVESTMENTS_COLL-ACCOUNT-TRANSACTION_STREAM_GNR
  - Init/Recon Topics: JTB-HQ_INVESTMENTS_COLL-ACCOUNT-TRANSACTION-INIT-AND-RECON_RSYNC_APP, JTB-CZ_INVESTMENTS_COLL-ACCOUNT-TRANSACTION_RCN_GNR, JTB-SK_INVESTMENTS_COLL-ACCOUNT-TRANSACTION_RCN_GNR
  - Control Topic: JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Data Objects:** CollAccountTransaction
- **Impacted Systems:**
  - Publisher: eBroker (via COLL_ACCOUNT_TRANSACTION_CONTINUOUS, COLL_ACCOUNT_TRANSACTION_INIT_AND_RECON tables)
  - Subscribers: KStreams, DKCZ, DKSK
- **Event Triggers:** Insert, change, delete of eBroker.A_Pohyb_Penez; update of eBroker.A_Text_Pohybu (nightly batch)
- **Volume:** Up to 70,000 events/day (eBroker trades: 1,200, TOPAS payments: 40,000, TA payments: 25,000)

### CollAccountValuationInstant - Event Stream
- **Purpose:** Publishes instant valuation events for collection accounts
- **Event Types:**
  - Continuous Topics: JTB-HQ_INVESTMENTS_COLL-ACCOUNT-VALUATION-INSTANT_SYNC_APP, JTB-CZ_INVESTMENTS_COLL-ACCOUNT-VALUATION-INSTANT_STREAM_GNR, JTB-SK_INVESTMENTS_COLL-ACCOUNT-VALUATION-INSTANT_STREAM_GNR
  - Init/Recon Topics: JTB-HQ_INVESTMENTS_COLL-ACCOUNT-VALUATION-INSTANT-INIT-AND-RECON_RSYNC_APP, JTB-CZ_INVESTMENTS_COLL-ACCOUNT-VALUATION-INSTANT_RCN_GNR, JTB-SK_INVESTMENTS_COLL-ACCOUNT-VALUATION-INSTANT_RCN_GNR
  - Control Topic: JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Data Objects:** CollAccountValuationInstant
- **Impacted Systems:**
  - Publisher: eBroker (via COLL_ACCOUNT_VALUATION_INSTANT_CONTINUOUS, COLL_ACCOUNT_VALUATION_INSTANT_INIT_AND_RECON tables)
  - Subscribers: KStreams, DKCZ, DKSK

### AccruedInterest - Event Stream
- **Purpose:** Publishes accrued interest (AUV) calculations for securities
- **Event Types:**
  - Continuous Topics: JTB-HQ_INSTRUMENT-PRICE-DAILY_SYNC_APP, JTB-HQ_INVESTMENTS_ACCRUED-INTEREST_STREAM_GNR
  - Init/Recon Topics: JTB-HQ_INSTRUMENT-PRICE-DAILY_RSYNC_APP, JTB-HQ_INVESTMENTS_ACCRUED-INTEREST_RCN_GNR
  - Control Topic: JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Data Objects:** AccruedInterest
- **Impacted Systems:**
  - Publisher: eBroker (via INSTRUMENT_PRICE_DAILY_CONTINUOUS, INSTRUMENT_PRICE_DAILY_INIT_AND_RECON tables)
  - Subscribers: KStreams, DKCZ, DKSK
- **Note:** Shares interface tables with InstrumentMarketPriceDaily and InstrumentValuePriceDaily

## Data Objects

### CollAccountTransaction
- **Description:** Cash transaction details on collection accounts
- **Key Attributes:**
  - X-Correlation-ID: Correlation identifier (mandatory for INIT and RECON)
  - businessChangeDate: Date and time of last entity change
  - status: Entity status (active|deleted)
  - ebrId: eBroker ID (used as event key)
  - Transaction details (amount, currency, type, dates)
  - Portfolio and account references
  - Payment information
- **Relationship:** 1 trade can have N transactions; 1 transaction belongs to exactly 1 trade
- **Interface Tables:** COLL_ACCOUNT_TRANSACTION_CONTINUOUS, COLL_ACCOUNT_TRANSACTION_INIT_AND_RECON

### CollAccountValuationInstant
- **Description:** Instant valuation snapshot of collection accounts
- **Key Attributes:**
  - X-Correlation-ID: Correlation identifier (mandatory for INIT and RECON)
  - businessChangeDate: Date and time of last entity change
  - status: Entity status (active|deleted)
  - ebrId: eBroker ID (used as event key)
  - Valuation details (balance, currency, timestamp)
  - Portfolio and account references
- **Interface Tables:** COLL_ACCOUNT_VALUATION_INSTANT_CONTINUOUS, COLL_ACCOUNT_VALUATION_INSTANT_INIT_AND_RECON

### AccruedInterest
- **Description:** Accrued interest calculations for debt securities
- **Key Attributes:**
  - X-Correlation-ID: Correlation identifier (mandatory for INIT and RECON)
  - businessChangeDate: Date and time of last entity change
  - status: Entity status (active|deleted)
  - instrumentIds.ccpId: CCP ID (used as event key)
  - Interest calculation details
  - Instrument references
- **Interface Tables:** INSTRUMENT_PRICE_DAILY_CONTINUOUS (shared), INSTRUMENT_PRICE_DAILY_INIT_AND_RECON (shared)

### DisponibleBalance (API Response)
- **Description:** Available balance and buy power information for portfolios
- **Key Attributes:**
  - eBrokerId, topasId: Portfolio identifiers
  - portfolioTotalPresettled: Total presettled balance in report currency
  - reportCurrency: Reference currency for calculations
  - portfolioBuyPowerTotal: Array of buy power per currency
  - accountBalances: Array of collection account balances with presettled and disponible amounts

## Integration Points

### Publishing Systems
- **eBroker**: Core custody and portfolio management system
  - Publishes collection account transactions, valuations, and accrued interest events
  - Manages interface tables for Kafka integration via JDBC connector
  - Provides REST APIs for reconciliation and initialization
  - Provides Trading API for account balances
  - Provides MRM WebService for buy power calculations
- **TOPAS**: Trading and Portfolio Administration System
  - Source of payment transactions (up to 16,000 payments/day)
- **TA**: Transfer Agent system
  - Source of payment transactions (up to 25,000 payments/day)

### Consuming Systems
- **KStreams**: Stream processing consuming all event types
- **DKCZ**: Czech data warehouse consuming all event streams
- **DKSK**: Slovak data warehouse consuming all event streams
- **Digital Channels**: Consumer of disponible balance API for customer-facing applications

### Integration Infrastructure
- **WSO2 API-M**: API Management platform exposing reconciliation and CRUD APIs
- **Kafka**: Event streaming with JDBC connector, 8 partitions, 3 replicas, 6-day retention

## Summary Statistics
- Total REST APIs: 4
- Total Event Streams: 15 topics (3 entities x 3 continuous + 3 init/recon + 1 control per country, 1 shared control)
- Total Data Objects: 4 primary entities (CollAccountTransaction, CollAccountValuationInstant, AccruedInterest, DisponibleBalance)
- Total Impacted Systems: 7 (eBroker, TOPAS, TA, WSO2 API-M, KStreams, DKCZ, DKSK)
- Supported Locations: CZ (Czech Republic), SK (Slovakia)
- Historical Data: From 01.01.2015 for initialization
- Peak Volume: 70,000 transactions/day
- Event Architecture: Interface table pattern with JDBC connector to Kafka
