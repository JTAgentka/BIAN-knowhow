# Securities Trading - Summary

## Overview
Securities Trading capability manages various types of securities trading confirmations for investment operations. The system publishes confirmation events for multiple trade types including mutual funds, repo trades, securities transfers, and summed trades. All confirmations are integrated with XEROX document generation system and JTDOCS document management, providing comprehensive trade documentation across Czech and Slovak operations.

## REST APIs
- **Note:** This capability primarily uses event-driven architecture for confirmation document distribution
- REST APIs for confirmation reconciliation and initialization may be available but are not explicitly documented in the available files

## Event Stream Topics

### Mutual Funds - Event Stream
- **Purpose:** Publishes mutual fund trade confirmation documents
- **Event Types:**
  - CZ Continuous: JTB-CZ_DOCUMENTS_MUTUAL-FUNDS_STREAM_GNR
  - CZ Init/Recon: JTB-CZ_DOCUMENTS_MUTUAL-FUNDS_RCN_GNR
  - SK Continuous: JTB-SK_DOCUMENTS_MUTUAL-FUNDS_STREAM_GNR
  - SK Init/Recon: JTB-SK_DOCUMENTS_MUTUAL-FUNDS_RCN_GNR
- **Data Objects:** Mutual fund confirmation data
- **Impacted Systems:**
  - Publisher: XEROX (document generation), JTDOCS (via Kafka Connect)
  - Subscribers: KStreams, DKCZ, DKSK

### Repo Trades - Event Stream
- **Purpose:** Publishes repo trade confirmation documents
- **Event Types:** Not specified in available documentation
- **Data Objects:** Repo trade confirmation data
- **Impacted Systems:** XEROX, JTDOCS, KStreams, DKCZ, DKSK

### Securities Transfers - Event Stream
- **Purpose:** Publishes securities transfer confirmation documents
- **Event Types:** Not specified in available documentation
- **Data Objects:** Securities transfer confirmation data
- **Impacted Systems:** XEROX, JTDOCS, KStreams, DKCZ, DKSK

### Summed Trades - Event Stream
- **Purpose:** Publishes summed trade confirmation documents (consolidated trade confirmations)
- **Event Types:** Not specified in available documentation
- **Data Objects:** Summed trade confirmation data
- **Impacted Systems:** XEROX, JTDOCS, KStreams, DKCZ, DKSK

### Shared Confirmation Topics
- **Purpose:** Consolidated confirmations stream for all securities trading confirmation types
- **Event Types:**
  - HQ Continuous: JTB-HQ_DOCUMENTS_CONFIRMATIONS_SYNC_APP (shared with other confirmations)
  - HQ Init/Recon: JTB-HQ_DOCUMENTS_CONFIRMATIONS_RSYNC_APP (shared with other confirmations)
  - Control: JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Data Objects:** Multiple confirmation entity types
- **Impacted Systems:**
  - Publisher: JTDOCS (via Kafka Connect)
  - Subscribers: KStreams, DKCZ, DKSK

## Data Objects

### Mutual Funds Confirmation
- **Description:** Mutual fund trade confirmation documents
- **Key Attributes:**
  - confirmationId: Unique confirmation identifier (used as event key)
  - businessChangeDate: Date of confirmation change
  - status: Document status (New, InsertedForXerox, GettingDataFromDb, Generating_XML, XML_Generated, Formatting, PDF_Generated, SendingToSharePoint, Completed, Error, Suspended, Temp)
  - X-Correlation-ID: Correlation identifier (mandatory for INIT and RECON)
  - LOCATION: CZ or SK
  - ENTITY_TYPE: Mutual funds confirmation type code
  - Trade details, portfolio information, instrument data
- **Source System:** XEROX
- **Event Trigger:** State change in JTDOCS document lifecycle

### Repo Trades Confirmation
- **Description:** Repo trade confirmation documents
- **Key Attributes:** Similar structure to other confirmations with repo-specific trade details
- **Source System:** XEROX
- **Event Trigger:** State change in JTDOCS

### Securities Transfers Confirmation
- **Description:** Securities transfer confirmation documents
- **Key Attributes:** Similar structure to other confirmations with transfer-specific details
- **Source System:** XEROX
- **Event Trigger:** State change in JTDOCS

### Summed Trades Confirmation
- **Description:** Consolidated trade confirmation documents combining multiple related trades
- **Key Attributes:** Similar structure to other confirmations with consolidated trade details
- **Source System:** XEROX
- **Event Trigger:** State change in JTDOCS

## Integration Points

### Publishing Systems
- **XEROX**: Document generation system
  - Generates confirmation documents for securities trades
  - Manages document lifecycle through 12 states (New → Completed/Error)
  - Provides source data for all securities trading confirmations
  - Automatic retry mechanism for error states
- **JTDOCS**: Document management system
  - Manages interface tables for Kafka integration
  - DB procedures insert confirmation data into interface tables
  - Kafka Connect reads from interface tables
  - Tracks document state transitions

### Consuming Systems
- **KStreams**: Stream processing for all confirmation types
- **DKCZ**: Czech data warehouse consuming confirmation streams
- **DKSK**: Slovak data warehouse consuming confirmation streams

### Integration Infrastructure
- **Kafka**: Event streaming platform
  - JDBC connector for JTDOCS interface tables
  - Shared DOCUMENTS_CONFIRMATIONS interface tables for all confirmation types
  - 8 partitions (standard topics), 1 partition (reference data)
  - 3 replicas
  - 6-day retention period

## Summary Statistics
- Total REST APIs: Not explicitly documented (primarily event-driven)
- Total Event Streams: 9+ topics (4+ securities trading confirmation types x 2 locations x 2 topic types + shared HQ topics + control)
- Total Data Objects: 4+ confirmation entity types (Mutual Funds, Repo Trades, Securities Transfers, Summed Trades)
- Total Impacted Systems: 5 (XEROX, JTDOCS, KStreams, DKCZ, DKSK)
- Supported Locations: CZ (Czech Republic), SK (Slovakia)
- Document States: 12 lifecycle states from New to Completed/Error
- Event Architecture: Shared interface table pattern for all securities trading confirmations via JDBC connector to Kafka
- **Note:** This capability shares the DOCUMENTS_CONFIRMATIONS interface table infrastructure with other confirmation types (FX trades, deposits/withdrawals, etc.) for efficient streaming and document lifecycle management
