# JIRA TASK: BMS Domain Impact Analysis - Market Data Platform Replacement

**Domain**: Brand, Marketing and Sales Management (BMS)
**Linked Epic**: Market Data Platform (MDP) Replacement
**Agent**: BMS Impact Analyst
**Status**: Analysis Complete

---

## Domain Impact Assessment

**Overall Impact Level**: MEDIUM

**Rationale**: BMS domain uses market data for competitive intelligence, campaign targeting, sales tools, and market research. Impact is moderate as BMS operations can tolerate higher latency (minutes/hours vs. seconds for trading) and are less mission-critical than trading/risk operations.

---

## SCOPE MATRIX - IN SCOPE (BMS Domain)

**Total Requirements**: 8 across Market Management, Campaign Management, Message Management

### Key Requirements Summary:

1. **Market Management** (6 requirements):
   - Market data feed configuration and administration
   - Market data monitoring and operations
   - Financial market analysis for competitive intelligence
   - Market information consolidation for sales/marketing
   - Public reference data management for marketing materials
   - Market research access via MDP

2. **Campaign Management** (1 requirement):
   - Campaign segmentation/targeting using portfolio valuations

3. **Message Management** (1 requirement):
   - Corporate messaging about market data capabilities

### Critical Requirements:
- Market data switch administration (BMS-MDP-IN-001) - HIGH priority
- Financial market analysis (BMS-MDP-IN-003) - HIGH priority (competitive pricing)
- Campaign targeting logic (BMS-MDP-IN-007) - MEDIUM-HIGH priority

---

## SCOPE MATRIX - OUT OF SCOPE (BMS Domain)

**Items explicitly NOT in BMS scope:**
- Technical integration (ITS domain)
- Data governance framework (PSO + ITS)
- Vendor contract management (PSO Agreement Management)
- Risk/compliance implementation (RFC domain)
- System performance tuning (ITS Platform Operations)
- Technical training/documentation (ITS)

---

## ASSUMPTIONS (8 total)

### HIGH-Risk Assumptions:
1. **Backward-compatible data formats** (ASMP-MDP-003): Assumes new MDP provides compatible formats OR conversion layer
   - **Risk**: HIGH - If violated, significant BMS application rework
   - **Validation**: Request technical specification from ITS (Week 1)

2. **Historical data migration** (ASMP-MDP-004): 3+ years of historical data will be migrated
   - **Risk**: HIGH - BMS trend analysis broken without sufficient history
   - **Validation**: Confirm with PSO/ITS migration scope

3. **Data quality maintenance** (ASMP-MDP-008): Market data quality maintained or improved
   - **Risk**: HIGH - Degradation undermines competitive intelligence value
   - **Validation**: Request quality metrics from ITS/PSO

### MEDIUM-Risk Assumptions:
- BMS data consumption is low-volume vs. trading operations
- BMS latency requirements less stringent (minutes vs. seconds)
- BMS has capacity for UAT without operational disruption
- No new regulatory requirements from MDP change
- MDP migration is IT-funded (no significant BMS budget allocation)

---

## CONSTRAINTS (6 total)

### HIGH-Impact Constraints:
1. **Q4 Campaign Calendar** (CNSTR-MDP-002): Major year-end campaigns limit UAT availability Oct-Dec
   - **Mitigation**: Coordinate migration timeline, prioritize critical functions for early testing

2. **Hard-coded Dependencies** (CNSTR-MDP-003): BMS applications may have dependencies on current MDP structure
   - **Mitigation**: Early technical discovery, application inventory, budget for potential rework

3. **Licensing Changes** (CNSTR-MDP-006): Potential loss of research content or increased costs
   - **Mitigation**: Early engagement with PSO Agreement Management, validate licensing terms

### MEDIUM-Impact Constraints:
- MiFID II requirements for data sourcing transparency in marketing materials
- Limited BMS technical expertise (heavy IT reliance)
- Historical data granularity requirements for wealth management scenarios

---

## CRITICAL DEPENDENCIES

### Upstream Dependencies:
- **PSO Financial Instrument Management**: Reference data, pricing feeds for competitive analysis
- **ITS System Integration**: API compatibility, data format conversion, historical data migration
- **PSO Agreement Management**: Data provider licensing, research content access

### Downstream Dependencies:
- **Campaign effectiveness**: Poor data quality → wrong segmentation → campaign failures
- **Competitive positioning**: Data gaps → outdated intelligence → market share loss
- **Sales productivity**: Unreliable sales tools → lost opportunities

---

## RISKS IDENTIFIED

### Medium-High Risk Items:
1. **Hard-coded application dependencies** → extensive rework, timeline delays
2. **Historical data incomplete** → analytics broken, strategic decisions impaired
3. **Q4 calendar conflicts** → rushed testing, quality compromises
4. **Licensing changes** → loss of critical research content
5. **Data quality degradation** → competitive intelligence unreliable

---

## RECOMMENDED ACTIONS

### IMMEDIATE (Week 1-2):
1. Assign dedicated BMS MDP liaison
2. Complete inventory of BMS applications consuming market data
3. Specify BMS minimum historical data requirements (instruments, timeframes, granularity)
4. Begin licensing review with PSO Agreement Management

### SHORT-TERM (Week 3-8):
1. Technical discovery - assess BMS integration points, API compatibility
2. UAT planning - identify test scenarios, coordinate with campaign calendar
3. Validate BMS data access maintained in new MDP vendor agreements

### MEDIUM-TERM (Month 3-6):
1. UAT execution - sales tools, dashboards, campaign segmentation, reporting
2. Contingency planning - fallback procedures if market data unavailable
3. Internal stakeholder communication - RMs, marketing team, sales planning

### POST-MIGRATION:
1. Hypercare monitoring - daily checks of BMS-critical data feeds
2. Performance validation - confirm latency, accuracy meet BMS SLAs
3. Lessons learned documentation

---

## QUESTIONS FOR DOMAIN OWNER VALIDATION

See detailed scope matrix for 40+ specific questions requiring business owner confirmation, including:

- Current market data feeds and providers for BMS purposes
- BMS applications consuming market data (tools, dashboards, reports)
- SLA requirements for data availability and latency
- Competitive analysis processes and data dependencies
- Campaign targeting logic using market data
- Historical data requirements for trend analysis
- Marketing materials using reference data
- Research content licensing and usage

---

## SUCCESS CRITERIA (BMS Domain)

1. ✓ All BMS market data feeds operational
2. ✓ Sales tools provide near-real-time data (5-15 min delay max)
3. ✓ 3+ years historical data available for analytics
4. ✓ Campaign segmentation logic functions correctly
5. ✓ Competitive analysis reports accurate and timely
6. ✓ Research content access maintained (licensing)
7. ✓ Zero disruption to Q4 campaign execution
8. ✓ All 12 scheduled reports functioning (Power BI, Excel)

---

## DELIVERABLES

- ✅ BMS Scope Matrix (IN/OUT) with 8 in-scope requirements
- ✅ 8 Assumptions documented with validation approaches
- ✅ 6 Constraints identified with mitigation strategies
- ✅ Critical dependencies mapped (PSO, ITS, CPB)
- ✅ Risk register with 5 medium-high priority risks
- ✅ Recommended action plan (immediate/short/medium-term)

---

**Analysis Date**: 2025-10-17
**Analyst**: BMS Domain Expert (architect-scope-analyst)
**Status**: ✅ Complete - Ready for Business Owner Validation
**Next Step**: Schedule BMS stakeholder validation workshop
