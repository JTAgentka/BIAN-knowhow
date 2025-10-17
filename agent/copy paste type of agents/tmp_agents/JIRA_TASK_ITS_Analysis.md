# JIRA TASK: ITS Domain Impact Analysis - Market Data Platform Replacement

**Domain**: IT Services Management (ITS)
**Linked Epic**: Market Data Platform (MDP) Replacement
**Agent**: ITS Impact Analyst
**Status**: Analysis Complete

---

## Domain Impact Assessment

**Overall Impact Level**: CRITICAL

**Rationale**: ITS domain is the EXECUTION OWNER for MDP replacement - responsible for system development, deployment, integration, infrastructure, monitoring, and ongoing operations. All other domains depend on ITS successful delivery. Zero-downtime requirement and real-time latency constraints make this a high-complexity technical initiative.

---

## SCOPE MATRIX - IN SCOPE (ITS Domain)

**Total Requirements**: 12 across all 13 ITS sub-domains

### Key Requirements Summary:

#### System Development & Deployment (ITS-IN-01, ITS-IN-02, ITS-IN-03):
- New MDP system development (APIs, data transformation, integration logic)
- Deployment strategy and cutover planning (phased rollout, parallel-run, rollback)
- Comprehensive testing (functional, integration, performance, data accuracy, DR)

#### Infrastructure & Operations (ITS-IN-04, ITS-IN-05, ITS-IN-07, ITS-IN-12):
- Infrastructure provisioning and scaling (hybrid on-premise/cloud)
- Data migration and historical data preservation (7-10 years)
- Monitoring, alerting, observability implementation
- Backup and disaster recovery procedures (RTO 4h, RPO 15min)

#### Integration & Connectivity (ITS-IN-06):
- External provider integrations (Bloomberg, Refinitiv, ICE)
- Connectivity protocols (FIX, RMDS, B-PIPE, REST)
- Multi-provider redundancy and failover

#### Support & Governance (ITS-IN-08, ITS-IN-09, ITS-IN-10, ITS-IN-11):
- Support enablement and helpdesk readiness (L2 specialized team)
- Architecture governance and standards compliance (security, data governance)
- CI/CD pipeline and DevOps automation
- Legacy MDP decommissioning planning

### Critical Requirements:
- **ITS-IN-01** (System Development): CRITICAL - core MDP platform
- **ITS-IN-02** (Deployment Strategy): CRITICAL - zero-downtime requirement
- **ITS-IN-03** (Testing): CRITICAL - data accuracy, performance validation
- **ITS-IN-04** (Infrastructure): HIGH - capacity, performance, DR
- **ITS-IN-05** (Data Migration): HIGH - 7-10 years historical data

---

## SCOPE MATRIX - OUT OF SCOPE (ITS Domain)

**Items explicitly NOT in ITS scope:**
- Trading strategy or portfolio optimization logic (PSO domain)
- Regulatory reporting logic (RFC domain)
- Client-facing application UI/UX development (CPB + BMS)
- Contract negotiation with data providers (PSO + Procurement)
- Business case and ROI analysis (Project sponsor + CFO)
- Valuation models and pricing algorithms (PSO Financial Instrument Management)
- End-user training on trading/business decisions (PSO + Business training)
- Broader enterprise data strategy (Chief Data Officer + EA)

---

## ASSUMPTIONS (15 total)

### CRITICAL Assumptions (6):
1. **Continuous Market Data Access** (ITS-ASM-01): Dual-feed capability during migration
   - **Risk**: CRITICAL - Any data gaps = trading impact = revenue loss
   - **Validation**: Validate provider contract terms, confirm dual-licensing, Week 1

2. **Infrastructure Capacity** (ITS-ASM-02): Current infrastructure adequate or budget exists for expansion
   - **Risk**: CRITICAL - Undersizing = performance degradation
   - **Validation**: Capacity assessment Week 1-2, confirm budget

3. **Legacy Data Quality** (ITS-ASM-04): Legacy data sufficient for migration (minimal cleanup)
   - **Risk**: CRITICAL - Poor quality = extended timeline
   - **Validation**: Data quality audit Week 2-4

4. **Regulatory Compliance** (ITS-ASM-08): New MDP compliant with MiFID II, EMIR, retention policies
   - **Risk**: CRITICAL - Non-compliance = project blocker
   - **Validation**: Early Compliance/Legal engagement Week 1

