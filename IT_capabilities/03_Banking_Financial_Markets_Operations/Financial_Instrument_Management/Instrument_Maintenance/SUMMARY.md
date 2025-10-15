# Instrument Maintenance - Summary

## Overview
The Instrument Maintenance capability manages financial instrument master data and lifecycle events. It maintains instrument reference data including securities, bonds, equities, and other financial instruments. The system publishes instrument creation, modification, and event data through event streams and provides reconciliation capabilities via REST APIs.

## REST APIs

### Instrument Reconciliation API
- **Description:** Provides reconciliation and initialization for financial instrument master data
- **Key Operations:**
  - POST /instrument/query - Retrieve instruments for reconciliation
- **Data Objects:** Instrument
- **Parameters:**
  - Header (required): X-Correlation-ID, traceparent, X-Request-ID
  - Body (optional): businessChangeDateStart, businessChangeDateEnd, instrumentIds (with ccpId)
- **Reconciliation Logic:**
  - If BCD interval defined: resend entities changed within interval
  - If BCD interval not defined: resend entities changed in last 3 months
- **Initialization:** Triggers all events from 2015; can filter by security (instrumentIds.ccpId)
- **Impacted Systems:**
  - Source: CCP (Currency & Securities Platform)
  - Consumers: DKCZ, DKSK

### InstrumentEvent Reconciliation API
- **Description:** Provides reconciliation for instrument lifecycle events (corporate actions, dividends, coupons)
- **Key Operations:**
  - Query instrument events for reconciliation
- **Data Objects:** InstrumentEvent
- **Parameters:** Similar to Instrument API
- **Impacted Systems:** CCP as source, data warehouses as consumers

## Event Stream Topics

### Instrument Event Stream
- **Purpose:** Publishes financial instrument master data changes
- **Event Types:** Continuous, Init/Recon, Control
- **Data Objects:** Instrument
- **Impacted Systems:**
  - **Publisher:** CCP
  - **Subscribers:** DKCZ, DKSK

### InstrumentEvent Event Stream
- **Purpose:** Publishes instrument lifecycle events (corporate actions, dividends, interest payments, maturities)
- **Event Types:** Continuous, Init/Recon, Control
- **Data Objects:** InstrumentEvent
- **Impacted Systems:**
  - **Publisher:** CCP
  - **Subscribers:** DKCZ, DKSK

## Data Objects

### Instrument
Master data for financial instruments.

**Key Attributes:**
- **instrumentId** / **ccpId**: Instrument identifier (Business Identifier and KEY)
- **businessChangeDate** (date-time): Publication timestamp (BCD)
- **ISIN**: International Securities Identification Number
- **instrumentType**: Type of instrument (Bond, Equity, Fund, etc.)
- **currency**: Trading currency
- **issuer**: Issuing entity
- **maturityDate**: For fixed-term instruments
- **couponRate**: For interest-bearing instruments
- Status, trading venue, and other instrument-specific attributes

**Source:** CCP (Currency & Securities Platform)
**Historical Data:** Available from 2015

### InstrumentEvent
Lifecycle events associated with financial instruments.

**Key Attributes:**
- **eventId**: Event identifier
- **instrumentId**: Related instrument
- **eventType**: Corporate action type (Dividend, Coupon, Maturity, Split, Merger, etc.)
- **eventDate**: When event occurs
- **recordDate**: Date of record for entitlement
- **paymentDate**: Payment/settlement date
- **amount**: Event amount (dividend, coupon payment)
- **currency**: Payment currency

**Source:** CCP
**Historical Data:** Available from 2015

## Integration Points

### Publishing Systems
- **CCP (Currency & Securities Platform)**: Central platform managing financial instrument master data and lifecycle events. Maintains instrument catalogue, processes corporate actions, and publishes all instrument-related changes.

### Consuming Systems
- **DKCZ**: Czech data warehouse for instrument analytics, portfolio valuation, and reporting
- **DKSK**: Slovak data warehouse for instrument analytics, portfolio valuation, and reporting

## Technical Details

### Kafka Configuration
- **Partitions:** 8 for data topics
- **Replicas:** 3
- **Retention period:** 6 days

### Event Volume
Varies based on market activity and corporate action calendar. Higher volumes during earnings seasons and corporate action periods.

## Summary Statistics
- **Total REST APIs:** 2 (Instrument Reconciliation API, InstrumentEvent Reconciliation API)
- **Total Event Streams:** 2 main streams (Instrument, InstrumentEvent)
- **Total Data Objects:** 2 (Instrument, InstrumentEvent)
- **Total Impacted Systems:** 3 (CCP as publisher, DKCZ and DKSK as consumers)
