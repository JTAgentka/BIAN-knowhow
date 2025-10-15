# Product Pricing - Summary

## Overview
The Product Pricing capability manages fee calculations and pricing structures for banking products and services. This service domain provides CRUD operations for fees calculation configurations, enabling dynamic pricing management across different products, channels, and customer segments.

## REST APIs

### CRUD Operations - FeesCalculation
- **Description:** REST API for managing fees calculation rules and configurations
- **Key Operations:**
  - Create fee calculation rules
  - Read fee structures and pricing
  - Update pricing configurations
  - Delete obsolete fee rules
- **Data Objects:** FeesCalculation with pricing rules, product mappings, and calculation logic
- **Impacted Systems:** Fees Calculation Engine, Product Catalog, Digital Channels CZ, Digital Channels SK

## Event Stream Topics
Not specified in documentation - pricing configuration changes may be managed synchronously through REST API only.

## Data Objects

### FeesCalculation
- **Description:** Fee calculation rules and pricing structures for banking products and services
- **Key Attributes:**
  - Fee types and categories
  - Calculation methods (flat, percentage, tiered)
  - Product associations
  - Channel-specific pricing
  - Customer segment pricing
  - Effective dates and validity periods
  - Currency and amount specifications

## Integration Points

### Publishing Systems
- **Fees Calculation Engine:** Manages fee structures and pricing rules; provides CRUD operations for fee configurations

### Consuming Systems
- **Product Catalog:** Consumes pricing information for product definitions
- **Digital Channels CZ:** Applies fee calculations for Czech market transactions
- **Digital Channels SK:** Applies fee calculations for Slovak market transactions
- **Transaction Processing Systems:** Apply fees during transaction execution

## Key Features

### Pricing Flexibility
- Multiple calculation methods supported
- Product-specific fee structures
- Channel-differentiated pricing
- Customer segment-based pricing
- Time-based pricing rules (effective dates)

### Configuration Management
- CRUD operations for fee management
- Version control for pricing changes
- Historical fee structure tracking
- Validation rules for pricing configurations

## Technical Specifications
Not specified in documentation - follows standard REST API patterns for CRUD operations.

## Summary Statistics
- Total REST APIs: 1 (CRUD Operations - FeesCalculation)
- Total Event Streams: 0 (not specified in available documentation)
- Total Data Objects: 1 (FeesCalculation)
- Total Impacted Systems: 4+ (Fees Calculation Engine, Product Catalog, Digital Channels CZ/SK, Transaction Processing)
