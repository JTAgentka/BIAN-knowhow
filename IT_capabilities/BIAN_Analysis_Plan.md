# BIAN Directory Analysis Plan

## Objective

Analyze all 40 leaf directories in the BIAN structure and create comprehensive summary MD files for each directory containing:

1. **APIs**: List of REST APIs with their main functions and descriptions
2. **EI Topics**: List of Event Stream topics with their purpose
3. **Data Objects**: Data models/objects exposed by APIs or Kafka topics
4. **Impacted Systems**: Systems that provide or consume the APIs/topics

## Identified Leaf Directories (40)

### Division 02: IT Management (6 directories)

1. `02_IT_Management/Application_State_Management` (8 files)
2. `02_IT_Management/Document_Management` (15 files)
3. `02_IT_Management/Operational_Gateway_API_Management` (8 files)
4. `02_IT_Management/Process_Management` (8 files)
5. `02_IT_Management/Reference_Data_Codebooks` (6 files)
6. `02_IT_Management/System_Operations_Integration` (6 files)

**Total: 51 files**

### Division 03: Banking & Financial Markets Operations (31 directories)

#### Collateral Management (1 directory)
7. `03_Banking_Financial_Markets_Operations/Collateral_Management` (3 files)

#### Financial Instrument Management (7 directories)
8. `03_Banking_Financial_Markets_Operations/Financial_Instrument_Management/Currency_Exchange` (4 files)
9. `03_Banking_Financial_Markets_Operations/Financial_Instrument_Management/Current_Account` (12 files)
10. `03_Banking_Financial_Markets_Operations/Financial_Instrument_Management/Deposits` (4 files)
11. `03_Banking_Financial_Markets_Operations/Financial_Instrument_Management/Foreign_Exchange` (13 files)
12. `03_Banking_Financial_Markets_Operations/Financial_Instrument_Management/Instrument_Maintenance` (9 files)
13. `03_Banking_Financial_Markets_Operations/Financial_Instrument_Management/Instrument_Pricing` (11 files)
14. `03_Banking_Financial_Markets_Operations/Financial_Instrument_Management/Reference_Data` (8 files)

#### Investment Portfolio Management (9 directories)
15. `03_Banking_Financial_Markets_Operations/Investment_Portfolio_Management/Brokerage_Trading` (6 files)
16. `03_Banking_Financial_Markets_Operations/Investment_Portfolio_Management/Custody_Operations` (15 files)
17. `03_Banking_Financial_Markets_Operations/Investment_Portfolio_Management/Investment_Account_Operations` (15 files)
18. `03_Banking_Financial_Markets_Operations/Investment_Portfolio_Management/Investment_Orders` (10 files)
19. `03_Banking_Financial_Markets_Operations/Investment_Portfolio_Management/Investment_Support` (8 files)
20. `03_Banking_Financial_Markets_Operations/Investment_Portfolio_Management/Managed_Investment` (4 files)
21. `03_Banking_Financial_Markets_Operations/Investment_Portfolio_Management/Portfolio_Analysis` (9 files)
22. `03_Banking_Financial_Markets_Operations/Investment_Portfolio_Management/Securities_Position` (8 files)
23. `03_Banking_Financial_Markets_Operations/Investment_Portfolio_Management/Securities_Trading` (15 files)

#### Issued Device Administration (1 directory)
24. `03_Banking_Financial_Markets_Operations/Issued_Device_Administration` (14 files)

#### Payment Execution (4 directories)
25. `03_Banking_Financial_Markets_Operations/Payment_Execution/Direct_Debit` (8 files)
26. `03_Banking_Financial_Markets_Operations/Payment_Execution/Payment_Orders` (13 files)
27. `03_Banking_Financial_Markets_Operations/Payment_Execution/Payment_Processing` (7 files)
28. `03_Banking_Financial_Markets_Operations/Payment_Execution/Transaction_Processing` (23 files)

#### Product Management (3 directories)
29. `03_Banking_Financial_Markets_Operations/Product_Management/Product_Design` (7 files)
30. `03_Banking_Financial_Markets_Operations/Product_Management/Product_Fulfillment` (8 files)
31. `03_Banking_Financial_Markets_Operations/Product_Management/Product_Pricing` (2 files)

