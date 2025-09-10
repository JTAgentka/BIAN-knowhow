#!/usr/bin/env node

/**
 * BIAN Capability Extractor Slash Command
 * Extracts structured BIAN capability information from MHTML files
 */

const fs = require('fs');
const path = require('path');

function extractBianCapabilities(directoryPath) {
  if (!directoryPath) {
    console.error('Error: Directory path is required');
    console.log('Usage: /extract-bian-capabilities <directory_path>');
    process.exit(1);
  }

  const fullPath = path.resolve(directoryPath);
  
  if (!fs.existsSync(fullPath)) {
    console.error(`Error: Directory does not exist: ${directoryPath}`);
    process.exit(1);
  }

  console.log(`🔍 Extracting BIAN capabilities from: ${directoryPath}`);
  
  // This will be executed by Claude Code using the available tools
  const extractionPlan = `
## BIAN Capability Extraction Plan

### Step 1: Find all MHTML files
- Search directory: ${directoryPath}
- Look for files with .mhtml extension
- Include subdirectories

### Step 2: Process files in parallel
- Use BIAN capability extractor sub-agent: @.claude/subagents/bian-capability-extractor.md
- Extract structured data from each file:
  - Role Definition
  - Example of Use
  - Executive Summary
  - Key Features
  - API BIAN Portal Link
  - Served By / Serves relationships
  - Triggered By / Triggers relationships
  - List of Scenarios with links

### Step 3: Save results
- Create Markdown files with structured tables
- Create JSON files with structured objects
- Save in same directory structure as source files
- Use descriptive filenames based on capability names

### Execution Command for Claude Code:
Use TodoWrite to track progress, then:
1. Glob pattern: ${directoryPath}/**/*.mhtml
2. Task tool with bian-capability-extractor for each file
3. Write tool to save .md and .json files
`;

  console.log(extractionPlan);
  console.log('\n✅ Execution plan ready for Claude Code');
}

// Get command line arguments
const args = process.argv.slice(2);
const directoryPath = args[0];

extractBianCapabilities(directoryPath);