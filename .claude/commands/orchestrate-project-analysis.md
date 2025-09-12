# Orchestrate Project Analysis

## Description
Master orchestrator command that processes JIRA Epic descriptions and coordinates complete project definition workflows through specialized sub-agents. Analyzes inputs, makes routing decisions, and coordinates 5-domain parallel execution with knowledge injection.

## Usage
```
/orchestrate-project-analysis [requirement] [expertise-level]
```

**Parameters:**
- `requirement`: JIRA Epic description or project requirement text
- `expertise-level`: Optional expertise level override (Junior/Senior/Expert, defaults to Senior)

## Orchestration Logic

### Input Processing Workflow
1. **Context Initialization**: Create/update manager and session context files
2. **Content Analysis**: Distinguish between input data and user instructions
3. **Domain Detection**: Analyze content for business domain keywords
4. **Knowledge Selection**: Select appropriate knowledge commands based on domains and complexity
5. **Instruction Interpretation**: Determine which project definition phases are required
6. **Context Preparation**: Package information and knowledge injection parameters
7. **Workflow Coordination**: Execute sub-agent sequence with parallel/sequential execution
8. **Output Consolidation**: Integrate results and provide comprehensive response
9. **Context Finalization**: Complete session context and archive if workflow finished

### Default Orchestration Behavior
**ALWAYS execute by default (unless overridden by user instructions):**
- Run 5 parallel `project-analyst` instances with all business domains
- Use Senior Level expertise for all domains if not overridden
- Execute full lifecycle (phases 1-11) through all three sub-agent types

**Default Sub-agent Execution Sequence:**
```
Parallel Phase 1-4 (Analysis):
1. project-analyst + /Senior Level/know-customer-distribution
2. project-analyst + /Senior Level/know-enterprise-enabling  
3. project-analyst + /Senior Level/know-risk-management
4. project-analyst + /Senior Level/know-marketing-sales
5. project-analyst + /Senior Level/know-product-services

Sequential Phase 5-7 (Design):
project-designer (consolidates all 5 domain analyses)

Sequential Phase 8-11 (Documentation):
project-documenter (finalizes consolidated documentation)
```

### Domain Detection Logic
The orchestrator analyzes input to detect relevant business domains:

**Domain Keywords Mapping:**
```
Customer/Channel/Distribution → know-customer-distribution
Legal/Compliance/Task → know-enterprise-enabling  
Risk/Fraud/Policy → know-risk-management
Marketing/Sales/Campaign/Brand → know-marketing-sales
Product/Payment/System/Agreement → know-product-services
```

### Expertise Level Selection
- **Default Level**: Senior Level (applied to all domains unless overridden)
- **Expert Level**: When user explicitly mentions "expert", "strategic", "regulatory", "complex transformation"
- **Junior Level**: When user explicitly mentions "junior", "basic", "simple", "documentation only"
- **Mixed Levels**: When user specifies different levels for different domains

### Knowledge Injection Parameters

**Default Parameter Structure (all 5 domains, Senior Level):**
```json
{
  "knowledge_commands": [
    "/Senior Level/know-customer-distribution",
    "/Senior Level/know-enterprise-enabling", 
    "/Senior Level/know-risk-management",
    "/Senior Level/know-marketing-sales",
    "/Senior Level/know-product-services"
  ]
}
```

**Override Examples:**
```json
{
  "knowledge_commands": ["/Expert Level/know-risk-management"]
}
```

```json
{
  "knowledge_commands": [
    "/Expert Level/know-customer-distribution",
    "/Junior Level/know-enterprise-enabling"
  ]
}
```

### Context Management
- **Manager Context File**: `.claude/control-records/active/manager-context.json`
- **Session Context File**: `.claude/control-records/sessions/session-{timestamp}.json`
- **Agent Context Monitoring**: Track context file updates from all invoked sub-agents
- **Handover Logging**: Record all context transfers between agents with timestamps
- **Performance Tracking**: Monitor agent execution times and quality gate passages
- **Knowledge Injection Tracking**: Log which knowledge commands were injected into each sub-agent

