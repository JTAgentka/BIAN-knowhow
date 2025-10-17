#!/bin/bash

# Test script for subagent memory injection hook
# Usage: ./test-hook.sh [subagent-type]

SUBAGENT_TYPE="${1:-project-analyst}"

echo "Testing hook with subagent type: $SUBAGENT_TYPE"
echo "================================================"
echo ""

# Create test input
TEST_INPUT=$(cat <<EOF
{
  "session_id": "test-session",
  "transcript_path": "/tmp/test-transcript",
  "cwd": "$(pwd)",
  "hook_event_name": "PreToolUse",
  "tool_name": "Task",
  "tool_input": {
    "subagent_type": "$SUBAGENT_TYPE",
    "description": "Test description",
    "prompt": "Test prompt"
  }
}
EOF
)

# Run the hook
echo "$TEST_INPUT" | node .claude/hooks/inject-subagent-memory.js

echo ""
echo "================================================"
echo "Test complete!"
echo ""
echo "If you see JSON output above with 'additionalContext',"
echo "the hook is working correctly and will inject context"
echo "when you invoke the '$SUBAGENT_TYPE' subagent."
echo ""
echo "If there's no output, check that the memory file exists:"
echo "  .claude/memory/subagents/$SUBAGENT_TYPE.md"
