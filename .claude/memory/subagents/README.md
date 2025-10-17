# Subagent Memory Injection System

This system automatically injects context and memory into subagents based on their type using PreToolUse hooks.

## How It Works

When you invoke a subagent using the Task tool, the PreToolUse hook intercepts the call and:

1. Reads the `subagent_type` parameter
2. Loads the corresponding memory file from `.claude/memory/subagents/`
3. Also loads shared context from `_shared.md`
4. Injects this context into the subagent before it starts

This ensures every subagent has the right context without manually including it in each prompt.

## Directory Structure

```
.claude/
├── hooks/
│   └── inject-subagent-memory.js      # Hook script
└── memory/
    └── subagents/
        ├── _shared.md                  # Shared context for all subagents
        ├── project-analyst.md          # Context for project-analyst
        ├── project-designer.md         # Context for project-designer
        ├── CPB-impact-analyst.md       # Context for CPB domain
        ├── ITS-impact-analyst.md       # Context for ITS domain
        └── ...                         # Add more as needed

.clauderc                                # Hook configuration
```

## Usage

### 1. Adding Context for a New Subagent Type

Create a new file named after the subagent type:

```bash
touch .claude/memory/subagents/my-custom-agent.md
```

Add your context in markdown:

```markdown
# Context for my-custom-agent

## Role
Description of the agent's role...

## Key Responsibilities
- Responsibility 1
- Responsibility 2

## Guidelines
...
```

### 2. Updating Shared Context

Edit `.claude/memory/subagents/_shared.md` to add context that ALL subagents should receive:

```bash
# Edit shared context
vi .claude/memory/subagents/_shared.md
```

### 3. Testing the Hook

You can test the hook manually by simulating the input:

```bash
echo '{
  "session_id": "test",
  "transcript_path": "/tmp/test",
  "cwd": "'$(pwd)'",
  "hook_event_name": "PreToolUse",
  "tool_name": "Task",
  "tool_input": {
    "subagent_type": "project-analyst",
    "description": "Test",
    "prompt": "Test prompt"
  }
}' | node .claude/hooks/inject-subagent-memory.js
```

This should output the context that would be injected.

### 4. Disabling the Hook

To temporarily disable the hook, edit `.clauderc` and comment out or remove the hook configuration:

```json
{
  "hooks": [
    // {
    //   "event": "PreToolUse",
    //   "matcher": "Task",
    //   "command": "node .claude/hooks/inject-subagent-memory.js"
    // }
  ]
}
```

## Memory File Best Practices

### Structure Your Context

Use clear sections:

```markdown
# Context for [agent-name]

## Role
Clear description of the agent's purpose

## Key Responsibilities
Bulleted list of what the agent does

## Guidelines
How the agent should operate

## Output Format
Expected deliverables and structure

## Domain Knowledge
Specific domain information
```

### Keep It Focused

- Only include information relevant to that specific subagent type
- Avoid duplicating information that's already in `_shared.md`
- Keep files under 2000 lines for optimal performance

### Use Markdown Features

- **Headings**: Organize content hierarchically
- **Lists**: Break down complex information
- **Code blocks**: Include examples where helpful
- **Tables**: Structure comparison data

## Available Subagent Types

Current memory files are configured for:

- `project-analyst`: BIAN capability impact analysis
- `project-designer`: Design documentation and impact analysis
- `CPB-impact-analyst`: Customer Distribution domain (Customer, Channel, Interaction, Partner Management)
- `ITS-impact-analyst`: IT Systems domain (Deployment, Operations, Security, Infrastructure)
- `project-documenter`: Final documentation and review
- `BMS-impact-analyst`: Marketing and Sales domain
- `ES-impact-analyst`: Legal Support domain
- `PSO-impact-analyst`: Financial services domain
- `RFC-impact-analyst`: Risk and Compliance domain

Add more by creating `[subagent-type].md` files.

## Troubleshooting

### Hook Not Running

1. Verify `.clauderc` is valid JSON
2. Check hook script is executable: `chmod +x .claude/hooks/inject-subagent-memory.js`
3. Test hook manually (see Testing section above)

### Context Not Being Injected

1. Verify the memory file exists and matches the subagent type exactly
2. Check file permissions: `ls -la .claude/memory/subagents/`
3. Look for syntax errors in the memory markdown files

### Too Much Context

If context is too large:
1. Move general information to `_shared.md`
2. Split large files into more specific subagent types
3. Remove unnecessary details

## Advanced Usage

### Conditional Context

You can modify the hook script to inject different context based on other parameters:

```javascript
// In inject-subagent-memory.js
const description = input.tool_input?.description || '';

// Different context based on description keywords
if (description.includes('security')) {
  // Load security-specific context
}
```

### Multiple Memory Directories

Organize by project phase, domain, or other criteria:

```javascript
const phase = process.env.PROJECT_PHASE || 'development';
const memoryDir = path.join(input.cwd, '.claude', 'memory', phase, 'subagents');
```

### Logging

Add logging to track what context is being injected:

```javascript
const logFile = path.join(input.cwd, '.claude', 'logs', 'hook.log');
fs.appendFileSync(logFile, `Injected context for ${subagentType}\n`);
```

## Examples

### Example 1: Invoking CPB Impact Analyst

When you run:
```
Use the CPB-impact-analyst to analyze customer onboarding impacts
```

The hook automatically injects:
- Shared context from `_shared.md`
- CPB-specific context from `CPB-impact-analyst.md`

### Example 2: Creating a New Domain Analyst

1. Create memory file:
```bash
cat > .claude/memory/subagents/payments-analyst.md << 'EOF'
# Context for payments-analyst

## Domain Focus
Payment processing, clearing, and settlement

## Key Areas
- Payment initiation and authorization
- Payment routing and clearing
- Settlement and reconciliation
- Failed payment handling
EOF
```

2. Invoke the agent:
```
Use the payments-analyst to review payment flow changes
```

The context is automatically injected!

## Contributing

When adding new subagent types:
1. Create the memory file with clear structure
2. Add it to the "Available Subagent Types" section above
3. Test the injection with the manual test command
4. Document any special considerations

## References

- [Claude Code Hooks Documentation](https://docs.claude.com/en/docs/claude-code/hooks.md)
- [Claude Code Subagents Guide](https://docs.claude.com/en/docs/claude-code/sub-agents.md)
