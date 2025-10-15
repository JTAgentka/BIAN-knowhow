# Foreign Exchange - Summary

## Overview
The Foreign Exchange capability manages FX trading instruments including FX Spot, FX Forward, FX Swap, and FX Derivatives within the trading systems. It publishes transaction and lifecycle events through event streams and provides reconciliation capabilities via REST APIs. The system sources data from trading platforms (Quaestor, PTS, eBroker) and distributes to data warehouses.

## REST APIs

### FX Derivatives Reconciliation API
- **Description:** Provides reconciliation and initialization for FX derivative instruments
- **Key Operations:**
  - POST /FxDerivatives/query - Retrieve FX derivatives for reconciliation
- **Data Objects:** FX Derivatives
- **Parameters:**
  - Header (required): X-Correlation-ID, traceparent
  - Body (required): businessChangeDateStart, businessChangeDateEnd
- **Reconciliation Logic:**
  - If time interval defined: resend entities changed within that interval (current states only)
  - If time interval not defined: resend entities changed in last 3 months (current states only)
- **Initialization:** Triggers all events; can filter by security
- **Impacted Systems:**
  - Source: Trading systems (Quaestor, eBroker, PTS)
  - Consumers: DKCZ, DKSK (via Kafka)

## Event Stream Topics

### FX Spot Event Stream
- **Purpose:** Publishes FX spot transaction events
- **Event Types:** Continuous, Init/Recon, Control
- **Data Objects:** FX Spot transactions
- **Impacted Systems:** Trading platforms as publishers, DKCZ/DKSK as consumers

### FX Forward Event Stream
- **Purpose:** Publishes FX forward contract events
- **Event Types:** Continuous, Init/Recon, Control
- **Data Objects:** FX Forward contracts
- **Impacted Systems:** Trading platforms as publishers, DKCZ/DKSK as consumers

### FX Swap Event Stream
- **Purpose:** Publishes FX swap transaction events
- **Event Types:** Continuous, Init/Recon, Control
- **Data Objects:** FX Swap transactions
- **Impacted Systems:** Trading platforms as publishers, DKCZ/DKSK as consumers

### FX Derivatives Event Stream
- **Purpose:** Publishes FX derivative instrument events (options, structured products)
- **Event Types:** Continuous, Init/Recon, Control
- **Data Objects:** FX Derivatives
- **Impacted Systems:** Trading platforms as publishers, DKCZ/DKSK as consumers

## Data Objects

### FX Spot
Spot foreign exchange transactions with immediate settlement.
- Transaction ID, currency pairs, amounts, rates, settlement dates, counterparties

### FX Forward
Forward foreign exchange contracts with future settlement dates.
- Contract ID, currency pairs, forward rates, maturity dates, notional amounts

### FX Swap
Foreign exchange swap transactions combining spot and forward legs.
- Swap ID, near leg details, far leg details, swap points, maturities

### FX Derivatives
Foreign exchange derivative instruments including options and structured products.
- Instrument ID, derivative type, underlying currencies, strike prices, expiry dates, notional amounts

## Integration Points

### Publishing Systems
- **Quaestor**: Treasury trading system for FX derivatives and structured products
- **eBroker**: Electronic brokerage platform for FX trading
- **PTS**: Payment and transaction system for FX spot and forwards

### Consuming Systems
- **DKCZ**: Czech data warehouse for FX trading analytics and reporting
- **DKSK**: Slovak data warehouse for FX trading analytics and reporting

## Technical Details

### Kafka Configuration
- **Partitions:** 8 for data topics
- **Replicas:** 3
- **Retention period:** 6 days

### Event Frequency
Based on trading activity - can vary significantly by market conditions and trading volumes.

## Summary Statistics
- **Total REST APIs:** 1 (FX Derivatives Reconciliation API)
- **Total Event Streams:** 4 main streams (FX Spot, FX Forward, FX Swap, FX Derivatives)
- **Total Data Objects:** 4 (FX Spot, FX Forward, FX Swap, FX Derivatives)
- **Total Impacted Systems:** 5 (Quaestor, eBroker, PTS as publishers; DKCZ and DKSK as consumers)
