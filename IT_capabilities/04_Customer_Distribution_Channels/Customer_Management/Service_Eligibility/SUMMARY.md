# Service Eligibility - Summary

## Overview
Service Eligibility capability manages customer investment questionnaires and market settings that determine customer eligibility for various investment services and products. This capability handles MiFID II compliance questionnaires (InvestmentQuestionnaire), questionnaire evaluations (InvestmentQuestionnaireEval), questionnaire templates (InvestmentQuestionnaireTemplate), and market-specific settings (MarketSettings). The system ensures customers are assessed for investment knowledge and experience, and maintains configurations for different investment markets and products across Czech and Slovak operations.

## REST APIs

### CRM InvestmentQuestionnaire Reconciliation
- **Description:** Reconciliation API for investment questionnaires exposed via WSO2 platform
- **Key Operations:**
  - GET /Questionnaire/InvestmentQuestionnaireDataId/{investmentQuestionnaireDataId}?mode=async - Retrieve specific questionnaire
  - GET /Questionnaire/AccountGUID/{AccountID}?mode=async - Retrieve questionnaires for specific account
  - GET /Questionnaire?location=xx&from=xxx&to=yyy&mode=async - Query with location and BCD filtering
- **Data Objects:** InvestmentQuestionnaire, InvestmentQuestionnaireEval, InvestmentQuestionnaireTemplate
- **Impacted Systems:** CRM (source), DKCZ (target), DKSK (target), WSO2 (API gateway)

### CRM MarketSettings Reconciliation
- **Description:** Reconciliation API for market configuration settings exposed via WSO2 platform
- **Key Operations:**
  - GET /MarketSettings/{marketSettingsId} - Retrieve specific market settings
  - GET /MarketSettings - Query all market settings with optional filters
  - GET /health - Health check endpoint
- **Data Objects:** MarketSettings
- **Impacted Systems:** CRM (source), DKCZ (target), DKSK (target), WSO2 (API gateway)

## Event Stream Topics

### InvestmentQuestionnaireEval Topics

#### JTB-CZ_PARTIES_INVESTMENT-QUESTIONNAIRE-EVAL_SYNC_GNR
- **Purpose:** Continuous streaming of questionnaire evaluation results for Czech market
- **Event Types:** Evaluation completion, score updates
- **Data Objects:** InvestmentQuestionnaireEval entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKCZ

#### JTB-CZ_PARTIES_INVESTMENT-QUESTIONNAIRE-EVAL_RCN_GNR
- **Purpose:** Reconciliation of questionnaire evaluations for Czech market
- **Event Types:** Bulk reconciliation events
- **Data Objects:** InvestmentQuestionnaireEval entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKCZ

#### JTB-SK_PARTIES_INVESTMENT-QUESTIONNAIRE-EVAL_SYNC_GNR
- **Purpose:** Continuous streaming of questionnaire evaluation results for Slovak market
- **Event Types:** Evaluation completion, score updates
- **Data Objects:** InvestmentQuestionnaireEval entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKSK

#### JTB-SK_PARTIES_INVESTMENT-QUESTIONNAIRE-EVAL_RCN_GNR
- **Purpose:** Reconciliation of questionnaire evaluations for Slovak market
- **Event Types:** Bulk reconciliation events
- **Data Objects:** InvestmentQuestionnaireEval entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKSK

### InvestmentQuestionnaire Topics

#### JTB-CZ_PARTIES_INVESTMENT-QUESTIONNAIRE_SYNC_GNR
- **Purpose:** Continuous streaming of questionnaire data for Czech market
- **Event Types:** Questionnaire submission, updates
- **Data Objects:** InvestmentQuestionnaire entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKCZ

#### JTB-CZ_PARTIES_INVESTMENT-QUESTIONNAIRE_RCN_GNR
- **Purpose:** Reconciliation of questionnaire data for Czech market
- **Event Types:** Bulk reconciliation events
- **Data Objects:** InvestmentQuestionnaire entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKCZ

