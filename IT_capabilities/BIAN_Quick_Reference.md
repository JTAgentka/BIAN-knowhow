# BIAN Structure Quick Reference Guide

## Quick File Finder

### Looking for Payment APIs?
```
BIAN/03_Banking_Financial_Markets_Operations/Payment_Execution/
├── Payment_Processing/          # Payment events, SEPA
├── Payment_Orders/              # Standing orders, DDM
├── Direct_Debit/                # Direct debit mandates
└── Transaction_Processing/      # CRD, LCP, FCP, TLM, CTI, GEN transactions
```

### Looking for Customer/CRM APIs?
```
BIAN/04_Customer_Distribution_Channels/Customer_Management/
├── Customer_Relationship/       # CRM Account, Contact, Relations
├── Access_Entitlement/          # Disposition rights, authorized accounts
├── Event_History/               # CRM Activities, DK Activities
├── Service_Eligibility/         # Investment questionnaire, market settings
└── Advisory_Services/           # Real-time data access
```

### Looking for Investment/Portfolio APIs?
```
BIAN/03_Banking_Financial_Markets_Operations/Investment_Portfolio_Management/
├── Portfolio_Analysis/          # Portfolio overview and valuations
├── Investment_Orders/           # Investment orders, regular investments
├── Brokerage_Trading/           # Instrument transactions, trading
├── Securities_Position/         # Portfolio positions and valuations
├── Custody_Operations/          # Collection accounts, accrued interest
└── Securities_Trading/          # Mutual funds, repo trades, transfers
```

### Looking for Card/Device APIs?
```
BIAN/03_Banking_Financial_Markets_Operations/Issued_Device_Administration/
# Card details, card states, credit accounts, transaction notifications
```

### Looking for FX/Currency APIs?
```
BIAN/03_Banking_Financial_Markets_Operations/Financial_Instrument_Management/
├── Currency_Exchange/           # FX rates
├── Foreign_Exchange/            # FX forward, spot, swap, derivatives
├── Instrument_Pricing/          # Market prices, value prices
└── Current_Account/             # Accounts, balances, closing balances
```

### Looking for Technical/Integration Docs?
```
BIAN/02_IT_Management/
├── System_Operations_Integration/    # Integration analysis, schemas
├── Operational_Gateway_API_Management/  # PSD2 APIs
├── Process_Management/              # Camunda processes
└── Document_Management/             # Statements, notices, documents
```

### Looking for Product Information?
```
BIAN/03_Banking_Financial_Markets_Operations/Product_Management/
├── Product_Design/              # Product catalog, relevant products
├── Product_Fulfillment/         # Autosweep, kombi products
└── Product_Pricing/             # Fees calculation
```

---

## File Naming Patterns

### Event Stream Files
- **Pattern:** `{Name}---Event-Stream_{ID}.html`
- **Example:** `Payment---Event-Stream_17338862.html`
- **Location:** Throughout capability folders

### REST API Files
- **Pattern:** `{Name}---REST-API_{ID}.html`
- **Example:** `Account---REST-API_17340371.html`
- **Location:** Throughout capability folders

### Data Model Files
- **Pattern:** `{ID}.html` with "Datový model" in title
- **Example:** `17342098.html` (CRM Account - Datový model)
- **Location:** Grouped with related APIs

### Integration Analysis Files
- **Pattern:** `{ID}.html` with "Integrační analýza" in title
- **Example:** `17342097.html` (CRM Account - Integrační analýza)
- **Location:** Grouped with related APIs

---

## Common Tasks

### Task: Find all CRM-related files
**Path:** `BIAN/04_Customer_Distribution_Channels/Customer_Management/`

### Task: Find all payment transaction types
**Path:** `BIAN/03_Banking_Financial_Markets_Operations/Payment_Execution/Transaction_Processing/`

### Task: Find PSD2 APIs
**Path:** `BIAN/02_IT_Management/Operational_Gateway_API_Management/`

### Task: Find investment instrument information
**Path:** `BIAN/03_Banking_Financial_Markets_Operations/Financial_Instrument_Management/Instrument_Maintenance/`

### Task: Find process definitions (Camunda)
**Path:** `BIAN/02_IT_Management/Process_Management/`

---

## Division Overview

### Division 1: Risk, Compliance & Fraud
**Status:** Empty (placeholder for future content)

### Division 2: IT Management (51 files)
**Focus:** Technical infrastructure and integration
- System operations
- API gateways (PSD2)
- Process orchestration
- Document management
- Reference data

### Division 3: Banking & Financial Markets (236 files)
**Focus:** Core banking operations
- Payments & transactions
- Investment portfolio
- Financial instruments
- Products & pricing
- Cards & devices
- Collateral

### Division 4: Customer & Distribution (80 files)
**Focus:** Customer management and channels
- CRM and relationships
- Access & entitlements
- Digital channels
- Advisory services

### Division 5: Marketing & Sales (4 files)
**Focus:** Marketing and campaigns
- Campaign management
- Marketing lists

---

## Capability Index

### IT Management Capabilities
1. System Operations Integration
2. Operational Gateway API Management
3. Process Management
4. Application State Management
5. Document Management
6. Reference Data Codebooks

### Banking Operations Capabilities
1. Collateral Management
2. Financial Instrument Management
3. Investment Portfolio Management
4. Issued Device Administration
5. Payment Execution
6. Product Management

### Customer & Channels Capabilities
1. Channel Management
2. Customer Management

### Marketing & Sales Capabilities
1. Campaign Management

---

## Tips

### Browsing by Business Function
1. Start with the division (01-05)
2. Navigate to the capability
3. Find the subcapability (if applicable)
4. Locate your specific file

### Searching for Specific APIs
- Use file search with API name
- Example: Search for "Payment" → find Payment---Event-Stream
- Check the parent folders to understand the business context

### Understanding File Groups
Files are grouped by business entity:
- **Event Stream:** Real-time events
- **REST API:** Synchronous queries
- **Data Model:** Data structures
- **Integration Analysis:** Implementation docs

### Common Assets
All shared resources (images, styles, attachments) are in:
```
BIAN/_Common_Assets/
├── attachments/
├── images/
├── styles/
└── index.html
```

---

## Folder Statistics

| Division | Capability Folders | Total Files |
|----------|-------------------|-------------|
| IT Management | 6 | 51 |
| Banking & Financial Markets | 6 main + 26 sub | 236 |
| Customer & Channels | 2 main + 7 sub | 80 |
| Marketing & Sales | 1 | 4 |
| Navigation | 1 | 12 |
| Common Assets | 1 | 1 |
| **TOTAL** | **42** | **384** |

---

## Need More Detail?

- **Full structure:** See `EI_Reorganization_Plan.md`
- **Migration details:** See `BIAN_Migration_Summary.md`
- **Capability model:** See `komplet.md`

---

**Last Updated:** 2025-10-14
