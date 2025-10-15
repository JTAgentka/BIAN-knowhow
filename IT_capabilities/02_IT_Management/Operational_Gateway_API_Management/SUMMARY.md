# Operational Gateway API Management - Summary

## Overview
Operational Gateway API Management capability provides external API gateway services primarily focused on PSD2 (Payment Services Directive 2) regulatory compliance. This capability exposes secure banking APIs to third-party providers (TPPs) enabling Account Information Service Providers (AISP), Payment Initiation Service Providers (PISP), and Card Issuer Service Providers (CISP) to access customer banking data and initiate payments in compliance with EU regulations.

## REST APIs

### API - PSD2 (Main API)
- **Description:** Core PSD2 API gateway providing standardized access to banking services for authorized third-party providers
- **Key Operations:**
  - Account information services
  - Payment initiation services
  - Card information services
  - Reference data access
- **Data Objects:** Not specified in available documentation
- **Impacted Systems:** WSO2 API Gateway, Banking Core Systems, Authorization Servers

### API - PSD2-AISP (Account Information Service Provider)
- **Description:** Specialized API for TPPs providing account information services to end customers
- **Key Operations:**
  - Read account lists
  - Read account details
  - Read account balances
  - Read transaction history
- **Data Objects:** Account data, Transaction data, Balance information
- **Impacted Systems:** Account Management Systems, WSO2 Gateway, Customer Authorization

### API - PSD2-PISP (Payment Initiation Service Provider)
- **Description:** API enabling TPPs to initiate payments on behalf of customers
- **Key Operations:**
  - Initiate single payments
  - Initiate bulk payments
  - Check payment status
  - Cancel payments
- **Data Objects:** Payment initiation requests, Payment status, Payment confirmation
- **Impacted Systems:** Payment Processing Systems, WSO2 Gateway, Strong Customer Authentication (SCA)

### API - PSD2-CISP (Card Issuer Service Provider)
- **Description:** API for card-based services and card information access
- **Key Operations:**
  - Read card account information
  - Read card transaction history
  - Manage card services
- **Data Objects:** Card account data, Card transaction data
- **Impacted Systems:** Card Management Systems, WSO2 Gateway

### API - PSD2-ref (Reference Data)
- **Description:** Provides reference data and supporting information for PSD2 services
- **Key Operations:**
  - Access bank reference data
  - Retrieve currency codes
  - Get bank codes
  - Access country codes
- **Data Objects:** Reference data entities, Code lists
- **Impacted Systems:** Reference Data Management, CSC (Codebook System)

## Event Stream Topics
**Note:** Based on available documentation, this capability primarily exposes REST APIs rather than event streams. Event streams are not specified for Operational Gateway API Management.

- **Total Event Streams:** 0
- **Topics:** Not applicable for this capability
- **Reason:** API Gateway functions as synchronous request-response service

## Data Objects

### PSD2 Account Information
**Description:** Account data structures compliant with PSD2 standards

**Key Attributes:**
- Account identifiers (IBAN, account number)
- Account type and status
- Account holder information
- Currency and balance information
- Account servicer (bank) details

### PSD2 Payment Initiation
**Description:** Payment instruction data for PISP services

**Key Attributes:**
- Debtor account information
- Creditor account information
- Payment amount and currency
- Payment reference
- Execution date
- Payment status

### PSD2 Transaction Data
**Description:** Transaction history information

**Key Attributes:**
- Transaction ID
- Transaction amount and currency
- Transaction date and time
- Debtor/Creditor information
- Transaction status
- Additional transaction details

### Card Information
**Description:** Card account and transaction data for CISP services

**Key Attributes:**
- Card account identifiers
- Card type and status
- Available balance and limits
- Transaction history
- Card holder information

## Integration Points

### Publishing Systems
**Note:** Operational Gateway primarily acts as an API gateway exposing internal systems externally

#### WSO2 API Gateway
- **Role:** API Gateway and security enforcement
- **Function:** Exposes PSD2 APIs to external TPPs
- **Security:** OAuth 2.0, Strong Customer Authentication (SCA), TLS
- **Rate Limiting:** TPP request throttling and quota management

### Consuming Systems

