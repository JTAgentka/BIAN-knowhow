# Customer Event History (Capability)

## Role Definition
The service domain captures a wide range of customer events to build a comprehensive history of customer activity that can support subsequent behavioral analysis. This includes key sales/proposal events, relationship management events, product delivery events, detected customer triggers (typically gleaned during servicing dialogues) and possibly externally sourced customer activity. The assembled data is made available for behavioral analysis and for more general reference (as might be used for relationship management for example)

## Example of Use
A customer contacts the call center to enquire about account transactions and during the dialogue the servicing representative detects a life event (e.g. the customer is moving house). The contact details and life event are captured in the customer history

## Executive Summary
This service domain captures, classifies and stores relationship, servicing and product fulfillment related customer events. In addition to servicing and product transaction details, the log can capture life/relationship events that are revealed during customer exchanges

## Key Features
- Log customer sales/marketing and relationship development events
- Log customer servicing events
- Log detected life events (from interactions or external research)
- Log product fulfillment events and alerts

## Properties
- **Folder Name**: Interaction Management
- **Core Business Object**: Customer Event Log
- **API BIAN Portal**: https://app.swaggerhub.com/apis/BIAN-3/CustomerEventHistory/12.0.0

## Relationships
### Serves
- Customer Management
- Interaction Management

### Triggered By
- Customer Relationship Management
- Customer Behavior Insights
- Customer Behavior Models
- Customer Case
- Session Dialogue
- Product Fulfillment SDs

### Triggers
- Product Fulfillment SDs

## List of Scenarios
- Execute Interactive Retention Campaign
- EXT Handle Customer Relationships Case
- Process Internal Customer Upgrade
- Assess Customer Behaviour Model Performance
- Develop Customer Insights
- Conduct Relationship Development Planning
- Perform Customer Relationship Development Planning
- End Mobile Access Session and Update Event and Servicing and Channel History