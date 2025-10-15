# Brokerage Trading - Summary

## Overview
The Brokerage Trading capability handles the execution of investment trading orders through the eBroker system. It provides comprehensive trading functionality including order placement, instrument transactions, and portfolio management for brokerage operations. The system integrates with multiple backend systems (TOPAS, TA) and supports both Czech (CZ) and Slovak (SK) operations.

## REST APIs

### InstrumentTransaction - REST API
- **Description:** Reconciliation and initialization API for instrument transaction data
- **Key Operations:**
  - POST /instrumentTransaction/query - Query and reconcile instrument transactions
  - Initialization API for bulk data synchronization
  - Support for time-based filtering (businessChangeDateStart, businessChangeDateEnd)
  - Portfolio and order-based filtering
- **Data Objects:** InstrumentTransaction
- **Impacted Systems:** eBroker (source), WSO2 API-M (integration layer), KStreams (consumer), DKCZ, DKSK (data warehouses)

### Trading - CRUD Operations
- **Description:** Universal API for submitting investment orders to eBroker with optional cash transfer reservation from current account to collection account
- **Key Operations:**
  - POST /order - Submit trading orders with portfolio and instrument specifications
  - Support for various order types and trading scenarios
  - Integration with cash transfer reservation mechanism
- **Data Objects:** Order, Portfolio, Instrument, Account
- **Impacted Systems:** eBroker (core system), Digital Channels (FE consumer), WSO2 API-M (API gateway)

## Event Stream Topics

### InstrumentTransaction - Event Stream
- **Purpose:** Publishes data about realized trades on portfolios
- **Event Types:**
  - Continuous Topic: JTB-HQ_INVESTMENTS_INSTRUMENT-TRANSACTION_SYNC_APP
  - Initialization/Reconciliation Topic: JTB-HQ_INVESTMENTS_INSTRUMENT-TRANSACTION-INIT-AND-RECON_RSYNC_APP
  - CZ Stream Topics: JTB-CZ_INVESTMENTS_INSTRUMENT-TRANSACTION_STREAM_GNR, JTB-CZ_INVESTMENTS_INSTRUMENT-TRANSACTION_RCN_GNR
  - SK Stream Topics: JTB-SK_INVESTMENTS_INSTRUMENT-TRANSACTION_STREAM_GNR, JTB-SK_INVESTMENTS_INSTRUMENT-TRANSACTION_RCN_GNR
  - Control Topic: JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Data Objects:** InstrumentTransaction (includes blocking events with direction 'B')
- **Impacted Systems:**
  - Publisher: eBroker (via interface tables INSTRUMENT_TRANSACTION_CONTINUOUS, INSTRUMENT_TRANSACTION_INIT_AND_RECON)
  - Subscribers: KStreams, DKCZ, DKSK

## Data Objects

### InstrumentTransaction
- **Description:** Contains data about realized trades on portfolios
- **Key Attributes:**
  - X-Correlation-ID: Correlation identifier (mandatory for INIT and RECON)
  - businessChangeDate: Date and time of last entity change
  - status: Entity status (active|deleted)
  - tradeIds: Trade identifiers (ebrokerId, topasIdNumber, topasIdSeq, taId)
  - orderIds: Order identifiers (ebrokerId, topasId, taId)
  - portfolioIds: Portfolio identifiers (ebrokerId, topasId, taId)
  - instrumentIds: Security identifiers (ISIN, ebrokerId, topasId, taId)
  - Various trading attributes (direction, quantity, prices, currencies, dates, etc.)
- **Reference Data:** DepositoryAccType, InstrumentTransactionType, InvExchanges, Currencies

### Order (Trading API)
- **Description:** Investment order submission details
- **Key Attributes:**
  - validFrom: Order submission date
  - placedById: Access account ID submitting the order
  - submitterCrmId: CRM ID of client submitting order
  - receivingTraderId: Operator account ID receiving the order
  - portfolioId/topPortfolioId: Portfolio identifiers
  - instrumentId: Instrument identifier in eBroker
  - isPlacedByBroker: Flag indicating broker-placed order
  - Various order details (quantities, prices, validity periods, etc.)

## Integration Points

### Publishing Systems
- **eBroker**: Main brokerage system providing instrument transaction events and order management
  - Manages interface tables for continuous and reconciliation topics
  - Provides REST APIs for order submission and data reconciliation
  - Integrates with TOPAS and TA systems
  - Supports FIX protocol for third-party communication

### Consuming Systems
- **KStreams**: Consumes instrument transaction events from continuous and reconciliation topics
- **DKCZ**: Czech data warehouse consuming instrument transaction streams
- **DKSK**: Slovak data warehouse consuming instrument transaction streams
- **Digital Channels (FE)**: Front-end system for customer-facing trading operations
  - Consumes Trading REST API for order submission
  - Provides user interface for banking operations via internet

### Integration Infrastructure
- **WSO2 API-M**: API Management platform for creating, integrating and exposing digital services as managed APIs
- **Kafka**: Event streaming platform with JDBC connector for reading from eBroker interface tables

## Summary Statistics
- Total REST APIs: 2
- Total Event Streams: 7 topics (2 continuous HQ, 2 init/recon per country, 1 control)
- Total Data Objects: 2 primary entities (InstrumentTransaction, Order)
- Total Impacted Systems: 8 (eBroker, TOPAS, TA, WSO2 API-M, KStreams, DKCZ, DKSK, Digital Channels)
- Supported Locations: CZ (Czech Republic), SK (Slovakia)
- Event Architecture: Interface table pattern with JDBC connector to Kafka
- Partitions: 8 (for main topics), Replicas: 3, Retention: 6 days
