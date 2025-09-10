# Extract BIAN Capabilities

## Description
Extracts structured BIAN capability information from all PDF files in a specified directory and sub-directory using the BIAN capability extractor sub-agent, then saves the results in both Markdown and JSON formats.

## Usage
```
/extract-bian-capabilities <directory_path>
```

## Parameters
- `directory_path`: Path to the directory containing sub-directories with PDF files (relative to project root)

## Example
```
/extract-bian-capabilities business_capabilities/Enterprise Enabling/
/extract-bian-capabilities business_capabilities/Core Banking/
```

## What it does
1. Repeat for each sub-directory: Finds all PDF files in each sub-directory (remember the name of sub-directory)
2. Processes each PDF file in parallel using the BIAN capability extractor sub-agent and handover to each sub-agent one PDF file found in this sub-directory
3. Wait for each sub-agent to finish its job and return back JSON file
4. Consolidate all JSON files into one structured overview table for current sub-directory
5. create overview output file in following structure and store to given directory (NOT TO PDFS FILES SUB-DIRECTORY) 
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
5. Loop until all sub-directories are processed.

## Output
- Creates `.md` files with structured Markdown tables
- Creates `.json` files with structured JSON objects
- Files are saved in the same directory as specified at the input
- Uses descriptive filenames based on the extracted sub-directories names

## Notes
- Uses the `@.claude/subagents/bian-capability-extractor.md` sub-agent
- Processes files in parallel for efficiency
- Handles partial data gracefully if some BIAN fields are missing
- Provides error handling for malformed or incomplete files