### Execution Steps for Main Context

When this command is invoked, the main context should execute:

1. **Initialize Context Files**
```
- Create/update manager-context.json from template
- Create session-{timestamp}.json from template
- Parse requirement and detect domains
- Determine expertise level (default: Senior)
```

2. **Execute Parallel Analysis Phase (1-4)**
```
Launch 5 parallel Task calls:
- Task(project-analyst, "Customer Distribution Analysis", prompt_with_knowledge_injection)
- Task(project-analyst, "Enterprise Enabling Analysis", prompt_with_knowledge_injection) 
- Task(project-analyst, "Risk Management Analysis", prompt_with_knowledge_injection)
- Task(project-analyst, "Marketing Sales Analysis", prompt_with_knowledge_injection)
- Task(project-analyst, "Product Services Analysis", prompt_with_knowledge_injection)
```

3. **Execute Sequential Design Phase (5-7)**
```
After all analysts complete:
- Task(project-designer, "Consolidate Design", prompt_with_consolidated_context)
```

4. **Execute Sequential Documentation Phase (8-11)**
```
After designer completes:
- Task(project-documenter, "Finalize Documentation", prompt_with_design_context)
```

5. **Consolidate and Report**
```
- Update manager-context.json with all results
- Generate comprehensive summary
- Archive session context
- Provide final deliverables overview
```

## Quality Gates and Validation

### Phase Completion Validation
- Ensure all 5 domain analyses complete before proceeding to design
- Validate designer output before proceeding to documentation
- Confirm all required artifacts are generated

### Context Transfer Validation
- Verify context files are properly created and populated
- Ensure knowledge injection commands are executed
- Validate handover between agents includes all required data

### Output Quality Assurance
- Check completeness of stakeholder analysis across all domains
- Validate problem statement alignment with all domain perspectives
- Ensure scope definition addresses all domain constraints
- Verify as-is analysis covers all relevant domain impacts

## Error Handling

### Agent Failure Recovery
- If any domain analysis fails, retry with error context
- If design consolidation fails, validate input completeness
- If documentation fails, check approval status and context

### Context Management Errors
- Create missing context files from templates
- Validate context file format and required fields
- Log all context operations with timestamps

## Expected Deliverables

Upon successful completion, the following files should be created:

### Context and Session Files
- `manager-context.json` - Orchestration tracking and routing decisions
- `session-{timestamp}.json` - Complete workflow execution record

### Domain Analysis Deliverables
- `analyst-context-customer-distribution.json` - Customer Distribution analysis context
- `analyst-customer-distribution-deliverables.json` - Customer Distribution artifacts
- `analyst-enterprise-enabling-deliverables.json` - Enterprise Enabling artifacts
- `analyst-risk-management-deliverables.json` - Risk Management artifacts  
- `analyst-marketing-sales-deliverables.json` - Marketing Sales artifacts
- `analyst-product-services-deliverables.json` - Product Services artifacts

### Design and Documentation Deliverables
- `designer-context.json` - Design consolidation context
- `designer-deliverables.json` - Design phase artifacts
- `documenter-context.json` - Documentation process context
- `{PROJECT-ID}-PROJECT-DEFINITION-v1.0.json` - Final project definition
- `{PROJECT-ID}-ANALYZA-PROJEKTU.md` - Czech analytical summary
- `{PROJECT-ID}-PROJECT-DEFINITION-v1.0.html` - HTML documentation

## Usage Examples

### Basic Usage (Senior Level, All Domains)
```
/orchestrate-project-analysis "BRQ202 Survey Management System - comprehensive survey management application..."
```

### Junior Level Override
```
/orchestrate-project-analysis "BRQ202 Survey Management System..." junior
```

### Expert Level Override  
```
/orchestrate-project-analysis "Complex transformation initiative..." expert
```

This command enables efficient parallel execution of multi-domain project analysis directly from the main context, eliminating sub-agent nesting complexity while maintaining comprehensive workflow orchestration capabilities.