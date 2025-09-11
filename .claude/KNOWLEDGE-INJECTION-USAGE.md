# Knowledge Injection System Usage Guide

## Overview
The Knowledge Injection System allows the Project Manager (orchestrator) to automatically inject BIAN banking domain expertise into sub-agents before they start their analysis, design, or documentation work.

## How It Works

### 1. Default Behavior (NEW)
The Project Manager **ALWAYS executes by default**:
- **All 5 business domains in parallel** (comprehensive coverage)
- **Senior Level expertise** for all domains 
- **Full lifecycle workflow** (analysis → design → documentation)
- **5 parallel analysts** followed by sequential designer and documenter

### 2. Override Only When Instructed
The orchestrator only changes default behavior when user provides explicit instructions:
- Different expertise levels ("expert analysis", "basic review")
- Specific domains only ("focus on customer and risk") 
- Different workflow phases ("analysis only", "design phase")

### 2. Domain Detection Keywords

| Business Domain | Keywords | Command |
|-----------------|----------|---------|
| Customer Distribution | customer, channel, distribution, onboarding, CRM | know-customer-distribution |
| Enterprise Enabling | legal, compliance, task, governance, audit | know-enterprise-enabling |
| Risk Management | risk, fraud, policy, regulatory, Basel | know-risk-management |
| Marketing & Sales | marketing, sales, campaign, brand, loyalty | know-marketing-sales |
| Product & Services | product, payment, system, agreement, API | know-product-services |

### 3. Expertise Level Selection

| Expertise Level | Experience | When Used | Override Keywords |
|-----------------|------------|-----------|-------------------|
| **Senior Level** | 8-12 years | **DEFAULT** (always used unless overridden) | No keywords needed |
| **Expert Level** | 15+ years | Override only | "expert", "strategic", "regulatory", "transformation" |
| **Junior Level** | 2-5 years | Override only | "basic", "simple", "junior", "documentation only" |

## Usage Examples

### Example 1: Default Behavior (Most Common)
**JIRA Input:**
```
Epic: "Improve customer onboarding process"
Description: "Streamline customer KYC and account opening workflow"
Comments: "Please provide complete project definition"
```

**Orchestrator Processing:**
- **Default Execution**: All 5 domains, Senior Level
- **No override keywords detected**
- **Standard parallel execution**

**Sub-agent Execution:**
```bash
# DEFAULT: Always runs all 5 domains in parallel at Senior Level
project-analyst-1 --knowledge="/Senior Level/know-customer-distribution"
project-analyst-2 --knowledge="/Senior Level/know-enterprise-enabling"  
project-analyst-3 --knowledge="/Senior Level/know-risk-management"
project-analyst-4 --knowledge="/Senior Level/know-marketing-sales"
project-analyst-5 --knowledge="/Senior Level/know-product-services"

# Then sequential:
project-designer (consolidates all 5 analyses)
project-documenter (finalizes documentation)
```

### Example 2: Expert Level Override
**JIRA Input:**
```
Epic: "Regulatory compliance transformation"
Description: "Implement Basel III/IV requirements across all business areas"
Comments: "This is a strategic regulatory initiative requiring expert analysis"
```

**Orchestrator Processing:**
- **Override Detected**: "expert analysis" → Expert Level for all domains
- **Domain Selection**: All 5 domains (default)
- **Expertise Override**: Senior → Expert Level

**Sub-agent Execution:**
```bash
# OVERRIDE: Expert Level for all 5 domains
project-analyst-1 --knowledge="/Expert Level/know-customer-distribution"
project-analyst-2 --knowledge="/Expert Level/know-enterprise-enabling"  
project-analyst-3 --knowledge="/Expert Level/know-risk-management"
project-analyst-4 --knowledge="/Expert Level/know-marketing-sales"
project-analyst-5 --knowledge="/Expert Level/know-product-services"
```

### Example 3: Domain-Specific Override
**JIRA Input:**
```
Epic: "Payment processing optimization"
Description: "Enhance payment system performance and risk controls"
Comments: "Focus on product and risk analysis only"
```

**Orchestrator Processing:**
- **Domain Override**: "product and risk" → only 2 domains
- **Expertise Level**: Senior Level (default)
- **Reduced execution scope**

**Sub-agent Execution:**
```bash
# OVERRIDE: Only 2 specific domains at Senior Level  
project-analyst-1 --knowledge="/Senior Level/know-product-services"
project-analyst-2 --knowledge="/Senior Level/know-risk-management"
```