#### Third-Party Providers (TPPs)
- **AISP Providers:** Consume account information APIs
- **PISP Providers:** Consume payment initiation APIs
- **CISP Providers:** Consume card information APIs
- **Purpose:** Provide value-added services to bank customers
- **Authorization:** eIDAS certificates, PSD2 licenses

#### Internal Bank Systems (Backend)
- **Account Management:** Provides account data for AISP requests
- **Payment Processing:** Executes PISP-initiated payments
- **Card Systems:** Provides card information for CISP requests
- **Customer Database:** Authentication and authorization
- **Core Banking:** Transaction and balance information

### Integration Patterns

**PSD2 API Access Pattern:**
1. TPP registers with bank and obtains API credentials
2. TPP requests customer consent via bank's authorization server
3. Customer authenticates using Strong Customer Authentication (SCA)
4. TPP receives OAuth 2.0 access token
5. TPP makes API calls with access token
6. API Gateway validates token and routes to backend systems
7. Response returned to TPP in standardized PSD2 format

**Security and Compliance:**
- TLS encryption for all API communications
- eIDAS qualified certificates for TPP identification
- OAuth 2.0 for authorization
- Strong Customer Authentication (SCA) for sensitive operations
- API request logging and monitoring
- Rate limiting and quota enforcement

**Regulatory Compliance:**
- PSD2 Directive compliance (EU 2015/2366)
- EBA RTS (Regulatory Technical Standards) compliance
- Data protection per GDPR
- Transaction monitoring and reporting

## Summary Statistics

- **Total REST APIs:** 5
  - PSD2 Main API
  - PSD2-AISP
  - PSD2-PISP
  - PSD2-CISP
  - PSD2-ref
- **Total Event Streams:** 0 (API Gateway pattern - synchronous)
- **Total Data Objects:** 4+ (Account Information, Payment Initiation, Transaction Data, Card Information, Reference Data)
- **Total Impacted Systems:** 10+
  - External: Multiple TPPs (AISPs, PISPs, CISPs)
  - Internal: WSO2 Gateway, Account Management, Payment Processing, Card Systems, Customer DB, Core Banking, Authorization Server
  - Supporting: CSC (Reference Data), Logging/Monitoring Systems

## Technical Configuration

### API Gateway Configuration
- **Platform:** WSO2 API Manager
- **Protocol:** HTTPS with TLS 1.2+
- **Authentication:** OAuth 2.0, eIDAS certificates
- **Authorization:** Scope-based access control
- **Rate Limiting:** Per TPP and per endpoint
- **Monitoring:** Real-time API analytics and alerts

### Security Requirements
- eIDAS qualified certificates mandatory for TPPs
- Strong Customer Authentication (SCA) for sensitive operations
- Token expiration and refresh mechanisms
- API key and secret management
- Audit logging of all API access

### Compliance Requirements
- PSD2 Directive (EU 2015/2366)
- EBA RTS on Strong Customer Authentication
- GDPR for personal data protection
- Financial transaction reporting standards
- Regular security audits

### Error Handling
- Standardized PSD2 error codes
- HTTP status codes per PSD2 specifications
- Error message localization
- Retry mechanisms for transient failures
- Circuit breaker patterns for backend protection

### Capacity Requirements
- High availability (99.9% uptime)
- Response time SLA per PSD2 requirements
- Scalable to handle multiple TPP connections
- Peak load handling during business hours
- Geographic distribution for latency optimization

## Regulatory Context

### PSD2 Compliance
The Operational Gateway API Management capability ensures compliance with the EU Payment Services Directive 2 (PSD2), which:
- Mandates banks to provide APIs for licensed TPPs
- Requires Strong Customer Authentication (SCA)
- Defines standard interfaces for payment and account information services
- Protects consumer data and privacy
- Promotes competition and innovation in payment services

### Service Types
- **AISP (Account Information Service Provider):** Access to account data
- **PISP (Payment Initiation Service Provider):** Payment initiation on behalf of customers
- **CISP (Card Issuer Service Provider):** Card-related information and services

### TPP Licensing
- TPPs must be authorized by competent national authorities
- Require eIDAS qualified certificates
- Must comply with PSD2 technical standards
- Subject to regulatory oversight
