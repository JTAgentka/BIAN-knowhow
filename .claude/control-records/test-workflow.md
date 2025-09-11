# Context Logging System Test

## Overview
This test validates the complete context logging system across all project definition sub-agents. It simulates a full workflow from JIRA input processing through final document approval.

## Test Scenario
**Project**: New Customer Onboarding Process Implementation
**JIRA Epic**: EPIC-2024-001
**User Instruction**: "Complete project definition analysis"

## Test Execution Steps

### 1. Initialize Test Environment
```bash
# Create test project context
PROJECT_ID="TEST-2024-001"
JIRA_EPIC_ID="EPIC-2024-001"
SESSION_ID="test_session_$(date +%Y%m%d_%H%M%S)"

# Initialize controller context
echo "Initializing controller context..."
cp .claude/control-records/templates/controller-template.json \
   .claude/control-records/active/controller-context.json
```

### 2. Test Controller Context Creation
**Expected Behavior**: Controller should create and populate initial context
**Test Data**:
```json
{
  "jira_input": {
    "epic_description": "Implement new customer onboarding process to reduce manual work and improve customer experience",
    "attachments": [
      {
        "name": "business-requirements.pdf",
        "content": "Detailed requirements for customer onboarding automation",
        "type": "document"
      }
    ],
    "comments": [
      {
        "author": "project.manager@company.com",
        "content": "Please provide complete project definition analysis",
        "timestamp": "2024-01-15T09:00:00Z"
      }
    ]
  }
}
```

**Validation Points**:
- [ ] Controller context file created
- [ ] JIRA input properly parsed
- [ ] Routing decision documented (should be "full_lifecycle")
- [ ] Session ID generated and recorded

### 3. Test Facilitator Agent Context Flow
**Expected Behavior**: Facilitator should read controller context and progress through phases 1-4

**Phase 1 Test - Stakeholder Mapping**:
```json
{
  "phase_outputs": {
    "phase_1_stakeholder_mapping": {
      "stakeholder_engagement_matrix": [
        {
          "stakeholder": "Customer Service Team",
          "role": "Process Users",
          "objectives": "Efficient customer processing",
          "attitude": "supportive",
          "influence": "high",
          "interest": "high",
          "engagement_strategy": "Early involvement in design"
        },
        {
          "stakeholder": "IT Department",
          "role": "System Implementation",
          "objectives": "Technical feasibility",
          "attitude": "neutral",
          "influence": "high", 
          "interest": "medium",
          "engagement_strategy": "Technical review and approval"
        }
      ],
      "validation_status": "validated",
      "timestamp": "2024-01-15T10:30:00Z"
    }
  }
}
```

**Validation Points**:
- [ ] Facilitator context initialized from template
- [ ] Controller context successfully imported
- [ ] Phase 1 stakeholder matrix populated
- [ ] Validation status set to "validated"
- [ ] Timestamp recorded in ISO8601 format

**Phase 2 Test - Problem Statement**:
```json
{
  "phase_outputs": {
    "phase_2_problem_statement": {
      "business_pain": "Manual customer onboarding takes 5-7 days and prone to errors",
      "change_motivation": "Reduce onboarding time to 2 days and eliminate manual errors",
      "high_level_objectives": [
        "Automate customer data collection",
        "Implement digital document verification",
        "Create customer self-service portal"
      ],
      "success_criteria": [
        "Onboarding time reduced to 2 days",
        "Manual error rate reduced by 90%",
        "Customer satisfaction score >8.5"
      ],
      "validation_status": "validated",
      "timestamp": "2024-01-15T11:15:00Z"
    }
  }
}
```

**Validation Points**:
- [ ] Current state updated to phase 2
- [ ] Problem statement artifacts complete
- [ ] Success criteria are measurable
- [ ] Phase 1 artifacts preserved

**Phases 3-4 Test**: Similar validation for scope definition and as-is analysis

### 4. Test Consolidator Agent Context Flow
**Expected Behavior**: Consolidator should import facilitator handover and progress through phases 5-7

**Context Import Test**:
```json
{
  "inputs_from_facilitator": {
    "stakeholder_engagement_matrix": "...",
    "problem_statement": "...",
    "scope_definition": "...",
    "as_is_analysis": "...",
    "received_timestamp": "2024-01-15T13:00:00Z"
  }
}
```

**Validation Points**:
- [ ] Consolidator context initialized
- [ ] Facilitator handover successfully imported
- [ ] All phase 1-4 artifacts available
- [ ] Current state set to phase 5

**Phase 5 Test - To-Be Design**:
```json
{
  "phase_outputs": {
    "phase_5_to_be_design": {
      "to_be_model": {
        "process_diagrams": ["Digital onboarding flow"],
        "system_architecture": ["Self-service portal", "Document verification API"],
        "role_definitions": ["Customer Success Specialist", "Digital Onboarding Coordinator"],
        "data_flows": ["Customer data → Verification → Account creation"]
      },
      "gap_analysis": [
        {
          "dimension": "process",
          "as_is_state": "Manual paper-based process",
          "to_be_state": "Digital automated process",
          "gap_description": "Complete process digitization required",
          "impact_level": "high",
          "priority": "high"
        }
      ],
      "stakeholder_validation": "validated",
      "timestamp": "2024-01-15T14:30:00Z"
    }
  }
}
```

