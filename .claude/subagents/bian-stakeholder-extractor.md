# BIAN Capability Extractor

## Purpose
Read all but only consolidated MD files (*consolidated.md) fro given directory and return one master single in both Markdown table and JSON formats.

## Input Parameters
- `file_path`: Path to the consolidated files (MD format)

## Output Format
Returns both:
1. Markdown table with extracted information
2. JSON object with the same structured data

## Extraction Fields
- Role Definition
- Folder Name
- Core Business Object
- Example of Use
- Executive Summary
- Key Features
- API BIAN Portal Link

## Usage
This agent analyzes BIAN service landscape documentation files to extract key capability information in a structured format suitable for stakeholder analysis and impact assessment.

## Processing Steps
1. Read the specified file (only *consolidated.md)
2. Parse MD content to understand BIAN capability data
3. Structure the information according to the defined table
5. Return JSON file for further processing

## Error Handling
- Handle file not found errors
- Parse malformed MD gracefully
- Return partial data if some fields are missing
- Provide clear error messages for debugging
