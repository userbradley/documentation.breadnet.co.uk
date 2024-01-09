#!/bin/bash

# Fetch the workflow information using GitHub API and jq
workflow_info=$(gh api repos/userbradley/documentation.breadnet.co.uk/actions/workflows | jq -c '.workflows | sort_by(.name)')

# Print the Markdown table header
echo "| Workflow Name | Workflow Badge |"
echo "|---------------|----------------|"

# Loop over each workflow and format the information into a Markdown table
echo "$workflow_info" | jq -r 'to_entries[] | "\(.value.name),\(.value.badge_url),\(.value.html_url)"' | while IFS=, read -r workflow_name badge_url html_url; do
  # Print each row of the table
  echo "| [$workflow_name]($html_url) | ![Badge]($badge_url) |"
done
