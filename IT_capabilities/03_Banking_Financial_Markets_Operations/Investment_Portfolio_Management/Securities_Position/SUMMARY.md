# Securities Position - Summary

## Overview
Securities Position capability manages securities positions and portfolio valuations for investment portfolios. The system publishes two primary entities: PortfolioPosition tracking individual security positions within portfolios, and PortfolioValuationDaily providing daily portfolio valuation snapshots. Data is published from eBroker to data warehouses and stream processing systems supporting Czech and Slovak operations.

## REST APIs

### PortfolioPosition - REST API
- **Description:** Reconciliation and initialization API for portfolio security positions
- **Key Operations:**
  - Reconciliation for portfolio position data with time-based filtering
  - Initialization for bulk data synchronization
  - X-Correlation-ID tracking for init/recon processes
- **Data Objects:** PortfolioPosition
- **Impacted Systems:** eBroker (source), WSO2 API-M (gateway), KStreams (consumer), DKCZ, DKSK

### PortfolioValuationDaily - REST API
- **Description:** Reconciliation and initialization API for daily portfolio valuations
- **Key Operations:**
  - Reconciliation for portfolio valuation data with time-based filtering
  - Initialization for bulk data synchronization
  - X-Correlation-ID tracking for init/recon processes
- **Data Objects:** PortfolioValuationDaily
- **Impacted Systems:** eBroker (source), WSO2 API-M (gateway), KStreams (consumer), DKCZ, DKSK

## Event Stream Topics

### PortfolioPosition - Event Stream
- **Purpose:** Publishes security position events for investment portfolios
- **Event Types:**
  - HQ Continuous: JTB-HQ_INVESTMENTS_PORTFOLIO-POSITION_SYNC_APP
  - HQ Init/Recon: JTB-HQ_INVESTMENTS_PORTFOLIO-POSITION-INIT-AND-RECON_RSYNC_APP
  - CZ Continuous: JTB-CZ_INVESTMENTS_PORTFOLIO-POSITION_STREAM_GNR
  - CZ Init/Recon: JTB-CZ_INVESTMENTS_PORTFOLIO-POSITION_RCN_GNR
  - SK Continuous: JTB-SK_INVESTMENTS_PORTFOLIO-POSITION_STREAM_GNR
  - SK Init/Recon: JTB-SK_INVESTMENTS_PORTFOLIO-POSITION_RCN_GNR
  - Control: JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Data Objects:** PortfolioPosition
- **Impacted Systems:**
  - Publisher: eBroker (via PORTFOLIO_POSITION_CONTINUOUS, PORTFOLIO_POSITION_INIT_AND_RECON tables)
  - Subscribers: KStreams, DKCZ, DKSK
- **Event Triggers:**
  - Trade entry/execution in KUL (a_obchod) by trade date
  - Trade settlement in T+N (settled positions on portfolio)
  - FX rate updates (recalculates position values for traded positions in the day multiplied by number of currencies)
- **Volume:** Average 5,371 events/day, maximum 15,427 events/day per trigger type

### PortfolioValuationDaily - Event Stream
- **Purpose:** Publishes daily portfolio valuation snapshot events
- **Event Types:**
  - HQ Continuous: JTB-HQ_INVESTMENTS_PORTFOLIO-VALUATION-DAILY_SYNC_APP
  - HQ Init/Recon: JTB-HQ_INVESTMENTS_PORTFOLIO-VALUATION-DAILY-INIT-AND-RECON_RSYNC_APP
  - CZ Continuous: JTB-CZ_INVESTMENTS_PORTFOLIO-VALUATION-DAILY_STREAM_GNR
  - CZ Init/Recon: JTB-CZ_INVESTMENTS_PORTFOLIO-VALUATION-DAILY_RCN_GNR
  - SK Continuous: JTB-SK_INVESTMENTS_PORTFOLIO-VALUATION-DAILY_STREAM_GNR
  - SK Init/Recon: JTB-SK_INVESTMENTS_PORTFOLIO-VALUATION-DAILY_RCN_GNR
  - Control: JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Data Objects:** PortfolioValuationDaily
