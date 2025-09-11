# Context Management Guide

## Overview
This guide provides comprehensive instructions for managing context files across all project definition sub-agents. Context files ensure workflow continuity, traceability, and state persistence throughout the project definition lifecycle.

## Context File Lifecycle

### 1. Initialization
**When**: Agent starts execution
**Action**: Read existing context or create from template
**Location**: `.claude/control-records/active/{agent-name}-context.json`

```bash
# Check if context exists
if [ -f ".claude/control-records/active/facilitator-context.json" ]; then
    # Resume from existing context
    echo "Resuming from existing context"
else
    # Create new context from template
    cp ".claude/control-records/templates/facilitator-template.json" \
       ".claude/control-records/active/facilitator-context.json"
fi
```

### 2. Context Updates
**When**: Phase transitions, significant decisions, artifact completions
**Action**: Update relevant context sections with timestamps
**Validation**: Ensure all required fields are populated

```json
{
  "current_state": {
    "phase": 2,
    "status": "in_progress",
    "last_updated": "2024-01-15T10:30:00Z"
  },
  "phase_outputs": {
    "phase_1_stakeholder_mapping": {
      "validation_status": "validated",
      "timestamp": "2024-01-15T10:15:00Z"
    }
  }
}
```

### 3. Handover Preparation
**When**: Agent completes its workflow phases
**Action**: Package artifacts and mark ready for handover
**Validation**: Ensure all outputs are complete and validated

```json
{
  "handover_to_consolidator": {
    "ready_for_handover": true,
    "consolidated_artifacts": {
      "stakeholder_matrix": "...",
      "problem_statement": "...",
      "scope_definition": "...",
      "as_is_analysis": "..."
    },
    "validation_summary": "All phase 1-4 artifacts completed and validated",
    "timestamp": "2024-01-15T11:00:00Z"
  }
}
```

### 4. Context Archival
**When**: Workflow completion or session end
**Action**: Move context files to archive directory
**Retention**: Maintain for audit and process improvement

```bash
# Create project archive directory
mkdir -p ".claude/control-records/archive/${PROJECT_ID}"

# Move completed contexts to archive
mv ".claude/control-records/active/"*-context.json \
   ".claude/control-records/archive/${PROJECT_ID}/"
```

## Agent-Specific Context Management

### Controller Agent
**File**: `controller-context.json`
**Key Responsibilities**:
- Parse JIRA inputs and document routing decisions
- Track agent handovers and performance metrics
- Consolidate outputs from multiple sub-agents
- Maintain session-level context coordination

**Critical Update Points**:
- After JIRA input parsing
- Before each sub-agent invocation
- After each sub-agent completion
- At workflow finalization

### Facilitator Agent
**File**: `facilitator-context.json`
**Key Responsibilities**:
- Track progression through phases 1-4
- Maintain stakeholder engagement records
- Document problem statements and scope decisions
- Prepare comprehensive handover package

**Critical Update Points**:
- After stakeholder mapping completion
- After problem statement validation
- After scope definition approval
- Before handover to consolidator

### Consolidator Agent
**File**: `consolidator-context.json`
**Key Responsibilities**:
- Import facilitator artifacts and validate prerequisites
- Track To-Be design and gap analysis progress
- Document data and system impact assessments
- Prepare acceptance criteria and consolidation package

**Critical Update Points**:
- After facilitator context import
- After To-Be design stakeholder validation
- After system impact assessment completion
- Before handover to finalizer

### Finalizer Agent
**File**: `finalizer-context.json`
**Key Responsibilities**:
- Import all previous agent artifacts
- Track document version progression (v0.1→v0.5→v0.8→v1.0)
- Manage review cycles and stakeholder feedback
- Complete final approval and archival process

**Critical Update Points**:
- After each document version creation
- After each review cycle completion
- After governance approval milestones
- At final document archival

## Context Validation Rules

