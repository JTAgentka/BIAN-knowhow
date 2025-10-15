# Reference Data - Summary

## Overview
Reference Data capability manages banker and broker relationship information for customers in the CRM system. This capability provides critical reference data about personal bankers (account managers) and brokers (Magnus) assigned to customers, enabling Digital Channels to display appropriate contact information and route customer inquiries to the correct banking professionals. The system maintains contact details, expertise areas, and assignment relationships for both Czech and Slovak markets.

## REST APIs

### CRM PersonalBanker Reconciliation
- **Description:** Reconciliation API for personal banker assignments exposed via WSO2 as part of DigiClientOperations/v2 API
- **Key Operations:**
  - POST /PersonalBanker - Query personal banker data with filtering by client identifiers and BCD timeframe
- **Data Objects:** PersonalBanker
- **Impacted Systems:** CRM (source), DKCZ (target), DKSK (target), WSO2 (API gateway)

### CRM Magnus Reconciliation
- **Description:** Reconciliation API for broker (Magnus) assignments exposed via WSO2 platform
- **Key Operations:**
  - POST /Magnus/query - Query Magnus (broker) data with optional filtering
- **Data Objects:** Magnus
- **Impacted Systems:** CRM (source), DKCZ (target), DKSK (target), WSO2 (API gateway)

## Event Stream Topics

### PersonalBanker Topics

#### JTB-CZ_PARTIES_PERSONAL-BANKER_SYNC_GNR
- **Purpose:** Continuous streaming of personal banker assignment changes for Czech market
- **Event Types:** Banker assignment, contact information updates
- **Data Objects:** PersonalBanker entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKCZ

#### JTB-CZ_PARTIES_PERSONAL-BANKER_RCN_GNR
- **Purpose:** Reconciliation of personal banker data for Czech market
- **Event Types:** Bulk reconciliation events
- **Data Objects:** PersonalBanker entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKCZ

#### JTB-SK_PARTIES_PERSONAL-BANKER_SYNC_GNR
- **Purpose:** Continuous streaming of personal banker assignment changes for Slovak market
- **Event Types:** Banker assignment, contact information updates
- **Data Objects:** PersonalBanker entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKSK

#### JTB-SK_PARTIES_PERSONAL-BANKER_RCN_GNR
- **Purpose:** Reconciliation of personal banker data for Slovak market
- **Event Types:** Bulk reconciliation events
- **Data Objects:** PersonalBanker entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKSK

### Magnus Topics

#### JTB-CZ_PARTIES_MAGNUS_SYNC_GNR
- **Purpose:** Continuous streaming of Magnus (broker) assignment changes for Czech market
- **Event Types:** Broker assignment, contact information updates
- **Data Objects:** Magnus entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKCZ

#### JTB-CZ_PARTIES_MAGNUS_RCN_GNR
- **Purpose:** Reconciliation of Magnus data for Czech market
- **Event Types:** Bulk reconciliation events
- **Data Objects:** Magnus entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKCZ

#### JTB-SK_PARTIES_MAGNUS_SYNC_GNR
- **Purpose:** Continuous streaming of Magnus (broker) assignment changes for Slovak market
- **Event Types:** Broker assignment, contact information updates
- **Data Objects:** Magnus entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKSK

#### JTB-SK_PARTIES_MAGNUS_RCN_GNR
- **Purpose:** Reconciliation of Magnus data for Slovak market
- **Event Types:** Bulk reconciliation events
- **Data Objects:** Magnus entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKSK

### Control Stream

#### JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Purpose:** Integration control and monitoring
- **Event Types:** Control messages
- **Data Objects:** Control stream metadata
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKCZ, DKSK

## Data Objects

### PersonalBanker
Entity containing information about personal bankers (account managers) assigned to customers.

**Key Attributes:**
- **X-Correlation-ID** (string, optional): Correlation identifier for INIT and RECON
- **timestamp** (string, date-time, required): Date and time of change (Business Change Date)
- **client** (object, required): Customer information
  - **crmId** (string, required): Client CRM identifier (KLID), length 10
- **banker** (object, required): Personal banker information
  - **crmId** (string): Banker CRM identifier
  - **domainName** (string): Banker domain name (e.g., JTBA\\JT8100008)
  - **firstName** (string): Banker first name
  - **lastName** (string): Banker last name
  - **degreeBeforeId** (string): Title before name
  - **degreeAfterId** (string): Title after name
  - **email** (string): Banker email address
  - **phone** (string): Banker phone number
  - **mobilePhone** (string): Banker mobile phone
  - **branch** (object): Banker's branch assignment
    - **branchId** (string): Branch identifier
    - **branchName** (string): Branch name
  - **location** (object): Market location (CZ | SK)
- **relationshipType** (string, enum): Type of banker-client relationship (primary | secondary | team_member)
- **assignmentStart** (string, date-time): Relationship start date
- **assignmentEnd** (string, date-time): Relationship end date

