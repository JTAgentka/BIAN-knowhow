# Context Management Utilities

## Overview
Utility functions and commands for managing context files across the project definition workflow. These utilities help with context validation, backup, recovery, and monitoring.

## Context Validation Utilities

### JSON Schema Validation
```bash
#!/bin/bash
# validate_context.sh - Validate context file against schema

validate_context() {
    local context_file=$1
    local agent_type=$2
    
    if [[ ! -f "$context_file" ]]; then
        echo "ERROR: Context file not found: $context_file"
        return 1
    fi
    
    # Check JSON syntax
    if ! jq empty "$context_file" 2>/dev/null; then
        echo "ERROR: Invalid JSON format in $context_file"
        return 1
    fi
    
    # Validate required fields based on agent type
    case $agent_type in
        "controller")
            validate_controller_context "$context_file"
            ;;
        "facilitator")
            validate_facilitator_context "$context_file"
            ;;
        "consolidator")
            validate_consolidator_context "$context_file"
            ;;
        "finalizer")
            validate_finalizer_context "$context_file"
            ;;
        *)
            echo "ERROR: Unknown agent type: $agent_type"
            return 1
            ;;
    esac
}
```

### Required Fields Validation
```bash
validate_base_fields() {
    local context_file=$1
    
    # Check metadata fields
    local session_id=$(jq -r '.metadata.session_id // empty' "$context_file")
    local timestamp=$(jq -r '.metadata.timestamp // empty' "$context_file")
    local project_id=$(jq -r '.metadata.project_id // empty' "$context_file")
    
    if [[ -z "$session_id" ]]; then
        echo "ERROR: Missing metadata.session_id"
        return 1
    fi
    
    if [[ -z "$timestamp" ]]; then
        echo "ERROR: Missing metadata.timestamp"
        return 1
    fi
    
    if [[ -z "$project_id" ]]; then
        echo "ERROR: Missing metadata.project_id"
        return 1
    fi
    
    # Validate timestamp format (ISO8601)
    if ! date -d "$timestamp" &>/dev/null; then
        echo "ERROR: Invalid timestamp format: $timestamp"
        return 1
    fi
    
    echo "Base field validation passed"
    return 0
}
```

## Context Backup and Recovery

### Backup Creation
```bash
create_context_backup() {
    local context_file=$1
    local backup_dir=".claude/control-records/backups"
    
    # Create backup directory if it doesn't exist
    mkdir -p "$backup_dir"
    
    # Create timestamped backup
    local timestamp=$(date +%Y%m%d_%H%M%S)
    local backup_file="$backup_dir/$(basename "$context_file" .json)_$timestamp.json"
    
    if cp "$context_file" "$backup_file"; then
        echo "Backup created: $backup_file"
        return 0
    else
        echo "ERROR: Failed to create backup"
        return 1
    fi
}
```

### Context Recovery
```bash
recover_context() {
    local context_file=$1
    local backup_dir=".claude/control-records/backups"
    
    # Find most recent backup
    local latest_backup=$(ls -t "$backup_dir"/$(basename "$context_file" .json)_*.json 2>/dev/null | head -1)
    
    if [[ -n "$latest_backup" ]]; then
        echo "Recovering from backup: $latest_backup"
        cp "$latest_backup" "$context_file"
        echo "Context recovered successfully"
        return 0
    else
        echo "No backup found, creating from template"
        create_from_template "$context_file"
        return $?
    fi
}
```

## Context Initialization

### Template-Based Creation
```bash
create_from_template() {
    local context_file=$1
    local agent_type=$(basename "$context_file" | cut -d'-' -f1)
    local template_file=".claude/control-records/templates/${agent_type}-template.json"
    
    if [[ ! -f "$template_file" ]]; then
        echo "ERROR: Template not found: $template_file"
        return 1
    fi
    
    # Copy template and populate metadata
    cp "$template_file" "$context_file"
    
    # Generate session ID and populate metadata
    local session_id=$(uuidgen 2>/dev/null || echo "session_$(date +%Y%m%d_%H%M%S)")
    local timestamp=$(date -u +%Y-%m-%dT%H:%M:%SZ)
    
    # Update metadata using jq
    jq --arg sid "$session_id" \
       --arg ts "$timestamp" \
       '.metadata.session_id = $sid | .metadata.timestamp = $ts' \
       "$context_file" > "${context_file}.tmp" && mv "${context_file}.tmp" "$context_file"
    
    echo "Context created from template: $context_file"
    return 0
}
```

### Context Initialization with Parameters
```bash
initialize_context() {
    local agent_type=$1
    local project_id=$2
    local jira_epic_id=$3
    
    local context_file=".claude/control-records/active/${agent_type}-context.json"
    
    # Create from template
    create_from_template "$context_file"
    
    # Populate additional metadata
    jq --arg pid "$project_id" \
       --arg jid "$jira_epic_id" \
       '.metadata.project_id = $pid | .metadata.jira_epic_id = $jid' \
       "$context_file" > "${context_file}.tmp" && mv "${context_file}.tmp" "$context_file"
    
    echo "Context initialized: $context_file"
}
```

## Context Monitoring