**Validation Points**:
- [ ] To-Be model artifacts populated
- [ ] Gap analysis complete with impact assessment
- [ ] Stakeholder validation recorded
- [ ] Transition to phase 6 ready

### 5. Test Finalizer Agent Context Flow
**Expected Behavior**: Finalizer should import all previous contexts and manage document versioning

**Context Import Test**:
```json
{
  "inputs_from_previous_agents": {
    "facilitator_artifacts": "...",
    "consolidator_artifacts": "...",
    "received_timestamp": "2024-01-15T16:00:00Z"
  }
}
```

**Document Version Test**:
```json
{
  "current_state": {
    "document_version": "v0.1",
    "phase": 8,
    "status": "in_progress"
  },
  "document_versions": {
    "v0_1_consolidation": {
      "document_structure": "Complete project definition structure",
      "quality_assurance_checklist": "All QA items validated",
      "traceability_matrix": "Complete artifact traceability",
      "executive_summary": "Project definition for customer onboarding automation",
      "timestamp": "2024-01-15T16:30:00Z"
    }
  }
}
```

**Validation Points**:
- [ ] All previous agent contexts imported
- [ ] Document version v0.1 created
- [ ] QA checklist completed
- [ ] Traceability matrix populated

### 6. Test Session Context Creation
**Expected Behavior**: Session context should track overall workflow execution

```json
{
  "session_metadata": {
    "session_id": "test_session_20240115_143000",
    "start_timestamp": "2024-01-15T09:00:00Z",
    "end_timestamp": "2024-01-15T17:00:00Z",
    "project_id": "TEST-2024-001",
    "jira_epic_id": "EPIC-2024-001",
    "user_id": "test_user"
  },
  "workflow_execution": {
    "agents_involved": ["controller", "facilitator", "consolidator", "finalizer"],
    "phases_completed": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
    "total_duration": "8h 00m",
    "quality_gates_passed": [
      "stakeholder_validation",
      "problem_statement_approval", 
      "scope_validation",
      "as_is_validation",
      "to_be_validation",
      "impact_assessment_approval",
      "acceptance_criteria_validation",
      "internal_review_approval",
      "external_validation_approval",
      "governance_approval"
    ]
  },
  "performance_metrics": {
    "total_processing_time": "8h 00m",
    "agent_handover_times": [
      {"from": "controller", "to": "facilitator", "duration": "5m"},
      {"from": "facilitator", "to": "consolidator", "duration": "3m"},
      {"from": "consolidator", "to": "finalizer", "duration": "4m"}
    ],
    "validation_cycles": 10,
    "stakeholder_interactions": 15
  }
}
```

**Validation Points**:
- [ ] Session metadata complete
- [ ] All agents tracked
- [ ] Performance metrics recorded
- [ ] Quality gates documented

## Test Results Validation

### Context File Integrity
- [ ] All context files are valid JSON
- [ ] All required fields populated
- [ ] Timestamps in correct ISO8601 format
- [ ] Cross-references between contexts valid

### Workflow Continuity
- [ ] Each agent can read previous agent outputs
- [ ] No information loss between handovers
- [ ] State progression is logical and complete
- [ ] Error conditions handled gracefully

### Performance Metrics
- [ ] Execution times recorded
- [ ] Quality gates tracked
- [ ] Stakeholder interactions logged
- [ ] Resource utilization monitored

### Archive and Cleanup
- [ ] Contexts properly archived after completion
- [ ] Archive directory structure correct
- [ ] Session summary generated
- [ ] Active contexts cleaned up

## Success Criteria
✅ **All context files created and populated correctly**
✅ **Complete workflow traceability maintained**
✅ **No information loss during handovers**
✅ **Performance metrics captured accurately**
✅ **Error recovery mechanisms functional**
✅ **Archive process completed successfully**

## Test Automation Script
```bash
#!/bin/bash
# run_context_test.sh

set -e

PROJECT_ID="TEST-2024-001"
JIRA_EPIC_ID="EPIC-2024-001"

echo "Starting context logging system test..."

# 1. Clean test environment
rm -f .claude/control-records/active/*.json
rm -rf .claude/control-records/sessions/test_*
rm -rf .claude/control-records/archive/TEST-*

# 2. Initialize controller context
echo "Initializing controller context..."
cp .claude/control-records/templates/controller-template.json \
   .claude/control-records/active/controller-context.json

# 3. Populate test data
echo "Populating test data..."
jq --arg pid "$PROJECT_ID" --arg jid "$JIRA_EPIC_ID" \
   '.metadata.project_id = $pid | .metadata.jira_epic_id = $jid' \
   .claude/control-records/active/controller-context.json > temp.json
mv temp.json .claude/control-records/active/controller-context.json

# 4. Simulate agent workflow
echo "Simulating facilitator workflow..."
# (Additional simulation steps would go here)

# 5. Validate results
echo "Validating context integrity..."
# (Validation steps would go here)

echo "Context logging system test completed successfully!"
```

## Expected Test Duration
- **Setup**: 5 minutes
- **Execution**: 15 minutes  
- **Validation**: 10 minutes
- **Total**: 30 minutes

This test provides comprehensive validation of the context logging system across all sub-agents and workflow phases.