# Currency Exchange (FxRates) - Summary

## Overview
The Currency Exchange capability manages foreign exchange rates through three main data entities: FxRateLists (reference data), FxRatesInstant (intraday trading rates), and FxRatesDaily (daily reference rates from CNB and ECB). The system sources data from CSC (codebook system) and CCP (currency pricing platform) and publishes rate updates to data warehouses via Kafka topics. This capability supports both continuous rate updates and reconciliation processes for data consistency.

## REST APIs

### FxRates Reconciliation API
- **Description:** Provides reconciliation and initialization capabilities for FX rate data with temporal filtering
- **Key Operations:**
  - POST /fxRatesInstant/query/ - Reconcile intraday FX rates
  - POST /fxRatesDaily/query/ - Reconcile daily FX rates
- **Data Objects:** FxRatesInstant, FxRatesDaily
- **Parameters:**
  - Header (required): X-Correlation-ID, X-Request-ID
  - Body (optional): validityDateStart, validityDateEnd, businessChangeDateStart, businessChangeDateEnd, fxRateListId
- **Reconciliation Logic:**
  - If businessChangeDate interval defined: resend entities changed within that interval (current states only)
  - If businessChangeDate interval not defined: resend entities changed in last 3 months (current states only)
  - Status "deleted" entities are included in reconciliation
- **Initialization:** Triggers flow of all historical events from 2015 (deleted entities excluded)
- **Impacted Systems:**
  - Source: CCP (via WSO2)
  - Consumers: DKCZ, DKSK (via Kafka reconciliation topics)

## Event Stream Topics

### FxRatesInstant Event Stream
- **Purpose:** Publishes intraday foreign exchange rates (trading rates) updated multiple times per day
- **Event Types:**
  - Continuous/Ongoing events (STREAM)
  - Initialization/Reconciliation events (RCN)
  - Control events (CONTROL_STREAM)
- **Data Objects:** FxRatesInstant (contains currency pairs with buy/middle/sell rates and deviations)
- **Impacted Systems:**
  - **Publisher:** CCP (via Kafka Connector)
  - **Subscribers:** KStreams (for processing), DKCZ, DKSK (for analytics)

#### Topic Details:
| Topic Name | Type | Publisher | Consumer |
|------------|------|-----------|----------|
| JTB-HQ_EXCHANGE-RATES_FX-RATE-CONTINUOUS_SYNC_APP | Continuous | CCP - kafka conn | KStreams |
| JTB-HQ_EXCHANGE-RATES_FXRATES-INSTANT_STREAM_GNR | Continuous | CCP - kafka conn | DKCZ, DKSK |
| JTB-HQ_EXCHANGE-RATES_FX-RATES-INIT-AND-RECON_RSYNC_APP | Init/Recon | CCP - kafka conn | KStreams |
| JTB-HQ_EXCHANGE-RATES_FXRATES-INSTANT_RCN_GNR | Init/Recon | CCP - kafka conn | DKCZ, DKSK |

### FxRatesDaily Event Stream
- **Purpose:** Publishes daily foreign exchange rates from CNB and ECB, updated approximately once per business day
- **Event Types:**
  - Continuous/Ongoing events (STREAM)
  - Initialization/Reconciliation events (RCN)
  - Control events (CONTROL_STREAM)
- **Data Objects:** FxRatesDaily (contains currency pairs with middle rates only)
- **Impacted Systems:**
  - **Publisher:** CCP (via Kafka Connector, datafeed import)
  - **Subscribers:** KStreams (for processing), DKCZ, DKSK (for analytics)

