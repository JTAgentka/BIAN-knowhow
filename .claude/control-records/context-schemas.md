# Context Logging Schemas

## Overview
Standardized JSON schemas for context logging across all project definition sub-agents. Each agent maintains its own context file with inputs, outputs, state, and handover information.

## File Naming Convention
```
control-records/
├── controller-context.json          # Orchestrator context
├── facilitator-context.json         # Phases 1-4 context  
├── consolidator-context.json        # Phases 5-7 context
├── finalizer-context.json          # Phases 8-11 context
├── session-{timestamp}.json        # Session-specific context
└── schemas/                        # Schema definitions
```

## Base Context Schema
```json
{
  "metadata": {
    "agent_id": "string",
    "session_id": "string", 
    "timestamp": "ISO8601",
    "version": "string",
    "project_id": "string"
  },
  "current_state": {
    "phase": "number|string",
    "status": "pending|in_progress|completed|error",
    "last_updated": "ISO8601"
  },
  "inputs": {},
  "outputs": {},
  "handover": {}
}
```

## Controller Context Schema
```json
{
  "metadata": {
    "agent_id": "jira-project-definition-controller",
    "session_id": "uuid",
    "timestamp": "ISO8601",
    "version": "1.0",
    "project_id": "string",
    "jira_epic_id": "string"
  },
  "current_state": {
    "phase": "orchestration",
    "status": "pending|in_progress|completed|error",
    "last_updated": "ISO8601",
    "routing_decision": "full_lifecycle|partial_workflow|specific_phase"
  },
  "jira_input": {
    "epic_description": "string",
    "attachments": [
      {
        "name": "string",
        "content": "string",
        "type": "document|image|other"
      }
    ],
    "comments": [
      {
        "author": "string",
        "content": "string",
        "timestamp": "ISO8601"
      }
    ]
  },
  "parsed_content": {
    "input_data": "string",
    "user_instructions": "string",
    "stakeholder_info": "string",
    "requirements_summary": "string"
  },
  "routing_logic": {
    "decision_rationale": "string",
    "selected_agents": ["string"],
    "workflow_sequence": ["string"],
    "expected_phases": ["number"]
  },
  "agent_handovers": [
    {
      "target_agent": "string",
      "context_transferred": "object",
      "timestamp": "ISO8601",
      "status": "sent|received|completed"
    }
  ],
  "consolidated_outputs": {
    "deliverables": ["object"],
    "quality_validation": "object",
    "stakeholder_summary": "string"
  }
}
```

## Facilitator Context Schema (Phases 1-4)
```json
{
  "metadata": {
    "agent_id": "project-definition-facilitator",
    "session_id": "uuid",
    "timestamp": "ISO8601",
    "version": "1.0",
    "project_id": "string"
  },
  "current_state": {
    "phase": 1-4,
    "status": "pending|in_progress|completed|error",
    "last_updated": "ISO8601",
    "completed_phases": ["number"]
  },
  "inputs": {
    "jira_context": "object",
    "user_instructions": "string",
    "business_requirements": "string",
    "initial_stakeholder_info": "string"
  },
  "phase_outputs": {
    "phase_1_stakeholder_mapping": {
      "stakeholder_engagement_matrix": [
        {
          "stakeholder": "string",
          "role": "string",
          "objectives": "string",
          "attitude": "supportive|neutral|resistant",
          "influence": "high|medium|low",
          "interest": "high|medium|low",
          "engagement_strategy": "string"
        }
      ],
      "validation_status": "pending|validated|rejected",
      "timestamp": "ISO8601"
    },
    "phase_2_problem_statement": {
      "business_pain": "string",
      "change_motivation": "string",
      "high_level_objectives": ["string"],
      "success_criteria": ["string"],
      "validation_status": "pending|validated|rejected",
      "timestamp": "ISO8601"
    },
    "phase_3_scope_definition": {
      "scope_in": ["string"],
      "scope_out": ["string"], 
      "assumptions": ["string"],
      "constraints": ["string"],
      "validation_status": "pending|validated|rejected",
      "timestamp": "ISO8601"
    },
    "phase_4_as_is_analysis": {
      "current_processes": ["object"],
      "system_landscape": ["object"],
      "role_definitions": ["object"],
      "problem_areas": ["string"],
      "risk_assessment": ["object"],
      "validation_status": "pending|validated|rejected", 
      "timestamp": "ISO8601"
    }
  },
  "handover_to_consolidator": {
    "ready_for_handover": "boolean",
    "consolidated_artifacts": "object",
    "validation_summary": "string",
    "timestamp": "ISO8601"
  }
}
```

