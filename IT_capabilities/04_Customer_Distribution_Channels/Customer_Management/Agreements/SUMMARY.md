# Agreements - Summary

## Overview
Agreements capability manages customer contracts and service agreements in the CRM system. This capability handles contract lifecycle management including contract creation, status tracking, and validity periods for various banking and investment service agreements. The system supports both Czech and Slovak markets and provides contract data to Digital Channels for customer service and compliance purposes.

## REST APIs

### CRM Contract Reconciliation
- **Description:** Reconciliation API for contract data exposed via WSO2 platform
- **Key Operations:**
  - GET /Contract/{contractId}?mode=async - Retrieve specific contract by ID
  - GET /Contract?from=xxx&to=yyy&mode=async&klientId=zzz&accountId=qqqq - Query contracts with optional filtering
- **Data Objects:** Contract
- **Impacted Systems:** CRM (source), DKCZ (target), DKSK (target), WSO2 (API gateway)

## Event Stream Topics

### JTB-CZ_PARTIES_CONTRACT_SYNC_GNR
- **Purpose:** Continuous streaming of contract changes for Czech market
- **Event Types:** Create, update, delete operations on contracts
- **Data Objects:** Contract entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKCZ

### JTB-CZ_PARTIES_CONTRACT_RCN_GNR
- **Purpose:** Initialization and reconciliation of contract data for Czech market
- **Event Types:** Bulk reconciliation events
- **Data Objects:** Contract entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKCZ

### JTB-SK_PARTIES_CONTRACT_SYNC_GNR
- **Purpose:** Continuous streaming of contract changes for Slovak market
- **Event Types:** Create, update, delete operations on contracts
- **Data Objects:** Contract entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKSK

### JTB-SK_PARTIES_CONTRACT_RCN_GNR
- **Purpose:** Initialization and reconciliation of contract data for Slovak market
- **Event Types:** Bulk reconciliation events
- **Data Objects:** Contract entity
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

### Contract
Entity representing customer service contracts and agreements with the bank.

**Key Attributes:**

**Header:**
- **X-Correlation-ID** (string, optional): Correlation identifier for initialization and reconciliation
- **action** (string, optional): Operation type (create | update | delete), NULL for reconciliation
- **timestamp** (string, date-time, required): Date and time of operation (Business Change Date)
- **contractId** (string, uuid, required): Internal CRM GUID primary key, always populated

**Top-Level:**
- **adpContractType** (string, enum): Contract type for ADP system (ignore | consign | framework | custody | management)

**Before/After Pattern:**
- **before** (object, optional): State before changes, NULL on create or reconciliation
- **after** (object, optional): State after changes, NULL on delete

**Contract Data (in before/after objects):**
- **accountId** (string, uuid, required): Client/company GUID in CRM
- **klientId** (string): Client ID (KLID), example: 1000018856
- **contractNumber** (string, required, max 40): Contract/instruction number
- **contractType** (string, max 2): Contract type API code (CI | PI | SI | SE)
- **location** (object, required): Contract location (cannot be ambiguous CZ+SK)
  - **value** (integer, required): CRM enumerator value, example: 500000000
  - **label** (string): Description from CRM (CZ | SK)
- **validFrom** (string, date-time): Validity start date
- **validTo** (string, date-time): Validity end date
- **contractStatus** (object): Closure status
  - **value** (integer, required): CRM enumerator value
  - **label** (string, required): Status description (nová | čeká na ověřovací platbu | k podpisu u klienta | k podpisu v bance | podepsaná | stornovaná)
- **conclusionType** (object): Method of conclusion
  - **value** (integer, required): CRM enumerator value
  - **label** (string, required): Conclusion method (Kurýrem | Na dálku | Tváří v tvář | Přes e-Portál | On-line)
- **reservedBankAccountNumber** (string, max 100): Reserved account number

**State Management:**
- **state** (object): Technical record state
  - **statecode** (object, required): State code
    - **value** (integer, required): 0 (Active) | 1 (Inactive)
    - **label** (string, required): Aktivní | Neaktivní
  - **statuscode** (object, required): Status code
    - **value** (integer, required): 1 (Active) | 2 (Inactive)
    - **label** (string, required): Aktivní | Neaktivní
  - **anonymized** (boolean): Record anonymization flag
  - **deleted** (boolean): Record deletion flag
  - **merged** (boolean): Record merge and deactivation flag
  - **masterid** (string, uuid): Master record GUID on merge

**Business Identifiers:**
- Business Identifier: contractId
- Partition Key: contractId
- Business Change Date: timestamp
- Business State: statusCode + anonymized + deleted

**Referenced Code Tables:**
- **Gender**: Not specified in documentation (marked as ???)
- **IdentityDocumentType**: Not specified in documentation (marked as ???)
- **SanctionListCheckResult**: Not specified in documentation (marked as ???)

## Integration Points

### Publishing Systems
- **CRM**: Publishes all contract changes via REST interface and CRM console for both CZ and SK markets

### Consuming Systems
- **DKCZ (Digital Channels CZ)**: Consumes contract data for service eligibility and customer information display
- **DKSK (Digital Channels SK)**: Consumes contract data for service eligibility and customer information display

## Technical Implementation

### Event Characteristics
- **Trigger:** Any change on contract object via REST interface or CRM console
- **Frequency:** Not specified in documentation
- **Pattern:** Before/After state tracking for audit trail

### API Parameters

**Reconciliation:**
- Path params: contractId (contract identifier)
- Headers: X-Correlation-ID (required)
- Query params (optional):
  - from: BCD filtering start date
  - to: BCD filtering end date
  - klientId: Client identifier
  - accountId: Account identifier
- Query params (required):
  - mode: async

### Initialization
- Means sending all contracts in last state
- Can be REST service or alternative format based on application owner preference

### Error Handling
- Duplicates may occur up to BCD level
- Consumers expected to handle deduplication
- Standard integration aspects apply

### Contract Types
**ADP Contract Types:**
- **ignore**: Not relevant for ADP processing
- **consign**: Consignment agreement
- **framework**: Framework agreement
- **custody**: Custody agreement
- **management**: Management agreement

**Contract API Codes:**
- **CI**: Custody Investment
- **PI**: Private Investment
- **SI**: Standard Investment
- **SE**: Securities

### Contract Lifecycle States
**Contract Status:**
1. nová (new)
2. čeká na ověřovací platbu (waiting for verification payment)
3. k podpisu u klienta (for signature at client)
4. k podpisu v bance (for signature at bank)
5. podepsaná (signed)
6. stornovaná (canceled)

**Conclusion Methods:**
1. Kurýrem (by courier)
2. Na dálku (remotely)
3. Tváří v tvář (face-to-face)
4. Přes e-Portál (via e-Portal)
5. On-line (online)

## Summary Statistics
- **Total REST APIs:** 1 (Contract Reconciliation)
- **Total Event Streams:** 5 (4 Contract topics - 2 CZ + 2 SK, 1 Control)
- **Total Data Objects:** 1 (Contract)
- **Total Impacted Systems:** 4 (CRM, DKCZ, DKSK, WSO2)

## Special Notes
- Contract cannot have ambiguous location (both CZ and SK)
- Location determines topic routing
- Before/after pattern enables full audit trail
- ADP contract type logic aligns with GetClient() for ePortal
- Location must be considered when interpreting ADP contract type
- JSON schemas stored in centralized repository
- Supports asynchronous mode only
- Initialization sends all contracts in last state
- Deleted/inactive entities tracked through state management
- Some code tables not yet defined (marked with ???)
