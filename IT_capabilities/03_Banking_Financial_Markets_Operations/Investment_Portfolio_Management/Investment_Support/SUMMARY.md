# Investment Support - Summary

## Overview
Investment Support capability provides specialized support services for investment portfolio operations including portfolio creation, product transfers between portfolios, FX rate inquiries for investment transactions, and client consent management (KIID agreements). The system integrates eBroker with Digital Channels and CRM through WSO2 API-M, providing essential operational support for Czech and Slovak investment operations.

## REST APIs

### TransferOrder - CRUD Operations
- **Description:** Portfolio-to-portfolio product transfer operations
- **Key Operations:**
  - POST /transferOrder - Transfer products between portfolios with specified instrument, quantity, and dates
  - Supports order type specification, client notes, and order validity periods
- **Data Objects:** TransferOrder request/response with portfolio IDs, instrument details, quantities
- **Impacted Systems:** eBroker (backend), Digital Channels (consumer), WSO2 API-M (gateway)

### InvestmentFxRate - CRUD Operations
- **Description:** Foreign exchange rate inquiry service for investment transactions
- **Key Operations:**
  - POST /fxRate - Get FX exchange rates for investment currency conversions
  - Supports buy/sell currency pairs with volume-based calculations
  - Maps to eBroker web service vratKursMenyForex operation
- **Data Objects:** FX rate request with currency pairs (buy/sell), volumes, and FX rate response with exchange rates, base amounts, and rate validity
- **Impacted Systems:** eBroker (eBroker_AKC_obchodovani web service), Digital Channels (consumer), WSO2 API-M (gateway)

### CreatePortfolio - CRUD Operations
- **Description:** Portfolio creation service for establishing new investment portfolios in backend systems
- **Key Operations:**
  - POST operations for portfolio creation in Topas/TA and eBroker systems
  - Orchestrated by Metada integration layer (ADP platform)
  - Maps to eBroker osoba.ZapisPortfolio web service
- **Data Objects:** Portfolio creation request/response data
- **Impacted Systems:** ADP (Arbes Digital Platform for orchestration), eBroker (Topas/TA backend via web service), Digital Channels (consumer), WSO2 API-M (gateway)

### Account KIID Agreement - CRUD Operations
- **Description:** Client consent management for Key Investor Information Document (KIID) electronic communication
- **Key Operations:**
  - PUT /Account/{crmIdType}/{crmId}/kiidAgreement - Set KIID consent flag and agreement date
  - Supports client agreement tracking with timestamps
  - Published via Kafka topic JTB-CZ_PARTIES_ACCOUNT_SYNC_GNR
- **Data Objects:** KIID agreement data with consent flag (agreeKiid), agreement date (agreeKiidDate)
- **Impacted Systems:** CRM (Acmark), Digital Channels (consumer), WSO2 API-M (gateway), Kafka (event publication)

### Account Transaction Currency Change - CRUD Operations
- **Description:** Asynchronous service for changing account reference currency with automatic value recalculation
- **Key Operations:**
  - PATCH /Account/{crmIdType}/{crmId}/changeTransactionCurrency - Change reference currency (CZK, EUR, USD)
  - Async operation due to required value recalculation (e.g., 25 CZK to 1 EUR conversion)
- **Data Objects:** Transaction currency change request with new currency code
- **Impacted Systems:** CRM (Acmark via DigiClientOperations/v2 API), Digital Channels (consumer), WSO2 API-M (gateway)

## Event Stream Topics
- **Note:** This capability primarily uses synchronous REST API integration patterns
- KIID agreement changes are published to Kafka topic: JTB-CZ_PARTIES_ACCOUNT_SYNC_GNR for downstream consumption

## Data Objects

### TransferOrder
- **Description:** Product transfer order between portfolios
- **Key Attributes:**
  - X-Correlation-ID: Correlation identifier
  - portfolioIdFrom: Source portfolio ID
  - portfolioIdTo: Destination portfolio ID
  - instrumentId: Financial instrument ID
  - quantity: Transfer quantity
  - orderType: Type of transfer order
  - currency: Transaction currency (ISO 4217)
  - acceptDate: Order acceptance date
  - orderValidTo: Order validity end date
  - noteForClient: Client-facing note
  - operationTimestamp: Operation timestamp for response correlation

