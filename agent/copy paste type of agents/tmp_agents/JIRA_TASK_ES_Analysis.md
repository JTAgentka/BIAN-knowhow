# JIRA TASK: ES Domain Impact Analysis - Market Data Platform Replacement

**Domain**: Enterprise Services Management (ES)
**Linked Epic**: Market Data Platform (MDP) Replacement
**Agent**: ES Impact Analyst
**Status**: Analysis Complete

---

## Domain Impact Assessment

**Overall Impact Level**: MEDIUM

**Rationale**: ES domain provides critical enabling services for MDP replacement - legal compliance, contract review, support readiness. While not operationally dependent on market data, ES capabilities are ON THE CRITICAL PATH for project success due to legal review timelines and regulatory requirements.

---

## SCOPE MATRIX - IN SCOPE (ES Domain)

**Total Requirements**: 7 across Legal Support Management, Task Management

### Key Requirements Summary:

#### Legal Support Management (4 requirements):
1. **Data Provider Contract Review** - review all provider agreements for platform change restrictions
2. **Legal Compliance Continuity** - validate client SLA agreements, identify breach risks
3. **Regulatory Compliance** - MiFID II, EMIR, GDPR, AML compliance validation
4. **GDPR/Data Privacy** - vendor compliance, DPA review, DPIA assessment

#### Task Management (3 requirements):
5. **Support Readiness** - knowledge base creation, tier structure, escalation procedures
6. **Training Program** - comprehensive training for support team on new MDP
7. **Customer Communication** - incident management, proactive communication procedures

### Critical Requirements:
- **ES-IN-001** (Data Provider Contract Review): CRITICAL - on critical path, 4-6 weeks
- **ES-IN-003** (Regulatory Compliance): CRITICAL - CNB notification may be required
- **ES-IN-004** (Support Readiness): HIGH - customer experience depends on support quality

---

## SCOPE MATRIX - OUT OF SCOPE (ES Domain)

**Items explicitly NOT in ES scope:**
- Technical integration (ITS domain)
- Business user training on trading/market data interpretation (PSO/Trading)
- Broader enterprise data governance (Chief Data Officer)
- Vendor commercial negotiations (Procurement + PSO)
- System performance/infrastructure (ITS)
- Risk controls implementation (RFC)

---

## ASSUMPTIONS (10 total)

### CRITICAL Assumptions:
1. **Data Provider Contracts Allow Changes** (ES-ASM-001): Contracts permit platform changes without re-negotiation
   - **Risk**: CRITICAL - If violated, could add 3-6 months to timeline
   - **Validation**: Immediate contract review (Week 1)

2. **No New CNB Regulatory Licenses** (ES-ASM-005): No new regulatory approvals required
   - **Risk**: CRITICAL - Regulatory approval could add 6-12 months
   - **Validation**: Early CNB informal consultation (Week 1)

3. **Client SLA Commitments Maintained** (ES-ASM-010): No SLA breaches during migration
   - **Risk**: CRITICAL - Breach could trigger penalties, litigation, client losses
   - **Validation**: Client SLA review, redundancy/rollback planning

### HIGH-Risk Assumptions:
- Support team can be upskilled within 4-6 weeks
- Historical data migration meets audit/regulatory retention requirements
- GDPR vendor compliance straightforward (no complex DPIA)

---

## CONSTRAINTS (10 total)

### CRITICAL Constraints:
1. **MiFID II Audit Trail** (ES-CON-001): New MDP must support complete audit trail from Day 1
   - **Impact**: No exceptions possible, design requirement
   - **Mitigation**: Pre-launch compliance validation

2. **Legal Review Timeline** (ES-CON-003): 4-6 weeks non-compressible
   - **Impact**: On critical path
   - **Mitigation**: Early initiation, external counsel if needed

### HIGH-Impact Constraints:
- GDPR vendor compliance requirements limit provider selection
- Limited market data specialist capacity in support team
- Legal counsel capacity constraints (shared resource)
- Support team availability during year-end (reduced capacity)

---

## CRITICAL DEPENDENCIES

### ES Domain Dependencies on Others:
- **PSO Agreement Management**: Access to data provider contracts
- **ITS**: Technical specifications for legal review (security, audit trail, GDPR)
- **RFC Compliance**: Regulatory interpretation, CNB relationship

### Other Domains Dependent on ES:
- **All domains**: Cannot proceed without legal approval (contracts, regulatory)
- **ITS**: Support readiness gates deployment
- **CPB**: Customer communication strategy approval

---

## RISKS IDENTIFIED

### CRITICAL Risks:
1. **Contract restrictions discovered** → re-negotiation required → 3-6 month delay
2. **CNB approval required** → regulatory review → 6-12 month delay, uncertainty
3. **SLA breach during migration** → client penalties, litigation, reputational damage
4. **Compliance gaps** → launch blocked, regulatory sanctions

