# Product Design - Summary

## Overview
The Product Design capability manages the product catalog for J&T Bank, publishing product configurations (not templates) for both Czech and Slovak markets. This service domain integrates data from multiple source systems (CCP for investments, Quaestor for banking products, CRM for code lists) and provides real-time product information to Digital Channels through event streams and REST APIs.

## REST APIs

### Product REST API
- **Description:** REST API for accessing product catalog information
- **Key Operations:** Product retrieval and querying
- **Data Objects:** Product with various product types (banking, investment, combined)
- **Impacted Systems:** Product Catalog, Digital Channels CZ, Digital Channels SK

### CRUD Operations - relevantProduct
- **Description:** CRUD operations for managing product relevancy and availability
- **Key Operations:** Create, Read, Update, Delete operations for product configurations
- **Data Objects:** Product configuration with filtering attributes (provider, publication place, contract type, segment, service level)
- **Impacted Systems:** Product Catalog, Digital Channels CZ, Digital Channels SK

## Event Stream Topics

### Product Event Topics (Headquarters - Shared for CZ/SK)
- **Purpose:** Real-time publication of product catalog changes
- **Event Topics (Current - v3):**
  - Continuous: JTB-HQ_PRODUCTS_PRODUCT_SYNC_GNR_v3
  - Reconciliation: JTB-HQ_PRODUCTS_PRODUCT_RCN_GNR_v3
  - Control: JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Legacy Topics (Maintained until 15.3 as workaround):**
  - Continuous: JTB-HQ_PRODUCTS_PRODUCT_SYNC_GNR_v2
  - Reconciliation: JTB-HQ_PRODUCTS_PRODUCT_RCN_GNR_v2
- **Data Objects:** Product entity with banking, investment, and combined product attributes
- **Impacted Systems:**
  - Publishers: Product Catalog (integrating CCP, Quaestor, CRM)
  - Subscribers: Digital Channels CZ, Digital Channels SK
- **Key:** technicalProductId (unique identifier)

## Data Objects

### Product
- **Description:** Comprehensive product definition with flat structure covering all product types
- **Structure Sections:**
  - **product:** Common attributes across all products (union, not intersection)
  - **banking:** Attributes common to daily banking products
  - **investment:** Attributes common to investment products
  - **currentAccount:** Current account specific attributes
  - **mutualFund:** Mutual fund specific attributes
  - **termDeposit:** Term deposit specific attributes
  - **deposit:** Common deposit attributes (term and notice deposits)
  - **noticeDeposit:** Notice deposit specific attributes
  - **card:** Card product specific attributes
  - **combined:** Combined product attributes (banking + investment)

### Product Types Mapping

#### Investment Products
- **Stock (Akcie):** product + investment
- **Bond (Dluhopis):** product + investment
- **Investment Certificate (Certifikát):** product + investment
- **Bill (Směnka):** product + investment
- **Derivative (Deriváty):** product + investment
- **MutualFund (Podílový fond):** product + investment + mutualFund

#### Banking Products
- **Card (Platební karta):** product + banking + card
- **CurrentAccount (Běžný účet):** product + banking + currentAccount
- **NoticeDeposit (Vklad s výpovědní lhůtou):** product + banking + deposit + noticeDeposit
- **TermDeposit (Termínovaný vklad):** product + banking + deposit + termDeposit

#### Combined Products
- **Combined (Kombinovaný produkt):** product + banking + investment + combined + termDeposit

### Controlling Attributes for Product Availability
- **Provider (Poskytovatel):** Controls product availability by country (CZ/SK)
- **Publication Place (Publikační místo):** Controls availability in specific publication channels
- **Contract Type (Typ smlouvy):** Product contract categorization
- **Segment:** Required for investment products only
- **Service Level (Úroveň obsluhy):** Service tier classification

## Integration Points

### Publishing Systems
- **Product Catalog:** Central product catalog system integrating multiple sources
- **CCP (Capital Markets Platform):** Publishes investment products (Bonds, Funds, Certificates, Derivatives, Stocks) and code lists
- **Quaestor:** Publishes banking products (Term Deposits, Notice Deposits, Payment Cards, Current Accounts) and code lists
- **CRM:** Publishes code lists

### Consuming Systems
- **Digital Channels CZ:** Consumes product catalog for Czech market (with appropriate filtering)
- **Digital Channels SK:** Consumes product catalog for Slovak market (with appropriate filtering)

## Key Features

### Synchronization Schedule
- **Full Synchronization:** Daily at 4:00 AM (working days)
  - CCP: Bonds, Funds, Certificates, Derivatives, Stocks, and code lists
  - Quaestor: Term Deposits, Notice Deposits, Payment Cards, Current Accounts, and code lists
  - CRM: Code lists
- **Partial Synchronization (CCP only):** Working days at 10:00, 13:00, 15:00, 17:00
  - Bonds, Funds, Certificates, Derivatives, Stocks
  - Only new/changed data since last synchronization

### Data Consumption Rules
- Filtering responsibility lies with Digital Channels applications
- Each new version goes through standard development cycle with business acceptance
- Application administrators for Digital Channels responsible for correct filtering
- Product availability controlled via Product Catalog configuration
- Restrictions possible down to segment/contract type level

### Version Management
- v2 topics maintained until March 15 as workaround
- v3 topics are current standard
- Each version change follows standard versioning process

### Error Handling
- Product Catalog job monitors commit success and Kafka message delivery
- Messages marked as processed after successful send
- Retry mechanism with defined period for Kafka unavailability
- Retry period to be specified in practice

### Event Volume
- Typical: Units to low tens daily
- Variable depending on:
  - New product creation
  - Product modification requests
  - Document/value updates
- Cannot be standardized due to business-driven nature

## Technical Specifications

### Kafka Configuration
- 8 partitions (standard), 1 partition (for code lists)
- 3 replicas
- 6-day retention period
- Key: technicalProductId

### Schema
- JSON schema: ProduktovyKatalog_Product_v1.json
- Flat structure for all product types
- Optional X-Correlation-ID for reconciliation/initialization

## Summary Statistics
- Total REST APIs: 2 (Product API, CRUD Operations)
- Total Event Streams: 2 (v3 Continuous and Reconciliation topics, plus legacy v2 topics)
- Total Data Objects: 11 product types (6 investment, 4 banking, 1 combined)
- Total Impacted Systems: 5 (Product Catalog, CCP, Quaestor, CRM, Digital Channels CZ/SK)
