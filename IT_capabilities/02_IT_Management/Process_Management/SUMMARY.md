# Process Management - Summary

## Overview
Process Management capability provides request orchestration and application journal management services. The primary component is the ApplicationOrchestration service (formerly named RequestOrchestration) which reads from multiple Kafka topics and automatically creates application requests in the CRM journal system. This service eliminates manual request creation by processing events from various source systems (Quaestor, eBroker) and transforming them into standardized CRM application requests.

## REST APIs

### SERVICE-RequestOrchestration (ApplicationOrchestration)
- **Description:** Orchestration service that consumes events from multiple topics and automatically creates application requests in CRM journal. No public API interface - operates as an event-driven consumer service.
- **Key Operations:**
  - Read events from Kafka topics (Deposits, Account, Notices, PortfolioOverview, ApplicationStateNotification)
  - Transform event data to CRM ApplicationWs.ManageApplication WS format
  - Create application journal entries in CRM
  - Handle various application types (NEWTD, NEWINV, TDWITHD, NEWCA, AUTPROL, etc.)
- **Data Objects:** Multiple application request types mapped from source topics
- **Impacted Systems:** CRM (consumer), Kafka topics (producer), Quaestor, eBroker, Camunda

**Note:** Service located on CRM side, consumes topics but does not expose public REST endpoints. Uses CRM's existing WS service: ApplicationWs.ManageApplication

## Event Stream Topics

### Consumed Topics (Input)

#### QST (Quaestor) - Deposits Topic
- **Purpose:** Creates deposit-related application requests
- **Event Types:** New deposits, automatic prolongation changes
- **Application Types Created:**
  - **NEWTD** (}ádost o vklad / New Deposit Request)
  - **AUTPROL** (}ádost o zmnu nastavení automatické prolongace / Automatic Prolongation Setting Change)
- **Frequency:** Per business events
- **Publisher:** Quaestor (BISQ) system

#### QST (Quaestor) - Account Topic
- **Purpose:** Creates current account application requests
- **Event Types:** New account creation
- **Application Types Created:**
  - **NEWCA** (}ádost o b~ný úet / Current Account Request)
- **Frequency:** Per business events
- **Publisher:** Quaestor (BISQ) system

#### QST (Quaestor) - Notices Topic
- **Purpose:** Creates deposit termination requests
- **Event Types:** Deposit withdrawal notices
- **Application Types Created:**
  - **TDWITHD** (}ádost o výpov ze vkladu / Deposit Withdrawal Request)
- **Frequency:** Per business events
- **Publisher:** Quaestor (BISQ) system

#### eBroker - PortfolioOverview Topic
- **Purpose:** Creates investment account application requests
- **Event Types:** New portfolio/investment account creation
- **Application Types Created:**
  - **NEWINV** (}ádost o investování / Investment Request)
- **Frequency:** Per business events
- **Publisher:** eBroker system

#### Camunda - ApplicationStateNotification Topic
- **Purpose:** Creates universal application requests from Camunda workflows
- **Event Types:** Application state changes
- **Application Types Created:**
  - Universal application requests (not using standard ManageApplication WS)
- **Frequency:** Per workflow state changes
- **Publisher:** Camunda BPM system

### Topic Consumption Pattern
- Service reads from multiple independent topics
- Each topic maps to specific application request types
- Automatic transformation and CRM journal entry creation
- Processing type: Auto (automatic processing)

## Data Objects

### Application Request Types

#### NEWTD - New Term Deposit Request
**Source:** Quaestor Deposits topic

**Mapped Attributes:**
- ApplicationType: CONST "NewTd"
- Status: CONST "Signed"
- CreatedAt: startDate (DATE ’ DATE-TIME conversion)
- Country: CONST "Cz" or "Sk" (based on topic)
- Currency: currency (CZK, EUR)
- StartDate: startDate (DATE ’ DATE-TIME conversion)
- InterestRate: interestRate
- InterestDisposition: "ToPrinc" if no interestPayoffAccount
- Amount: termDepositSpecific.initialAmount
- PrKind: CONST "NWB"
- PrType: depositType
- WithdrawalPeriod: termDepositSpecific.termDuration (integer part)
- WithdrawalPeriodUnit: termDepositSpecific.termDuration (D/M/Y part)
- InterestPeriod: interestFrequency (numeric part)
- InterestPeriodUnit: interestFrequency (D/M/Y part)
- CurrentAccount: principalPayoffAccount
- Processing: CONST "Auto"

