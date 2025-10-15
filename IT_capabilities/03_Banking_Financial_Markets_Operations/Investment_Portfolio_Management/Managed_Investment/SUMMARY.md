# Managed Investment - Summary

## Overview
Managed Investment capability provides managed client portfolio data from the Jupiter system. The system publishes monthly portfolio valuation events with daily granularity for managed investment portfolios. Data is published once per month containing the previous month's portfolio valuations. This capability supports managed investment analysis and reporting for Czech operations.

## REST APIs

### ManagedClientPortfolio - REST API
- **Description:** Reconciliation and initialization API for managed client portfolio data
- **Key Operations:**
  - Reconciliation with X-Correlation-ID tracking
  - Initialization for bulk data synchronization
  - Monthly publication of portfolio valuations
- **Data Objects:** ManagedClientPortfolio
- **Impacted Systems:** Jupiter (source), KStreams (consumer), DKCZ

## Event Stream Topics

### ManagedClientPortfolio - Event Stream
- **Purpose:** Publishes managed client portfolio valuation events with monthly frequency
- **Event Types:**
  - HQ Continuous: JTB-HQ_INVESTMENTS_MANAGED-CLIENT-PORTFOLIO_SYNC_APP
  - HQ Init/Recon: JTB-HQ_INVESTMENTS_MANAGED-CLIENT-PORTFOLIO-INIT-AND-RECON_RSYNC_APP
  - CZ Continuous: JTB-CZ_INVESTMENTS_MANAGED-CLIENT-PORTFOLIO_STREAM_GNR
  - CZ Init/Recon: JTB-CZ_INVESTMENTS_MANAGED-CLIENT-PORTFOLIO_RCN_GNR
  - Control: JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Data Objects:** ManagedClientPortfolio
- **Impacted Systems:**
  - Publisher: Jupiter (via Java API library direct to Kafka)
  - Subscribers: KStreams, DKCZ
- **Publication Frequency:** Once per month with daily granularity for previous month
- **Event Trigger:** Portfolio valuation date (monthly batch publication)

## Data Objects

### ManagedClientPortfolio
- **Description:** Managed client portfolio valuation data with historical daily values
- **Key Attributes:**
  - X-Correlation-ID: Correlation identifier (mandatory for INIT and RECON)
  - businessChangeDate: Date of portfolio valuation
  - Portfolio valuation data
  - Daily granularity values for previous month
  - Client portfolio identifiers
  - Valuation metrics and calculations
- **Publication Pattern:** Monthly batch containing daily values for previous month
- **Source System:** Jupiter (managed investment platform)

## Integration Points

### Publishing Systems
- **Jupiter**: Managed investment portfolio management system
  - Calculates portfolio valuations on monthly basis
  - Publishes directly to Kafka using Java API library
  - No interface tables (direct Kafka publication)
  - Generates monthly batches with daily granularity
  - Provides portfolio performance and valuation metrics

### Consuming Systems
- **KStreams**: Stream processing for managed portfolio events
- **DKCZ**: Czech data warehouse consuming managed portfolio streams
- **Note:** Currently only CZ operations supported (no SK topics)

### Integration Infrastructure
- **Kafka**: Event streaming platform
  - Direct publication from Jupiter via Java API
  - 8 partitions (standard topics), 2 partitions (for this capability)
  - 3 replicas
  - 6-day retention period
- **Batch over Stream Pattern**: Monthly publication with control topic tracking

## Summary Statistics
- Total REST APIs: 1
- Total Event Streams: 5 topics (2 HQ + 2 CZ + 1 control)
- Total Data Objects: 1 primary entity (ManagedClientPortfolio)
- Total Impacted Systems: 3 (Jupiter, KStreams, DKCZ)
- Supported Locations: CZ (Czech Republic only)
- Event Architecture: Direct Kafka publication using Java API (no interface tables)
- Publication Frequency: Monthly with daily granularity
- **Note:** This capability uses a batch-over-stream pattern with monthly publication containing daily portfolio valuations for the previous month