#### JTB-SK_PARTIES_INVESTMENT-QUESTIONNAIRE_SYNC_GNR
- **Purpose:** Continuous streaming of questionnaire data for Slovak market
- **Event Types:** Questionnaire submission, updates
- **Data Objects:** InvestmentQuestionnaire entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKSK

#### JTB-SK_PARTIES_INVESTMENT-QUESTIONNAIRE_RCN_GNR
- **Purpose:** Reconciliation of questionnaire data for Slovak market
- **Event Types:** Bulk reconciliation events
- **Data Objects:** InvestmentQuestionnaire entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKSK

### InvestmentQuestionnaireTemplate Topics (Headquarters-level)

#### JTB-HQ_PARTIES_INVESTMENT-QUESTIONNAIRE-TEMPLATE_SYNC_GNR
- **Purpose:** Continuous streaming of questionnaire template changes for all markets
- **Event Types:** Template creation, updates, versioning
- **Data Objects:** InvestmentQuestionnaireTemplate entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKCZ, DKSK

#### JTB-HQ_PARTIES_INVESTMENT-QUESTIONNAIRE-TEMPLATE_RCN_GNR
- **Purpose:** Reconciliation of questionnaire templates for all markets
- **Event Types:** Bulk reconciliation events
- **Data Objects:** InvestmentQuestionnaireTemplate entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKCZ, DKSK

### MarketSettings Topics

#### JTB-CZ_PARTIES_MARKET-SETTINGS_SYNC_GNR
- **Purpose:** Continuous streaming of market configuration changes for Czech market
- **Event Types:** Market parameter updates, product configurations
- **Data Objects:** MarketSettings entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKCZ

#### JTB-CZ_PARTIES_MARKET-SETTINGS_RCN_GNR
- **Purpose:** Reconciliation of market settings for Czech market
- **Event Types:** Bulk reconciliation events
- **Data Objects:** MarketSettings entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKCZ

#### JTB-SK_PARTIES_MARKET-SETTINGS_SYNC_GNR
- **Purpose:** Continuous streaming of market configuration changes for Slovak market
- **Event Types:** Market parameter updates, product configurations
- **Data Objects:** MarketSettings entity
- **Impacted Systems:**
  - Publishers: CRM
  - Subscribers: DKSK

#### JTB-SK_PARTIES_MARKET-SETTINGS_RCN_GNR
- **Purpose:** Reconciliation of market settings for Slovak market
- **Event Types:** Bulk reconciliation events
- **Data Objects:** MarketSettings entity
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

### InvestmentQuestionnaire
Customer-completed investment knowledge and experience questionnaire for MiFID II compliance.

**Key Attributes:**
- **X-Correlation-ID** (string, optional): Correlation identifier
- **questionnaireId** (string, uuid, required): Questionnaire instance identifier
- **timestamp** (string, date-time, required): Completion timestamp (Business Change Date)
- **owner** (object, required): Customer who completed questionnaire
  - **crmId** (string, required): Client CRM identifier (KLID), length 10
- **questionnaireTemplateId** (string, uuid, required): Template version used
- **status** (string, enum, required): Questionnaire status (draft | submitted | evaluated | approved | rejected)
- **filledBy** (object): Person who filled questionnaire
  - **crmId** (string): Filler CRM identifier
  - **bankerDomainName** (string): Banker domain name if filled on behalf
- **filledWhen** (string, date-time, required): Submission date/time
- **questions** (array, required): Collection of questions and answers
  - **questionId** (string): Question identifier
  - **questionText** (string): Question text
  - **answerType** (string): Answer type (single-choice | multiple-choice | text | numeric)
  - **answer** (object): Customer's answer
- **score** (object): Evaluation score
  - **totalScore** (integer): Total score achieved
  - **maxScore** (integer): Maximum possible score
  - **percentage** (number): Score percentage
- **location** (object): Market location (CZ | SK)

**Business Identifiers:**
- Business Identifier: questionnaireId or owner.crmId
- Business Change Date: timestamp
- Business State: status