## Consolidator Context Schema (Phases 5-7)
```json
{
  "metadata": {
    "agent_id": "project-definition-consolidator", 
    "session_id": "uuid",
    "timestamp": "ISO8601",
    "version": "1.0",
    "project_id": "string"
  },
  "current_state": {
    "phase": 5-7,
    "status": "pending|in_progress|completed|error",
    "last_updated": "ISO8601",
    "completed_phases": ["number"]
  },
  "inputs_from_facilitator": {
    "stakeholder_engagement_matrix": "object",
    "problem_statement": "object", 
    "scope_definition": "object",
    "as_is_analysis": "object",
    "received_timestamp": "ISO8601"
  },
  "phase_outputs": {
    "phase_5_to_be_design": {
      "to_be_model": {
        "process_diagrams": ["object"],
        "system_architecture": ["object"],
        "role_definitions": ["object"],
        "data_flows": ["object"]
      },
      "gap_analysis": [
        {
          "dimension": "process|system|data|roles",
          "as_is_state": "string",
          "to_be_state": "string", 
          "gap_description": "string",
          "impact_level": "high|medium|low",
          "priority": "high|medium|low"
        }
      ],
      "stakeholder_validation": "pending|validated|rejected",
      "timestamp": "ISO8601"
    },
    "phase_6_data_systems_impact": {
      "data_impact_assessment": [
        {
          "data_element": "string",
          "current_owner": "string",
          "new_owner": "string",
          "sensitivity": "high|medium|low",
          "access_changes": "string",
          "lineage_impact": "string"
        }
      ],
      "system_impact_matrix": [
        {
          "system_application": "string",
          "impact_type": "modification|new|retirement",
          "modification_required": "string",
          "integration_changes": ["string"],
          "risk_level": "high|medium|low"
        }
      ],
      "integration_requirements": ["string"],
      "timestamp": "ISO8601"
    },
    "phase_7_acceptance_criteria": {
      "smart_criteria": [
        {
          "criterion_id": "string",
          "description": "string",
          "specific": "boolean",
          "measurable": "boolean", 
          "achievable": "boolean",
          "relevant": "boolean",
          "time_bound": "string",
          "validation_method": "string"
        }
      ],
      "stakeholder_validation": "pending|validated|rejected",
      "timestamp": "ISO8601"
    }
  },
  "handover_to_finalizer": {
    "ready_for_handover": "boolean",
    "consolidated_artifacts": "object",
    "validation_summary": "string", 
    "timestamp": "ISO8601"
  }
}
```

## Finalizer Context Schema (Phases 8-11)
```json
{
  "metadata": {
    "agent_id": "project-definition-finalizer",
    "session_id": "uuid", 
    "timestamp": "ISO8601",
    "version": "1.0",
    "project_id": "string"
  },
  "current_state": {
    "phase": 8-11,
    "status": "pending|in_progress|completed|error",
    "last_updated": "ISO8601",
    "document_version": "v0.1|v0.5|v0.8|v1.0",
    "completed_phases": ["number"]
  },
  "inputs_from_previous_agents": {
    "facilitator_artifacts": "object",
    "consolidator_artifacts": "object", 
    "received_timestamp": "ISO8601"
  },
  "document_versions": {
    "v0_1_consolidation": {
      "document_structure": "object",
      "quality_assurance_checklist": "object",
      "traceability_matrix": "object",
      "executive_summary": "string",
      "timestamp": "ISO8601"
    },
    "v0_5_internal_review": {
      "review_distribution": ["object"],
      "feedback_register": ["object"],
      "conflict_resolution": ["object"], 
      "internal_signoffs": ["object"],
      "timestamp": "ISO8601"
    },
    "v0_8_external_validation": {
      "validation_sessions": ["object"],
      "external_feedback": ["object"],
      "governance_package": "object",
      "stakeholder_confirmations": ["object"],
      "timestamp": "ISO8601"
    },
    "v1_0_final_approval": {
      "governance_submission": "object",
      "compliance_verification": "object", 
      "approval_records": "object",
      "archive_records": "object",
      "timestamp": "ISO8601"
    }
  },
  "review_cycles": [
    {
      "cycle_type": "internal|external|governance",
      "participants": ["string"],
      "timeline": "string",
      "feedback_summary": "string",
      "resolution_status": "pending|resolved|escalated",
      "timestamp": "ISO8601"
    }
  ],
  "final_deliverable": {
    "approved_document": "object",
    "project_authorization": "boolean",
    "archive_location": "string",
    "timestamp": "ISO8601"
  }
}
```

## Session Context Schema
```json
{
  "session_metadata": {
    "session_id": "uuid",
    "start_timestamp": "ISO8601",
    "end_timestamp": "ISO8601",
    "project_id": "string", 
    "jira_epic_id": "string",
    "user_id": "string"
  },
  "workflow_execution": {
    "agents_involved": ["string"],
    "phases_completed": ["number"],
    "total_duration": "string",
    "quality_gates_passed": ["string"]
  },
  "context_files_created": [
    {
      "agent": "string", 
      "file_path": "string",
      "size_bytes": "number",
      "timestamp": "ISO8601"
    }
  ],
  "performance_metrics": {
    "total_processing_time": "string",
    "agent_handover_times": ["object"],
    "validation_cycles": "number",
    "stakeholder_interactions": "number"
  }
}
```

## Context File Management Rules

### File Lifecycle
1. **Creation**: New context file created when agent starts
2. **Updates**: Context updated at each phase transition
3. **Handover**: Context packaged and transferred to next agent
4. **Archival**: Final context archived with session metadata

### Validation Requirements
- All required fields must be populated
- Timestamps must be ISO8601 format
- Status fields must use defined enumerations
- Cross-references must be valid UUIDs

### Error Handling
- Invalid context triggers error state
- Missing required fields prevent phase progression  
- Context corruption requires session restart
- Backup contexts maintained for recovery