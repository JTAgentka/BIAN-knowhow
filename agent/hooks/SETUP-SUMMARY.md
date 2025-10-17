# Business Analyst Work Center - Setup Summary

## Overview
The Business Analyst Work Center is a sophisticated multi-agent orchestration system that coordinates domain-specific impact analysis across six business domains with JIRA integration.

**Version:** 2.0.0
**Created:** 2025-10-10
**Updated:** 2025-10-17

---

## Architecture

### System Flow
```
JIRA Webhook → Orchestrator → Sub-agents (parallel) → Consolidated Analysis → JIRA Comment
```

### Key Components

#### 1. Main Agent (Orchestrator)
- **Location:** `prompt.md`
- **Purpose:** Coordinates multi-domain impact analysis workflow
- **Features:**
  - Reads JIRA EPIC and linked TASKs
  - Executes domain analysts in parallel
  - Consolidates results
  - Posts Czech-language reports to JIRA

#### 2. Sub-agents (Domain Analysts)
Current sub-agent in `agents/` directory:
- `architect-scope-analyst.md` - Systematic scope definition with IN/OUT boundaries

**Previous sub-agents (removed in v2.0.0):**
- BMS-impact-analyst.md (Brand, Marketing and Sales)
- CPB-impact-analyst.md (Customer, Partner and Branch)
- ES-impact-analyst.md (Enterprise Services)
- ITS-impact-analyst.md (IT Services)
- PSO-impact-analyst.md (Product, Service and Operations)
- RFC-impact-analyst.md (Risk, Fraud and Compliance)

#### 3. Knowledge Injection System

**Pre-Hook:** `hooks/inject-subagent-memory.js`
- Automatically injects domain context before sub-agent execution
- Triggers on `Task` tool calls via `PreToolUse` event
- Reads context from `memory/subagents/` directory

**Memory Files:** `memory/subagents/`
- `_shared.md` - Common context for all sub-agents
- `cpb.md` - Customer, Partner, Branch Management domain
- `bms.md` - Brand, Marketing and Sales Management domain
- `es.md` - Enterprise Services Management domain
- `its.md` - IT Services Management domain
- `pso.md` - Product, Service and Operations Management domain
- `rfc.md` - Risk, Fraud and Compliance Management domain

---

## Pre-Hook Configuration

### What It Does
The pre-hook intercepts `Task` tool calls and automatically injects relevant domain knowledge from `memory/subagents/` files before the sub-agent starts working.

### Hook Mechanism
```javascript
// .clauderc configuration
{
  "hooks": [
    {
      "event": "PreToolUse",          // Triggers before tool use
      "matcher": "Task",               // Only for Task tool
      "command": "node .claude/hooks/inject-subagent-memory.js"
    }
  ]
}
```

### How It Works
1. Orchestrator calls `Task` tool with `subagent_type` parameter
2. Pre-hook intercepts the call
3. Hook looks for matching memory file: `memory/subagents/{subagent_type}.md`
4. Hook injects `_shared.md` (common context) + specific domain file
5. Sub-agent receives injected context before starting work

### Example Flow
```bash
# Orchestrator invokes:
Task(subagent_type="architect-scope-analyst", prompt="Analyze scope...")

# Pre-hook automatically injects:
# 1. memory/subagents/_shared.md (communication style, guidelines)
# 2. memory/subagents/cpb.md (if analyzing CPB domain)

# Sub-agent receives enriched context and starts analysis
```

---

## Setup Methods

### Container Deployment (Automatic) ✅
**No manual setup required!** The pre-hook system is automatically configured in Docker containers.

See **[CONTAINER-SETUP.md](CONTAINER-SETUP.md)** for full details.

**TL;DR:**
- Dockerfile copies all files: `.clauderc`, `hooks/`, `memory/`
- `working_directory` in config.json ensures correct execution context
- Claude CLI automatically loads hooks from agent directory
- Just build and deploy - everything works out of the box!

### Local Development Setup

#### Method 1: Automated Setup (Recommended)
```bash
# From business-analyst-work-center directory
./setup-new-project.sh /path/to/new/project
```

**What it does:**
1. Creates `.claude/hooks/` and `.claude/memory/subagents/` directories
2. Copies `inject-subagent-memory.js` hook script
3. Creates or updates `.clauderc` with hook configuration
4. Creates template `_shared.md` for customization
5. Optionally copies domain-specific memory files

#### Method 2: Manual Setup
Follow instructions in `KNOWLEDGE-INJECTION-USAGE.md`:

1. **Create directory structure:**
   ```bash
   mkdir -p .claude/hooks
   mkdir -p .claude/memory/subagents
   ```

2. **Copy hook script:**
   ```bash
   cp hooks/inject-subagent-memory.js .claude/hooks/
   chmod +x .claude/hooks/inject-subagent-memory.js
   ```

