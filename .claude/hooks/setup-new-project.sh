#!/bin/bash
# Setup Subagent Memory Injection System for New Project
# Usage: ./setup-new-project.sh /path/to/new/project

NEW_PROJECT="$1"

if [ -z "$NEW_PROJECT" ]; then
  echo "Usage: $0 /path/to/new/project"
  exit 1
fi

if [ ! -d "$NEW_PROJECT" ]; then
  echo "Error: Directory $NEW_PROJECT does not exist"
  exit 1
fi

echo "Setting up subagent memory injection system in: $NEW_PROJECT"
echo "================================================================"

# Create directory structure
echo "Creating directory structure..."
mkdir -p "$NEW_PROJECT/.claude/hooks"
mkdir -p "$NEW_PROJECT/.claude/memory/subagents"

# Copy hook script
echo "Copying hook script..."
cp .claude/hooks/inject-subagent-memory.js "$NEW_PROJECT/.claude/hooks/"
chmod +x "$NEW_PROJECT/.claude/hooks/inject-subagent-memory.js"

# Copy test script
echo "Copying test script..."
cp .claude/hooks/test-hook.sh "$NEW_PROJECT/.claude/hooks/"
chmod +x "$NEW_PROJECT/.claude/hooks/test-hook.sh"

# Copy or create .clauderc
echo "Setting up .clauderc..."
if [ -f "$NEW_PROJECT/.clauderc" ]; then
  echo "  .clauderc already exists - you need to manually add the hook configuration"
  echo "  Add this to your .clauderc:"
  echo '  {'
  echo '    "hooks": ['
  echo '      {'
  echo '        "event": "PreToolUse",'
  echo '        "matcher": "Task",'
  echo '        "command": "node .claude/hooks/inject-subagent-memory.js"'
  echo '      }'
  echo '    ]'
  echo '  }'
else
  cat > "$NEW_PROJECT/.clauderc" << 'EOF'
{
  "hooks": [
    {
      "event": "PreToolUse",
      "matcher": "Task",
      "command": "node .claude/hooks/inject-subagent-memory.js"
    }
  ]
}
EOF
  echo "  Created new .clauderc with hook configuration"
fi

# Copy README
echo "Copying documentation..."
cp .claude/memory/subagents/README.md "$NEW_PROJECT/.claude/memory/subagents/"

# Create template _shared.md
echo "Creating template _shared.md..."
cat > "$NEW_PROJECT/.claude/memory/subagents/_shared.md" << 'EOF'
# Shared Context for All Subagents

## Project Overview
[TODO: Describe your project here]

## General Guidelines
- [TODO: Add project-specific guidelines]
- [TODO: Add coding standards or conventions]
- [TODO: Add team practices]

## Project Structure
- [TODO: Describe directory structure]
- [TODO: Document key modules or components]
- [TODO: Note any special organization]

## Communication Style
- Be concise and professional
- Use structured formats where appropriate
- Highlight important considerations
EOF

# Ask about copying domain-specific files
echo ""
echo "Do you want to copy domain-specific memory files? (y/n)"
echo "  - project-analyst.md"
echo "  - project-designer.md"
echo "  - CPB-impact-analyst.md"
echo "  - ITS-impact-analyst.md"
read -r COPY_DOMAINS

if [ "$COPY_DOMAINS" = "y" ] || [ "$COPY_DOMAINS" = "Y" ]; then
  echo "Copying domain-specific memory files..."
  for file in project-analyst.md project-designer.md CPB-impact-analyst.md ITS-impact-analyst.md; do
    if [ -f ".claude/memory/subagents/$file" ]; then
      cp ".claude/memory/subagents/$file" "$NEW_PROJECT/.claude/memory/subagents/"
      echo "  Copied $file"
    fi
  done
else
  echo "Skipping domain-specific files - you can add your own later"
fi

echo ""
echo "================================================================"
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "1. Edit $NEW_PROJECT/.claude/memory/subagents/_shared.md with your project details"
echo "2. Add or customize subagent memory files in $NEW_PROJECT/.claude/memory/subagents/"
echo "3. Test the setup:"
echo "   cd $NEW_PROJECT"
echo "   ./.claude/hooks/test-hook.sh [subagent-type]"
echo ""
echo "For more information, see:"
echo "  $NEW_PROJECT/.claude/memory/subagents/README.md"
