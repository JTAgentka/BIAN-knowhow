# Servicing Mandate (Capability)

## Capability Information
- **Capability Name**: Servicing Mandate
- **Folder Name**: Agreement Management
- **Core Business Object**: Servicing Mandate

## Role Definition
The Servicing Mandate service domain maintains an agreement between the bank and an external party that governs/constrains the allowed access given to the bank's products and services. This access permission can be defined at two levels - overall for the service provider and at a more detailed level as applied to a specific customer.

## Example of Use
A third party provider has accessed the bank on behalf of a customer to initiate payment for a purchased product. The bank checks that the service provider is permitted to perform payments in general and whether there are specific constrains for this customer

## Executive Summary
This service domain maintains the allowed customer servicing arrangements for a service provider covering general access to the bank's products and services and optionally customer specific arrangements

## Key Features
- Set-up mandate covering 3rd party access to services
- Set-up provider's customer specific servicing permissions
- Check proposed activity is covered by the mandate
- Maintain/report on 3rd party activity

## API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/ServicingMandate/12.0.0

## Service Relationships

### Served By
- Not specified in document

### Serves
- Agreement Management

### Triggered By
- Servicing Order
- Contact Handler
- Transaction Authorization

### Triggers
- Party Lifecycle Management

## List of Scenarios
- Create Customer Reports
- 1 - Initiate Consent
- 3 - Initiate Consent
- Maintain the allowed customer servicing arrangments for a service provider covering allowed general access to products and services and customer specific arrangments