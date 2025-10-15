# Application State Management - Summary

## Overview
This capability provides application state notification and attendance tracking functionality. It enables systems to receive real-time notifications about changes in application states (mainly from Camunda workflow system) and tracks employee attendance data from Multimax system for payroll processing.

## REST APIs

### ApplicationStateNotification - REST API
- **Description:** Reconciliation API for application state notifications, exposed via WSO2 and orchestrated by Metada service. Ensures reconciliation requests are sent to all backends (Camunda and CRM).
- **Key Operations:**
  - POST /applicationStateNotification/query - Query application state changes within a time interval
  - Supports initialization and reconciliation modes
- **Data Objects:** ApplicationStateNotification
- **Impacted Systems:** Camunda, CRM, WSO2, Metada, DKCZ (Data warehouse)

### Attendance - REST API
- **Description:** OUT OF SCOPE
- **Key Operations:** Not implemented
- **Data Objects:** Not applicable
- **Impacted Systems:** None

## Event Stream Topics

### ApplicationStateNotification Event Stream
- **Purpose:** Publishes application state change events from Camunda to data warehouse
- **Event Types:**
  - SYNC (Průběžný) - Continuous state changes
  - RCN (Inicializační/Rekonciliační) - Initialization/Reconciliation events
- **Data Objects:** ApplicationStateNotification entity
- **Impacted Systems:**
  - **Publishers:** Camunda
  - **Subscribers:** DKCZ (Data warehouse for CZ), DKSK (Data warehouse for SK)
- **Topics:**
  - JTB-CZ_PARTIES_APPLICATION-STATE-NOTIFICATION_SYNC_GNR (Continuous)
  - JTB-CZ_PARTIES_APPLICATION-STATE-NOTIFICATION_RCN_GNR (Init/Recon)
  - JTB-HQ_INTEGRATION_CONTROL_STREAM_GNR (Control topic)

### Attendance Event Stream
- **Purpose:** Publishes employee attendance events from Multimax DB for payroll processing
- **Event Types:**
  - SYNC (Průběžný) - Continuous attendance records triggered by new DB view records
- **Data Objects:** Attendance entity
- **Impacted Systems:**
  - **Publishers:** Multimax (MmxKafka DB view)
  - **Subscribers:** KS-MZDY CZ (Payroll module CZ), KS-MZDY SK (Payroll module SK)
- **Topics:**
  - JTB-CZ_MANAGEMENT_ATTENDANCE_SYNC_GNR (CZ attendance)
  - JTB-SK_MANAGEMENT_ATTENDANCE_SYNC_GNR (SK attendance)

## Data Objects

- **ApplicationStateNotification**: Represents application state change with attributes:
  - X-Correlation-ID (optional, required for init/recon)
  - businessChangeDate (date-time of last entity change)
  - applicationCreatedDate (date-time when application was created)
  - applicationIds (object containing applicationConsumerId and processingSystemApplicationId)
  - owner (object with client identifiers including crmId/KLID)
  - applicationKey (process definition key from applicationType codebook)
  - applicationType (type determining assignment to resolver group)
  - applicationState (current state from applicationState codebook)
  - applicationTaskUrl (optional URI to user task)
  - callingSystem (system identifier that created the application)

- **Attendance**: Employee attendance tracking data with attributes:
  - txnID (unique record identifier, primary key)
  - passageDateTime (date-time of employee passage)
  - employeeNumber (employee JT identifier)
  - cardScanLocation (card reader location)
  - firstName (employee first name)
  - lastName (employee last name)
  - cardNumber (card reader identifier)

## Integration Points

### Publishing Systems
- **Camunda**: Publishes application state change notifications when workflow states change
- **Multimax**: Publishes attendance records from MmxKafka DB view when new passages are recorded

### Consuming Systems
- **DKCZ**: Consumes application state notifications for Czech data warehouse
- **DKSK**: Consumes application state notifications (control stream) and attendance data for Slovak data warehouse
- **KS-MZDY CZ**: Consumes Czech employee attendance data for payroll processing
- **KS-MZDY SK**: Consumes Slovak employee attendance data for payroll processing
- **CRM**: Participates in reconciliation process for application states
- **WSO2**: API gateway exposing reconciliation API
- **Metada**: Orchestration service coordinating reconciliation across backends

## Summary Statistics

- Total REST APIs: 1 (1 implemented, 1 out of scope)
- Total Event Streams: 2 (ApplicationStateNotification, Attendance)
- Total Data Objects: 2
- Total Impacted Systems: 9 (Camunda, CRM, WSO2, Metada, DKCZ, DKSK, Multimax, KS-MZDY CZ, KS-MZDY SK)