**Total: 236 files**

### Division 04: Customer & Distribution Channels (8 directories)

#### Channel Management (1 directory)
32. `04_Customer_Distribution_Channels/Channel_Management` (6 files)

#### Customer Management (7 directories)
33. `04_Customer_Distribution_Channels/Customer_Management/Access_Entitlement` (17 files)
34. `04_Customer_Distribution_Channels/Customer_Management/Advisory_Services` (9 files)
35. `04_Customer_Distribution_Channels/Customer_Management/Agreements` (4 files)
36. `04_Customer_Distribution_Channels/Customer_Management/Customer_Relationship` (17 files)
37. `04_Customer_Distribution_Channels/Customer_Management/Event_History` (8 files)
38. `04_Customer_Distribution_Channels/Customer_Management/Reference_Data` (8 files)
39. `04_Customer_Distribution_Channels/Customer_Management/Service_Eligibility` (11 files)

**Total: 80 files**

### Division 05: Marketing & Sales (1 directory)

40. `05_Marketing_Sales/Campaign_Management` (4 files)

**Total: 4 files**

---

## Grand Total

- **40 directories** to analyze
- **371 HTML files** to process (excluding Navigation Pages and Common Assets)

---

## Analysis Approach

### For Each Directory:

1. **Read all HTML files** in the directory
2. **Extract information**:
   - API names (REST APIs ending with `---REST-API`)
   - Event Stream topics (files ending with `---Event-Stream`)
   - Main functions and descriptions from content
   - Data models/objects (files with "Datový model" or data structure information)
   - Impacted systems (system names mentioned in documentation)
3. **Create summary MD file** named `SUMMARY.md` in each directory
4. **Format** according to specified structure

### Summary MD File Structure:

```markdown
# [Capability Name] - Summary

## Overview
[Brief description of the capability]

## REST APIs

### [API Name 1]
- **Description:** [Purpose and main functionality]
- **Key Operations:** [List of main operations]
- **Data Objects:** [Objects exposed/consumed]
- **Impacted Systems:** [System names]

### [API Name 2]
...

## Event Stream Topics

### [Topic Name 1]
- **Purpose:** [What events are published]
- **Event Types:** [Types of events]
- **Data Objects:** [Objects in events]
- **Impacted Systems:** [Publishers/Subscribers]

### [Topic Name 2]
...

## Data Objects

- **[Object Name 1]**: [Description and key attributes]
- **[Object Name 2]**: [Description and key attributes]
...

## Integration Points

### Publishing Systems
- [System 1]: [What it provides]
- [System 2]: [What it provides]

### Consuming Systems
- [System 1]: [What it consumes]
- [System 2]: [What it consumes]

## Summary Statistics

- Total REST APIs: X
- Total Event Streams: Y
- Total Data Objects: Z
- Total Impacted Systems: W
```

---

## Execution Plan

### Phase 1: IT Management (6 directories)
Analyze and create summaries for all IT Management capability directories.

### Phase 2: Banking Operations - Financial Instruments (7 directories)
Analyze Financial Instrument Management subdirectories.

### Phase 3: Banking Operations - Investment Portfolio (9 directories)
Analyze Investment Portfolio Management subdirectories.

### Phase 4: Banking Operations - Payments & Others (10 directories)
Analyze Payment Execution, Product Management, Issued Devices, and Collateral.

### Phase 5: Customer & Distribution (8 directories)
Analyze all Customer and Channel Management directories.

### Phase 6: Marketing & Sales (1 directory)
Analyze Campaign Management directory.

---

## Expected Deliverables

- **40 SUMMARY.md files**, one in each leaf directory
- Each summary containing:
  - Complete API inventory
  - Complete Event Stream inventory
  - Data object catalog
  - System integration map
  - Statistics

---

## Success Criteria

✅ All 40 directories have SUMMARY.md files
✅ All HTML files analyzed and information extracted
✅ Consistent formatting across all summaries
✅ Accurate extraction of APIs, topics, data objects, and systems
✅ Complete and actionable documentation

---

**Plan Created:** 2025-10-14
**Status:** Ready for Execution
