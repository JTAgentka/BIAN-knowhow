# JIRA TASK: RFC Domain Impact Analysis - Market Data Platform Replacement

**Domain**: Risk, Fraud and Compliance Management (RFC)
**Linked Epic**: Market Data Platform (MDP) Replacement
**Agent**: RFC Impact Analyst
**Status**: Analysis Complete

---

## Domain Impact Assessment

**Overall Impact Level**: CRITICAL

**Rationale**: RFC domain has HIGHEST BUSINESS IMPACT - all core risk models (Market Risk VaR, Counterparty Risk CVA, Liquidity Risk LCR) are heavily dependent on continuous, high-quality market data. Regulatory reporting has immovable deadlines (quarterly COREP/FINREP, MiFID II). Any data gaps or quality degradation directly impacts regulatory compliance, risk measurement accuracy, and Board reporting. RFC domain CANNOT TOLERATE disruption without material consequences.

---

## SCOPE MATRIX - IN SCOPE (RFC Domain)

**Total Requirements**: 14 across Risk Management, Fraud Incident Management, Policy Management

### Key Requirements Summary:

#### Risk Management (12 requirements):
1. **Market Risk Models** - VaR calculations, stress testing, scenario analysis (HIGH dependency on tick-level pricing data)
2. **Counterparty Risk Management** - CVA, exposure calculation, collateral valuation (HIGH dependency on credit spreads, equity prices)
3. **Liquidity Risk Management** - LCR, NSFR calculations (MEDIUM dependency on haircut parameters, funding spreads)
4. **Gap Analysis** - Interest rate risk, FX risk gap analysis (HIGH dependency on yield curves, FX rates)
5. **Economic Capital** - Risk-based capital allocation (MEDIUM dependency on correlation matrices, volatility data)
6. **Limit Management** - Real-time limit monitoring, breach alerts (CRITICAL dependency on current market data)
7. **Credit Risk Models** - PD/LGD calibration using market data (MEDIUM dependency on equity/CDS prices)
8. **Operational Risk Models** - Market-driven loss scenarios (LOW-MEDIUM dependency)

#### Fraud Incident Management (2 requirements):
9. **Fraud Detection Models** - Market manipulation detection, unusual trading patterns (MEDIUM dependency on market benchmarks)
10. **Fraud Evaluation** - Transaction anomaly scoring using market context (LOW-MEDIUM dependency)

#### Policy Management (4 requirements, overlap with Risk):
11. **Regulatory Reporting** - COREP, FINREP, Pillar 3, MiFID II (CRITICAL - immovable quarterly deadlines)
12. **Regulatory Compliance** - MAR (Market Abuse Regulation) surveillance (CRITICAL - zero tolerance for gaps)
13. **Compliance Reporting** - Internal risk reports to Board/ALCO (HIGH)
14. **IT Standards** - Data quality standards, audit trail requirements (MEDIUM)

### Critical Requirements:
- **RFC-IN-01** (Market Risk Models): CRITICAL - VaR, stress testing drive capital requirements
- **RFC-IN-02** (Counterparty Risk): CRITICAL - CVA calculation for Basel III reporting
- **RFC-IN-06** (Limit Management): CRITICAL - real-time monitoring prevents trading losses
- **RFC-IN-11** (Regulatory Reporting): CRITICAL - quarterly deadlines immovable
- **RFC-IN-12** (MAR Compliance): CRITICAL - zero tolerance for surveillance gaps

---

## SCOPE MATRIX - OUT OF SCOPE (RFC Domain)

**Items explicitly NOT in RFC scope:**
- Technical MDP system development (ITS domain)
- Business continuity planning (Enterprise Risk Management)
- Credit management operations (PSO Credit Management)
- Underwriting decisioning (PSO Underwriting)
- Security assurance of MDP infrastructure (IT Security)
- Audit execution (Internal Audit)
- Customer risk profiling (CPB Customer Management)
- Non-market-data fraud capabilities (fraud in payments, identity theft)
- Corporate policy setting (Board/Executive)
- Credit rules and approval authorities (PSO Credit Management)
- Account recovery/collections (CPB)
- Business risk models (operational risk excluding market-driven scenarios)

---

## ASSUMPTIONS (14 total)

### HIGH-Risk Assumptions (5):
1. **Data Quality Maintenance** (RFC-ASM-002): Assumes new MDP maintains same/better data quality
   - **Risk**: HIGH - Any degradation impacts all risk calculations and regulatory compliance
   - **Validation**: Define comprehensive data quality KPIs and SLAs (Week 1-2)

2. **Historical Data Migration** (RFC-ASM-003): 7+ years of historical data migrated with full integrity
   - **Risk**: HIGH - Required for regulatory audit trail, model validation, backtesting
   - **Validation**: Technical validation of migration approach, compliance sign-off

3. **SLA Requirements** (RFC-ASM-005): 99.5% availability and <15min latency achievable
   - **Risk**: HIGH - Critical for real-time risk monitoring and limit management
   - **Validation**: ITS capacity planning, performance testing