### HIGH Risks:
5. **Support capacity insufficient** → poor customer experience, escalations
6. **Historical data migration fails audit requirements** → regulatory non-compliance

---

## RECOMMENDED ACTIONS

### IMMEDIATE (Week 1-2):
1. **Initiate Legal Contract Review** (ES-IN-001) - CRITICAL, on critical path
   - Owner: Legal Support Management
   - Action: Full review of all data provider contracts for technology change restrictions

2. **CNB Regulatory Consultation** (ES-ASM-005) - CRITICAL, potential blocker
   - Owner: Legal Compliance + RFC
   - Action: Informal consultation to confirm no new licensing required

3. **Support Team Skills Assessment** (ES-ASM-003)
   - Owner: ES Operations Manager + HR
   - Action: Assess market data knowledge, identify training needs or hiring requirements

### SHORT-TERM (Week 2-4):
4. **Legal Continuity Assessment** (ES-IN-002)
   - Owner: Legal Compliance
   - Action: Review all client SLA agreements, identify continuity obligations

5. **Support Readiness Planning** (ES-IN-004, ES-IN-005, ES-IN-006)
   - Owner: ES Operations Manager
   - Action: Define support structure, escalation procedures, knowledge base requirements

6. **GDPR Compliance Validation** (ES-IN-007)
   - Owner: Legal Compliance + DPO
   - Action: Assess DPIA requirements, ensure vendor DPA compliance

### MEDIUM-TERM (Month 2-3):
7. **Support Training Program Development**
   - Owner: ES Operations + Training
   - Action: Create training curriculum, knowledge base articles, certification

8. **Customer Communication Plan**
   - Owner: BMS Communications + Legal
   - Action: Develop multi-channel strategy with legal-approved messaging

---

## QUESTIONS FOR DOMAIN OWNER VALIDATION

See detailed scope matrix for 25+ specific questions requiring validation, including:

- Data provider contract terms and technology change restrictions
- Client SLA obligations and breach consequences
- CNB notification requirements and regulatory approval process
- Support team current market data expertise level
- Historical support incident volumes and complexity
- Legal counsel capacity and availability
- GDPR compliance requirements and vendor assessment
- Customer communication regulatory constraints

---

## SUCCESS CRITERIA (ES Domain)

1. ✓ All data provider contracts reviewed with no material blockers
2. ✓ CNB informal consultation confirms no licensing requirements
3. ✓ Client SLA compliance maintained (zero breaches)
4. ✓ Regulatory compliance validated (MiFID II, EMIR, GDPR, AML)
5. ✓ Support team trained and operational before go-live
6. ✓ Knowledge base comprehensive and validated
7. ✓ Customer communication plan approved and ready
8. ✓ Incident resolution SLAs met during hypercare period

---

## DELIVERABLES

- ✅ ES Scope Matrix (IN/OUT) with 7 in-scope requirements
- ✅ 10 Assumptions documented with validation approaches
- ✅ 10 Constraints identified with mitigation strategies
- ✅ Critical dependencies mapped (PSO, RFC, ITS, all domains)
- ✅ Risk register with 6 critical/high priority risks
- ✅ Recommended action plan (immediate/short/medium-term)

---

## ES DOMAIN EXPERT OPINION

From the Enterprise Services Management perspective, the MDP replacement represents a **moderate complexity initiative with significant legal and operational implications**.

**Key Assessment:**
1. **Legal Compliance is Critical Path** - Unlike typical IT infrastructure changes, MDP carries substantial legal risk due to contracts, SLAs, and regulatory requirements
2. **Support Readiness is Customer Experience Differentiator** - Market data is mission-critical for investment clients; ES readiness determines smooth vs. problematic transition
3. **Risk Profile is Manageable with Proactive Legal Engagement** - Most risks mitigated through early, thorough legal review

**Red Flags:**
- Contract restrictions requiring provider re-negotiation → 3-6 month delay
- CNB regulatory approval requirement → 6-12 month delay and uncertainty
- Support team lacks expertise and hiring needed → 3-6 month lead time

**Green Lights:**
- ES capabilities exist and are mature (legal support, case management, support)
- Regulatory framework well-established (no ambiguity)
- Cross-domain collaboration structure exists

**Bottom Line:** Project is **FEASIBLE with disciplined legal and operational preparation**. ES recommendation is **CONDITIONAL GO** subject to successful completion of critical path items (Week 1-2).

**Confidence Level:** 75% → 90% with successful validation of critical assumptions

---

**Analysis Date**: 2025-10-17
**Analyst**: ES Domain Expert (architect-scope-analyst)
**Status**: ✅ Complete - Ready for Legal/Operations Validation
**Next Step**: Initiate Week 1 critical path activities (contract review, CNB consultation)
