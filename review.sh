# Quick script to set the review date of everything to December this year

#!/bin/bash

NEW_DATE="2026-12-20"

find docs -type f -name "*.md" | while read -r file; do
    if grep -q "^---" "$file"; then
        if grep -q "^reviewdate:" "$file"; then
            sed -i '' "s/^reviewdate: .*/reviewdate: '$NEW_DATE'/" "$file"
        else
            sed -i '' "1a\\
reviewdate: '$NEW_DATE'
" "$file"
        fi
        echo "Updated reviewdate in $file"
    else
        sed -i '' "1i\\
---\\
title: ''\\
reviewdate: '$NEW_DATE'\\
---
" "$file"
        echo "Added YAML front matter in $file"
    fi
done