### Example 4: Mixed Level Override
**JIRA Input:**
```
Epic: "Customer experience enhancement"
Description: "Improve customer journey with regulatory compliance updates"
Comments: "Need expert regulatory analysis but basic customer review"
```

**Orchestrator Processing:**
- **Mixed Override**: "expert regulatory, basic customer"
- **Domain Selection**: All 5 domains (default)
- **Mixed expertise levels**

**Sub-agent Execution:**
```bash
# OVERRIDE: Mixed expertise levels per domain
project-analyst-1 --knowledge="/Junior Level/know-customer-distribution"    # basic
project-analyst-2 --knowledge="/Expert Level/know-enterprise-enabling"     # expert
project-analyst-3 --knowledge="/Senior Level/know-risk-management"         # default
project-analyst-4 --knowledge="/Senior Level/know-marketing-sales"         # default  
project-analyst-5 --knowledge="/Senior Level/know-product-services"        # default
```

## Technical Implementation

### 1. Context File Structure
The orchestrator adds knowledge commands to the context file:

```json
{
  "session_id": "session_20250911_143022",
  "project_id": "EPIC-12345",
  "knowledge_injection": {
    "detected_domains": ["customer-distribution", "risk-management"],
    "complexity_level": "Expert",
    "selected_commands": [
      "/Expert Level/know-customer-distribution",
      "/Expert Level/know-risk-management"
    ]
  },
  "knowledge_commands": [
    "/Expert Level/know-customer-distribution",
    "/Expert Level/know-risk-management"
  ]
}
```

### 2. Sub-agent Knowledge Injection Sequence

Each sub-agent follows this sequence:

1. **Context Load**: Read context file (analyst-context.json, designer-context.json, or documenter-context.json)
2. **Knowledge Detection**: Check for `knowledge_commands` array in context
3. **Command Execution**: Execute each knowledge command to inject domain expertise
4. **Workflow Start**: Begin analysis/design/documentation with injected knowledge

### 3. Knowledge Command Execution
When a sub-agent receives knowledge commands:

```javascript
// Pseudo-code for knowledge injection
if (context.knowledge_commands) {
  for (let command of context.knowledge_commands) {
    // Execute knowledge command (e.g., "/Expert Level/know-customer-distribution")
    await executeKnowledgeCommand(command);
  }
}
// Now start the actual workflow with injected domain expertise
await startWorkflow();
```

## Benefits

### 1. **Automated Domain Expertise**
- No manual knowledge selection required
- Consistent domain expertise injection
- Reduces human error in domain selection

### 2. **Parallel Processing**
- Multiple sub-agents can run simultaneously with different domain expertise
- Faster processing for complex multi-domain projects
- Comprehensive coverage of all business areas

### 3. **Scalable Architecture**
- Easy to add new domains by creating new knowledge commands
- Flexible expertise levels (Expert/Senior/Junior)
- Consistent knowledge injection across all sub-agents

### 4. **Quality Assurance**
- Ensures appropriate domain expertise for each project
- Maintains consistency in analysis quality
- Reduces knowledge gaps in complex projects

## Configuration

### Adding New Domains
To add a new business domain:

1. Create knowledge command files in `.claude/commands/`:
   ```
   .claude/commands/Expert Level/know-new-domain.md
   .claude/commands/Senior Level/know-new-domain.md
   .claude/commands/Junior Level/know-new-domain.md
   ```

2. Update domain detection keywords in project-manager.md:
   ```
   "new-domain-keywords" → know-new-domain
   ```

### Customizing Expertise Levels
Modify the complexity indicators in project-manager.md:
- Add new project types to each expertise level
- Adjust keyword matching for complexity detection
- Update knowledge command selection logic

## Troubleshooting

### Common Issues

1. **No Knowledge Commands Injected**
   - Check domain keyword matching in project-manager.md
   - Verify knowledge command files exist in `.claude/commands/`
   - Confirm context file contains `knowledge_commands` array

2. **Wrong Expertise Level Selected**
   - Review complexity indicators in JIRA input
   - Update complexity detection keywords if needed
   - Manually specify expertise level in JIRA comments

3. **Sub-agent Not Using Injected Knowledge**
   - Verify sub-agent reads context file at startup
   - Check knowledge injection sequence in sub-agent code
   - Confirm knowledge commands are executed before workflow start

### Manual Override
You can manually specify knowledge injection in JIRA comments:
```
Comments: "Use Expert Level customer-distribution and Senior Level risk-management knowledge"
```

This system ensures that your sub-agents always have the right domain expertise for any banking project!