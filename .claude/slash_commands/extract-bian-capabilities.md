# Extract BIAN Capabilities

## Description
Extracts structured BIAN capability information from all MHTML files in a specified directory using the BIAN capability extractor sub-agent, then saves the results in both Markdown and JSON formats.

## Usage
```
/extract-bian-capabilities <directory_path>
```

## Parameters
- `directory_path`: Path to the directory containing MHTML files (relative to project root)

## Example
```
/extract-bian-capabilities business_capabilities/Enterprise Enabling/
/extract-bian-capabilities business_capabilities/Core Banking/
```

## What it does
1. Finds all MHTML files in the specified directory (including subdirectories)
2. Processes each MHTML file in parallel using the BIAN capability extractor sub-agent
3. Extracts structured BIAN capability data including:
   - Capability Name
   - Folder name
   - Core Business Object
   - Role Definition
   - Example of Use
   - Executive Summary  
   - Key Features
   - API BIAN Portal Link
   - Service relationships (Served By, Serves, Triggered By, Triggers)
   - List of Scenarios with links
4. Consolidate all returned JSON file into single table
5. Creates organized output files in the same directory as handovered

## Output
- Creates `.md` files with structured Markdown tables
- Creates `.json` files with structured JSON objects
- Files are saved in the same directory as specified at the input
- Uses descriptive filenames based on the extracted capability names

## Notes
- Uses the `@.claude/subagents/bian-capability-extractor.md` sub-agent
- Processes files in parallel for efficiency
- Handles partial data gracefully if some BIAN fields are missing
- Provides error handling for malformed or incomplete files