### Required Fields Validation
- **Metadata**: session_id, timestamp, project_id must be populated
- **Current State**: phase and status must be valid enumerations
- **Handover**: ready_for_handover flag must be set before progression
- **Timestamps**: All timestamps must be ISO8601 format

### Cross-Agent Validation
- **Handover Integrity**: Receiving agent must validate handover package completeness
- **Artifact Traceability**: All artifacts must trace back to previous phases
- **Stakeholder Consistency**: Stakeholder information must be consistent across agents
- **Version Control**: Document versions must progress sequentially

### Data Integrity Checks
- **JSON Schema**: All context files must validate against defined schemas
- **Required Outputs**: Each phase must produce required deliverables
- **Validation Status**: All artifacts must have appropriate validation status
- **Error States**: Invalid states must be logged and resolved

## Error Recovery Procedures

### Context File Corruption
1. **Detection**: JSON parsing fails or schema validation errors
2. **Backup**: Check for backup context files in archive
3. **Recovery**: Restore from most recent valid backup or restart from template
4. **Logging**: Document corruption incident and recovery actions

### Missing Prerequisites
1. **Detection**: Required inputs from previous agents are missing
2. **Validation**: Verify previous agent completion status
3. **Resolution**: Request previous agent re-execution or manual input
4. **Prevention**: Implement prerequisite validation at agent startup

### Handover Failures
1. **Detection**: Handover package validation fails
2. **Analysis**: Identify missing or invalid artifacts
3. **Resolution**: Return to previous agent for completion
4. **Quality Gate**: Implement stricter handover validation

## Performance Monitoring

### Context File Metrics
- **File Size**: Monitor context file growth over time
- **Update Frequency**: Track context update patterns
- **Validation Time**: Measure validation performance
- **Error Rates**: Monitor context-related errors

### Workflow Performance
- **Phase Duration**: Track time spent in each workflow phase
- **Handover Time**: Measure context transfer efficiency
- **Quality Gates**: Monitor validation checkpoint performance
- **Error Resolution**: Track error resolution times

## Best Practices

### Context Management
1. **Frequent Updates**: Update context at all significant state changes
2. **Atomic Operations**: Ensure context updates are complete and consistent
3. **Validation First**: Always validate context before proceeding
4. **Backup Strategy**: Maintain context snapshots at major milestones
5. **Clean Architecture**: Keep context files well-structured and readable

### Quality Assurance
1. **Schema Compliance**: Always validate against defined schemas
2. **Completeness Checks**: Verify all required fields are populated
3. **Cross-Reference Validation**: Ensure consistency across related contexts
4. **Audit Trail**: Maintain complete timestamp and decision logging
5. **Error Prevention**: Implement proactive validation and error checking

### Performance Optimization
1. **Efficient Updates**: Update only changed sections, not entire contexts
2. **Size Management**: Archive old contexts to prevent file bloat
3. **Validation Caching**: Cache validation results where appropriate
4. **Parallel Processing**: Enable concurrent context operations where safe
5. **Resource Cleanup**: Remove unnecessary context data regularly

## Troubleshooting Common Issues

### Issue: Context File Not Found
**Symptom**: Agent cannot read context file
**Cause**: File was deleted or never created
**Solution**: Create from template and populate required metadata

### Issue: Invalid JSON Format
**Symptom**: JSON parsing errors
**Cause**: Malformed JSON or encoding issues
**Solution**: Validate JSON syntax and fix formatting

### Issue: Schema Validation Failure
**Symptom**: Context doesn't match expected schema
**Cause**: Missing required fields or incorrect data types
**Solution**: Compare against schema and fix validation errors

### Issue: Handover Package Incomplete
**Symptom**: Receiving agent cannot validate prerequisites
**Cause**: Previous agent didn't complete all required artifacts
**Solution**: Return to previous agent to complete missing deliverables

### Issue: Timestamp Format Errors
**Symptom**: Invalid timestamp format errors
**Cause**: Non-ISO8601 timestamp format
**Solution**: Convert to ISO8601 format (YYYY-MM-DDTHH:MM:SSZ)