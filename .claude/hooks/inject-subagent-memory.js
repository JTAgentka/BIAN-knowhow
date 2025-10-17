#!/usr/bin/env node

/**
 * PreToolUse Hook: Inject Memory Based on Subagent Type
 *
 * This hook intercepts Task tool calls and injects specific memory/context
 * files based on the subagent_type parameter.
 */

const fs = require('fs');
const path = require('path');

// Read the hook input from stdin
const input = JSON.parse(fs.readFileSync(0, 'utf-8'));

// Only process Task tool calls
if (input.tool_name !== 'Task') {
  process.exit(0);
}

const subagentType = input.tool_input?.subagent_type;

if (!subagentType) {
  // No subagent type specified, nothing to inject
  process.exit(0);
}

// Define memory file mappings
const memoryDir = path.join(input.cwd, '.claude', 'memory', 'subagents');
const memoryFile = path.join(memoryDir, `${subagentType}.md`);

// Also check for a common/shared memory file
const sharedMemoryFile = path.join(memoryDir, '_shared.md');

let contextParts = [];

// Load shared memory if it exists
if (fs.existsSync(sharedMemoryFile)) {
  try {
    const sharedContext = fs.readFileSync(sharedMemoryFile, 'utf-8');
    contextParts.push('# Shared Context\n' + sharedContext);
  } catch (err) {
    // Silently fail if we can't read the file
  }
}

// Load subagent-specific memory if it exists
if (fs.existsSync(memoryFile)) {
  try {
    const specificContext = fs.readFileSync(memoryFile, 'utf-8');
    contextParts.push(`# Context for ${subagentType}\n` + specificContext);
  } catch (err) {
    // Silently fail if we can't read the file
  }
}

// If we have context to inject, output it
if (contextParts.length > 0) {
  const output = {
    hookSpecificOutput: {
      hookEventName: "PreToolUse",
      additionalContext: contextParts.join('\n\n---\n\n')
    }
  };

  console.log(JSON.stringify(output, null, 2));
}

// Exit successfully
process.exit(0);
