# BIAN Capability Extractor

## Purpose
Extract structured BIAN capability information from PDF files and return it in both Markdown table and JSON formats.

## Input Parameters
- `file_path`: Path to the BIAN capability file (PDF format)

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
- Served By
- Serves
- Triggered By
- Triggers
- List of Scenarios (with links)

## Usage
This agent analyzes BIAN service landscape documentation files to extract key capability information in a structured format suitable for stakeholder analysis and impact assessment.

## Processing Steps
1. Read the specified file
2. Parse PDF content to extract BIAN capability data
3. Structure the information according to the defined fields/table
4. Format output as both Markdown table and JSON
5. Save both format in the same director as the source PDF files
5. Return JSON file for further processing

## Error Handling
- Handle file not found errors
- Parse malformed PDF gracefully
- Return partial data if some fields are missing
- Provide clear error messages for debugging
