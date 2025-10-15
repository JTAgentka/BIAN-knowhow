# Campaign Management - Summary

## Overview
Campaign Management capability provides marketing list management and bank news distribution services through CRM system integration. The capability supports both static and dynamic marketing lists for customer segmentation, campaign targeting, and bank newsletter subscription management. Data is distributed through Kafka event streams and REST APIs for reconciliation and on-demand data retrieval. The system manages marketing lists for both Czech (DKCZ) and Slovak (DKSK) markets with support for Contact and Account member types.

## REST APIs

### CRM MarketingList - Reconciliation API
- **Description:** Provides reconciliation and initialization capabilities for marketing list data, bank news lists, and bank news settings. Exposed via WSO2 API Gateway.
- **Key Operations:**
  - GET /marketingList/list - Retrieve all marketing lists from a time interval
  - GET /marketingList/{marketingListId}/members - Retrieve members of a specific marketing list
  - GET /BankNews/List - Retrieve collection of existing bank news distributions
  - GET /bankNews/settings/{crmIdType}/{crmId} - Retrieve bank news settings for specific client/contact
  - PATCH /api/v1/BankNews/{identifierType}/{identifier}/subscribe - Subscribe to bank news distributions
  - PATCH /api/v1/BankNews/{identifierType}/{identifier}/unsubscribe - Unsubscribe from bank news distributions
- **Data Objects:** MarketingList, MarketingListMember, BankNewsList, BankNewsSettings
- **Impacted Systems:** CRM (publisher), DKCZ, DKSK (consumers), WSO2 (API gateway)

### API Parameters
- **Header Parameters (required):** X-Correlation-ID
- **Query Parameters (optional):** from, to, marketingListId, mode (sync/async)
- **Expected Frequency:** Units per day (low volume)

## Event Stream Topics

### JTB-HQ_CRM_MARKETING-LIST_SYNC_GNR
- **Purpose:** Continuous synchronization of marketing list changes
- **Event Types:** Continuous topic (SYNC)
- **Data Objects:** MarketingList entity with create/update/delete actions
- **Impacted Systems:** Publisher: CRM | Subscribers: DKCZ, DKSK

### JTB-HQ_CRM_MARKETING-LIST_RCN_GNR
- **Purpose:** Initialization and reconciliation of marketing list data
- **Event Types:** Initialization/Reconciliation topic (RCN)
- **Data Objects:** MarketingList entity in final state
- **Impacted Systems:** Publisher: CRM | Subscribers: DKCZ, DKSK

### JTB-HQ_CRM_MARKETING-LIST-MEMBERS_RCN_GNR
- **Purpose:** On-demand delivery of marketing list members via API call
- **Event Types:** Initialization/Reconciliation topic (RCN)
- **Data Objects:** MarketingListMember entity
- **Impacted Systems:** Publisher: CRM | Subscribers: DKCZ, DKSK

### JTB-HQ_CODEBOOKS_TECHNICAL_CB_GNR
- **Purpose:** Technical codebook distribution for bank news lists
- **Event Types:** Compact topic
- **Data Objects:** BankNewsList as technical codebook
- **Impacted Systems:** Publisher: CSC | Subscribers: DKCZ, DKSK

### JTB-HQ_CRM_BANK-NEWS-SETTINGS_SYNC_GNR
- **Purpose:** Continuous synchronization of bank news subscription settings
- **Event Types:** Continuous topic (SYNC)
- **Data Objects:** BankNewsSettings entity with create/update/delete actions
- **Impacted Systems:** Publisher: CRM | Subscribers: DKCZ, DKSK

### JTB-HQ_CRM_BANK-NEWS-SETTINGS_RCN_GNR
- **Purpose:** Initialization and reconciliation of bank news settings
- **Event Types:** Initialization/Reconciliation topic (RCN)
- **Data Objects:** BankNewsSettings entity in final state
- **Impacted Systems:** Publisher: CRM | Subscribers: DKCZ, DKSK

### JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Purpose:** Control stream for integration monitoring
- **Event Types:** Control topic
- **Data Objects:** Integration control messages
- **Impacted Systems:** Subscribers: DKCZ, DKSK

## Data Objects

### MarketingList
**Description:** Core marketing list entity representing campaign targeting lists
**Key Attributes:**
- marketingListId (string, UUID) - Primary identifier (BID)
- timestamp (string, date-time) - Business change date (BCD)
- listName (string) - Marketing list name
- description (string) - Marketing list description
- memberCount (integer) - Number of members for static lists
- isDynamic (boolean) - Flag indicating dynamic list
- memberPartyType (string) - Type of list subscribers (contact|account)
- mailmanId (string) - Mailman application identifier
- bankNewsIdentifier (string) - Bank newsletter identifier for subscribe/unsubscribe operations
- action (string) - Operation type (create|update|delete)
- state (object) - Technical record state with statecode, statuscode, anonymized, deleted, merged, masterid