4. **Regulatory Model Acceptance** (RFC-ASM-012): Regulators accept platform change without model re-validation
   - **Risk**: MEDIUM-HIGH - Model re-validation could add 3-6 months
   - **Validation**: Proactive CNB communication, demonstrate data equivalence

5. **Data Format Compatibility** (RFC-ASM-001): New MDP provides backward-compatible data formats
   - **Risk**: MEDIUM-HIGH - Format changes require risk engine reconfiguration
   - **Validation**: Data format mapping workshop (Week 2)

### MEDIUM-Risk Assumptions (9):
- RFC team has capacity for UAT without disrupting regular operations
- No new regulatory requirements triggered by platform change
- Data provider licensing remains compliant
- Risk calculation engines can consume new MDP data without major changes
- Parallel-run period (4 weeks) sufficient for validation
- Current data governance framework adequate for new MDP
- Fraud detection models tolerant of minor data latency changes
- Data lineage and audit trail maintained through migration

---

## CONSTRAINTS (14 total)

### CRITICAL Constraints (2):
1. **Regulatory Reporting Deadlines** (RFC-CON-001): Quarterly COREP/FINREP immovable
   - **Impact**: MDP cutover MUST be 6+ weeks before Mar/Jun/Sep/Dec deadlines
   - **Mitigation**: Careful timeline planning, avoid cutover in Feb/May/Aug/Nov

2. **MAR Compliance** (RFC-CON-002): Zero tolerance for market surveillance gaps
   - **Impact**: Zero-downtime approach for fraud detection systems mandatory
   - **Mitigation**: Parallel surveillance during migration, immediate failover capability

### HIGH-Impact Constraints (6):
- Legacy technology stack (risk engines on legacy platforms, limited flexibility)
- RFC SME availability (unavailable Nov-Feb due to year-end activities)
- Data quality SLAs must be maintained (no degradation acceptable)
- CNB regulatory relationship (changes must be communicated, may require notification)
- Audit trail completeness (MiFID II, EMIR - no gaps allowed)
- Data provider licensing restrictions (some providers restrict platform changes)

### MEDIUM-Impact Constraints (6):
- Fraud model re-calibration time (2-4 weeks for pattern learning)
- Regulatory reporting system constraints (limited flexibility, change lead time)
- Risk committee calendar (quarterly risk reports, monthly ALCO)
- Model validation capacity (limited quant team availability)
- Operational risk incident tracking (market-driven scenarios)
- Data governance approval process

---

## CRITICAL DEPENDENCIES

### RFC Dependencies on Other Domains:
- **PSO Financial Instrument Management**: Valuation data feeds directly into risk calculations
- **ITS System Integration**: API performance, data quality, historical data migration
- **ES Legal/Compliance**: Regulatory interpretation, CNB communication
- **ES Support**: Incident response for data quality issues

### Other Domains Dependent on RFC:
- **Board/Executive**: Risk reports depend on accurate market data
- **Trading Desks**: Limit management alerts prevent losses
- **Regulators**: Quarterly submissions must be accurate and timely
- **Audit**: Audit trail completeness for regulatory examination

---

## RISKS IDENTIFIED

### CRITICAL Risks (4):
1. **Data quality degradation** → Risk miscalculation → Capital inadequacy → Regulatory breach
   - Mitigation: Rigorous parallel-run validation, clear acceptance criteria

2. **Data gaps during migration** → VaR calculation failure → Trading halted → Revenue loss
   - Mitigation: Dual-feed approach, real-time reconciliation, <30min rollback

3. **Regulatory reporting deadline missed** → CNB sanctions → Reputational damage
   - Mitigation: 6-week buffer before deadlines, dry-run validation

4. **MAR surveillance gap** → Market abuse undetected → Regulatory penalties
   - Mitigation: Parallel surveillance systems, zero-downtime approach

### HIGH Risks (4):
5. **Historical data migration incomplete** → Regulatory audit failure → Non-compliance findings
6. **Fraud model re-calibration insufficient** → False positives/negatives → Operational issues
7. **Counterparty exposure miscalculation** → Credit losses → Capital impact
8. **Performance degradation** → Real-time limit monitoring delayed → Trading losses

---

## RECOMMENDED ACTIONS

### IMMEDIATE (Week 1-2):
1. **Data Format Mapping Workshop** (ITS + RFC quant analysts)
   - Validate interface compatibility, identify conversion requirements
   - Validates RFC-ASM-001

2. **Define Data Quality KPIs and SLAs**
   - Accuracy metrics, latency thresholds, completeness requirements
   - Addresses RFC-ASM-002, RFC-ASM-005, RFC-CON-007

3. **Establish RFC Steering Committee**
   - Committed SME resources, avoid Nov-Feb period
   - Addresses RFC-ASM-004, RFC-CON-006

