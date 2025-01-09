---
title: Lychee Link Checker
---

## What

When managing a documentation site like this, I do my best to prevent broken links and sites from dead linking.

In order to do this I employ a tool called `Lychee` that runs on a daily schedule, as well as on Pull request to scan all
the markdown files and locate broken links

## Setup

You can use this 2 ways from this document

* PR checker
* Daily check

I recommend setting both of them up, that way you're not introducing broken links in PR's

You should also include a file called `.lycheeignore` in the root of your repository where you add URL's and regex that
you expect to fail, or want to ignore

### PR Commenter

This works best with GitHub Actions

Creat a new workflow called `link-checker-pr.yaml` under `.github/workflows/`

```yaml
name: Broken Link Checker PR
on:
  pull_request:
    types:
      - synchronize
      - opened
    paths:
      - docs/** # (1)!
      - .github/workflows/broken-link-checker-pr.yaml
jobs:
  linkChecker:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Check Links
        uses: lycheeverse/lychee-action@v1.8.0
        with:
          args: --verbose --no-progress './**/*.md' './**/*.html' './**/*.rst' --exclude-mail # (2)!
          output: /tmp/out.md
        env:
          GITHUB_TOKEN: ${{secrets.GITHUB_TOKEN}}
      - name: PR comment with Broken Links # (3)!
        if: env.lychee_exit_code != 0
        uses: thollander/actions-comment-pull-request@v2.4.3
        with:
          filePath: /tmp/out.md
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      - name: Comment with no broken links # (4)!
        if: env.lychee_exit_code == 0
        uses: thollander/actions-comment-pull-request@v2
        with:
          message: |
            PR introduces no broken links
```

1. You should change this line to include where the Markdown documents are that you want checked
2. Excludes email address
3. Comments on the PR a report of broken links. If none are found this step is skipped
4. If no broken links the bot will comment on your PR that none were found

### Daily job

The below should be put in to a file called `broken-link-checker.yaml` in the `.github/workflows` directory

```yaml
name: Broken Link Checker
on:
  workflow_dispatch: # (1)!
  schedule:
    - cron: "00 18 * * *" # (2)!
jobs:
  linkChecker:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Check Links
        uses: lycheeverse/lychee-action@v1.8.0
        with:
          args: --verbose --no-progress './**/*.md' './**/*.html' './**/*.rst' --exclude-mail
        env:
          GITHUB_TOKEN: ${{secrets.GITHUB_TOKEN}}
      - name: Create Issue From File # (3)!
        uses: peter-evans/create-issue-from-file@v4.0.1
        with:
          title: Link Checker Report
          content-filepath: ./lychee/out.md
          labels: Broken Link
```

1. Runs the workflow on its own
2. Runs at 1800 every day, don't ask me what timezone its using.
3. If there are broken links found, create an issue with them

## Examples

### Issue

* documentation.breadnet.co.uk!219

### Workflows

* [runs/7331735623](https://github.com/userbradley/documentation.breadnet.co.uk/actions/runs/7331735623)
