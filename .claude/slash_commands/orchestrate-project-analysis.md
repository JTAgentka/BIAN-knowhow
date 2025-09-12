# /orchestrate-project-analysis

## Command Description
Slash command implementation for orchestrating complete project definition workflows through specialized sub-agents with parallel execution capabilities.

## Syntax
```
/orchestrate-project-analysis [requirement] [expertise-level]
```

## Parameters
- **requirement** (required): JIRA Epic description or project requirement text
- **expertise-level** (optional): Junior/Senior/Expert (defaults to Senior)

## Implementation Notes

This slash command should trigger the orchestration workflow described in `/Users/agent/dev/BIAN-knowhow/.claude/commands/orchestrate-project-analysis.md`.

When invoked, the main context (Claude) should:

1. Read the orchestration command logic
2. Initialize context files and session tracking
3. Execute 5 parallel project-analyst Task calls with domain-specific knowledge injection
4. Sequentially execute project-designer and project-documenter
5. Consolidate results and generate comprehensive deliverables

## Usage Examples

```bash
# Basic orchestration with Senior Level expertise
/orchestrate-project-analysis "BRQ202 Survey Management System - comprehensive application for managing survey templates, versioning, and role-based access"

# Junior Level expertise override
/orchestrate-project-analysis "Simple survey management tool" Junior

# Expert Level for complex transformations
/orchestrate-project-analysis "Complex regulatory compliance initiative" Expert
```

## Expected Behavior

The command should eliminate the need to manually invoke the project-manager sub-agent, instead allowing direct orchestration from the main context with better parallel execution capabilities.

## Architecture Benefits

- **Native Parallel Execution**: Main context can efficiently handle 5 simultaneous Task calls
- **Direct Context Management**: No sub-agent nesting complexity
- **Better Error Handling**: Direct visibility into all sub-agent executions
- **Simplified Debugging**: All orchestration logic visible in main context
- **User Control**: Direct invocation without sub-agent overhead