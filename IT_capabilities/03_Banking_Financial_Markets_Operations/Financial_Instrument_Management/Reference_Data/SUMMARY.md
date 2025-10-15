# Reference Data - Summary

## Overview
The Reference Data capability manages financial instrument reference data including bond catalog information and instrument market registrations. It maintains master reference data for bonds (fixed-income securities) and tracks instrument registrations across multiple markets and exchanges. The system publishes reference data changes through event streams and provides reconciliation via REST APIs.

## REST APIs

### Bond Reconciliation API
- **Description:** Provides reconciliation and initialization for bond reference data catalog
- **Key Operations:**
  - POST /bond/query/ - Retrieve bond reference data
  - GET /health/ - Health check endpoint
- **Data Objects:** Bond
- **Parameters:**
  - Header (required): X-Correlation-ID, traceparent
  - Body (optional): validityDateStart, validityDateEnd, businessChangeDateStart, businessChangeDateEnd, portfolioIds (topasId), bondPriceDataId, isin
- **Reconciliation Logic:** Returns current state of bonds at time of call; can filter by businessChangeDateStart
- **Initialization:** Triggers current snapshot of Bond catalog
- **Localization:** Separate API for SK operations
- **Impacted Systems:**
  - Source: CCP / Bond catalog system
  - Consumers: DKCZ, DKSK

### InstrumentMarketRegistration Reconciliation API
- **Description:** Provides reconciliation for instrument market registration data
- **Key Operations:**
  - Query instrument market registrations
- **Data Objects:** InstrumentMarketRegistration
- **Impacted Systems:** CCP as source, data warehouses as consumers

## Event Stream Topics

### Bond Event Stream
- **Purpose:** Publishes bond reference data catalog changes
- **Event Types:** Continuous, Init/Recon, Control
- **Data Objects:** Bond
- **Impacted Systems:**
  - **Publisher:** CCP / Bond catalog system
  - **Subscribers:** DKCZ, DKSK

### InstrumentMarketRegistration Event Stream
- **Purpose:** Publishes instrument market registration and listing information
- **Event Types:** Continuous, Init/Recon, Control
- **Data Objects:** InstrumentMarketRegistration
- **Impacted Systems:**
  - **Publisher:** CCP
  - **Subscribers:** DKCZ, DKSK

## Data Objects

### Bond
Reference data for fixed-income securities (bonds).

**Key Attributes:**
- **bondId** / **isin**: Bond identifier (ISIN - International Securities Identification Number)
- **businessChangeDate**: Publication timestamp (BCD)
- **issuer**: Issuing entity/organization
- **issuerCountry**: Country of issuer
- **bondType**: Type (Government, Corporate, Municipal, etc.)
- **currency**: Denomination currency
- **faceValue**: Par value/nominal value
- **issueDate**: Original issue date
- **maturityDate**: Maturity date
- **couponRate**: Fixed or floating coupon rate
- **couponFrequency**: Payment frequency (Annual, Semi-annual, Quarterly, Monthly)
- **dayCountConvention**: Day count basis (30/360, Act/365, Act/Act, etc.)
- **callPutProvisions**: Embedded options (callable, putable)
- **rating**: Credit rating (Moody's, S&P, Fitch)
- **seniority**: Debt seniority level
- **portfolioIds.topasId**: Portfolio identifier in TOPAS system
- **bondPriceDataId**: Price data identifier
- **status**: Active, Matured, Redeemed, Defaulted

**Source:** CCP / Bond catalog system
**Localization:** Separate streams for CZ and SK

### InstrumentMarketRegistration
Market registration and listing information for financial instruments.

**Key Attributes:**
- **registrationId**: Registration identifier
- **instrumentId**: Related instrument
- **marketId**: Exchange/market identifier
- **exchangeCode**: Market/exchange code (XPRA, XLON, XNYS, etc.)
- **tradingSymbol**: Trading ticker/symbol
- **listingDate**: Date listed on market
- **delistingDate**: Date delisted (if applicable)
- **tradingCurrency**: Currency for trading on this market
- **lotSize**: Minimum trading lot
- **tradingStatus**: Active, Suspended, Halted, Delisted
- **primaryListing**: Boolean indicating primary exchange
- **marketSegment**: Market segment/category

**Source:** CCP (market data / listings management)

## Integration Points

### Publishing Systems
- **CCP (Currency & Securities Platform)**: Manages bond catalog and instrument market registration data
  - Bond catalog management (new issues, amendments, maturities)
  - Market listing and registration tracking
  - Integration with external bond databases and market data providers
  - Publishing reference data changes via event streams
- **Bond Catalog System**: Specialized subsystem for bond reference data
- **TOPAS**: Portfolio management system providing portfolio-bond linkages

### Consuming Systems
- **DKCZ**: Czech data warehouse for:
  - Bond analytics and portfolio management
  - Fixed-income reporting
  - Compliance and regulatory reporting
  - Market listing verification
- **DKSK**: Slovak data warehouse for same purposes as DKCZ

## Technical Details

### Kafka Configuration
- **Partitions:** 8 for data topics, 1 for reference data
- **Replicas:** 3
- **Retention period:** 6 days

### Event Volume
- **Bond catalog:** Changes as new bonds are issued, mature, or amended (typically low to moderate volume)
- **Market registrations:** Changes as instruments are listed, delisted, or trading status changes

### Localization
Bond API is localized with separate services for CZ and SK operations, supporting country-specific bond markets and regulatory requirements.

## Summary Statistics
- **Total REST APIs:** 2 (Bond Reconciliation API, InstrumentMarketRegistration Reconciliation API)
- **Total Event Streams:** 2 main streams (Bond, InstrumentMarketRegistration)
- **Total Data Objects:** 2 (Bond with ~20 attributes, InstrumentMarketRegistration with ~10 attributes)
- **Total Impacted Systems:** 4 (CCP, Bond catalog system, TOPAS as publishers; DKCZ and DKSK as consumers)
