# Portable Subagent Memory Injection System

This document describes how to take this memory injection system to other projects.

## Minimum Required Files

Copy these files to use the system in any project:

```
📦 Portable Package
├── .clauderc                                    # Hook configuration
├── .claude/
│   ├── hooks/
│   │   ├── inject-subagent-memory.js          # Core hook script (no edits needed)
│   │   └── test-hook.sh                       # Test utility (optional)
│   └── memory/
│       └── subagents/
│           ├── README.md                       # Documentation (optional)
│           ├── _shared.md                      # Edit for new project ⚠️
│           └── [domain-specific].md            # Copy if relevant
```

## Automatic Setup Script

Run this from the current project:

```bash
./.claude/hooks/setup-new-project.sh /path/to/new/project
```

This will:
- ✅ Create directory structure
- ✅ Copy hook script and test utility
- ✅ Set up .clauderc configuration
- ✅ Create template _shared.md
- ✅ Optionally copy domain-specific files

## Manual Setup

### Step 1: Create Structure

```bash
cd /path/to/new/project
mkdir -p .claude/hooks
mkdir -p .claude/memory/subagents
```

### Step 2: Copy Hook Script

```bash
# Copy from this project
cp /path/to/BIAN-knowhow/.claude/hooks/inject-subagent-memory.js \
   .claude/hooks/

chmod +x .claude/hooks/inject-subagent-memory.js
```

### Step 3: Configure .clauderc

Create or edit `.clauderc`:

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

### Step 4: Create _shared.md

Edit `.claude/memory/subagents/_shared.md` with project-specific context:

```markdown
# Shared Context for All Subagents

## Project Overview
[Your project description]

## General Guidelines
- [Your guidelines]

## Project Structure
- [Your structure]
```

### Step 5: Add Subagent Memory Files

Create files for your subagent types:

```bash
# Example
touch .claude/memory/subagents/project-analyst.md
touch .claude/memory/subagents/code-reviewer.md
```

## What's Reusable vs Project-Specific

### 100% Portable (No Changes Needed)
- ✅ `inject-subagent-memory.js` - Core hook logic
- ✅ `test-hook.sh` - Testing utility
- ✅ `README.md` - Documentation

### Must Customize
- ⚠️ `_shared.md` - Project-specific context
- ⚠️ `.clauderc` - May need to merge with existing config

### Conditionally Reusable
- 🔄 Domain-specific memory files (e.g., `project-analyst.md`)
  - Copy if working in same domain (BIAN banking)
  - Create new ones for different domains

## Domain-Specific Files Available

These are BIAN banking-specific but can serve as templates:

```
.claude/memory/subagents/
├── project-analyst.md          # BIAN capability impact analyst
├── project-designer.md         # Business analysis and design
├── CPB-impact-analyst.md       # Customer Distribution domain
├── ITS-impact-analyst.md       # IT Systems domain
└── project-documenter.md       # Documentation specialist
```

## Testing in New Project

```bash
cd /path/to/new/project

# Test with a subagent type
./.claude/hooks/test-hook.sh project-analyst

# You should see JSON output with injected context
```

## Example: Setting Up for Different Domain

### E-commerce Project

```bash
# Create memory files
cat > .claude/memory/subagents/product-manager.md << 'EOF'
# Context for product-manager

## Role
Product management for e-commerce platform

## Key Responsibilities
- Product roadmap planning
- Feature prioritization
- Market analysis
EOF

cat > .claude/memory/subagents/backend-engineer.md << 'EOF'
# Context for backend-engineer

## Role
Backend development for e-commerce services

## Tech Stack
- Node.js, PostgreSQL, Redis
- Microservices architecture
EOF
```

### DevOps Project

```bash
# Create memory files
cat > .claude/memory/subagents/infrastructure-engineer.md << 'EOF'
# Context for infrastructure-engineer

## Role
Cloud infrastructure and deployment automation

## Platforms
- AWS (ECS, RDS, CloudFront)
- Terraform, Kubernetes
EOF
```

## Sharing Across Teams

To share with team members:

### Option 1: Git Repository
Commit to version control:

```bash
git add .claude/ .clauderc
git commit -m "Add subagent memory injection system"
```

### Option 2: Tarball Package

```bash
tar czf subagent-memory-system.tar.gz \
  .clauderc \
  .claude/hooks/ \
  .claude/memory/subagents/
```

Team members extract in their project:

```bash
cd /their/project
tar xzf subagent-memory-system.tar.gz
```

### Option 3: Template Repository

Create a template repo with:
- The hook system pre-configured
- Generic memory templates
- Documentation

Team members clone and customize.

## Troubleshooting in New Project

### Hook Not Running

```bash
# Check Node.js is available
node --version

# Check script is executable
ls -la .claude/hooks/inject-subagent-memory.js

# Test manually
echo '{"tool_name":"Task","tool_input":{"subagent_type":"test"},"cwd":"'$(pwd)'"}' | \
  node .claude/hooks/inject-subagent-memory.js
```

### Context Not Injecting

```bash
# Verify files exist
ls -la .claude/memory/subagents/

# Check file names match subagent_type exactly
# Example: subagent_type="project-analyst" needs project-analyst.md
```

### Path Issues

The hook script uses relative paths from `input.cwd`, so it should work in any project as long as:
- `.claude/memory/subagents/` exists
- Memory files are properly named

## Advanced: Cross-Project Shared Memory

To share memory files across multiple projects:

### Symlink Approach

```bash
# Create shared memory repo
mkdir ~/shared-subagent-memory
cp .claude/memory/subagents/*.md ~/shared-subagent-memory/

# In each project, symlink to shared files
cd /project-1
ln -s ~/shared-subagent-memory/* .claude/memory/subagents/

cd /project-2
ln -s ~/shared-subagent-memory/* .claude/memory/subagents/
```

### Environment Variable Approach

Modify the hook script to check an env var:

```javascript
// In inject-subagent-memory.js
const sharedMemoryDir = process.env.SHARED_SUBAGENT_MEMORY ||
                        path.join(input.cwd, '.claude', 'memory', 'subagents');
```

Then set in shell:

```bash
export SHARED_SUBAGENT_MEMORY=~/shared-subagent-memory
```

## Summary Checklist

When moving to a new project:

- [ ] Copy `inject-subagent-memory.js` to `.claude/hooks/`
- [ ] Add hook configuration to `.clauderc`
- [ ] Create `.claude/memory/subagents/` directory
- [ ] Create/customize `_shared.md` for new project
- [ ] Copy or create domain-specific memory files
- [ ] Test with `.claude/hooks/test-hook.sh`
- [ ] Commit to version control if desired

## File Size Reference

The entire portable system is very lightweight:

```
inject-subagent-memory.js: ~2 KB
test-hook.sh:              ~1 KB
README.md:                 ~8 KB
_shared.md:                ~1 KB (template)
domain-specific files:     ~2-5 KB each

Total: ~15-30 KB for complete system
```

This makes it easy to include in any project without bloat.