#### NEWINV - New Investment Request
**Source:** eBroker PortfolioOverview topic

**Mapped Attributes:**
- ApplicationId: GENERATED UUID
- ApplicationType: CONST "NewInv"
- Status: CONST "Finish"
- CreatedAt: created
- Country: CONST "Cz" or "Sk" (based on topic)
- Currency: pfCurrency
- Name: shortName
- PortfolioID: ebrokerId
- CurrentAccount: Not available
- Processing: CONST "Auto"

#### TDWITHD - Term Deposit Withdrawal Request
**Source:** Quaestor Notices topic

**Mapped Attributes:**
- ApplicationId: GENERATED UUID
- ApplicationType: CONST "TdWithd"
- Status: CONST "Finished"
- CreatedAt: createdDate (DATE ’ DATE-TIME conversion)
- Country: CONST "Cz" or "Sk" (based on topic)
- Currency: currency (CZK, EUR)
- Amount: terminationAmount
- CurrentAccount: payoffAccount.accountNumber + "/" + payoffAccount.bankCode
- WithdrawalStart: beginDate (DATE ’ DATE-TIME conversion)
- WithdrawalEnd: terminationDate (DATE ’ DATE-TIME conversion)
- Processing: CONST "Auto"

#### NEWCA - New Current Account Request
**Source:** Quaestor Account topic

**Mapped Attributes:**
- ApplicationId: GENERATED UUID
- ApplicationType: CONST "NewCa"
- Status: CONST "Process"
- CreatedAt: creationDate (DATE ’ DATE-TIME conversion)
- Country: CONST "Cz" or "Sk" (based on topic)
- Currency: accountCurrency
- PrKind: CONST "CUA"
- PrType: accountType
- Name: accountName
- Processing: CONST "Auto"

#### AUTPROL - Automatic Prolongation Setting Change
**Source:** Quaestor Deposits topic

**Mapped Attributes:**
- ApplicationId: GENERATED UUID
- ApplicationType: CONST "AutProl"
- Status: CONST "Finished"
- CreatedAt: startDate (DATE ’ DATE-TIME conversion)
- Country: CONST "Cz" or "Sk" (based on topic)
- Renewal: termDepositSpecific.prolongation (M ’ false, A ’ true)
- Processing: CONST "Auto"

#### Universal Application (Camunda)
**Source:** Camunda ApplicationStateNotification topic

**Mapped Attributes:**
- applicationIds.camundaId
- applicationCreatedDate
- Universal application indicator
- applicationType
- applicationState
- callingSystem
- applicationTaskUrl

### Other Application Types (Not Processed by Service)
The following application types exist in CRM but are either processed manually (M) or handled internally by CRM (CRM), not by the orchestration service:

- **TDRENEW** - Deposit renewal request (M)
- **CHNGSETACC** - Settlement account change (A)
- **NEWDOC** - Contract request (A)
- **CARDLIM** - Card limit change (M)
- **NEW50** - 50/50 investment (M)
- **UPDEMAIL** - Email address change (CRM internal)
- **NEWCARD** - Payment card request (M)
- **UPDDOCUMET** - ID document change (M)
- **UPDCOMADDR** - Correspondence address change (CRM)
- **UPDDOMADDR** - Permanent address change (CRM)
- **RENEW** - Automatic card renewal setting (M)
- **CHNGSETINV** - Investment account link change (A)

**Legend:**
- A = Automatic processing
- M = Manual processing
- CRM = Internal CRM processing
- X = Not applicable / Future implementation

## Integration Points

### Publishing Systems (Event Sources)

#### Quaestor (BISQ)
- **Publishes:** Deposits, Account, Notices topics
- **Application Types:** NEWTD, NEWCA, TDWITHD, AUTPROL
- **Purpose:** Core banking product lifecycle events
- **Systems:** Deposit management, Account management, Termination management

