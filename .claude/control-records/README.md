# Control Records Directory

## Purpose
This directory contains context logging files that track the state, inputs, outputs, and handovers between all project definition sub-agents. These files ensure no information is lost and each agent can resume with full context awareness.

## Directory Structure
```
control-records/
├── README.md                        # This file
├── context-schemas.md               # JSON schema definitions
├── templates/                       # Template files for new contexts
│   ├── controller-template.json
│   ├── facilitator-template.json
│   ├── consolidator-template.json
│   ├── finalizer-template.json
│   └── session-template.json
├── active/                          # Current active context files
│   ├── controller-context.json
│   ├── facilitator-context.json
│   ├── consolidator-context.json
│   └── finalizer-context.json
├── sessions/                        # Session-specific contexts
│   └── session-{timestamp}.json
└── archive/                         # Completed project contexts
    └── {project-id}/
        ├── controller-context.json
        ├── facilitator-context.json
        ├── consolidator-context.json
        ├── finalizer-context.json
        └── session-summary.json
```

## File Usage

### Active Context Files
- **controller-context.json**: Current orchestrator state and routing decisions
- **facilitator-context.json**: Phases 1-4 progress and artifacts  
- **consolidator-context.json**: Phases 5-7 progress and artifacts
- **finalizer-context.json**: Phases 8-11 progress and artifacts

### Session Files
- **session-{timestamp}.json**: Session-specific execution tracking
- Created for each new project definition workflow execution
- Contains performance metrics and cross-agent coordination data

### Archive Files
- Completed project contexts moved to archive/{project-id}/
- Maintains historical record of all project definition executions
- Enables audit trail and process improvement analysis

## Context File Lifecycle

1. **Initialization**: Agent reads template and creates initial context
2. **Execution**: Context updated at each phase transition and decision point
3. **Handover**: Context packaged and transferred to next agent
4. **Completion**: Final context archived with session summary
5. **Cleanup**: Active contexts reset for next workflow execution

## Agent Integration Requirements

Each sub-agent must:
1. **Initialize**: Read existing context file or create from template
2. **Update**: Write context changes at each significant state transition  
3. **Handover**: Package relevant context for next agent
4. **Finalize**: Complete context record before termination

## Monitoring and Maintenance

- Context files enable workflow monitoring and debugging
- Performance metrics support process optimization
- Archive enables historical analysis and compliance reporting
- Regular cleanup of old session files recommended