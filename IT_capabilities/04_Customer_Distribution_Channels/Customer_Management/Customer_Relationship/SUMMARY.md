# Customer Relationship - Summary

## Overview
Customer Relationship capability manages core customer account data and relationships in the CRM system. This foundational capability handles customer/client account information including personal and business details, providing master data for both Czech and Slovak markets. The system publishes account changes via Kafka topics and provides reconciliation APIs for data synchronization across Digital Channels and other downstream systems.

## REST APIs

### CRM Account Reconciliation
- **Description:** Reconciliation API for account data exposed via WSO2 as part of DigiClientOperations API
- **Key Operations:**
  - POST /Account/create/{legalType} - Create new account
  - PUT /Account/{crmIdType}/{crmId}/update - Update existing account
  - PATCH /Account/{crmIdType}/{crmId}/updateKomunikace - Update communications
  - POST /Account/check - Check account status
  - PUT /Account/{crmIdType}/{crmId}/approve - Approve account
  - POST /Account/query - Query accounts with optional filtering by BCD timeframe
- **Data Objects:** Account
- **Impacted Systems:** CRM (source), DKCZ (target), DKSK (target), WSO2 (API gateway)

## Event Stream Topics

### JTB-CZ_PARTIES_ACCOUNT_SYNC_GNR
- **Purpose:** Continuous streaming of account changes for Czech market
- **Event Types:** Create, update, delete operations on customer accounts
- **Data Objects:** Account entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKCZ

### JTB-CZ_PARTIES_ACCOUNT_RCN_GNR
- **Purpose:** Initialization and reconciliation of account data for Czech market
- **Event Types:** Bulk reconciliation events
- **Data Objects:** Account entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKCZ

### JTB-SK_PARTIES_ACCOUNT_SYNC_GNR
- **Purpose:** Continuous streaming of account changes for Slovak market
- **Event Types:** Create, update, delete operations on customer accounts
- **Data Objects:** Account entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKSK

### JTB-SK_PARTIES_ACCOUNT_RCN_GNR
- **Purpose:** Initialization and reconciliation of account data for Slovak market
- **Event Types:** Bulk reconciliation events
- **Data Objects:** Account entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKSK

### JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Purpose:** Integration control and monitoring
- **Event Types:** Control messages
- **Data Objects:** Control stream metadata
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKCZ, DKSK

## Data Objects

### Account
Master customer account entity containing comprehensive client information for both individuals and business entities.

**Key Attributes:**
- **X-Correlation-ID** (string, optional): Correlation identifier for initialization and reconciliation
- **action** (string, optional): Operation type (create | update | delete), NULL for reconciliation
- **timestamp** (string, date-time, required): Date and time of operation
- **accountId** (string, uuid, required): Internal CRM GUID primary key
- **before** (object, optional): State before changes, NULL on create or reconciliation
- **after** (object, optional): State after changes, NULL on delete
- **AccountData** (object): Contains comprehensive account information including:
  - **accountKLID** (string): Client ID (KLID)
  - **legalType** (object): Legal entity type (individual | corporate)
  - **personalData**: Personal information (name, titles, gender, birth date/place, nationality, residency)
  - **businessData**: Corporate information (business name, registration, tax IDs, LEI)
  - **communicationData**: Contact details (phone, email, addresses)
  - **identificationData**: ID documents (passport, ID card, driving license)
  - **financialData**: Tax residency, PEP status, employment, income
  - **relationshipData**: Customer relationships, employee information
- **state** (object): Technical state management
  - **statecode**: Active (0) | Inactive (1)
  - **statuscode**: Various status codes
  - **anonymized** (boolean): Anonymization flag
  - **deleted** (boolean): Deletion flag
  - **merged** (boolean): Merge flag
  - **masterid** (string, uuid): Master record GUID on merge

**Business Identifiers:**
- Business Identifier: accountId
- Partition Key: accountId
- Business Change Date: timestamp

## Integration Points

### Publishing Systems
- **CRM**: Publishes all account changes via REST interface and CRM console for both CZ and SK markets

### Consuming Systems
- **DKCZ (Digital Channels CZ)**: Consumes account data for customer relationship management in Czech market
- **DKSK (Digital Channels SK)**: Consumes account data for customer relationship management in Slovak market

## Technical Implementation

### Event Characteristics
- **Trigger:** Any change on account object via REST interface or CRM console
- **Frequency:** Currently not estimated, to be reviewed based on practice
- **Note:** CRM object is richer than published portion, may cause identical messages with different BCDs
- **Data Quality:** Timestamp (BCD) will function, but change may occur on unpublished parameters

### Topic Selection
- Based on location parameter (cz, sk, czsk)
- If location = czsk, data object placed in both CZ and SK topics
- Separate continuous and reconciliation topics for each market

### Error Handling
- Duplicates may occur up to BCD level
- Consumers expected to handle deduplication
- Standard integration aspects apply

### API Parameters

**Reconciliation API:**
- Headers: X-Correlation-ID (required)
- Path params: legalType, crmIdType, crmId
- Query params (optional): from, to (BCD filtering)
- Query params (required): mode (sync | async)
- Body: AccountGUID, AccountKLID, AccountRC, AccountICO, AccountNID, AccountVID, AccountZAM

### Initialization
- Means sending all Account entities stored in CRM in last state
- Can be REST service or alternative format based on application owner preference
- Deleted entities are not transferred during initialization

## Capacity Requirements
- Current estimates not available
- Number of events per day: To be determined
- Volume per entity: To be determined
- Will be revised based on operational practice

## Summary Statistics
- **Total REST APIs:** 1 (Account Reconciliation with multiple operations)
- **Total Event Streams:** 5 (4 Account topics - 2 CZ + 2 SK, 1 Control)
- **Total Data Objects:** 1 (Account)
- **Total Impacted Systems:** 4 (CRM, DKCZ, DKSK, WSO2)

## Special Notes
- CRM object significantly richer than published portion
- May cause identical Kafka messages with only BCD (timestamp) changes
- Location parameter determines topic routing
- JSON schemas stored in centralized repository
- Supports both synchronous and asynchronous modes
- Initialization sends all accounts in last state only
- Separate handling for Czech and Slovak markets