#### eBroker
- **Publishes:** PortfolioOverview topic
- **Application Types:** NEWINV
- **Purpose:** Investment account creation events
- **Systems:** Investment portfolio management

#### Camunda
- **Publishes:** ApplicationStateNotification topic
- **Application Types:** Universal applications
- **Purpose:** Workflow-driven application state changes
- **Systems:** BPM workflow engine

### Consuming Systems

#### CRM (Primary Consumer)
- **Consumes:** All orchestrated application requests
- **Interface:** ApplicationWs.ManageApplication WS service
  - INT Environment: https://crm-int.jtfg.com:4443/ArbesWs/WS/ApplicationWs.asmx
  - WSDL: https://crm-int.jtfg.com:4443/ArbesWs/WS/ApplicationWs.asmx?WSDL
- **Purpose:** Application journal management
- **Function:** Creates application records in CRM journal for tracking and processing
- **Location:** Orchestration service deployed on CRM side

### Integration Architecture

**Event-Driven Pattern:**
1. Source system publishes business event to Kafka topic
2. ApplicationOrchestration service consumes event
3. Service transforms event data to CRM WS format
4. Service calls CRM ApplicationWs.ManageApplication
5. CRM creates application journal entry
6. Processing marked as "Auto" for automatic handling

**Connection Analysis:**
- Kafka connection: Requires CRM-to-Kafka connectivity analysis (new requirement)
- WS Service: Uses existing CRM internal WS service
- No public API: Service operates internally without external exposure
- No WSO2 exposure: Direct Kafka ’ CRM pattern

## Summary Statistics

- **Total REST APIs:** 0 (Service consumes events, no public API)
- **Total Internal WS Services Used:** 1 (CRM ApplicationWs.ManageApplication)
- **Total Event Streams Consumed:** 5
  - Quaestor Deposits
  - Quaestor Account
  - Quaestor Notices
  - eBroker PortfolioOverview
  - Camunda ApplicationStateNotification
- **Total Application Types Orchestrated:** 5 active types (NEWTD, NEWINV, TDWITHD, NEWCA, AUTPROL)
- **Total Application Types in CRM:** 17+ (including manual and CRM-internal types)
- **Total Data Objects:** 6 (5 orchestrated application types + universal application)
- **Total Impacted Systems:** 5
  - Publishers: Quaestor/BISQ (3 topics), eBroker (1 topic), Camunda (1 topic)
  - Consumer: CRM
  - Infrastructure: Kafka

## Technical Configuration

### Service Deployment
- **Location:** CRM side (co-located with consumer)
- **Architecture:** Event-driven microservice
- **Pattern:** Topic consumer ’ Transformation ’ WS call
- **Processing:** Automatic (no manual intervention)

### Kafka Configuration
- **Consumer Group:** ApplicationOrchestration service
- **Topic Subscriptions:** 5 topics across multiple domains
- **Processing Guarantee:** At-least-once delivery
- **Error Handling:** Retry mechanisms (to be detailed in CRM-Kafka connection analysis)

### Data Transformation
- **Format Conversion:** JSON (Kafka) ’ SOAP XML (WS)
- **Date Handling:** DATE to DATE-TIME conversions
- **ID Generation:** UUID generation for certain application types
- **Constant Mapping:** Fixed values per application type
- **Country Detection:** Based on topic naming (CZ/SK)

### Error Handling
- **Missing Data:** ApplicationNumber not available from source topics
- **Failed WS Calls:** Retry logic and error logging
- **Invalid Data:** Validation before WS call
- **Monitoring:** Application creation success/failure tracking

### Future Enhancements
- Service renamed from RequestOrchestration to ApplicationOrchestration
- Additional application types may be added
- CRM-Kafka connection analysis to be completed
- Enhanced monitoring and alerting

## Business Value

### Automation Benefits
- Eliminates manual application entry in CRM journal
- Reduces processing time from hours to seconds
- Improves data accuracy (no manual transcription errors)
- Enables real-time application tracking
- Provides audit trail from source event to CRM entry

### Integration Value
- Decouples source systems from CRM journal specifics
- Standardizes application creation across systems
- Enables new source systems to integrate easily
- Supports multiple countries (CZ/SK) through single service
- Facilitates compliance and reporting through centralized journal