- **Impacted Systems:**
  - Publisher: eBroker (via PORTFOLIO_VALUATION_DAILY_CONTINUOUS, PORTFOLIO_VALUATION_DAILY_INIT_AND_RECON tables)
  - Subscribers: KStreams, DKCZ, DKSK
- **Event Triggers:**
  - Daily portfolio valuation recalculation in morning hours (creates new entities)
  - Changes in relevant Trades, Cash Transactions, Security Valuation Prices, and FX Rates after valuation (updates entities)
  - Note: Entities not generated for empty portfolios (zero security positions and zero account balances)
- **Volume:**
  - Daily valuation: ~55,000 CZ, ~15,000 SK portfolios
  - Updates after valuation: estimated 1/2 of daily valuation counts (~35,000 total events/day)

## Data Objects

### PortfolioPosition
- **Description:** Security position data within investment portfolios
- **Key Attributes:**
  - X-Correlation-ID: Correlation identifier (mandatory for INIT and RECON)
  - ebrId: eBroker ID (used as event key)
  - businessChangeDate: Date of position change
  - status: Entity status (active|deleted)
  - portfolioIds: Portfolio identifiers
  - instrumentIds: Security identifiers
  - Position details (quantity, values, currencies)
  - Traded and settled position states
  - LOCATION: CZ or SK
  - ENTITY_TYPE: PortfolioPosition
- **Interface Tables:** PORTFOLIO_POSITION_CONTINUOUS, PORTFOLIO_POSITION_INIT_AND_RECON
- **Source:** eBroker with data from KUL trading system

### PortfolioValuationDaily
- **Description:** Daily portfolio valuation snapshot data
- **Key Attributes:**
  - X-Correlation-ID: Correlation identifier (mandatory for INIT and RECON)
  - portfolioIds.ebrokerId: Portfolio eBroker ID (used as event key)
  - businessChangeDate: Date of valuation change
  - status: Entity status
  - Valuation details (total value, currency breakdowns)
  - Portfolio performance metrics
  - Security position valuations
  - Account balances (blocked, traded, presettled, settled)
  - LOCATION: CZ or SK
  - ENTITY_TYPE: PortfolioValuationDaily
- **Interface Tables:** PORTFOLIO_VALUATION_DAILY_CONTINUOUS, PORTFOLIO_VALUATION_DAILY_INIT_AND_RECON
- **Source:** eBroker valuation engine with morning batch calculations

## Integration Points

### Publishing Systems
- **eBroker**: Main securities position and valuation platform
  - Manages interface tables for Kafka integration via JDBC connector
  - Publishes position events triggered by trades and settlements
  - Performs daily valuation calculations for all portfolios with positions
  - Tracks security positions (traded and settled states)
  - Excludes empty portfolios from daily valuation events

### Consuming Systems
- **KStreams**: Stream processing consuming all position and valuation events
- **DKCZ**: Czech data warehouse consuming all event streams
- **DKSK**: Slovak data warehouse consuming all event streams

### Integration Infrastructure
- **WSO2 API-M**: API Management platform exposing reconciliation REST APIs
- **Kafka**: Event streaming platform with JDBC connector
  - 8 partitions (standard topics), 1 partition (reference data)
  - 3 replicas
  - 6-day retention period
- **Interface Tables**: eBroker manages interface tables with LOCATION and ENTITY_TYPE fields for routing

## Summary Statistics
- Total REST APIs: 2 (PortfolioPosition, PortfolioValuationDaily reconciliation APIs)
- Total Event Streams: 14 topics (2 entities x 3 locations x 2 topic types + 1 control topic)
- Total Data Objects: 2 primary entities (PortfolioPosition, PortfolioValuationDaily)
- Total Impacted Systems: 5 (eBroker, WSO2 API-M, KStreams, DKCZ, DKSK)
- Supported Locations: CZ (Czech Republic), SK (Slovakia)
- Volume: ~5,000-15,000 position events/day, ~70,000 valuation events/day
- Event Architecture: Interface table pattern with JDBC connector to Kafka
- **Note:** Daily valuations are batch-calculated in morning hours with subsequent updates throughout the day for affected portfolios; empty portfolios are excluded from valuation events
