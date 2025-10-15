# Channel Management - Summary

## Overview
Channel Management capability handles enrollment and onboarding processes for digital banking channels (internet banking, mobile banking). The system manages customer enrollment status tracking and publishing enrollment completion events to downstream systems, specifically targeting Digital Channels (DKCZ) as the primary consumer.

## REST APIs

### EnrollmentDigitalChannelsReconciliation
- **Description:** Reconciliation and initialization API for enrollment status in Digital Channels, exposed on WSO2 platform
- **Key Operations:**
  - GET /enrollmentDigitalChannels/{crmId} - Retrieve enrollment status for specific customer
  - GET /health - Health check endpoint
- **Data Objects:** EnrollmentDigitalChannels
- **Impacted Systems:** CRM (source), DKCZ (target), WSO2 (API gateway)

## Event Stream Topics

### JTB-CZ_PARTIES_ENROLLMENT-DIGITAL-CHANNELS_SYNC_GNR
- **Purpose:** Continuous streaming of customer enrollment status changes in Digital Channels
- **Event Types:** Synchronous/Continuous
- **Data Objects:** EnrollmentDigitalChannels entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKCZ

### JTB-CZ_PARTIES_ENROLLMENT-DIGITAL-CHANNELS_RCN_GNR
- **Purpose:** Initialization and reconciliation of enrollment data
- **Event Types:** Initialization/Reconciliation
- **Data Objects:** EnrollmentDigitalChannels entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKCZ

### JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR
- **Purpose:** Control stream for integration monitoring
- **Event Types:** Control messages
- **Data Objects:** Control stream metadata
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKCZ, DKSK

## Data Objects

### EnrollmentDigitalChannels
Primary data entity providing information about customer enrollment in Digital Channels.

**Key Attributes:**
- **X-Correlation-ID**: Correlation identifier for initialization and reconciliation (UUID format)
- **enrollmentData** (object): Container for enrollment information
  - **crmId** (string, required): CRM customer identifier (KLID), length 10
  - **state** (string, required): Final state of enrollment process (values: Finished | Error)
  - **stateChangeDate** (string, required): Timestamp of enrollment state change (date-time format)

**Business Identifiers:**
- Primary: enrollmentData.crmId
- Business Change Date: stateChangeDate
- Partition Key: enrollmentData.crmId

## Integration Points

### Publishing Systems
- **CRM**: Publishes enrollment state changes when customer onboarding process completes in Digital Channels (finished or error states)

### Consuming Systems
- **DKCZ (Digital Channels CZ)**: Consumes enrollment status events to track customer onboarding progress

## Technical Implementation

### API Specifications
- **Platform:** WSO2 API Gateway
- **Protocol:** REST (synchronous), Kafka (asynchronous)
- **Header Parameters:** X-Correlation-ID, traceparent
- **Path Parameters:** crmId (Account KLID)
- **Query Parameters (optional):** filledWhenFrom, filledWhenTo (date range filtering)

### Event Characteristics
- **Trigger:** Completion of customer enrollment process in Digital Channels
- **Frequency:** Tens to hundreds of events per day
- **Deduplication:** Consumers expected to handle duplicate detection up to BCD (Business Change Date) level

### Error Handling
- Duplicates may occur up to BCD level
- Consumers must implement deduplication logic
- Standard integration aspects apply (see referenced integration documentation)

## Summary Statistics
- **Total REST APIs:** 1 (EnrollmentDigitalChannelsReconciliation)
- **Total Event Streams:** 3 (1 Sync, 1 Reconciliation, 1 Control)
- **Total Data Objects:** 1 (EnrollmentDigitalChannels)
- **Total Impacted Systems:** 4 (CRM, DKCZ, DKSK, WSO2)

## Special Notes
- Initialization can be REST service or alternative format based on application owner preference
- Initialization means sending enrollment status for all customers in Digital Channels
- Reconciliation supports time-based filtering for targeted resynchronization
- JSON schemas stored separately in centralized schema repository