**REST API Triggers:**
- POST /api/v1/ClientQuestionnaire/answer/{clientId}
- POST /api/v1/ClientQuestionnaire/eval/{clientId}/{clientQuestionnaireId}
- PUT /api/v1/ClientQuestionnaire/answer/{clientId}/{clientQuestionnaireId}
- PUT /api/v1/ClientQuestionnaire/verify/{clientId}/{clientQuestionnaireId}
- PUT /api/v1/ClientQuestionnaire/acquaint/{clientId}/{clientQuestionnaireId}
- PUT /api/v1/ClientQuestionnaire/authorize/{clientId}/{clientQuestionnaireId}
- PUT /api/v1/ClientQuestionnaire/disable/{clientId}/{clientQuestionnaireId}
- PUT /api/v1/ClientQuestionnaire/refuse/{clientId}/{clientQuestionnaireId}

### InvestmentQuestionnaireEval
Evaluation results and analysis of completed investment questionnaires.

**Key Attributes:**
- **X-Correlation-ID** (string, optional): Correlation identifier
- **evaluationId** (string, uuid, required): Evaluation instance identifier
- **questionnaireId** (string, uuid, required): Referenced questionnaire
- **timestamp** (string, date-time, required): Evaluation timestamp (Business Change Date)
- **evaluatedBy** (object): Evaluator information
  - **crmId** (string): Evaluator CRM identifier
  - **domainName** (string): Evaluator domain name
- **evaluationResult** (string, enum): Result classification (suitable | conditional | unsuitable)
- **riskProfile** (string, enum): Customer risk profile (conservative | balanced | aggressive)
- **recommendedProducts** (array): Products suitable for customer
- **restrictedProducts** (array): Products not suitable for customer
- **expiryDate** (string, date-time): Evaluation expiry date
- **notes** (string): Evaluator notes

**Business Identifiers:**
- Business Identifier: evaluationId
- Business Change Date: timestamp

### InvestmentQuestionnaireTemplate
Master template defining questionnaire structure and questions.

**Key Attributes:**
- **X-Correlation-ID** (string, optional): Correlation identifier
- **templateId** (string, uuid, required): Template identifier
- **version** (string, required): Template version
- **validFrom** (string, date-time, required): Template validity start
- **validTo** (string, date-time): Template validity end
- **location** (object): Applicable market (CZ | SK | both)
- **questionnaireType** (string, enum): Type (mifid | appropriateness | suitability)
- **questions** (array, required): Question definitions
  - **questionId** (string): Question identifier
  - **questionText** (string): Question text
  - **questionType** (string): Type (single-choice | multiple-choice | text | numeric)
  - **required** (boolean): Whether question is mandatory
  - **options** (array): Available answer options
  - **scoringRules** (object): Scoring logic
- **evaluationRules** (object): Evaluation criteria and thresholds

**Business Identifiers:**
- Business Identifier: templateId
- Business Change Date: validFrom

**Note:** Templates published at HQ level (not location-specific topics)

### MarketSettings
Configuration parameters for investment markets and products.

**Key Attributes:**
- **X-Correlation-ID** (string, optional): Correlation identifier
- **marketSettingsId** (string, uuid, required): Settings identifier
- **timestamp** (string, date-time, required): Last modification timestamp
- **marketId** (string, required): Market identifier
- **marketName** (string): Market name
- **location** (object, required): Market location (CZ | SK)
- **tradingHours** (object): Trading schedule
  - **openTime** (string): Opening time
  - **closeTime** (string): Closing time
  - **tradingDays** (array): Active trading days
- **productSettings** (array): Product configurations
  - **productType** (string): Product type (stocks | bonds | etf | options | futures)
  - **enabled** (boolean): Whether product is available
  - **minimumInvestment** (number): Minimum investment amount
  - **fees** (object): Fee structure
- **riskLimits** (object): Risk management parameters
- **complianceSettings** (object): Compliance rules

**Business Identifiers:**
- Business Identifier: marketSettingsId
- Business Change Date: timestamp

## Integration Points