**Business Identifiers:**
- Business Identifier: client.crmId
- Business Change Date: timestamp
- Partition Key: client.crmId (location-based topic routing)

**Note:** Topics cannot be simply divided by location parameter - not all objects have it populated.

### Magnus
Entity containing information about Magnus brokers assigned to customers for investment services.

**Key Attributes:**
- **X-Correlation-ID** (string, optional): Correlation identifier for INIT and RECON
- **timestamp** (string, date-time, required): Date and time of change (Business Change Date)
- **client** (object, required): Customer information
  - **crmId** (string, required): Client CRM identifier (KLID), length 10
- **magnus** (object, required): Magnus broker information
  - **crmId** (string): Magnus CRM identifier
  - **domainName** (string): Magnus domain name
  - **firstName** (string): First name
  - **lastName** (string): Last name
  - **degreeBeforeId** (string): Title before name
  - **degreeAfterId** (string): Title after name
  - **email** (string): Email address
  - **phone** (string): Phone number
  - **mobilePhone** (string): Mobile phone
  - **expertise** (array): Investment expertise areas
  - **location** (object): Market location (CZ | SK)
- **assignmentStart** (string, date-time): Relationship start date
- **assignmentEnd** (string, date-time): Relationship end date
- **productScope** (array): Investment products in scope (stocks, bonds, funds, derivatives)

**Business Identifiers:**
- Business Identifier: client.crmId
- Business Change Date: timestamp
- Partition Key: client.crmId (location-based topic routing)

## Integration Points

### Publishing Systems
- **CRM**: Publishes banker and broker assignment changes via REST interface and CRM console for both CZ and SK markets

### Consuming Systems
- **DKCZ (Digital Channels CZ)**: Consumes banker/broker data to display contact information and route customer inquiries
- **DKSK (Digital Channels SK)**: Consumes banker/broker data to display contact information and route customer inquiries

## Technical Implementation

### Event Characteristics

**PersonalBanker:**
- **Trigger:** Any change on PersonalBanker object via REST interface or CRM console
- **Frequency:** Currently not estimated, to be revised based on practice
- **Note:** CRM object richer than published portion - may cause identical messages with only BCD changes

**Magnus:**
- **Trigger:** Any change on Magnus object via REST interface or CRM console
- **Frequency:** Not specified in documentation
- **Note:** Similar data richness considerations as PersonalBanker

### API Parameters

**PersonalBanker Reconciliation:**
- Service: DigiClientOperations/v2
- Method: POST /PersonalBanker
- Headers: X-Correlation-ID (required)
- Body params: AccountGUID, AccountKLID, rc, ico, nidmvid, zam (one of these required)
- Query params (optional):
  - from: BCD filtering start date
  - to: BCD filtering end date
  - location: Market filter (cz | sk) - filters questionnaires belonging to CZ or SK clients
- Query params (required):
  - mode: async

**Magnus Reconciliation:**
- Method: POST /Magnus/query
- Headers: X-Correlation-ID (required)
- Query params (optional): Similar to PersonalBanker
- Query params (required): mode: async

### Initialization

**PersonalBanker:**
- Sends all banker and broker contacts in last state for clients
- Can be REST service or alternative format based on application owner preference

**Magnus:**
- Sends all Magnus broker assignments in last state
- Similar flexibility in implementation approach

### Error Handling
- Duplicates may occur up to BCD level
- Consumers expected to handle deduplication
- Standard integration aspects apply

### Special Considerations
- Topics cannot be simply divided by location parameter
- Not all objects have location populated
- Some assignments may span both markets

## Capacity Requirements

### PersonalBanker
- **Total Records:** Approximately 250,000 records
- **Daily Changes:** Tens of records daily (estimated)
- **Bulk Operations:** Occasional mass updates affecting hundreds to thousands of clients (planned operations by CRM administrators, not user-initiated)

### Magnus
- **Total Records:** Not specified
- **Daily Changes:** Not specified
- **Bulk Operations:** Similar pattern to PersonalBanker expected

## Summary Statistics
- **Total REST APIs:** 2 (PersonalBanker Reconciliation, Magnus Reconciliation)
- **Total Event Streams:** 9 (4 PersonalBanker topics - 2 CZ + 2 SK, 4 Magnus topics - 2 CZ + 2 SK, 1 Control)
- **Total Data Objects:** 2 (PersonalBanker, Magnus)
- **Total Impacted Systems:** 4 (CRM, DKCZ, DKSK, WSO2)

## Special Notes
- PersonalBanker represents account managers for general banking services
- Magnus represents specialized investment brokers
- Topics cannot be divided simply by location - not all objects have location populated
- Bulk updates occasionally performed by CRM administrators (not end users)
- CRM object significantly richer than published data
- May generate identical messages with only BCD changes
- Supports multiple relationship types (primary banker, secondary support, team members)
- Magnus includes expertise and product scope information for investment services
- JSON schemas stored in centralized repository
- Both APIs require asynchronous mode
- Location parameter used to filter client assignments when available
- Initialization sends all contacts in last state
