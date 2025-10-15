# Reference Data Codebooks - Summary

## Overview
Reference Data Codebooks capability provides centralized codebook (reference data/lookup table) management through the CSC (Central Systemcode/Codebook System). This capability publishes codebooks to Kafka topics using a compacted topic strategy, ensuring all consuming systems have access to consistent, up-to-date reference data. The system manages both business codebooks (domain-specific lookup tables) and technical codebooks (system configuration data).

## REST APIs
**Note:** Based on available documentation, Reference Data Codebooks primarily uses event streaming (Kafka compacted topics) rather than REST APIs for data distribution. REST APIs are not specified in the documentation.

- **Total REST APIs:** 0 (Event-driven distribution model)
- **Distribution Method:** Kafka compacted topics
- **Access Pattern:** Consumers read directly from Kafka topics

## Event Stream Topics

### ListOfCodebooks Event Stream
- **Purpose:** Publishes the master list of all available codebooks in the system
- **Event Types:**
  - Kompaktní (Compacted) topic - retains latest state
- **Data Objects:** ListOfCodebooks entity
- **Trigger Conditions:**
  - New codebook added to CSC application
  - Topic assignment changed for existing codebook
- **Impacted Systems:**
  - **Publisher:** CSC (Central Codebook System)
  - **Consumers:** All systems requiring codebook catalog information
- **Topics:**
  - JTB-HQ_CODEBOOKS_LIST-OF-CODEBOOKS_CB_GNR (Compacted)

### Codebook - Business Event Stream
- **Purpose:** Publishes business domain codebooks (e.g., product types, customer categories, transaction codes)
- **Event Types:**
  - Kompaktní (Compacted) topic - retains latest state per codebook
- **Data Objects:** Codebook entity with business reference data
- **Trigger Conditions:**
  - Any item in codebook is changed
  - Complete codebook republished with all active items
  - Deleted or inactive items NOT notified separately
- **Impacted Systems:**
  - **Publisher:** CSC
  - **Consumers:** Business applications requiring domain reference data
- **Topics:**
  - JTB-HQ_CODEBOOKS_BUSINESS_CB_GNR (Compacted)
- **Frequency:** Per codebook (when changes occur)

### Codebook - Technical Event Stream
- **Purpose:** Publishes technical system codebooks (e.g., system codes, configuration values, technical parameters)
- **Event Types:**
  - Kompaktní (Compacted) topic - retains latest state per codebook
- **Data Objects:** Codebook entity with technical configuration data
- **Trigger Conditions:**
  - Any item in technical codebook is changed
  - Complete codebook republished with all active items
  - Deleted or inactive items NOT notified separately
- **Impacted Systems:**
  - **Publisher:** CSC
  - **Consumers:** Technical systems requiring configuration reference data
- **Topics:**
  - JTB-HQ_CODEBOOKS_TECHNICAL_CB_GNR (Compacted)
- **Frequency:** Per codebook (when changes occur)

## Data Objects

### ListOfCodebooks
**Description:** Master catalog of all codebooks available in the system

**Key Attributes:**
- Codebook identifiers
- Codebook names and descriptions
- Topic assignments for each codebook (business vs. technical)
- Codebook metadata
- Publication status

**Update Triggers:**
- New codebook registered in CSC
- Existing codebook's topic assignment modified
- Codebook metadata changes

**Business Rules:**
- Provides discovery mechanism for consumers
- Enables dynamic codebook subscription
- Single source of truth for codebook catalog

### Codebook (Business Type)
**Description:** Business domain reference data and lookup tables

**Key Attributes:**
- Codebook ID (unique identifier)
- Codebook name and description
- List of codebook items/entries
- Item attributes (code, description, values, status)
- Effective dates
- Version information
- Change date (commit date)

**Typical Examples:**
- applicationType (Application types used in CRM)
- applicationState (Application states in workflows)
- enterpriseSystemList (List of enterprise systems)
- Currency codes
- Country codes
- Product types
- Customer categories
- Transaction types
- Account types
- Deposit types

**Update Rules:**
- Only active items synchronized to Kafka
- Complete codebook sent on any item change
- No separate delete notifications
- Change date = commit date in CSC

### Codebook (Technical Type)
**Description:** Technical configuration and system reference data

**Key Attributes:**
- Codebook ID (unique identifier)
- Codebook name and description
- List of configuration items
- Technical parameters and values
- System codes
- Integration mappings
- Effective dates
- Version information
- Change date (commit date)

**Typical Examples:**
- System configuration parameters
- Technical status codes
- Integration endpoint mappings
- Error code definitions
- System capability flags
- Technical enumerations

**Update Rules:**
- Only active items synchronized to Kafka
- Complete codebook sent on any item change
- No separate delete notifications
- Change date = commit date in CSC

## Integration Points

### Publishing Systems

#### CSC (Central Codebook System)
- **Role:** Master reference data management system
- **Functionality:**
  - Maintains all enterprise codebooks
  - Manages codebook versioning
  - Controls item lifecycle (active/inactive/deleted)
  - Publishes changes to Kafka
  - Provides codebook administration interface
- **Publication Pattern:**
  - Compacted topics for efficient storage
  - Complete codebook republished on changes
  - Job-based publication with retry logic
  - Marks messages as processed after successful publication
  - Retry mechanism for Kafka unavailability (period to be specified)
- **Data Governance:**
  - Single source of truth for reference data
  - Change tracking and audit trail
  - Version control
  - Access control and authorization

### Consuming Systems

#### All Enterprise Applications
- **Consumption Pattern:** Subscribe to relevant codebook topics
- **Use Cases:**
  - Data validation (e.g., validate currency codes)
  - UI dropdowns and selection lists
  - Business rule execution
  - Data transformation and mapping
  - Report generation
  - Integration mappings