#### Topic Details:
| Topic Name | Type | Publisher | Consumer |
|------------|------|-----------|----------|
| JTB-HQ_EXCHANGE-RATES_FX-RATE-CONTINUOUS_SYNC_APP | Continuous | CCP - kafka conn | KStreams |
| JTB-HQ_EXCHANGE-RATES_FXRATES-DAILY_STREAM_GNR | Continuous | CCP - kafka conn | DKCZ, DKSK |
| JTB-HQ_EXCHANGE-RATES_FX-RATES-INIT-AND-RECON_RSYNC_APP | Init/Recon | CCP - kafka conn | KStreams |
| JTB-HQ_EXCHANGE-RATES_FXRATES-DAILY_RCN_GNR | Init/Recon | CCP - kafka conn | DKCZ, DKSK |

### FxRateLists Event Stream (Codebook)
- **Purpose:** Publishes reference codebook of available FX rate lists
- **Event Types:** Compact codebook
- **Data Objects:** FxRateLists
- **Impacted Systems:**
  - **Publisher:** CSC
  - **Subscribers:** DKCZ, DKSK

#### Topic Details:
| Topic Name | Type | Publisher | Consumer |
|------------|------|-----------|----------|
| JTB-HQ_CODEBOOKS_BUSINESS_CB_GNR | Codebook - Compact | CSC | DKCZ, DKSK |

### Control Stream Topics
| Topic Name | Type | Publisher | Consumer |
|------------|------|-----------|----------|
| JTB-HQ_INTEGRATION_CONTROL_SYNC_APP | Continuous | CCP - kafka conn | KStreams |
| JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR | Control | KStreams | DKCZ, DKSK |

## Data Objects

### FxRateLists
A reference codebook defining available foreign exchange rate lists.

**Key Attributes:**
- **codeBookId** (string): Codebook identifier (part of business identifier and KEY)
- **version** (number): Version of the codebook (part of business identifier)
- **status** (enum): active | deleted
- **bandCeilingCurrency** (string, 3 chars): Currency code (ISO 4217)
- **homeCurrency** (string, 3 chars): Home currency code (ISO 4217)
- **baseCurrency** (string, 3 chars): Base currency code (ISO 4217)
- **quoteCurrency** (string, 3 chars): Quote currency code (ISO 4217)

**Source:** CSC (Central Service Core)

### FxRatesInstant
Intraday foreign exchange rates with buy/sell spreads, updated multiple times daily.

**Key Attributes:**
- **fxRateListId** (string, 1-30 chars): FX rate list identifier - Business Identifier and KEY
- **validityDate** (date-time): Start date and time of validity - Business Identifier
- **businessChangeDate** (date-time): Date and time of publication (BCD - Business Change Date)
- **status** (enum): active | deleted (BUSINESS_STATE)
- **currencyRates** (array): Collection of currency rate pairs
  - **baseCurrency** (string, 3 chars): ISO 4217 currency code being priced
  - **baseAmount** (integer, >0): Amount of base currency
  - **quoteCurrency** (string, 3 chars): ISO 4217 pricing currency code
  - **buy** (number, optional, >0): Buy rate
  - **middle** (number, optional, >0): Middle rate
  - **sell** (number, optional, >0): Sell rate
  - **refRateValidityDate** (date, optional): Reference rate validity date
  - **buyRefDeviation** (number, optional): Buy rate deviation from ECB reference [pct]
  - **middleRefDeviation** (number, optional): Middle rate deviation from ECB reference [pct]
  - **sellRefDeviation** (number, optional): Sell rate deviation from ECB reference [pct]
  - **buyPrevDiff** (number, optional): Buy rate change from previous day's last value [pct]
  - **middlePrevDiff** (number, optional): Middle rate change from previous day's last value [pct]
  - **sellPrevDiff** (number, optional): Sell rate change from previous day's last value [pct]
- **X-Correlation-ID** (string, optional): Correlation identifier

**Source:** CCP (Currency Pricing Platform)
**Trigger:** Saving new values in editor, approximately once per business day, possibly multiple times
**Volume:** ~1 update = ~165 records

### FxRatesDaily
Daily foreign exchange rates from CNB (Czech National Bank) and ECB (European Central Bank).

