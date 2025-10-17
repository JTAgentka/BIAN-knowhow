### Correspondent Bank Directory - Domain Expertise
You have mastery-level understanding in following business and IT aspect of this capability. Your expertise is limited only to provided information below.



#### Role Definition
This service domain maintains reference details specific to a correspondent banking partner covering payment terms and preferences and security keys. It also consolidates transactional activity as might be needed to track reciprocity with the correspondent bank. Any specific arrangements and terms (e.g. SSIs) that might override market directory details are maintained here as part of the data record.

#### Folder Name
Partner Management

#### Core Business Object
Correspondent Banking Agreement

#### Example of Use
Correspondent bank (reciprocal) activity is consolidated to support periodic correspondent banking relationship reviews

#### Executive Summary
This service domain maintains correspondent bank reference details. This includes correspondent bank payment parameters in particular bank limits and capturing transaction activity to track reciprocity

#### Key Features
- Maintain correspondent bank reference data
- Maintain specific correspondent settlement instructions
- Track correspondent bank's service reciprocity

#### API BIAN Portal Link
https://app.swaggerhub.com/apis/BIAN-3/CorrespondentBankDirectory/12.0.0

#### Served By
- Correspondent Bank Directory Entry Analytics Object
- Correspondent Bank Directory Entry_Invocation
- Correspondent Bank Directory Entry_Instantiation
- Correspondent Bank Directory_SD_Operations
- Correspondent Bank Directory Entry_Reporting
- Correspondent Bank Directory_SD_Service Group

#### Serves
- Partner Management

#### Triggered By
- Payment Order

#### Triggers
(None specified)

#### List of Scenarios
- Handle Request for Outgoing Credit Transfer
- Handle Request for Outgoing FCY Credit Transfer via SWIFT

#### Analytics

### Individual Analytics
- correspondentBankDirectoryEntryAccumulators
- correspondentBankDirectoryEntryActivityAnalysis
- correspondentBankDirectoryEntryPerformanceAnalysis
- correspondentBankDirectoryEntryTrends&Events

### Portfolio Analytics
- correspondentBankDirectoryEntryPortfolioActivityAnalysis
- correspondentBankDirectoryEntryPortfolioMake-UpAnalysis
- correspondentBankDirectoryEntryPortfolioPerformanceAnalysis

#### Relations
- **Aggregated By**: External Agency, Wave 1, Clearing And Settlement
- **Is Part Of**: External Agency
- **Gets Input From**: Customer Relationship Management, Correspondent Bank Operations
- **Sends Output To**: Financial Message Analysis, Correspondent Bank Operations, Legal Entity Directory

#### BIAN Properties
- **BIAN Life Cycle**: Registered
- **Stereotype**: ServiceDomain
- **BIAN Proposed ISO20022 Control Record Match**: CorrespondentBankRegistry