5. **Provider Contract Continuity** (ITS-ASM-10): Contracts renewed/extended through migration
   - **Risk**: CRITICAL - Contract expiration = data loss
   - **Validation**: Contract expiration dates, renegotiation if needed (3-6 month lead time)

6. **Zero Data Loss Tolerance** (ITS-ASM-11): Business requires zero data loss
   - **Risk**: CRITICAL - Drives parallel-run complexity and cost
   - **Validation**: Confirm with trading + risk management

### HIGH-Risk Assumptions (7):
- Data provider API stability and backward compatibility
- Support team availability (3-5 FTE specialized team)
- Stakeholder availability for UAT testing
- Network bandwidth sufficiency
- Existing monitoring tools adequacy
- Budget approval with contingency
- Cloud readiness (if cloud components)

---

## CONSTRAINTS (15 total)

### CRITICAL Constraints (4):
1. **Zero-Downtime Requirement** (ITS-CON-01): 99.99% availability SLA
   - **Impact**: Phased rollout mandatory, comprehensive failover testing required
   - **Mitigation**: Parallel-run strategy, 30-min rollback capability

2. **Data Retention Compliance** (ITS-CON-02): 7-year historical retention (MiFID II, EMIR)
   - **Impact**: Archival strategy, retention enforcement, DR testing mandatory
   - **Mitigation**: Automated retention policies, regular audits

3. **Real-time Latency <100ms** (ITS-CON-03): P95 latency requirement (trading desk)
   - **Impact**: Performance engineering critical from architecture phase
   - **Mitigation**: Load testing, caching, infrastructure optimization, CDN

4. **Legacy System Dependencies** (ITS-CON-11): Multiple downstream systems depend on legacy format
   - **Impact**: Backward-compatible API layer required, costly refactoring
   - **Mitigation**: Consumer impact assessment, phased migration, 6-12 month legacy support

### HIGH-Impact Constraints (10):
- Deployment window restrictions (weekends, 02:00-06:00 only)
- Infrastructure capacity limits (datacenter space, power, cooling)
- Change management procedures (CAB 2-week approval)
- Specialized skill shortage (2-3 specialists only)
- Network security policies (firewall approvals 4-6 weeks)
- Data sovereignty requirements (EU data in EU)
- Fixed budget envelope (no contingency)
- Limited testing environments (2 non-prod shared)
- Privileged access restrictions
- Provider SLA limitations (99.5% vs. 99.99% internal requirement)

---

## CRITICAL DEPENDENCIES

### ITS Dependencies on Other Domains:
- **PSO Financial Instrument Management**: Data format requirements, valuation dependencies
- **PSO Agreement Management**: Provider contract renegotiation, licensing
- **RFC Compliance**: Regulatory validation, audit trail requirements
- **External Providers**: Bloomberg, Refinitiv, ICE - connectivity, SLAs

### Other Domains Dependent on ITS:
- **ALL DOMAINS**: Entire project depends on ITS successful delivery
- **PSO**: Data feeds, valuations, collateral management
- **RFC**: Risk calculations, regulatory reporting
- **CPB**: Customer channels, eBranch, CRM integration
- **BMS**: Market analysis, campaign data, research access
- **ES**: Support infrastructure, monitoring systems

---

## RISKS IDENTIFIED

### TOP 5 ITS-SPECIFIC RISKS:
1. **Data Consistency Failure During Migration** (Probability: MEDIUM, Impact: CRITICAL)
   - Mitigation: Automated reconciliation, parallel-run validation, 30-min rollback

2. **Performance Degradation Post-Migration** (Probability: MEDIUM, Impact: HIGH)
   - Mitigation: Comprehensive performance testing, caching, infrastructure optimization

3. **Provider Integration Failures** (Probability: MEDIUM, Impact: CRITICAL)
   - Mitigation: Multi-provider redundancy, POC validation, vendor support SLAs

4. **Legacy System Decommissioning Delays** (Probability: HIGH, Impact: MEDIUM)
   - Mitigation: Backward-compatible API, phased consumer migration, extended parallel-run

