# Investment Orders - Summary

## Overview
Investment Orders capability manages the lifecycle of investment orders including new order submissions and order cancellations. The system publishes order events for both new and cancel operations, supporting data warehousing and analytics for investment order processing across Czech and Slovak operations.

## REST APIs

### InvestmentOrder - REST API
- **Description:** Reconciliation and initialization API for investment orders
- **Key Operations:**
  - Reconciliation for InvestmentNewOrder and InvestmentCancelOrder entities
  - Initialization/reconciliation with time-based filtering
  - X-Correlation-ID tracking for init/recon processes
- **Data Objects:** InvestmentNewOrder, InvestmentCancelOrder
- **Impacted Systems:** eBroker (source), WSO2 API-M (gateway), KStreams (consumer), DKCZ, DKSK

### CancelOrder - CRUD Operations
- **Description:** Order cancellation operations
- **Key Operations:** Cancel investment orders
- **Data Objects:** Cancel order request/response data
- **Impacted Systems:** eBroker

## Event Stream Topics

### InvestmentNewOrder - Event Stream
- **Purpose:** Publishes new investment order events
- **Event Types:**
  - HQ Continuous: JTB-HQ_INVESTMENTS_INVESTMENT-ORDER_SYNC_APP
  - HQ Init/Recon: JTB-HQ_INVESTMENTS_INVESTMENT-ORDER-INIT-AND-RECON_RSYNC_APP
  - CZ Continuous: JTB-CZ_INVESTMENTS_INVESTMENT-NEW-ORDER_STREAM_GNR
  - CZ Init/Recon: JTB-CZ_INVESTMENTS_INVESTMENT-NEW-ORDER_RCN_GNR
  - SK Continuous: JTB-SK_INVESTMENTS_INVESTMENT-NEW-ORDER_STREAM_GNR
  - SK Init/Recon: JTB-SK_INVESTMENTS_INVESTMENT-NEW-ORDER_RCN_GNR
- **Data Objects:** InvestmentNewOrder
- **Impacted Systems:**
  - Publisher: eBroker (via INVESTMENT_ORDER_CONTINUOUS, INVESTMENT_ORDER_INIT_AND_RECON tables)
  - Subscribers: KStreams, DKCZ, DKSK

### InvestmentCancelOrder - Event Stream
- **Purpose:** Publishes investment order cancellation events
- **Event Types:**
  - HQ Continuous: JTB-HQ_INVESTMENTS_INVESTMENT-ORDER_SYNC_APP (shared with new orders)
  - HQ Init/Recon: JTB-HQ_INVESTMENTS_INVESTMENT-ORDER-INIT-AND-RECON_RSYNC_APP (shared)
  - CZ Continuous: JTB-CZ_INVESTMENTS_INVESTMENT-CANCEL-ORDER_STREAM_GNR
  - CZ Init/Recon: JTB-CZ_INVESTMENTS_INVESTMENT-CANCEL-ORDER_RCN_GNR
  - SK Continuous: JTB-SK_INVESTMENTS_INVESTMENT-CANCEL-ORDER_STREAM_GNR
  - SK Init/Recon: JTB-SK_INVESTMENTS_INVESTMENT-CANCEL-ORDER_RCN_GNR
- **Data Objects:** InvestmentCancelOrder
- **Impacted Systems:**
  - Publisher: eBroker (via shared interface tables with new orders)
  - Subscribers: KStreams, DKCZ, DKSK

### Control Topic
- **Purpose:** Integration control and reconciliation tracking
- **Topic:** JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Subscribers:** DKCZ, DKSK

### RegularInvestment - Event Stream
- **Purpose:** Publishes regular/recurring investment order events
- **Event Topics:** Not specified in available documentation
- **Data Objects:** RegularInvestment data
- **Impacted Systems:** eBroker, KStreams, DKCZ, DKSK

## Data Objects

### InvestmentNewOrder
- **Description:** New investment order data
- **Key Attributes:**
  - X-Correlation-ID: Correlation identifier (mandatory for INIT and RECON)
  - businessChangeDate: Date and time of last entity change
  - status: Entity status
  - orderIds.ebrokerId: Order identifier in eBroker (used as event key)
  - Portfolio identifiers
  - Instrument details
  - Order parameters (quantity, price, validity, etc.)
  - Submission details
- **Interface Tables:**
  - INVESTMENT_ORDER_CONTINUOUS (shared with cancel orders)
  - INVESTMENT_ORDER_INIT_AND_RECON (shared with cancel orders)

### InvestmentCancelOrder
- **Description:** Investment order cancellation data
- **Key Attributes:**
  - X-Correlation-ID: Correlation identifier (mandatory for INIT and RECON)
  - businessChangeDate: Date and time of last entity change
  - status: Entity status
  - orderIds.ebrokerId: Order identifier in eBroker (used as event key)
  - Cancellation reason
  - Original order reference
  - Cancellation timestamp
- **Interface Tables:** Shared with InvestmentNewOrder

### RegularInvestment
- **Description:** Regular/recurring investment order configuration
- **Key Attributes:** Not specified in available documentation

## Integration Points

### Publishing Systems
- **eBroker**: Core investment order management system
  - Manages investment orders lifecycle
  - Publishes new order and cancellation events
  - Provides interface tables for Kafka integration via JDBC connector
  - Supports both ad-hoc and regular investment orders

### Consuming Systems
- **KStreams**: Stream processing for all order event types
- **DKCZ**: Czech data warehouse consuming all order streams
- **DKSK**: Slovak data warehouse consuming all order streams

### Integration Infrastructure
- **Kafka**: Event streaming platform
  - JDBC connector for eBroker interface tables
  - Shared interface tables for new and cancel orders (INVESTMENT_ORDER_CONTINUOUS, INVESTMENT_ORDER_INIT_AND_RECON)
  - 8 partitions (standard topics), 1 partition (reference data)
  - 3 replicas
  - 6-day retention period

## Summary Statistics
- Total REST APIs: 2 (InvestmentOrder reconciliation, CancelOrder CRUD)
- Total Event Streams: 13 topics (2 HQ shared + 6 CZ/SK new + 6 CZ/SK cancel + 1 control, plus RegularInvestment streams)
- Total Data Objects: 3 primary entities (InvestmentNewOrder, InvestmentCancelOrder, RegularInvestment)
- Total Impacted Systems: 5 (eBroker, WSO2 API-M, KStreams, DKCZ, DKSK)
- Supported Locations: CZ (Czech Republic), SK (Slovakia)
- Event Architecture: Shared interface table pattern for new and cancel orders via JDBC connector to Kafka
- **Note:** New orders and cancel orders share the same interface tables but route to different country-specific topics for data warehouse consumption
