# Access Entitlement - Summary

## Overview
Access Entitlement capability manages customer access rights and disposition permissions for banking accounts and investment portfolios. The system handles authorized account relationships and disposition rights across multiple banking channels (internet banking, mobile banking), enabling secure multi-user access control. This capability includes specialized workaround solutions for integration with legacy systems like KUL (eBroker).

## REST APIs

### CRM AuthorizedAccount Reconciliation
- **Description:** Reconciliation API for authorized account data exposed via WSO2 as part of DigiClientOperations API
- **Key Operations:**
  - POST /AuthorizedAccount/query - Query authorized accounts with optional filtering
  - Supports both sync and async modes
- **Data Objects:** AuthorizedAccount
- **Impacted Systems:** CRM (source), DKCZ (target), DKSK (target), WSO2 (API gateway)

### DispositionRights Reconciliation
- **Description:** Reconciliation API for disposition rights (NOTE: Excluded from IAV16 release as of 14.02.2023)
- **Key Operations:**
  - POST /dispositionRight/query - Query disposition rights with filtering
- **Data Objects:** DispositionRights
- **Impacted Systems:** DKCZ (source/target), DKSK (source/target)

## Event Stream Topics

### CRM AuthorizedAccount Topics

#### JTB-HQ_PARTIES_AUTHORIZED-ACCOUNT_SYNC_GNR
- **Purpose:** Continuous streaming of authorized account changes
- **Event Types:** Create, update, delete operations on authorized accounts
- **Data Objects:** AuthorizedAccount entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKCZ, DKSK

#### JTB-HQ_PARTIES_AUTHORIZED-ACCOUNT_RCN_GNR
- **Purpose:** Initialization and reconciliation of authorized account data
- **Event Types:** Bulk reconciliation events
- **Data Objects:** AuthorizedAccount entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKCZ, DKSK

### DispositionRights Topics

#### JTB-CZ_PARTIES_DISPOSITION-RIGHTS_SYNC_GNR
- **Purpose:** Continuous streaming of disposition rights changes for Czech market
- **Event Types:** Permission grants, revocations, modifications
- **Data Objects:** DispositionRights entity
- **Impacted Systems:**
  - Publishers: DKCZ
  - Subscribers: Backend systems

#### JTB-CZ_PARTIES_DISPOSITION-RIGHTS_RCN_GNR
- **Purpose:** Reconciliation of disposition rights for Czech market
- **Event Types:** Bulk reconciliation events
- **Data Objects:** DispositionRights entity
- **Impacted Systems:**
  - Publishers: DKCZ
  - Subscribers: Backend systems

#### JTB-SK_PARTIES_DISPOSITION-RIGHTS_SYNC_GNR
- **Purpose:** Continuous streaming of disposition rights changes for Slovak market
- **Event Types:** Permission grants, revocations, modifications
- **Data Objects:** DispositionRights entity
- **Impacted Systems:**
  - Publishers: DKSK
  - Subscribers: Backend systems

#### JTB-SK_PARTIES_DISPOSITION-RIGHTS_RCN_GNR
- **Purpose:** Reconciliation of disposition rights for Slovak market
- **Event Types:** Bulk reconciliation events
- **Data Objects:** DispositionRights entity
- **Impacted Systems:**
  - Publishers: DKSK
  - Subscribers: Backend systems

### Control Stream

#### JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Purpose:** Integration control and monitoring
- **Event Types:** Control messages
- **Data Objects:** Control stream metadata
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKCZ, DKSK

## Data Objects

### AuthorizedAccount
Manages bank account authorization and access relationships.

**Key Attributes:**
- **bankAccountId** (string, required): Internal CRM GUID primary key
- **action** (string, optional): Operation type (create | update | delete), NULL for reconciliation
- **timestamp** (string, date-time): Date and time of operation
- **before** (object, optional): State before changes, NULL on create or reconciliation
- **after** (object, optional): State after changes, NULL on delete
- **BankAccountData** (object): Contains detailed account information
  - **accountId** (string, uuid): Customer/company GUID in CRM
  - **klientId** (string): Client ID (KLID)
  - **contractId** (string, uuid): Contract GUID in CRM
  - **portfolioKid** (string): Portfolio KID
  - **accountNumber** (string): Account number without bank code
  - **bankCode** (string): Bank code
  - **iban** (string): IBAN format account number
  - **specificSymbol** (string): Specific symbol
  - **bic** (string): BIC/SWIFT code
  - **order** (integer): Order/priority
  - **variableSymbol** (string): Variable symbol
  - **description** (string): Description
  - **validFrom** (string, date-time): Validity start date
  - **validTo** (string, date-time): Validity end date
  - **currency** (string, required): Currency code (CZK | EUR | USD)
  - **bankAccountKind** (object): Account kind enumeration
  - **bankAccountType** (object): Account type enumeration
- **state** (object): State management
  - **statecode**: Active (0) | Inactive (1)
  - **statuscode**: Active (1) | Inactive (2)
  - **anonymized** (boolean): Record anonymization flag
  - **deleted** (boolean): Record deletion flag
  - **merged** (boolean): Record merge flag
  - **masterid** (string, uuid): Master record GUID on merge

**Business Identifiers:**
- Business Identifier: bankAccountId
- Partition Key: bankAccountId
- Business Change Date: timestamp

### DispositionRights
Manages user permissions and authorization for investment portfolios across channels.