5. **Insufficient Support Team Readiness** (Probability: MEDIUM, Impact: HIGH)
   - Mitigation: Early training program, dedicated L2 team, comprehensive runbooks

---

## RECOMMENDED ACTIONS

### IMMEDIATE (Week 1-2):
1. **Stakeholder Alignment Workshop** - resolve gray areas, confirm scope
2. **Infrastructure Capacity Assessment** - validate sizing assumptions
3. **Data Quality Audit** - assess legacy MDP data quality
4. **Provider Contract Review** - validate expiration dates, initiate renegotiations
5. **Regulatory Compliance Checkpoint** - early Compliance/Legal engagement

### SHORT-TERM (Week 3-8):
1. **Technical Architecture Design** - event-driven, microservices, API-first
2. **Performance Baseline Testing** - measure current state, model future requirements
3. **Provider Integration POC** - validate connectivity, formats, latency
4. **Data Migration Strategy** - parallel-run design, reconciliation, rollback
5. **Support Enablement Planning** - training curriculum, runbook development

### MEDIUM-TERM (Month 3-6):
1. **Phased Rollout Execution** - Pilot → Controlled → Full deployment
2. **Comprehensive Testing** - functional, integration, performance, DR
3. **Monitoring Implementation** - data quality, latency, availability, provider health
4. **Legacy Decommissioning Planning** - 3-month stability period post-migration

---

## SUCCESS CRITERIA (ITS Domain)

### Technical:
1. ✓ 100% data accuracy (match with provider feeds)
2. ✓ <100ms latency P95 achieved
3. ✓ 99.99% availability SLA met
4. ✓ Zero data loss during migration
5. ✓ All downstream systems integrated successfully
6. ✓ Historical data migrated with full integrity (7-10 years)

### Operational:
7. ✓ L2 support team trained and operational
8. ✓ Incident resolution SLAs met
9. ✓ Monitoring and alerting fully operational
10. ✓ Disaster recovery validated (RTO 4h, RPO 15min)
11. ✓ Provider failover tested and functional

### Project:
12. ✓ Phased rollout completed without trading disruption
13. ✓ Parallel-run validation successful (4+ weeks)
14. ✓ Legacy decommissioning on schedule (3 months post-migration)

---

## DELIVERABLES

- ✅ ITS Scope Matrix (IN/OUT) with 12 in-scope requirements, 8 out-of-scope
- ✅ 15 Assumptions documented (6 CRITICAL, 7 HIGH, 2 MEDIUM)
- ✅ 15 Constraints identified (4 CRITICAL, 10 HIGH, 1 MEDIUM)
- ✅ Critical dependencies mapped (PSO, RFC, external providers, all downstream domains)
- ✅ Risk register with TOP 5 risks and mitigation strategies
- ✅ Recommended action plan (immediate/short/medium-term)

---

## ITS DOMAIN EXPERT ASSESSMENT

Market Data Platform replacement is a **technically complex project with high risks**, but **feasible with disciplined execution**.

**Strengths:**
- Clear business value (PSO confirms criticality)
- Proven technology options (Bloomberg, Refinitiv APIs well-documented)
- Existing infrastructure foundation

**Challenges:**
- Zero-downtime requirement = phased rollout mandatory
- Real-time latency <100ms = performance engineering critical
- Multiple downstream dependencies = backward compatibility required
- 6 CRITICAL assumptions require validation

**Keys to Success:**
1. Phased rollout (resist big-bang pressure)
2. Early validation of CRITICAL assumptions
3. Robust parallel-run strategy with automated reconciliation
4. Performance engineering from day 1
5. Multi-provider redundancy
6. Comprehensive monitoring and alerting
7. Strong governance and change control

**Recommendation**: **PROCEED with caution** subject to:
- Validation of 6 CRITICAL assumptions (Week 1-4)
- Infrastructure capacity confirmation
- Regulatory compliance sign-off
- Provider contract continuity validation
- Budget approval for phased approach

**Confidence Level**: **65-70%** → increases to **85-90%** after CRITICAL assumptions validated and POC completion

---

**Analysis Date**: 2025-10-17
**Analyst**: ITS Domain Expert (architect-scope-analyst)
**Status**: ✅ Complete - Ready for Technical Leadership Review
**Next Step**: Initiate Week 1 critical path activities (capacity assessment, contract review, data audit)
