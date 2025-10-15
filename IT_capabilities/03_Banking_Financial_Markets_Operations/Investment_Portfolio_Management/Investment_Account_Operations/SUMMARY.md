# Investment Account Operations - Summary

## Overview
Investment Account Operations capability manages confirmations and documentation for various types of investment account transactions. The system is integrated with XEROX and JTDOCS systems, publishing consolidated confirmation events for multiple operation types including asset accounts, bill of exchange operations, depreciation calculations, yields payments, and specialized operations. All confirmation types share common interface tables and streaming infrastructure.

## REST APIs
- **Description:** Not explicitly documented
- **Note:** This capability uses primarily event-driven architecture with shared JTDOCS confirmation streaming infrastructure

## Event Stream Topics

### Asset Account Confirmations (ocp40)
- **Purpose:** Publishes asset account confirmation documents
- **Event Types:**
  - CZ Continuous: JTB-CZ_DOCUMENTS_ASSET-ACCOUNT_STREAM_GNR
  - CZ Init/Recon: JTB-CZ_DOCUMENTS_ASSET-ACCOUNT_RCN_GNR
  - SK Continuous: JTB-SK_DOCUMENTS_ASSET-ACCOUNT_STREAM_GNR
  - SK Init/Recon: JTB-SK_DOCUMENTS_ASSET-ACCOUNT_RCN_GNR
- **Data Objects:** AssetAccount confirmation data
- **Impacted Systems:**
  - Publisher: XEROX (document generation), JTDOCS (via Kafka Connect)
  - Subscribers: KStreams, DKCZ, DKSK

### Bill of Exchange Operations Confirmations
- **Purpose:** Publishes bill of exchange transaction confirmation documents
- **Data Objects:** BillOfExchange confirmation data

### Depreciation of Initial Value Confirmations
- **Purpose:** Publishes depreciation calculation confirmation documents
- **Data Objects:** DepreciationOfInitialValue confirmation data

### Yields Payments Confirmations
- **Purpose:** Publishes yield and dividend payment confirmation documents
- **Data Objects:** YieldsPayments confirmation data

### Tatry Mountain Resort Confirmations
- **Purpose:** Publishes specialized confirmation documents for Tatry Mountain Resort operations
- **Data Objects:** TatryMountainResort confirmation data

### Shared Confirmation Topics
- **Purpose:** Consolidated confirmations stream for all confirmation types
- **Event Types:**
  - HQ Continuous: JTB-HQ_DOCUMENTS_CONFIRMATIONS_SYNC_APP
  - HQ Init/Recon: JTB-HQ_DOCUMENTS_CONFIRMATIONS_RSYNC_APP
  - Control: JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Data Objects:** All confirmation entity types (ocp04, ocp06, ocp08, ocp10, ocp12, ocp13, ocp14, ocp24, ocp37, ocp40, ocp43, ocp44, ocp46)
- **Impacted Systems:**
  - Publisher: JTDOCS (via Kafka Connect)
  - Subscribers: KStreams, DKCZ, DKSK

## Data Objects

### Confirmation Documents (Generic)
- **Description:** Shared confirmation document structure for all operation types
- **Key Attributes:**
  - confirmationId: Unique confirmation identifier (used as event key)
  - businessChangeDate: Date of confirmation change
  - status: Document status (New, InsertedForXerox, GettingDataFromDb, Generating_XML, XML_Generated, Formatting, PDF_Generated, SendingToSharePoint, Completed, Error, Suspended, Temp)
  - X-Correlation-ID: Correlation identifier (mandatory for INIT and RECON)
  - LOCATION: CZ or SK
  - ENTITY_TYPE: Operation type code (ocp04-ocp46)
- **Shared Interface Tables:**
  - DOCUMENTS_CONFIRMATIONS_CONTINUOUS (shared by all confirmation types)
  - DOCUMENTS_CONFIRMATIONS_INIT_AND_RECON (shared by all confirmation types)
- **Document Generation States:** 12 states from New to Completed/Error, automatic retry on errors

### AssetAccount (ocp40)
- **Description:** Asset account confirmation documents
- **Source System:** XEROX
- **Event Trigger:** State change in JTDOCS

### BillOfExchange (ocp43)
- **Description:** Bill of exchange operation confirmations

### DepreciationOfInitialValue (ocp44)
- **Description:** Depreciation calculation confirmations

### YieldsPayments (ocp46)
- **Description:** Yield and dividend payment confirmations

### TatryMountainResort (ocp37)
- **Description:** Tatry Mountain Resort specific operation confirmations

### Other Confirmation Types
- **ocp04**: FxSpot confirmations
- **ocp06**: FxForward confirmations
- **ocp08**: FxSwap confirmations
- **ocp10**: SummedTrades confirmations
- **ocp12**: SecuritiesTransfers confirmations
- **ocp13**: RepoTrades confirmations
- **ocp14**: DepositsWithdrawals confirmations
- **ocp24**: Additional operation type

## Integration Points

### Publishing Systems
- **XEROX**: Document generation system
  - Generates confirmation documents in various states
  - Provides source data for asset accounts and other operations
  - Manages document lifecycle through 12 states
- **JTDOCS**: Document management system
  - Manages interface tables for Kafka integration
  - DB procedures insert data into interface tables
  - Kafka Connect reads from interface tables

### Consuming Systems
- **KStreams**: Stream processing for all confirmation types
- **DKCZ**: Czech data warehouse consuming confirmation streams
- **DKSK**: Slovak data warehouse consuming confirmation streams

### Integration Infrastructure
- **Kafka**: Event streaming platform
  - JDBC connector for JTDOCS interface tables
  - 8 partitions (standard topics), 1 partition (reference data)
  - 3 replicas
  - 6-day retention period

## Summary Statistics
- Total REST APIs: 0 (primarily event-driven)
- Total Event Streams: 11+ topics (5 specific operation types x 2 locations x 2 topic types + shared HQ topics + control)
- Total Data Objects: 12 confirmation entity types (ocp04-ocp46)
- Total Impacted Systems: 5 (XEROX, JTDOCS, KStreams, DKCZ, DKSK)
- Supported Locations: CZ (Czech Republic), SK (Slovakia)
- Document States: 12 lifecycle states
- Event Architecture: Shared interface table pattern for all confirmations via JDBC connector to Kafka
- **Note:** All confirmation types share common DOCUMENTS_CONFIRMATIONS interface tables for efficient streaming