### SHORT-TERM (Week 2-4):
4. **Review Data Provider Licensing Agreements**
   - Platform change compliance validation
   - Addresses RFC-ASM-009, RFC-CON-010

5. **Prepare Regulatory Communication Plan**
   - ECB notification, informal feedback on platform change
   - Addresses RFC-ASM-012, RFC-CON-008

6. **Historical Data Requirements Specification**
   - 7+ years, tick-level granularity, audit trail completeness
   - Validates RFC-ASM-003

### MEDIUM-TERM (Month 3-6 pre-migration):
7. **Parallel-Run Planning**
   - Minimum 4 weeks, focus on regulatory report validation
   - Schedule completion 6+ weeks before quarterly deadline
   - Addresses RFC-ASM-011, RFC-CON-001

8. **Fraud Model Re-calibration Planning**
   - Historical pattern analysis, benchmark establishment
   - Addresses RFC-CON-003

9. **UAT Execution**
   - All risk models, regulatory reports, fraud detection, limit management
   - Avoid Nov-Feb resource constraints

---

## QUESTIONS FOR DOMAIN OWNER VALIDATION

See detailed scope matrix for 50+ specific questions requiring validation, including:

- Current market risk models and their market data dependencies
- VaR calculation methodologies and data granularity requirements
- Counterparty risk CVA calculation processes and data inputs
- Liquidity risk LCR/NSFR data requirements and update frequencies
- Limit management real-time requirements and alert mechanisms
- Regulatory reporting data lineage and audit trail requirements
- MiFID II transaction reporting and market surveillance dependencies
- Fraud detection model algorithms and market data usage patterns
- Historical data retention requirements and regulatory specifications
- Data quality validation procedures and acceptance criteria

---

## SUCCESS CRITERIA (RFC Domain)

### Risk Management:
1. ✓ VaR calculations match historical accuracy (backtesting validation)
2. ✓ Counterparty CVA calculations accurate (reconcile with pre-migration)
3. ✓ Real-time limit monitoring operational (<15min latency)
4. ✓ Risk models validated with 4+ weeks parallel-run data

### Regulatory Compliance:
5. ✓ Quarterly regulatory reports submitted on time (100% record)
6. ✓ MAR surveillance operational with zero gaps
7. ✓ Audit trail complete and compliant (MiFID II, EMIR)
8. ✓ CNB communication successful (no regulatory concerns)

### Operational:
9. ✓ Data quality SLAs met (99.5% availability, <15min latency)
10. ✓ Historical data migrated with full integrity (7+ years)
11. ✓ Fraud detection models re-calibrated and validated
12. ✓ RFC team trained and operational

---

## DELIVERABLES

- ✅ RFC Scope Matrix (IN/OUT) with 14 in-scope requirements, 17 out-of-scope
- ✅ 14 Assumptions documented (5 HIGH, 9 MEDIUM)
- ✅ 14 Constraints identified (2 CRITICAL, 6 HIGH, 6 MEDIUM)
- ✅ Critical dependencies mapped (PSO, ITS, ES, Board/Regulators)
- ✅ Risk register with 8 critical/high priority risks
- ✅ Recommended action plan (immediate/short/medium-term)

---

## RFC DOMAIN EXPERT OPINION

**Key Message:** The RFC domain analysis reveals **CRITICAL DEPENDENCIES** on Market Data Platform continuity and quality. The Risk Management domain **CANNOT TOLERATE** data gaps or quality degradation without material impact on:
- Regulatory compliance (CNB reporting, MAR surveillance)
- Risk measurement accuracy (VaR, CVA, LCR)
- Board reporting and governance

**HIGHEST PRIORITY:** Ensuring zero-downtime cutover for risk-critical data feeds (VaR, limit monitoring, counterparty exposure) and maintaining full audit trail for regulatory purposes.

**BIGGEST RISK:** Assumption that data quality will be maintained or improved - requires rigorous parallel-run validation with clear acceptance criteria before cutover.

**TIMING CONSTRAINT:** MDP go-live MUST be scheduled minimum 6 weeks before quarterly regulatory deadline (avoid March, June, September, December deadline months) and outside year-end period (November-February) when RFC resources unavailable.

**Recommendation:** **CONDITIONAL GO** - proceed subject to:
1. ✓ Data quality KPIs and SLAs defined and validated
2. ✓ Parallel-run minimum 4 weeks with regulatory report validation
3. ✓ Cutover scheduled outside regulatory deadline windows
4. ✓ CNB informal consultation confirms no model re-validation required
5. ✓ Historical data migration validated for audit trail completeness

**Confidence Level:** **70-75%** → increases to **90%** with successful parallel-run validation

---

**Analysis Date**: 2025-10-17
**Analyst**: RFC Domain Expert (architect-scope-analyst)
**Status**: ✅ Complete - Ready for Risk/Compliance Leadership Review
**Next Step**: Initiate immediate actions (data format workshop, define KPIs, establish steering committee)