### Publishing Systems
- **CRM**: Publishes all questionnaires, evaluations, templates, and market settings via REST API and CRM console

### Consuming Systems
- **DKCZ (Digital Channels CZ)**: Consumes questionnaires and settings to determine service eligibility and product availability
- **DKSK (Digital Channels SK)**: Consumes questionnaires and settings to determine service eligibility and product availability

## Technical Implementation

### Event Characteristics

**InvestmentQuestionnaireEval:**
- **Trigger:** Any change via REST interface or CRM console
- **Frequency:** Not estimated, to be revised based on practice
- **Note:** CRM object richer than published portion

**InvestmentQuestionnaire:**
- **Trigger:** Calling REST interface (answer, eval, verify, acquaint, authorize, disable, refuse operations)
- **Frequency:** Upon questionnaire creation or update

**InvestmentQuestionnaireTemplate:**
- **Trigger:** Template creation, change, or update via CRM console
- **Frequency:** Infrequent (template changes)

**MarketSettings:**
- **Trigger:** Market configuration changes via CRM console
- **Frequency:** Not specified

### API Parameters

**InvestmentQuestionnaire Reconciliation:**
- Path params: questionnaireId, investmentQuestionnaireDataId, AccountGUID
- Headers: X-Correlation-ID (required)
- Query params (optional):
  - from: BCD filtering start
  - to: BCD filtering end
  - location: Market filter (cz | sk) - selects only questionnaires belonging to CZ or SK clients
- Query params (required): mode=async

**MarketSettings Reconciliation:**
- Path params: marketSettingsId
- Headers: X-Correlation-ID, traceparent (required)
- Query params (optional): Similar filtering options

### Initialization
- Sends all questionnaires/settings in last state
- Can be REST service or alternative format
- For InvestmentQuestionnaire: All questionnaires in last state
- For Templates: All active template versions

### Error Handling
- Duplicates may occur up to BCD level
- Consumers expected to handle deduplication
- Standard integration aspects apply

## MiFID II Compliance

### Questionnaire Types
1. **Appropriateness Assessment** - Evaluates customer knowledge and experience
2. **Suitability Assessment** - Evaluates investment objectives and financial situation
3. **MiFID Questionnaire** - Comprehensive assessment for complex products

### Evaluation Process
1. Customer completes questionnaire (self-service or assisted)
2. System calculates score based on template rules
3. Evaluator reviews and approves/rejects
4. Result determines product eligibility
5. Evaluation expires and requires renewal

### Risk Profiles
- **Conservative:** Low-risk products only
- **Balanced:** Moderate-risk products allowed
- **Aggressive:** All products including high-risk

## Capacity Requirements
- **Volume:** Not specified in documentation
- **Frequency:** To be estimated based on operational practice
- **Peak Scenarios:** Onboarding periods, regulatory changes

## Summary Statistics
- **Total REST APIs:** 2 (InvestmentQuestionnaire Reconciliation, MarketSettings Reconciliation)
- **Total Event Streams:** 13 (4 Eval topics - 2 CZ + 2 SK, 4 Questionnaire topics - 2 CZ + 2 SK, 2 Template topics - HQ level, 4 MarketSettings topics - 2 CZ + 2 SK, 1 Control)
- **Total Data Objects:** 4 (InvestmentQuestionnaire, InvestmentQuestionnaireEval, InvestmentQuestionnaireTemplate, MarketSettings)
- **Total Impacted Systems:** 4 (CRM, DKCZ, DKSK, WSO2)

## Special Notes
- MiFID II compliance is primary driver for investment questionnaires
- Templates versioned to handle regulatory changes
- Questionnaire completion can be customer self-service or banker-assisted
- Evaluations have expiry dates requiring periodic renewal
- Market settings control product availability per market
- Template topics published at HQ level (both CZ and SK consume same templates)
- Location-specific questionnaire and evaluation topics for data segregation
- CRM object significantly richer than published data
- JSON schemas stored in centralized repository
- Supports comprehensive investment service eligibility assessment
- Risk profiles determine product access permissions
- Templates support multiple question types and complex scoring rules
