# JIRA TASK: CPB Domain Impact Analysis - Market Data Platform Replacement

**Domain**: Customer, Partner and Branch Management (CPB)
**Linked Epic**: Market Data Platform (MDP) Replacement
**Agent**: CPB Impact Analyst
**Status**: Analysis Complete

---

## Domain Impact Assessment

**Overall Impact Level**: MEDIUM-HIGH

**Rationale**: CPB domain has significant dependencies on market data for customer-facing channels (eBranch, mobile apps, IVR), CRM systems, and partner integrations. Customer experience directly impacted by data quality, availability, and latency.

---

## SCOPE MATRIX - IN SCOPE (CPB Domain)

**Total Requirements**: 10 across Customer Management, Channel Management, Partner Management

### Key Requirements Summary:

1. **Customer Management**: Customer service teams need access to real-time portfolio valuations, pricing information for customer inquiries
2. **Channel Management**: eBranch, mobile apps, IVR systems display market data-dependent information (account balances with valuations, FX rates, investment performance)
3. **Partner Management**: External partners (wealth advisors, brokers) access market data through partner portals
4. **Interaction Management**: Customer interactions logged with market data context (pricing at time of inquiry, valuations)

### Critical Requirements:
- eBranch SLA 99.5% availability - very narrow migration window
- API backward compatibility (CPB-ASM-001) - potential blocker if violated
- Historical data preservation (CPB-ASM-005) - regulatory requirement
- 24/5 global trading hours (CPB-CST-015) - requires phased rollout

---

## SCOPE MATRIX - OUT OF SCOPE (CPB Domain)

**Items explicitly NOT in CPB scope:**
- Technical MDP system development (ITS responsibility)
- Data governance framework (PSO + ITS ownership)
- Vendor contract negotiation (PSO Agreement Management)
- Risk calculations and models (RFC domain)

---

## ASSUMPTIONS (10 total)

### CRITICAL Assumptions:
1. **API Backward Compatibility** (CPB-ASM-001): Assumes new MDP provides backward-compatible APIs or conversion layer
   - **Risk**: HIGH - If violated, significant CPB application rework required
   - **Validation**: Request technical specification from ITS (Week 1-2)

2. **Historical Data Availability** (CPB-ASM-005): 3+ years of historical data will be migrated
   - **Risk**: HIGH - CPB analytics broken without sufficient history
   - **Validation**: Confirm with PSO/ITS data migration scope

3. **eBranch Integration Points** (CPB-ASM-002): Limited number of integration points requiring modification
   - **Risk**: MEDIUM - More complex integration could extend timeline
   - **Validation**: Technical discovery with IT (Week 2-4)

### Additional Assumptions:
- Customer communication possible during migration (no blackout restrictions)
- CRM system can handle dual data sources during parallel run
- 200 front-line staff can be trained within 4-6 weeks
- Premium client impacts can be managed through proactive communication
- Partner integrations tested pre-production without business disruption

---

## CONSTRAINTS (15 total)

### CRITICAL Constraints:
1. **eBranch SLA 99.5%** (CPB-CST-002): Very limited downtime allowance - requires zero-downtime approach
2. **24/5 Trading Hours** (CPB-CST-015): Global operations demand phased rollout across time zones
3. **Customer Communication Restrictions** (CPB-CST-006): Regulatory limits on proactive communication
4. **Partner Contract Dependencies** (CPB-CST-008): 5 external partners require coordination

### Additional Key Constraints:
- Regulatory compliance for customer data handling
- Customer service quality standards during transition
- Limited technical expertise in CPB team (heavy IT dependency)
- Peak season conflicts (avoid year-end, tax season)
- Multi-language support requirements (10 languages)

---

## CRITICAL DEPENDENCIES

### Upstream Dependencies:
- **PSO Financial Instrument Management**: Master data source for all CPB displayed valuations
- **ITS System Integration**: API availability, performance, backward compatibility
- **ITS Systems Operations**: Incident response, helpdesk escalation

### Downstream Dependencies:
- **Customer satisfaction**: Data quality issues → complaints → reputational risk
- **Partner relationships**: Partner portal outages → contractual penalties
- **Regulatory compliance**: Customer communication accuracy requirements

---

## RISKS IDENTIFIED

### High-Risk Items:
1. **API compatibility breaks** → All CPB channels fail → customer lockout
2. **Historical data gaps** → Regulatory violations, customer complaints
3. **Performance degradation** → SLA breaches, customer dissatisfaction
4. **Partner coordination failure** → Parallel disruptions, compounded impact
5. **Training inadequacy** → Front-line staff unable to support customers during issues

---

## RECOMMENDED ACTIONS

### IMMEDIATE (Week 1-2):
1. Inventory all CPB applications consuming market data
2. Assess integration points and API dependencies
3. Confirm historical data requirements (timeframes, granularity)
4. Initiate partner communication and coordination planning

### SHORT-TERM (Week 3-8):
1. Technical discovery - API compatibility, integration complexity
2. UAT planning - identify test scenarios, resource allocation
3. Customer communication strategy development
4. Training curriculum design for 200 front-line staff

### MEDIUM-TERM (Month 3-6):
1. UAT execution - channels, CRM, partner portals
2. Training delivery - front-line staff, helpdesk, specialists
3. Partner integration testing
4. Customer communication materials preparation

### PRE-LAUNCH:
1. Hypercare support model established
2. Escalation procedures tested
3. Rollback procedures validated
4. Customer communication ready for deployment

---

## QUESTIONS FOR DOMAIN OWNER VALIDATION

See detailed scope matrix for 30+ specific questions requiring business owner confirmation, including:

- Current eBranch/mobile app market data usage patterns
- Customer service SLA requirements and escalation procedures
- Partner portal contractual obligations and SLAs
- Front-line staff market data expertise assessment
- Historical customer inquiry patterns and data requirements
- Regulatory compliance requirements for customer communications
- Peak season restrictions and blackout periods

---

## SUCCESS CRITERIA (CPB Domain)

1. ✓ Zero customer-facing service disruptions
2. ✓ eBranch SLA 99.5% maintained throughout migration
3. ✓ All 5 partner integrations successful
4. ✓ 200 front-line staff trained and certified
5. ✓ Customer satisfaction scores maintained or improved
6. ✓ Zero regulatory compliance violations
7. ✓ API backward compatibility validated (or migration completed)

---

## DELIVERABLES

- ✅ CPB Scope Matrix (IN/OUT) with 10 in-scope requirements
- ✅ 10 Assumptions documented with validation approaches
- ✅ 15 Constraints identified with mitigation strategies
- ✅ Critical dependencies mapped (PSO, ITS, RFC)
- ✅ Risk register with 5 high-priority risks
- ✅ Recommended action plan (immediate/short/medium-term)

---

**Analysis Date**: 2025-10-17
**Analyst**: CPB Domain Expert (architect-scope-analyst)
**Status**: ✅ Complete - Ready for Business Owner Validation
**Next Step**: Schedule CPB stakeholder validation workshop