3. **Configure .clauderc:**
   ```json
   {
     "hooks": [
       {
         "event": "PreToolUse",
         "matcher": "Task",
         "command": "node .claude/hooks/inject-subagent-memory.js"
       }
     ]
   }
   ```

4. **Create memory files:**
   - `_shared.md` - Common context
   - `{domain}.md` - Domain-specific context

---

## Domain Coverage

### Business Domains (from manifest.yaml)
1. **CPB** - Customer, Partner and Branch Management
2. **PSO** - Product, Service and Operational Management
3. **BMS** - Brand, Marketing and Sales Management
4. **ES** - Enterprise Services Management
5. **ITS** - IT Services Management
6. **RFC** - Risk, Fraud and Compliance Management

### Domain Capabilities Examples
From `memory/subagents/cpb.md`:
- Channel Management (Advanced Voice Services, Branch Operations, eBranch)
- Customer Management (Credit Rating, Portfolio, Relationship Management)
- Interaction Management (Session Dialogue, Event History)
- Partner Management (Card Networks, Correspondent Banks, Merchant Acquiring)

---

## Configuration Files

### manifest.yaml
```yaml
name: business-analyst-work-center
version: 2.0.0
description: Business Analyst Work Center orchestrating domain-specific impact analysis

dependencies:
  subagents:
    - architect-scope-analyst.md
  mcp_servers:
    - atlassian

environment:
  required:
    - ATLASSIAN_URL
    - ATLASSIAN_EMAIL
    - JIRA_MCP_TOKEN
    - ANTHROPIC_API_KEY
```

### config.json
```json
{
  "timeout": 1200,
  "dangerous_mode": true,
  "working_directory": "agents/business-analyst-work-center",
  "mcp_config": "/app/mcp-config.json"
}
```

### .clauderc
```json
{
  "hooks": [
    {
      "event": "PreToolUse",
      "matcher": "Task",
      "command": "node .claude/hooks/inject-subagent-memory.js"
    }
  ]
}
```

---

## Workflow Phases

### Phase 1: IMPACT Analysis
- **Goal:** Identify IN/OUT requirements across all domains
- **Outputs:**
  - Requirements matrices per domain
  - Domain-specific impact analysis
  - Questions and answers for assumptions
  - Czech language documentation

### Phase 2: Comprehensive Analysis
- **Goal:** Consolidate domain requirements into single report
- **Outputs:**
  - Consolidated control record
  - Overall status across sub-agents
  - Cross-domain insights
  - Statistics and metrics

---

## Language Requirements

**CRITICAL:** All JIRA communication MUST be in Czech language

- **Internal Processing:** English (thinking, logic)
- **JIRA Comments:** Czech (grammatically correct, professional)
- **Output Documents:** Czech
- **JIRA Wiki Markup:** Use JIRA syntax (NOT Markdown)

### JIRA Wiki Markup Examples
```
Headers:   h1. Large heading
Formatting: *bold* _italic_ +underline+
Lists:     * Bullet  # Numbered
Tables:    ||Header 1||Header 2||
```

---

## Key Features

### 1. Parallel Sub-agent Execution
- All domain analysts run simultaneously
- Faster processing for multi-domain projects
- Comprehensive coverage of business areas

### 2. Automatic Knowledge Injection
- Pre-hook injects domain expertise before execution
- Consistent context across all sub-agents
- Reduces manual knowledge selection

### 3. JIRA Integration (MCP Tools)
- `mcp__atlassian__get_issue` - Fetch issues
- `mcp__atlassian__search_issues` - JQL searches
- `mcp__atlassian__add_comment` - Post results
- `mcp__atlassian__create_issue` - Create TASKs
- `mcp__atlassian__transition_issue` - Change status
- `mcp__atlassian__download_attachment` - Get files

### 4. Phase Detection Logic
1. Read issue from `VAC_WEBHOOK_CONTEXT`
2. Check JIRA comments for approval keywords
3. Look for: "schváleno", "approved", "OK", "pokračuj"
4. Execute appropriate workflow phase

---

## File Structure

```
business-analyst-work-center/
├── prompt.md                      # Main orchestrator agent
├── config.json                    # Agent configuration (timeout, model)
├── manifest.yaml                  # Agent metadata and dependencies
├── CLAUDE.md                      # Claude Code instructions
├── KNOWLEDGE-INJECTION-USAGE.md   # Knowledge injection documentation
├── setup-new-project.sh          # Automated setup script
├── .clauderc                      # Hook configuration
│
├── agents/                        # Sub-agents directory
│   └── architect-scope-analyst.md # Scope definition specialist
│
├── hooks/                         # Pre-hook scripts
│   └── inject-subagent-memory.js # Knowledge injection hook
│
└── memory/                        # Context injection files
    └── subagents/
        ├── _shared.md            # Common context for all agents
        ├── cpb.md                # Customer/Partner/Branch domain
        ├── bms.md                # Brand/Marketing/Sales domain
        ├── es.md                 # Enterprise Services domain
        ├── its.md                # IT Services domain
        ├── pso.md                # Product/Service/Operations domain
        └── rfc.md                # Risk/Fraud/Compliance domain
```