**Key Attributes:**
- **fxRateListId** (string, 1-30 chars): FX rate list identifier - Business Identifier and KEY
- **validityDate** (date): Start date of validity - Business Identifier
- **businessChangeDate** (date-time): Date and time of publication (BCD)
- **status** (enum): active | deleted (BUSINESS_STATE)
- **currencyRates** (array): Collection of currency rate pairs
  - **baseCurrency** (string, 3 chars): ISO 4217 currency code being priced
  - **baseAmount** (integer, >0): Amount of base currency
  - **quoteCurrency** (string, 3 chars): ISO 4217 pricing currency code
  - **middle** (number, >0): Middle rate (required)
- **X-Correlation-ID** (string, optional): Correlation identifier

**Source:** CCP (imported via datafeed)
**Trigger:** Datafeed import, approximately once per business day, possibly multiple times; CNB and ECB updates are separate events
**Volume:** ~1 update = ~84 records (2 events: CNB 49 records, ECB 35 records)

## Integration Points

### Publishing Systems
- **CSC (Central Service Core)**: Publishes FxRateLists codebook defining available rate lists and their properties. Provides master reference data for FX rate types.
- **CCP (Currency Pricing Platform)**:
  - Publishes FxRatesInstant with intraday trading rates updated by traders via editor
  - Publishes FxRatesDaily with reference rates imported from CNB and ECB datafeeds
  - Creates and manages interface tables for Kafka consumption
  - Provides reconciliation REST API via WSO2

### Consuming Systems
- **KStreams**: Intermediate processing layer that transforms and routes FX rate events from source topics to consumer topics
- **DKCZ**: Czech data warehouse consuming all FX rate events for Czech operations analytics
- **DKSK**: Slovak data warehouse consuming all FX rate events for Slovak operations analytics

## Technical Details

### Interface Tables (CCP)
CCP maintains dedicated interface tables for Kafka integration:

**FX_RATE_CONTINUOUS:**
- KEY (Varchar2(200)): fxRateListId
- BUSINESS_CHANGE_DATE (Oracle Date): From JSON body
- BODY (CLOB): JSON message (FxRatesInstant or FxRatesDaily)
- LOCATION (Varchar2(2)): Empty value (not location-specific)
- CREATED (Timestamp): SYS_EXTRACT_UTC(CURRENT_TIMESTAMP)
- ENTITY_TYPE (Varchar2(60)): FxRatesInstant | FxRatesDaily

**FX_RATE_INIT_AND_RECON:**
- Same structure as continuous plus:
- X_CORRELATION_ID (Varchar2(255)): From REST API header

**INTEGRATION_CONTROL:**
- CREATED (Timestamp): Time of insert
- TOTAL_EVENTS (Number): Count of events in reconciliation/init
- X_CORRELATION_ID (Varchar2(255)): From REST API header

### Kafka Configuration
- **Partitions:** 8 for data topics, 1 for codebook topics
- **Replicas:** 3
- **Retention period:** 6 days

### Event Frequency
Typical daily events: 3
- FxRatesInstant: ~1 update per business day (possibly multiple)
- FxRatesDaily - CNB: ~1 update per business day
- FxRatesDaily - ECB: ~1 update per business day

### Reference Data
Currencies codebook mapped to CSC Currencies reference data (ISO 4217 codes).

## Summary Statistics
- **Total REST APIs:** 1 (FxRates Reconciliation API with 2 endpoints)
- **Total Event Streams:** 3 main streams (FxRatesInstant, FxRatesDaily, FxRateLists) with 11 topics total
- **Total Data Objects:** 3 (FxRateLists, FxRatesInstant with ~19 attributes, FxRatesDaily with ~10 attributes)
- **Total Impacted Systems:** 5 (CSC and CCP as publishers, KStreams as processor, DKCZ and DKSK as consumers, WSO2 for API)