### Context Status Check
```bash
check_context_status() {
    local context_file=$1
    
    if [[ ! -f "$context_file" ]]; then
        echo "STATUS: Context file missing"
        return 1
    fi
    
    local status=$(jq -r '.current_state.status // "unknown"' "$context_file")
    local phase=$(jq -r '.current_state.phase // "unknown"' "$context_file")
    local last_updated=$(jq -r '.current_state.last_updated // "unknown"' "$context_file")
    
    echo "STATUS: $status"
    echo "PHASE: $phase"
    echo "LAST_UPDATED: $last_updated"
    
    # Check if status is valid
    case "$status" in
        "pending"|"in_progress"|"completed"|"error")
            return 0
            ;;
        *)
            echo "WARNING: Invalid status: $status"
            return 1
            ;;
    esac
}
```

### Workflow Progress Monitor
```bash
check_workflow_progress() {
    local project_id=$1
    
    echo "=== Workflow Progress for Project: $project_id ==="
    
    for agent in controller facilitator consolidator finalizer; do
        local context_file=".claude/control-records/active/${agent}-context.json"
        echo -n "$agent: "
        check_context_status "$context_file" | grep "STATUS:" | cut -d' ' -f2
    done
    
    echo "=== End Progress Report ==="
}
```

## Context Cleanup and Archival

### Archive Completed Contexts
```bash
archive_contexts() {
    local project_id=$1
    local archive_dir=".claude/control-records/archive/$project_id"
    
    # Create archive directory
    mkdir -p "$archive_dir"
    
    # Move active contexts to archive
    for context_file in .claude/control-records/active/*-context.json; do
        if [[ -f "$context_file" ]]; then
            local filename=$(basename "$context_file")
            echo "Archiving: $filename"
            mv "$context_file" "$archive_dir/"
        fi
    done
    
    # Create session summary
    create_session_summary "$archive_dir"
    
    echo "Contexts archived to: $archive_dir"
}
```

### Session Summary Creation
```bash
create_session_summary() {
    local archive_dir=$1
    local summary_file="$archive_dir/session-summary.json"
    
    # Extract key information from archived contexts
    jq -s '{
        session_metadata: {
            project_id: .[0].metadata.project_id,
            session_id: .[0].metadata.session_id,
            start_time: (.[].metadata.timestamp | min),
            end_time: (.[].metadata.timestamp | max)
        },
        agents_involved: [.[].metadata.agent_id],
        phases_completed: [.[].current_state.phase] | unique,
        final_status: [.[].current_state.status] | unique
    }' "$archive_dir"/*-context.json > "$summary_file"
    
    echo "Session summary created: $summary_file"
}
```

## Context Repair Utilities

### Fix Common Issues
```bash
repair_context() {
    local context_file=$1
    
    echo "Repairing context file: $context_file"
    
    # Fix missing timestamps
    local current_time=$(date -u +%Y-%m-%dT%H:%M:%SZ)
    
    # Use jq to fix common issues
    jq --arg ts "$current_time" '
        # Fix missing timestamp
        if .metadata.timestamp == "" or .metadata.timestamp == null then
            .metadata.timestamp = $ts
        else . end |
        
        # Fix missing session_id
        if .metadata.session_id == "" or .metadata.session_id == null then
            .metadata.session_id = ("session_" + ($ts | gsub("[:-]"; "_")))
        else . end |
        
        # Fix invalid status
        if (.current_state.status | IN("pending", "in_progress", "completed", "error") | not) then
            .current_state.status = "pending"
        else . end
    ' "$context_file" > "${context_file}.tmp" && mv "${context_file}.tmp" "$context_file"
    
    echo "Context repair completed"
}
```

### Validate and Repair All Contexts
```bash
validate_and_repair_all() {
    for context_file in .claude/control-records/active/*-context.json; do
        if [[ -f "$context_file" ]]; then
            echo "Checking: $context_file"
            
            if ! validate_context "$context_file" "$(basename "$context_file" | cut -d'-' -f1)"; then
                echo "Validation failed, attempting repair..."
                repair_context "$context_file"
                
                # Re-validate after repair
                if validate_context "$context_file" "$(basename "$context_file" | cut -d'-' -f1)"; then
                    echo "Repair successful"
                else
                    echo "Repair failed, manual intervention required"
                fi
            else
                echo "Validation passed"
            fi
        fi
    done
}
```

## Usage Examples

### Initialize New Workflow
```bash
# Start new project workflow
project_id="PROJ-001"
jira_epic_id="EPIC-123"

initialize_context "controller" "$project_id" "$jira_epic_id"
echo "Controller context initialized for project $project_id"
```

### Monitor Workflow Progress
```bash
# Check progress of active workflow
check_workflow_progress "PROJ-001"
```

### Cleanup and Archive
```bash
# Archive completed workflow
archive_contexts "PROJ-001"
echo "Workflow archived successfully"
```

### Emergency Recovery
```bash
# Recover corrupted context
recover_context ".claude/control-records/active/facilitator-context.json"
```

## Integration with Sub-Agents

### Agent Startup Validation
Each sub-agent should include this validation step:
```bash
# At agent startup
CONTEXT_FILE=".claude/control-records/active/facilitator-context.json"
if ! validate_context "$CONTEXT_FILE" "facilitator"; then
    echo "Invalid context, attempting recovery..."
    recover_context "$CONTEXT_FILE"
fi
```

### Context Update Pattern
```bash
# At significant state changes
update_context_field() {
    local context_file=$1
    local field_path=$2
    local new_value=$3
    local timestamp=$(date -u +%Y-%m-%dT%H:%M:%SZ)
    
    jq --arg val "$new_value" --arg ts "$timestamp" \
       "setpath([\"$field_path\"]; \$val) | .current_state.last_updated = \$ts" \
       "$context_file" > "${context_file}.tmp" && mv "${context_file}.tmp" "$context_file"
}