---
title: ''
reviewdate: '2026-12-20'
---
```yaml
name: Share File Workflow
on: [push]

jobs:
  share-file-job:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Create file
        run: echo "Hello, world!" > my-file.txt
          cat ${{ github.workspace }}/my-file.txt
```
