# Portfolio Analysis - Summary

## Overview
Portfolio Analysis capability provides comprehensive portfolio overview data for analysis and reporting purposes. The system publishes two types of portfolio overview entities: full PortfolioOverview from eBroker and partial PortfolioOverviewPartial from ADP (Arbes Digital Platform). The capability supports portfolio creation, updates, and reconciliation across Czech and Slovak operations with data flowing to data warehouses and stream processing systems.

## REST APIs

### PortfolioOverview - REST API
- **Description:** Reconciliation and initialization API for complete portfolio overview data
- **Key Operations:**
  - POST /portfolioOverview/query - Query and reconcile portfolio overview data
  - Support for time-based filtering (businessChangeDateStart, businessChangeDateEnd)
  - Portfolio and owner-based filtering (portfolioIds.ebrokerId, owner.crmId)
  - Location-based filtering (CZ, SK)
  - Reconciliation resends entities with last change from specified time interval (default: last 3 months)
  - Deleted entities are transferred in reconciliation, not in initialization
- **Data Objects:** PortfolioOverview
- **Impacted Systems:** eBroker (source), WSO2 API-M (gateway), KStreams (consumer), DKCZ, DKSK

### PortfolioOverviewPartial - REST API
- **Description:** Out of scope - no REST API implementation
- **Note:** PortfolioOverviewPartial is published event-only from ADP to eBroker

## Event Stream Topics

### PortfolioOverview - Event Stream
- **Purpose:** Publishes complete portfolio overview events from eBroker
- **Event Types:**
  - HQ Continuous: JTB-HQ_INVESTMENTS_PORTFOLIO-OVERVIEW_SYNC_APP
  - HQ Init/Recon: JTB-HQ_INVESTMENTS_PORTFOLIO-OVERVIEW-INIT-AND-RECON_RSYNC_APP
  - CZ Continuous: JTB-CZ_INVESTMENTS_PORTFOLIO-OVERVIEW_STREAM_GNR
  - CZ Init/Recon: JTB-CZ_INVESTMENTS_PORTFOLIO-OVERVIEW_RCN_GNR
  - SK Continuous: JTB-SK_INVESTMENTS_PORTFOLIO-OVERVIEW_STREAM_GNR
  - SK Init/Recon: JTB-SK_INVESTMENTS_PORTFOLIO-OVERVIEW_RCN_GNR
  - Control: JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Data Objects:** PortfolioOverview
- **Impacted Systems:**
  - Publisher: eBroker (via PORTFOLIO_OVERVIEW_CONTINUOUS, PORTFOLIO_OVERVIEW_INIT_AND_RECON tables)
  - Subscribers: KStreams, DKCZ, DKSK
- **Event Trigger:** Portfolio creation/update from WebOffice with supplementary updates from TOPAS
- **Volume:** Hundreds of events per day (current active portfolios: 113,551)

### PortfolioOverviewPartial - Event Stream
- **Purpose:** Publishes partial portfolio overview events from ADP to eBroker
- **Event Types:**
  - HQ Continuous: JTB-HQ_INVESTMENTS_PORTFOLIO-OVERVIEW-PARTIAL_STREAM_APP
  - HQ Init/Recon: JTB-HQ_INVESTMENTS_PORTFOLIO-OVERVIEW-PARTIAL-INIT-AND-RECON_RSYNC_APP
- **Data Objects:** PortfolioOverviewPartial
- **Impacted Systems:**
  - Publisher: ADP (Arbes Digital Platform)
  - Subscriber: eBroker
- **Event Trigger:**
  - Insert/update of portfolio in TOPAS triggered by:
    - Insert/update of client from Kafka, EPO
    - Portfolio request from Digital Channels
    - Insert/update via TOPAS GUI
  - Note: No topic generation for changes in peripheral entities (relationships, accounts, etc.)
- **Volume:**
  - New portfolios: Average 51/day, maximum 193/day (capacity requirement: 100 avg, 400 max)
  - Portfolio updates: Average 5,913/day, maximum 70,395/day (capacity requirement: 10,000 avg, 150,000 max)
  - Initial load: 121,404 active clients, 151,694 total clients (capacity requirement: 300,000)

## Data Objects

### PortfolioOverview
- **Description:** Complete portfolio overview data from eBroker
- **Key Attributes:**
  - X-Correlation-ID: Correlation identifier (mandatory for INIT and RECON)
  - ebrId: eBroker ID (used as event key)
  - businessChangeDate: Date of portfolio entity change
  - status: Entity status
  - portfolioIds.ebrokerId: Portfolio identifier
  - owner.crmId: Portfolio owner CRM identifier
  - LOCATION: CZ or SK
  - ENTITY_TYPE: PortfolioOverview
  - Portfolio details and characteristics
- **Interface Tables:** PORTFOLIO_OVERVIEW_CONTINUOUS, PORTFOLIO_OVERVIEW_INIT_AND_RECON
- **Source:** eBroker with updates from WebOffice and TOPAS

### PortfolioOverviewPartial
- **Description:** Partial portfolio overview data from ADP
- **Key Attributes:**
  - X-Correlation-ID: Correlation identifier (optional for continuous, mandatory for INIT and RECON)
  - portfolioIds.adpId: ADP portfolio identifier (used as event key)
  - businessChangeDate: Date of portfolio entity change
  - Partial portfolio information from ADP system
- **Source:** ADP (Arbes Digital Platform)
- **Consumer:** eBroker only (no data warehouse consumption)

## Integration Points

### Publishing Systems
- **eBroker**: Main investment portfolio system providing complete portfolio overview data
  - Manages interface tables for Kafka integration via JDBC connector
  - Publishes portfolio creation and update events
  - Receives PortfolioOverviewPartial events from ADP
  - Updates driven by WebOffice and TOPAS systems
- **ADP (Arbes Digital Platform)**: Orchestration platform publishing partial portfolio data
  - Publishes PortfolioOverviewPartial events directly to Kafka
  - Integrates with TOPAS for portfolio updates
  - Provides partial portfolio information to eBroker

### Consuming Systems
- **KStreams**: Stream processing consuming PortfolioOverview events from eBroker
- **DKCZ**: Czech data warehouse consuming PortfolioOverview streams
- **DKSK**: Slovak data warehouse consuming PortfolioOverview streams
- **eBroker**: Consumes PortfolioOverviewPartial events from ADP

### Integration Infrastructure
- **WSO2 API-M**: API Management platform exposing reconciliation REST API
- **Kafka**: Event streaming platform with JDBC connector
  - 8 partitions (standard topics), 1 partition (reference data)
  - 3 replicas
  - 6-day retention period
- **Interface Tables**: eBroker manages interface tables for continuous and init/recon topics with LOCATION and ENTITY_TYPE fields

## Summary Statistics
- Total REST APIs: 1 (PortfolioOverview reconciliation API)
- Total Event Streams: 9 topics (7 PortfolioOverview + 2 PortfolioOverviewPartial)
- Total Data Objects: 2 primary entities (PortfolioOverview, PortfolioOverviewPartial)
- Total Impacted Systems: 6 (eBroker, ADP, WSO2 API-M, KStreams, DKCZ, DKSK)
- Supported Locations: CZ (Czech Republic), SK (Slovakia)
- Event Architecture: Interface table pattern with JDBC connector to Kafka for eBroker; direct Kafka publication from ADP
- Volume: Hundreds to thousands of portfolio events daily with capacity for up to 150,000 updates/day
- **Note:** This capability supports bidirectional data flow: eBroker publishes complete portfolio overviews to data warehouses, while ADP publishes partial portfolio data to eBroker for consolidation
