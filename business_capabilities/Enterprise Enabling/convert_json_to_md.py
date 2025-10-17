#!/usr/bin/env python3
import json
import os
from pathlib import Path

def create_markdown_content(capability_data, folder_name):
    """Create markdown content from capability data"""

    capability_name = capability_data.get('capability_name', 'Unknown')
    role_definition = capability_data.get('role_definition', '')

    # Start with the header
    md_content = f"### {capability_name} Domain Expertise\n"
    md_content += "You have mastery-level understanding in following business and IT aspect of this capability. Your expertise is limited only to provided information below:\n\n"

    md_content += f"### {folder_name} with its business and IT definition expertise:\n\n"

    md_content += f"#### {capability_name} ({folder_name}) - {role_definition}\n\n"

    # Add Executive Summary
    if 'executive_summary' in capability_data:
        md_content += f"**Executive Summary:** {capability_data['executive_summary']}\n\n"

    # Add Core Business Object
    if 'core_business_object' in capability_data:
        md_content += f"**Core Business Object:** {capability_data['core_business_object']}\n\n"

    # Add Key Features
    if 'key_features' in capability_data and capability_data['key_features']:
        md_content += "**Key Features:**\n"
        for feature in capability_data['key_features']:
            md_content += f"- {feature}\n"
        md_content += "\n"

    # Add Example of Use
    if 'example_of_use' in capability_data:
        md_content += f"**Example of Use:** {capability_data['example_of_use']}\n\n"

    # Add API Link
    if 'api_bian_portal_link' in capability_data:
        md_content += f"**API BIAN Portal Link:** {capability_data['api_bian_portal_link']}\n\n"

    # Add Served By
    if 'served_by' in capability_data and capability_data['served_by']:
        md_content += "**Served By:**\n"
        for service in capability_data['served_by']:
            md_content += f"- {service}\n"
        md_content += "\n"

    # Add Serves
    if 'serves' in capability_data and capability_data['serves']:
        md_content += "**Serves:**\n"
        for service in capability_data['serves']:
            md_content += f"- {service}\n"
        md_content += "\n"

    # Add Triggered By
    if 'triggered_by' in capability_data and capability_data['triggered_by']:
        md_content += "**Triggered By:**\n"
        for trigger in capability_data['triggered_by']:
            md_content += f"- {trigger}\n"
        md_content += "\n"

    # Add Triggers
    if 'triggers' in capability_data and capability_data['triggers']:
        md_content += "**Triggers:**\n"
        for trigger in capability_data['triggers']:
            md_content += f"- {trigger}\n"
        md_content += "\n"

    # Add Scenarios
    if 'scenarios' in capability_data and capability_data['scenarios']:
        md_content += "**Scenarios:**\n"
        for scenario in capability_data['scenarios']:
            scenario_name = scenario.get('name', 'Unknown')
            scenario_link = scenario.get('link', '')
            md_content += f"- {scenario_name} ({scenario_link})\n"
        md_content += "\n"

    # Add Additional Info
    if 'additional_info' in capability_data:
        additional_info = capability_data['additional_info']
        md_content += "**Additional Information:**\n"

        if 'bian_lifecycle_registration_status' in additional_info:
            md_content += f"- BIAN Lifecycle Registration Status: {additional_info['bian_lifecycle_registration_status']}\n"

        if 'service_role' in additional_info:
            md_content += f"- Service Role: {additional_info['service_role']}\n"

        if 'individual_analytics' in additional_info and additional_info['individual_analytics']:
            md_content += "- Individual Analytics:\n"
            for analytic in additional_info['individual_analytics']:
                md_content += f"  - {analytic}\n"

        if 'portfolio_analytics' in additional_info and additional_info['portfolio_analytics']:
            md_content += "- Portfolio Analytics:\n"
            for analytic in additional_info['portfolio_analytics']:
                md_content += f"  - {analytic}\n"

        md_content += "\n"

    return md_content

def process_json_files(base_path):
    """Process all JSON files in the directory"""

    # Find all _extracted.json files
    json_files = list(Path(base_path).rglob("*_extracted.json"))

    print(f"Found {len(json_files)} JSON files to process")

    for json_file in json_files:
        print(f"\nProcessing: {json_file}")

        # Read JSON file
        with open(json_file, 'r', encoding='utf-8') as f:
            capability_data = json.load(f)

        # Get the file name without _extracted.json
        file_name = json_file.stem.replace('_extracted', '')

        # Get folder name from the JSON data
        folder_name = capability_data.get('folder_name', 'Unknown')
        capability_name = capability_data.get('capability_name', file_name)

        # Create folder in current directory if it doesn't exist
        folder_path = Path(base_path) / file_name
        folder_path.mkdir(exist_ok=True)
        print(f"  Created/verified folder: {folder_path}")

        # Create markdown file
        md_filename = f"{capability_name}.md"
        md_filepath = folder_path / md_filename

        # Generate markdown content
        md_content = create_markdown_content(capability_data, folder_name)

        # Write markdown file
        with open(md_filepath, 'w', encoding='utf-8') as f:
            f.write(md_content)

        print(f"  Created markdown file: {md_filepath}")

if __name__ == "__main__":
    base_path = Path(__file__).parent
    process_json_files(base_path)
    print("\n✓ All files processed successfully!")