---

## Testing

### Local Testing
```bash
# Test agent with webhook context
VAC_WEBHOOK_CONTEXT='{"issue_key":"TEST-1"}' \
  uv run python vac.py run business-analyst-work-center
```

### Hook Testing
```bash
# Test pre-hook injection
cd .claude/hooks
./test-hook.sh architect-scope-analyst
```

---

## Migration from v1.x to v2.0.0

### Major Changes
1. **Removed 6 domain-specific sub-agents** (BMS, CPB, ES, ITS, PSO, RFC)
2. **Added single architect-scope-analyst** for systematic scope definition
3. **Added knowledge injection system** with pre-hooks
4. **Added memory-based context** for domain expertise
5. **Enhanced JIRA integration** with comprehensive MCP tools

### What This Means
- Old sub-agents moved from `agents/*.md` to `memory/subagents/*.md`
- Domain knowledge now injected dynamically via pre-hooks
- More flexible architecture with single generalist + memory injection
- Easier to maintain domain knowledge (edit memory files vs agent prompts)

---

## Benefits of Pre-Hook System

### 1. Separation of Concerns
- **Agent Logic:** Lives in `agents/*.md` (workflow, process)
- **Domain Knowledge:** Lives in `memory/subagents/*.md` (expertise, data)
- **Orchestration:** Lives in `prompt.md` (coordination, JIRA)

### 2. Maintainability
- Update domain knowledge without touching agent code
- Add new domains by creating new memory files
- Single agent handles all domains with injected context

### 3. Reusability
- Same architect-scope-analyst works for any domain
- Memory files can be shared across projects
- Setup script enables quick project bootstrapping

### 4. Scalability
- Easy to add new domains (new memory file)
- No need to create new sub-agent per domain
- Reduced code duplication

---

## Environment Variables

### Required
```bash
ATLASSIAN_URL=https://company.atlassian.net
ATLASSIAN_EMAIL=user@company.com
JIRA_MCP_TOKEN=token_value
ANTHROPIC_API_KEY=sk-ant-...
```

### Optional
```bash
VAC_AGENT_TIMEOUT=1200
VAC_ENABLE_COST_TRACKING=true
VAC_DAILY_BUDGET=100
VAC_MONTHLY_BUDGET=3000
VAC_WEBHOOK_CONTEXT='{"issue_key":"PROJ-123"}'
```

---

## Troubleshooting

### Hook Not Triggering
1. Check `.clauderc` exists and is valid JSON
2. Verify hook script is executable: `chmod +x hooks/inject-subagent-memory.js`
3. Test hook manually: `./hooks/test-hook.sh architect-scope-analyst`
4. Check Node.js is installed: `node --version`

### Memory Not Injected
1. Verify memory files exist in `memory/subagents/`
2. Check `subagent_type` matches filename (e.g., `architect-scope-analyst.md`)
3. Ensure `_shared.md` exists for common context
4. Review hook script logs for errors

### JIRA Integration Issues
1. Verify environment variables are set
2. Test MCP tools: `mcp__atlassian__get_issue`
3. Check JIRA permissions for API token
4. Ensure Czech language in JIRA comments

---

## References

- **Container Setup Guide:** `CONTAINER-SETUP.md` ⭐ **Start here for deployment**
- **Knowledge Injection Guide:** `KNOWLEDGE-INJECTION-USAGE.md`
- **Agent Instructions:** `CLAUDE.md`
- **Setup Script:** `setup-new-project.sh` (local dev only)
- **Hook Script:** `hooks/inject-subagent-memory.js`
- **VAC Documentation:** `/Users/agent/dev/VAC/CLAUDE.md`

---

## Changelog

### v2.0.0 (2025-10-17)
- Complete refactor from BPMN agent to Business Analyst Work Center
- Added knowledge injection system with pre-hooks
- Added memory-based domain context
- Integrated architect-scope-analyst sub-agent
- Removed 6 domain-specific sub-agents (moved to memory)
- Added setup automation script
- Enhanced JIRA integration with comprehensive MCP tools

### v1.0.1
- Minor changes to Agent Manifest

### v1.0.0
- Initial release with BPMN generation pipeline

---

**Last Updated:** 2025-10-17
**Maintainer:** VAC BA Pipeline Team
