# Product Fulfillment - Summary

## Overview
The Product Fulfillment capability manages Autosweep configurations in CRM for automated fund sweeping between accounts. This service domain publishes Autosweep configuration changes to Digital Channels for both Czech and Slovak markets through event streams and REST APIs, enabling customers to automate fund transfers based on predefined rules.

## REST APIs

### CRM Autosweep REST API
- **Description:** REST API for managing Autosweep configurations
- **Key Operations:** CRUD operations for Autosweep setup and management
- **Data Objects:** Autosweep configuration with source/target account rules
- **Impacted Systems:** CRM, Digital Channels CZ, Digital Channels SK

## Event Stream Topics

### Autosweep Event Topics (CZ)
- **Purpose:** Real-time publication of Autosweep configuration changes for Czech market
- **Event Types:**
  - Continuous: JTB-CZ_PARTIES_AUTOSWEEP_SYNC_GNR
  - Reconciliation: JTB-CZ_PARTIES_AUTOSWEEP_RCN_GNR
  - Control: JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Data Objects:** Autosweep entity
- **Impacted Systems:**
  - Publisher: CRM
  - Subscriber: Digital Channels CZ

### Autosweep Event Topics (SK)
- **Purpose:** Real-time publication of Autosweep configuration changes for Slovak market
- **Event Types:**
  - Continuous: JTB-SK_PARTIES_AUTOSWEEP_SYNC_GNR
  - Reconciliation: JTB-SK_PARTIES_AUTOSWEEP_RCN_GNR
  - Control: JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Data Objects:** Autosweep entity
- **Impacted Systems:**
  - Publisher: CRM
  - Subscriber: Digital Channels SK

## Data Objects

### Autosweep
- **Description:** Automated fund sweeping configuration between accounts
- **Key Attributes:**
  - Source account details
  - Target account details
  - Sweep rules and conditions
  - Threshold amounts
  - Frequency and timing
  - Status and activation flags
- **Business Change Date (BCD):** Tracked with timestamp precision; updated on any configuration change via REST interface or CRM console

## Integration Points

### Publishing Systems
- **CRM:** Publishes Autosweep configuration changes directly to Kafka topics; manages Autosweep configurations through REST interface and CRM console

### Consuming Systems
- **Digital Channels CZ:** Consumes Autosweep configurations for Czech market customers
- **Digital Channels SK:** Consumes Autosweep configurations for Slovak market customers

## Key Features

### Event Publication
- CRM publishes data entity directly to Kafka topics
- Topic selection based on:
  - location parameter (CZ or SK)
  - Whether it's continuous change or initialization/reconciliation event
- Follows standard integration aspects defined in enterprise integration patterns

### Data Richness
- CRM data object is significantly richer than published portion
- May result in identical messages to Kafka when non-published attributes change
- BCD (timestamp) functions correctly but may change even when published data appears unchanged

### Error Handling
- Deduplication expected from consumers (duplicates possible up to BCD)
- Follows standard error handling patterns defined in integration aspects

### Event Triggers
- Any change to data object via REST interface
- Any change via CRM console
- Frequency: Currently not estimated (to be revised based on practice)

## Technical Specifications

### Kafka Configuration
- Standard partition configuration
- Standard replica configuration
- Standard retention period
- Location-based topic routing (CZ/SK)

### Schema
- JSON schema stored in centralized schema repository
- X-Correlation-ID included for reconciliation/initialization flows

## Capacity Requirements

### Volume
- Current estimate not available
- To be monitored and revised based on actual usage

### Frequency
- Currently no estimate available
- Will be evaluated based on practice

## Summary Statistics
- Total REST APIs: 1 (CRM Autosweep API)
- Total Event Streams: 4 (2 CZ topics - continuous/reconciliation, 2 SK topics - continuous/reconciliation)
- Total Data Objects: 1 (Autosweep)
- Total Impacted Systems: 3 (CRM, Digital Channels CZ, Digital Channels SK)