**Key Attributes:**
- **X-Correlation-ID** (string, optional): Correlation identifier for INIT and RECON
- **businessChangeDate** (string, date-time, required): Last entity modification timestamp
- **disponent** (object, required): User receiving permissions
  - **crmId** (string, required): CRM identifier, length 10
- **updatedBy** (object, optional): User who made the change
  - **crmId** (string): CRM identifier
  - **bankerDomainName** (string): Domain name of banker making change (e.g., JTBA\\JT8100008)
- **businessChangeApp** (string, required): Application where change occurred (digitalBankingCZ | mobileBankingCZ | onbehalfBankingCZ)
- **businessChangeChannel** (string, required): Channel of change (web | callcentrum | private)
- **products** (object, required): Products container
  - **investment** (object): Investment products
    - **portfolios** (array): Collection of portfolio permissions
      - **portfolioIds** (object): Portfolio identifiers
        - **ebrokerId** (integer, required): eBroker portfolio ID
        - **topasId** (integer): TOPAS (KID) portfolio ID
        - **taId** (integer): TA account ID
      - **authorizations** (array): Authorization collection
        - **channel** (string, required): Channel reference (from Channels codebook)
        - **disponentRights** (array, required): Rights collection (from DisponentRights codebook - read | buyOrder | sellOrder)

**Business Identifiers:**
- Business Identifier: disponent.crmId
- Business Change Date: businessChangeDate
- Partition Key: disponent.crmId

## Integration Points

### Publishing Systems
- **CRM**: Publishes authorized account changes via REST API and Event Stream for both CZ and SK markets
- **DKCZ**: Publishes disposition rights changes for Czech market via Kafka topics, triggers on permission model changes in WAC
- **DKSK**: Publishes disposition rights changes for Slovak market via Kafka topics

### Consuming Systems
- **DKCZ (Digital Channels CZ)**: Consumes authorized account data and disposition rights for access control
- **DKSK (Digital Channels SK)**: Consumes authorized account data and disposition rights for access control
- **KUL (eBroker)**: Consumes disposition rights via SOAP workaround (see special processes below)

## Workaround Solutions and Special Processes

### DispositionRightsForKUL - Workaround API
Specialized integration for communicating disposition rights to KUL (eBroker) using legacy SOAP web service.

**Service:** zapisPravaPristupovehoUctuKPfDK (SOAP)
- **Platform:** WSO2
- **Purpose:** Write access rights for user accounts in eBroker trading system
- **Protocol:** SOAP with security context header

**Transformation Mapping:**

Write Rights Transformation:
- DispositionRights topic data → SOAP request mapping
- CrmId → userId
- ebrokerId → idPortfolio
- disponentRights array → prava array with specific transformations:
  - buyOrder → opr_pok_web, opr_pok_pisemne, opr_pok_email, opr_pok_telefon
  - sellOrder → opr_pok_web, opr_pok_pisemne, opr_pok_email, opr_pok_telefon
  - read → opr_cteni

Delete Rights Transformation:
- When portfolio = null in topic → empty prava element in SOAP request (removes all rights)

**Special Handling:**
- Multiple portfolios: Service processes one portfolio per call, application iterates for each portfolio
- Per-portfolio SOAP invocation for users with multiple portfolios
- Automatic transformation from DispositionRights event to SOAP format

**Technical Flow:**
1. Application consumes DispositionRights topic
2. Performs data mapping per transformation tables
3. For each portfolio: invokes SOAP service
4. Handles null portfolio as rights removal

## Technical Implementation

### Event Characteristics

**AuthorizedAccount:**
- Trigger: Any change on account object via REST interface or CRM console
- Frequency: Currently not estimated
- Note: CRM object richer than published portion, may cause identical messages with different BCDs
- Deduplication: Required by consumers up to BCD level

**DispositionRights:**
- Trigger: Any change in DKCZ disposition model affecting KUL-replicated rights, including WAC operator actions and future Kafka message responses
- Frequency: Not specified
- Note: Cannot be simply divided by location parameter (not all objects have it populated)

### Error Handling
- Duplicates expected up to BCD level
- Consumers must implement deduplication
- Standard integration aspects apply

### API Parameters

**AuthorizedAccount Reconciliation:**
- Headers: X-Correlation-ID (required)
- Query params: from, to (optional), mode (required: sync | async)
- Body: accountGUID, accountKLID

**DispositionRights Reconciliation:**
- Headers: X-Correlation-ID, traceparent (required)
- Query params: businessChangeDateStart, businessChangeDateEnd (optional)
- Body: owner.crmId, portfolioIds.topasId

## Summary Statistics
- **Total REST APIs:** 2 (AuthorizedAccount Reconciliation, DispositionRights Reconciliation)
- **Total Event Streams:** 7 (4 Disposition Rights topics - 2 CZ + 2 SK, 2 Authorized Account topics, 1 Control)
- **Total Data Objects:** 2 (AuthorizedAccount, DispositionRights)
- **Total Impacted Systems:** 6 (CRM, DKCZ, DKSK, WSO2, KUL/eBroker, WAC)
- **Total Workaround Solutions:** 1 (DispositionRightsForKUL SOAP integration)

## Special Notes
- DispositionRights recon API excluded from IAV16 release (decision date: 14.02.2023)
- Topics cannot be divided by location parameter for disposition rights
- Potential for circular dependencies in future Kafka message-driven disposition changes
- SOAP workaround required for legacy KUL system integration
- Location-specific topics for CZ and SK markets maintained separately
- JSON schemas stored in centralized repository
- Initialization sends all authorized accounts in last state, deleted entities not transferred
