# Event History - Summary

## Overview
Event History capability manages customer interaction activities and communication records in the CRM system. This capability tracks all customer touchpoints including appointments, emails, phone calls, meetings, letters, SMS messages, and tasks. The system maintains comprehensive audit trails of customer interactions for both Czech and Slovak markets, enabling customer service representatives to review complete interaction history and supporting compliance requirements for customer communication tracking.

## REST APIs

### CRM Activities Reconciliation
- **Description:** Reconciliation API for activity records exposed via WSO2 platform
- **Key Operations:**
  - GET /activity/{activityType} - Retrieve activities by type with optional filters
  - GET /activity/{activityType}/{activityId} - Retrieve specific activity instance
  - GET /client/{crmIdType}/{crmId} - Retrieve all activities for specific client
  - GET /health - Health check endpoint
- **Data Objects:** Activities (multiple types)
- **Impacted Systems:** CRM (source), DKCZ (target), DKSK (target), DK (source - for some activity types), WSO2 (API gateway)

## Event Stream Topics

The system publishes 8 different activity types, each with dedicated topics for CZ and SK markets:

### Activity Types
1. **APPOINTMENT** - Scheduled appointments with customers
2. **EMAIL** - Email communications
3. **EMAIL-CALL-CENTER** - Call center email communications
4. **LETTER** - Physical letter correspondence
5. **MEETING-RECORD** - Meeting minutes and records
6. **PHONECALL** - Phone call logs
7. **SMS** - SMS message records
8. **TASK** - Tasks and action items

### Topic Structure (per activity type)

#### JTB-CZ_PARTIES_ACTIVITIES-{TYPE}_SYNC_GNR (8 topics)
- **Purpose:** Continuous streaming of activity records for Czech market
- **Event Types:** Activity creation and updates
- **Data Objects:** Activity entity (type-specific)
- **Impacted Systems:**
  - Publishers: CRM, DK (depending on activity type)
  - Subscribers: DKCZ

#### JTB-CZ_PARTIES_ACTIVITIES-{TYPE}_RCN_GNR (8 topics)
- **Purpose:** Initialization and reconciliation of activity records for Czech market
- **Event Types:** Bulk reconciliation events
- **Data Objects:** Activity entity (type-specific)
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKCZ

#### JTB-SK_PARTIES_ACTIVITIES-{TYPE}_SYNC_GNR (8 topics)
- **Purpose:** Continuous streaming of activity records for Slovak market
- **Event Types:** Activity creation and updates
- **Data Objects:** Activity entity (type-specific)
- **Impacted Systems:**
  - Publishers: CRM, DK (depending on activity type)
  - Subscribers: DKSK

#### JTB-SK_PARTIES_ACTIVITIES-{TYPE}_RCN_GNR (8 topics)
- **Purpose:** Initialization and reconciliation of activity records for Slovak market
- **Event Types:** Bulk reconciliation events
- **Data Objects:** Activity entity (type-specific)
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKSK

### Control Stream

#### JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Purpose:** Integration control and monitoring
- **Event Types:** Control messages
- **Data Objects:** Control stream metadata
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKCZ, DKSK

## Data Objects

### Activities (General Structure)
Customer interaction activity records with type-specific attributes.

**Common Attributes (all activity types):**
- **X-Correlation-ID** (string, optional): Correlation identifier for INIT and RECON
- **activityId** (string): Unique activity instance identifier in CRM
- **activityType** (string, enum): Type of activity (APPOINTMENT | EMAIL | EMAIL-CALL-CENTER | LETTER | MEETING-RECORD | PHONECALL | SMS | TASK)
- **timestamp** (string, date-time): Date and time of activity creation/update
- **owner** (object): Customer to whom activity relates
  - **crmId** (string): CRM identifier (KLID), length 10
- **createdBy** (object): User who created activity
  - **crmId** (string): User CRM identifier or domain name
- **subject** (string): Activity subject/title
- **description** (string): Detailed activity description
- **location** (object): Market location (CZ | SK)
- **status** (object): Activity status
- **scheduledStart** (string, date-time): Scheduled start time (for appointments)
- **scheduledEnd** (string, date-time): Scheduled end time (for appointments)
- **actualStart** (string, date-time): Actual start time
- **actualEnd** (string, date-time): Actual end time
- **regardingObject** (object): Related CRM object (contract, opportunity, etc.)

**Type-Specific Attributes:**