**Specific Consumer Examples:**
- **DKCZ/DKSK:** Reference data for data warehouse
- **CRM:** Application types, states, enterprise system list
- **Camunda:** Workflow status codes, system lists
- **Payment Systems:** Currency codes, country codes
- **Account Systems:** Account types, product types
- **Integration Layer:** System mappings, endpoint configurations

#### Integration Benefits for Consumers
- **Consistency:** All systems use same reference data
- **Real-time Updates:** Changes propagated immediately
- **Reduced Coupling:** No direct dependency on CSC
- **Efficient Storage:** Compacted topics minimize storage
- **Historical State:** Can replay topics for initialization
- **Scalability:** Multiple consumers without CSC load

### Integration Architecture

**Compacted Topic Pattern:**
1. CSC detects codebook change (commit event)
2. CSC job publishes complete codebook to appropriate topic
3. Kafka compacts topic (keeps only latest value per key)
4. Consumers read latest codebook state
5. New consumers automatically receive latest state
6. CSC marks message as processed
7. On failure, retry after configurable period

**Topic Strategy:**
- **Key:** Codebook ID
- **Value:** Complete codebook with all active items
- **Compaction:** Kafka log compaction enabled
- **Retention:** Unlimited (compacted topics retain indefinitely)
- **Partitions:** 1 (single partition for ordering)
- **Replicas:** 3 (high availability)

**Error Handling:**
- CSC job monitors commit events
- Tracks publication status per codebook
- Retry logic for Kafka unavailability
- Alert mechanism for persistent failures
- Manual intervention for critical failures

## Summary Statistics

- **Total REST APIs:** 0 (Event-driven distribution)
- **Total Event Streams:** 3
  - ListOfCodebooks (catalog)
  - Codebook - Business (domain data)
  - Codebook - Technical (system data)
- **Total Active Topics:** 3 (all compacted)
  - JTB-HQ_CODEBOOKS_LIST-OF-CODEBOOKS_CB_GNR
  - JTB-HQ_CODEBOOKS_BUSINESS_CB_GNR
  - JTB-HQ_CODEBOOKS_TECHNICAL_CB_GNR
- **Total Data Objects:** 2 (ListOfCodebooks, Codebook)
- **Total Impacted Systems:** 15+ (CSC publisher + all enterprise consumers)

## Technical Configuration

### Kafka Configuration
- **Partitions:** 1 (ensures ordering per codebook)
- **Replicas:** 3 (high availability)
- **Retention:** Unlimited (compacted topics)
- **Cleanup Policy:** Compact (log.cleanup.policy=compact)
- **Segment Size:** Optimized for compaction
- **Min Compaction Lag:** Configurable for stability

### Topic Compaction
- **Strategy:** Kafka log compaction
- **Key-Based:** Codebook ID as message key
- **Behavior:** Keeps only latest value per codebook
- **Benefits:**
  - Efficient storage (one message per codebook)
  - Fast consumer initialization
  - Historical changes discarded
  - Minimal disk usage
- **Trade-offs:**
  - No change history
  - Full codebook in each message
  - Larger message size

### Publication Control
- **Job Type:** CSC internal job
- **Trigger:** Codebook commit event
- **Frequency:** On-demand (change-driven)
- **Scope:** Complete codebook (all active items)
- **Tracking:** Publication status per codebook
- **Monitoring:** Success/failure rates, retry counts

### Error Handling and Resilience
- **Kafka Unavailable:** Retry with configurable backoff
- **Publication Failure:** Alert and manual review
- **Invalid Data:** Validation before publication
- **Duplicate Prevention:** Idempotent messages
- **Monitoring:** Real-time publication tracking

### Data Quality
- **Active Items Only:** Inactive/deleted items not published
- **Complete Codebook:** Full dataset on each change
- **Commit-Based:** Change date = CSC commit timestamp
- **Validation:** Data validation before Kafka publication
- **Consistency:** Transactional commit in CSC

## Capacity Requirements

### Event Volume
- **Frequency:** Per codebook (varies by codebook)
- **Typical Volume:** Low to moderate
  - Business codebooks: Occasional changes
  - Technical codebooks: Rare changes
  - ListOfCodebooks: Very rare changes
- **Peak Load:** Minimal (reference data changes infrequently)

### Message Size
- **Per Codebook:** Variable (depends on number of items)
- **Typical Range:** Small to medium
  - Simple codebooks: < 10 KB
  - Complex codebooks: 10-100 KB
  - Very large codebooks: > 100 KB (rare)
- **Compaction Benefit:** Only one message per codebook retained

### Storage Requirements
- **Compacted Topics:** Minimal storage
- **Total Size:** Sum of latest codebook sizes
- **Growth:** Linear with number of codebooks (not time)
- **Optimization:** Compaction keeps storage bounded

## Business Value

### Reference Data Governance
- **Single Source of Truth:** CSC is authoritative source
- **Consistency:** All systems use same reference data
- **Data Quality:** Centralized validation and management
- **Audit Trail:** Change tracking in CSC
- **Version Control:** Historical versions maintained

### Integration Benefits
- **Decoupling:** Consumers independent of CSC availability
- **Scalability:** Add consumers without CSC impact
- **Performance:** No real-time queries to CSC
- **Resilience:** Kafka provides high availability
- **Flexibility:** Easy to add new codebooks

### Operational Benefits
- **Automated Distribution:** No manual data synchronization
- **Real-time Updates:** Changes propagated immediately
- **Reduced Errors:** Eliminates manual data entry
- **Simplified Maintenance:** Centralized codebook management
- **Enhanced Monitoring:** Publication tracking and alerting