### InvestmentFxRate
- **Description:** FX rate inquiry data for investment transactions
- **Key Attributes:**
  - X-Correlation-ID: Correlation identifier
  - currency: Base currency (CZK for HQ, EUR for branch)
  - buyCurrency: Currency being purchased (bank perspective), ISO 4217
  - sellCurrency: Currency being sold (bank perspective), ISO 4217
  - buyVolume: Transaction volume in buy currency
  - sellVolume: Transaction volume in sell currency
  - exchangeRate: Exchange rate value
  - baseAmount: Base amount (quantity of units)
  - isInvert: Rate direction indicator (false: sell units per buy units, true: buy units per sell units)
  - buy: Buy currency rate vs domestic currency
  - sell: Sell currency rate vs domestic currency
  - fxRateListId: FX rate list identifier (1-standard, 2-premium, 3-vip)
  - rateValidityDate: Rate validity date

### CreatePortfolio
- **Description:** Portfolio creation request data
- **Key Attributes:**
  - Not fully specified in available documentation
  - Processed through ADP orchestration layer
  - Maps to eBroker osoba.ZapisPortfolio web service

### KIIDAgreement
- **Description:** Key Investor Information Document consent data
- **Key Attributes:**
  - X-Correlation-ID: Correlation identifier
  - traceparent: W3C Trace Context parameter
  - BCD: Business change date (operation date/time)
  - crmIdType: CRM identifier type (AccountGUID or AccountKLID)
  - crmId: CRM identifier value (GUID or 10-digit client number)
  - agreeKiid: Boolean consent flag
  - agreeKiidDate: Date of client consent (date-time format)

### TransactionCurrencyChange
- **Description:** Account reference currency change request
- **Key Attributes:**
  - X-Correlation-ID: Correlation identifier for async processing
  - traceparent: W3C Trace Context parameter
  - crmIdType: CRM identifier type (AccountGUID or AccountKLID)
  - crmId: CRM identifier value
  - transactionCurrency: New reference currency (CZK, EUR, USD)

## Integration Points

### Publishing Systems
- **eBroker**: Core investment platform providing:
  - Portfolio transfer operations
  - FX rate calculation service (eBroker_AKC_obchodovani.wsdl)
  - Portfolio creation service (osoba.ZapisPortfolio web service)
  - Integration with Topas and TA backend systems
- **CRM (Acmark)**: Customer relationship management system:
  - KIID consent management
  - Account reference currency management
  - DigiClientOperations/v2 REST API

### Consuming Systems
- **Digital Channels (FE)**: Front-end system consuming all investment support APIs for customer-facing operations
- **ADP (Arbes Digital Platform)**: Orchestration platform for complex multi-system operations like portfolio creation

### Integration Infrastructure
- **WSO2 API-M**: API Management platform exposing all investment support REST APIs with standard headers (X-Correlation-ID, traceparent)
- **Kafka**: Event streaming for KIID consent changes via JTB-CZ_PARTIES_ACCOUNT_SYNC_GNR topic

## Summary Statistics
- Total REST APIs: 5 (TransferOrder, InvestmentFxRate, CreatePortfolio, KIID Agreement, Transaction Currency Change)
- Total Event Streams: 1 Kafka topic (JTB-CZ_PARTIES_ACCOUNT_SYNC_GNR for KIID agreements)
- Total Data Objects: 5 primary entities
- Total Impacted Systems: 5 (eBroker, ADP, CRM/Acmark, Digital Channels, WSO2 API-M)
- Supported Locations: CZ (Czech Republic), potentially SK (Slovakia)
- Integration Pattern: Primarily synchronous REST API with some async operations and Kafka event publication for consent changes
- **Note:** This capability provides essential support services that complement core investment portfolio management operations, focusing on operational support rather than transactional processing
