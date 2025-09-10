# Task Management - BIAN Capabilities Overview

## Directory Overview
This directory contains extracted BIAN capabilities related to Task Management within the Enterprise Enabling domain. All capabilities have been extracted from BIAN service landscape MHTML files and structured into JSON and Markdown formats.

## Extracted Capabilities Summary

| Capability Name | Type | Description | Service Operations | Source File |
|-----------------|------|-------------|-------------------|-------------|
| **Servicing Issue** | Service Domain | Handles production customer servicing issues detected in the customer servicing environment | Issue detection, resolution, monitoring | object_33504.mhtml |
| **Case Root Cause Analysis** | Capability | Reviews case reports to identify improvements to eliminate/mitigate servicing issues | Product/service analysis, operational analysis, credit/fraud analysis | object_41839.mhtml |
| **Allocation Criteria** | Business Service | Manages allocation criteria with accept, verify, reject functions | ExchangeAllocationCriteria | object_41869.mhtml |
| **Customer Case Management** | Business Service | Manages customer case management plans and execution | Plan acceptance/rejection, case verification | object_42150.mhtml |
| **Card Case Arbitration** | Business Service | Manages card case arbitration processes and result validation | Arbitration result processing | object_30796.mhtml |
| **Open Item Repayment** | Business Service | Manages repayment transactions for open items | Repayment transaction processing | object_31686.mhtml |
| **Card Collections Payment** | Business Service | Manages payment transactions for card collections accounts | ExchangePaymentWorksteps | object_32295.mhtml |
| **Payment Worksteps** | Business Service | Manages payment workflow processes and verification sequences | Payment transaction processing | object_41059.mhtml |
| **Customer Case Procedure** | Business Service | Manages customer case procedures and verification workflows | Customer case aspect verification | object_43455.mhtml |
| **Sweep Agreement Process** | External Process | Handles requests to add accounts to sweep agreements | Account addition request handling | object_47264.mhtml |
| **Sweeps Pooling Management Process** | External Process | Manages sweep pooling operations and fund aggregation | Sweep pool management | object_47339.mhtml |

## Capability Types Distribution

### Service Domains (1)
- **Servicing Issue**: Core service domain for customer issue resolution

### Capabilities (1) 
- **Case Root Cause Analysis**: Analysis capability for service improvements

### Business Services (7)
- **Allocation Criteria**: Resource allocation management
- **Customer Case Management**: Case planning and execution
- **Customer Case Procedure**: Procedure execution and verification
- **Card Case Arbitration**: Dispute arbitration processes
- **Open Item Repayment**: Repayment processing
- **Card Collections Payment**: Collections payment management
- **Payment Worksteps**: Payment workflow processing

### External Processes (2)
- **Sweep Agreement Process**: Sweep agreement management
- **Sweeps Pooling Management Process**: Multi-account sweep operations

## Common Behavioral Patterns

- **Transaction Processing**: Real-time processing and verification
- **Case Management**: Comprehensive case lifecycle management
- **Resource Allocation**: Criteria-based assignment and routing
- **Payment Processing**: Multi-step payment workflows
- **Analysis & Reporting**: Performance analysis and improvement identification
- **Process Automation**: Automated decision-making and monitoring

## Asset Types Managed

- Case records and management plans
- Transaction logs and payment records
- Analysis results and improvement reports
- Allocation and routing criteria data
- Verification and status tracking records
- Arbitration and dispute resolution data
- Sweep agreement and pooling configurations

## Integration Points

These capabilities integrate with various banking systems including:
- Customer servicing platforms
- Payment processing systems
- Case management systems
- Fraud detection systems
- Collections management platforms
- Account management systems

## Files Structure

```
Task Management/
├── README.md                                    # This overview file
├── allocation-criteria-capability.json         # JSON structure
├── allocation-criteria-capability.md           # Documentation
├── card-case-arbitration-capability.json       # JSON structure  
├── card-case-arbitration-capability.md         # Documentation
├── card-collections-payment-capability.json    # JSON structure
├── card-collections-payment-capability.md      # Documentation
├── case-root-cause-analysis-capability.json    # JSON structure
├── case-root-cause-analysis-capability.md      # Documentation
├── customer-case-management-capability.json    # JSON structure
├── customer-case-management-capability.md      # Documentation
├── customer-case-procedure-capability.json     # JSON structure
├── customer-case-procedure-capability.md       # Documentation
├── open-item-repayment-capability.json         # JSON structure
├── open-item-repayment-capability.md           # Documentation
├── payment-worksteps-capability.json           # JSON structure
├── payment-worksteps-capability.md             # Documentation
├── servicing-issue-capability.json             # JSON structure
├── servicing-issue-capability.md               # Documentation
├── sweep-agreement-process.json                # JSON structure
├── sweep-agreement-process.md                  # Documentation
├── sweeps-pooling-management-process.json      # JSON structure
└── sweeps-pooling-management-process.md        # Documentation
```

## Usage Notes

Each capability is documented in both JSON (machine-readable) and Markdown (human-readable) formats. The JSON files contain the complete BIAN architectural structure while the Markdown files provide business-friendly documentation suitable for stakeholders and technical architects.

---
*Generated from BIAN Service Landscape MHTML files - Enterprise Enabling/Task Management domain*