### MarketingListMember
**Description:** Members of marketing lists with detailed customer information for campaign execution
**Delivery Methods:**
- Synchronous: REST API response with mode=sync
- Asynchronous: Kafka topic with mode=async (requires X-Correlation-ID)

**Key Attributes:**
- marketingListId (string, UUID) - Marketing list identifier (BID)
- memberId (string, UUID) - Member identifier (BID)
- timestamp (string, date-time) - Business change date (BCD)
- memberType (string) - Member type (Account|Contact)
- name (string) - First name
- surname (string) - Last name
- klientId (string) - Client ID (KLID)
- email (string) - Email address
- location (string) - Location
- gender (string) - Gender
- salutationCZ (string) - Czech salutation
- salutationSK (string) - Slovak salutation
- levelService (string) - Service level
- bankerName, bankerSurname, bankerEmail, bankerPhone (string) - Assigned banker details
- preferredLanguage (string) - Preferred language
- magnusPoints (number) - Magnus loyalty points from CRM
- yesterdayMagnusPoints (number) - Previous day Magnus points from AXA
- primaryPhone (string) - Primary phone number
- messageFromBankId (string) - GUID of client's bank news settings entity

### BankNewsList
**Description:** Collection of available bank newsletter distributions (technical codebook)
**Delivery:** Provided via technical codebook topic (JTB-HQ_CODEBOOKS_TECHNICAL_CB_GNR)
**Key Attributes:**
- Identifier used for subscribe/unsubscribe methods
- List of available bank news distributions in CRM system

### BankNewsSettings
**Description:** Client/contact subscription settings for bank newsletters
**Delivery Methods:**
- REST API: GET /api/v1/BankNews/settings/{identifierType}/{identifier}
- Kafka topics: SYNC and RCN topics
- Update operations: PATCH subscribe/unsubscribe endpoints

**Key Attributes:**
- Settings for individual bank news subscriptions per client/contact
- Boolean flags for each newsletter subscription
- Updated by client subscribe/unsubscribe actions

## Integration Points

### Publishing Systems
- **CRM (Microsoft Dynamics):** Publishes marketing lists, marketing list members (on-demand), and bank news settings. Source system for all marketing and campaign data.
- **CSC (Codebook Service Center):** Publishes BankNewsList as technical codebook for available bank news distributions.

### Consuming Systems
- **DKCZ (Czech Digital Banking):** Consumes all marketing list topics and bank news topics for Czech market campaign execution and newsletter distribution.
- **DKSK (Slovak Digital Banking):** Consumes all marketing list topics and bank news topics for Slovak market campaign execution and newsletter distribution.

### Integration Infrastructure
- **WSO2 API Gateway:** Exposes reconciliation and initialization REST APIs for marketing lists and bank news.
- **Kafka:** Event streaming platform for continuous synchronization and reconciliation topics.

## Event Publication Triggers and Frequency

### MarketingList
- **Trigger:** Save of new attribute values in CRM
- **Frequency:** Units per day
- **Topics:** Both SYNC and RCN available

### MarketingListMember
- **Trigger:** API call to /marketingList/{marketingListId}/members
- **Frequency:** Units per day
- **Topics:** RCN topic only (no continuous sync)
- **Note:** Members do not have continuous topic, only on-demand via API

### BankNewsList
- **Trigger:** Save of new values / API call
- **Frequency:** Less than once per day
- **Topics:** Technical codebook topic

### BankNewsSettings
- **Trigger:** Save of new values / API call / client subscribe/unsubscribe action
- **Frequency:** Units to tens per day
- **Topics:** Both SYNC and RCN available
- **Note:** Frequency may be lower during large distributions or new campaigns

## Topic Configuration Requirements
- **Partitions:** 8 (codebook: 1)
- **Replicas:** 3
- **Retention Period:** 6 days

## Summary Statistics
- **Total REST APIs:** 2 (MarketingList Reconciliation API, BankNews Reconciliation API)
- **Total Event Streams:** 7 topics (2 for MarketingList, 1 for MarketingListMembers, 1 for BankNewsList codebook, 2 for BankNewsSettings, 1 control stream)
- **Total Data Objects:** 4 entities (MarketingList, MarketingListMember, BankNewsList, BankNewsSettings)
- **Total Impacted Systems:** 5 (CRM, CSC, DKCZ, DKSK, WSO2)

## Business Identifiers (BID) and Change Dates (BCD)
- **MarketingList:** BID = marketingListId, BCD = timestamp
- **MarketingListMember:** BID = marketingListId + memberId, BCD = timestamp
- **Event Key Definition:** businessChangeDate

## Notes
- Marketing list members are not synchronized continuously - they are only provided on-demand via API call
- BankNews will be implemented using codebook approach - specific codebook topic name to be added when available
- Both synchronous (REST response) and asynchronous (Kafka topic) modes are supported for member retrieval
- System supports both Czech and Slovak markets with separate consuming systems
- Member types include both Account (corporate) and Contact (individual) entities
- Integration supports GDPR operations: anonymization, deletion, and record merging
