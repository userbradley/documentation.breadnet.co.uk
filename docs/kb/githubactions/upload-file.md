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

      - name: Share file
        uses: actions/upload-artifact@v2
        with:
          name: my-artifact
          path: my-file.txt

      - name: Use file
        run: |
          echo "Here's the content of the shared file:"
          cat ${{ github.workspace }}/my-file.txt
```

This uploads a file to the pipeline run.

See access file between steps: access-file-between-steps.md