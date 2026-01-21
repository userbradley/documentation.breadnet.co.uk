---
reviewdate: '2026-12-20'
title: Skipping package due to invalid metadata entry
---

This can happen (usually on a mac) after running `brew upgrade`

## Example of error

```text
WARNING: Skipping /opt/homebrew/lib/python3.11/site-packages/numpy-1.26.3.dist-info due to invalid metadata entry 'name'
WARNING: Skipping /opt/homebrew/lib/python3.11/site-packages/PyYAML-6.0.1.dist-info due to invalid metadata entry 'name'
WARNING: Skipping /opt/homebrew/lib/python3.11/site-packages/Markdown-3.5.2.dist-info due to invalid metadata entry 'name'
WARNING: Skipping /opt/homebrew/lib/python3.11/site-packages/pathspec-0.12.1.dist-info due to invalid metadata entry 'name'
WARNING: Skipping /opt/homebrew/lib/python3.11/site-packages/tabulate-0.0.0.dist-info due to invalid metadata entry 'name'
Installing collected packages: mkdocs-material
WARNING: Skipping /opt/homebrew/lib/python3.11/site-packages/numpy-1.26.3.dist-info due to invalid metadata entry 'name'
WARNING: Skipping /opt/homebrew/lib/python3.11/site-packages/PyYAML-6.0.1.dist-info due to invalid metadata entry 'name'
WARNING: Skipping /opt/homebrew/lib/python3.11/site-packages/Markdown-3.5.2.dist-info due to invalid metadata entry 'name'
WARNING: Skipping /opt/homebrew/lib/python3.11/site-packages/pathspec-0.12.1.dist-info due to invalid metadata entry 'name'
Successfully installed mkdocs-material-9.5.6
WARNING: Skipping /opt/homebrew/lib/python3.11/site-packages/numpy-1.26.3.dist-info due to invalid metadata entry 'name'
WARNING: Skipping /opt/homebrew/lib/python3.11/site-packages/PyYAML-6.0.1.dist-info due to invalid metadata entry 'name'
WARNING: Skipping /opt/homebrew/lib/python3.11/site-packages/numpy-1.26.3.dist-info due to invalid metadata entry 'name'
WARNING: Skipping /opt/homebrew/lib/python3.11/site-packages/PyYAML-6.0.1.dist-info due to invalid metadata entry 'name'
WARNING: Skipping /opt/homebrew/lib/python3.11/site-packages/Markdown-3.5.2.dist-info due to invalid metadata entry 'name'
WARNING: Skipping /opt/homebrew/lib/python3.11/site-packages/pathspec-0.12.1.dist-info due to invalid metadata entry 'name'
WARNING: Skipping /opt/homebrew/lib/python3.11/site-packages/numpy-1.26.3.dist-info due to invalid metadata entry 'name'
WARNING: Skipping /opt/homebrew/lib/python3.11/site-packages/PyYAML-6.0.1.dist-info due to invalid metadata entry 'name'
WARNING: Skipping /opt/homebrew/lib/python3.11/site-packages/Markdown-3.5.2.dist-info due to invalid metadata entry 'name'
WARNING: Skipping /opt/homebrew/lib/python3.11/site-packages/pathspec-0.12.1.dist-info due to invalid metadata entry 'name'
```

## Solution

```shell
find /opt/homebrew/lib/python3.11/site-packages -empty -type d -delete
```