**EMAIL/EMAIL-CALL-CENTER:**
- **from**: Sender email address
- **to**: Recipient email addresses
- **cc**: Carbon copy addresses
- **bcc**: Blind carbon copy addresses

**PHONECALL:**
- **phoneNumber**: Called/calling phone number
- **direction**: Incoming/outgoing call direction
- **duration**: Call duration

**SMS:**
- **phoneNumber**: Mobile number
- **messageContent**: SMS text content
- **deliveryStatus**: Delivery confirmation status

**MEETING-RECORD:**
- **attendees**: List of meeting participants
- **meetingNotes**: Detailed meeting minutes
- **actionItems**: Follow-up tasks from meeting

**Business Identifiers:**
- Business Identifier: activityId
- Business Change Date: timestamp
- Partition Key: owner.crmId (client location determines topic)

## Integration Points

### Publishing Systems
- **CRM**: Publishes activity records created via REST interface and CRM console
- **DK (Digital Channels)**: Publishes certain activity types initiated by customers through digital channels

### Consuming Systems
- **DKCZ (Digital Channels CZ)**: Consumes activity history for customer interaction display and service analytics
- **DKSK (Digital Channels SK)**: Consumes activity history for customer interaction display and service analytics

## Technical Implementation

### Event Characteristics
- **Trigger:** Activity record creation in CRM via REST API or CRM console
- **Frequency:** Tens of events per day (based on current estimates)
- **Note:** Location (CZ/SK) is client property in CRM, but topic doesn't contain this attribute as each location has dedicated topic instance

### API Parameters

**Reconciliation:**
- Headers: X-Correlation-ID, traceparent (required)
- Path params:
  - activityType: Activity kind (appointment, email, phonecall, etc.)
  - activityId: Activity instance identifier in CRM
  - crmIdType: Client identifier type (AccountGUID or AccountKLID - RC/IC not allowed for security)
  - crmId: Client instance identifier in CRM
- Query params (optional):
  - klientId (AccountKLID): Client number (not applicable for /client/{crmIdType}/{crmId})
  - filledWhenFrom: Date range start (BCD filtering)
  - filledWhenTo: Date range end (BCD filtering)

### Topic Selection
- Based on client's location parameter (CZ or SK)
- Based on activity type (8 different types)
- Based on stream type (SYNC or RCN)
- **Total: 32 activity-specific topics + 1 control topic**

### Initialization
- Means sending all activity records currently stored in CRM
- Can be REST service or alternative format based on application owner preference

### Error Handling
- Duplicates may occur up to BCD level
- Consumers expected to handle deduplication
- Standard integration aspects apply

## Activity Type Details

### Customer-Initiated Activities
- **EMAIL** - Customer email communications
- **PHONECALL** - Customer phone interactions
- **SMS** - Customer text messages

### Bank-Initiated Activities
- **APPOINTMENT** - Scheduled banker-customer meetings
- **LETTER** - Official bank correspondence
- **TASK** - Internal bank tasks related to customer

### Bidirectional Activities
- **MEETING-RECORD** - Face-to-face meeting documentation
- **EMAIL-CALL-CENTER** - Call center email handling

## Capacity Requirements
- **Daily Volume:** Tens of activity records per day
- **Total Volume:** Not specified in documentation
- **Peak Scenarios:** Customer service hours, campaign periods
- **Growth:** To be revised based on operational practice

## Summary Statistics
- **Total REST APIs:** 1 (Activities Reconciliation with multiple operation types)
- **Total Event Streams:** 33 (32 activity topics - 8 types x 2 markets x 2 streams + 1 control)
- **Total Data Objects:** 8 (one per activity type)
- **Total Activity Types:** 8 (APPOINTMENT, EMAIL, EMAIL-CALL-CENTER, LETTER, MEETING-RECORD, PHONECALL, SMS, TASK)
- **Total Impacted Systems:** 5 (CRM, DKCZ, DKSK, DK, WSO2)

## Special Notes
- Location parameter in CRM determines topic routing but is not included in published event
- CRM object richer than published portion - may cause identical messages with only BCD changes
- Each activity type has dedicated topics for both markets
- Some activity types can be created by customers through digital channels
- All activity types tracked for compliance and customer service purposes
- JSON schemas stored in centralized repository
- Supports comprehensive customer interaction audit trail
- Security restriction: RC/IC identifiers not allowed in API calls
- Separate topics per activity type enable fine-grained consumption patterns
