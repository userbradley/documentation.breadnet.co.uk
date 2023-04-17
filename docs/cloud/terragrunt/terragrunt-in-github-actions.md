---
title: Terragrunt in GitHub Actions
---

## Why

Using terragrunt allows you to realy keep all envs the same, and code DRY

## How

```yaml
      - name: Install Terraform
        uses: hashicorp/setup-terraform@v2
        with:
          terraform_version: ${{ env.TF_VERSION }}


      - name: Setup Terragrunt
        run: |
          mkdir bin
          wget -O bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/$TERRAGRUNT_VERSION/terragrunt_linux_amd64
          chmod +x bin/terragrunt
          echo "$GITHUB_WORKSPACE/bin" >> $GITHUB_PATH

      - name: Terragrunt Init
        working-directory: ${{ env.DIR }}
        run: |
          eval `ssh-agent -s`
          ssh-add - <<< '${{ secrets.GH_ACTIONS_SSH_KEY }}'
          terragrunt run-all init -upgrade
```

??? note "Full Example"

    ```yaml
    name: Cloudflare Tunnels
    env:
      DIR: "dns/tunnels"
      TF_VERSION: 1.4.4
      TERRAGRUNT_VERSION: v0.45.0
    on:
      push:
        branches:
          - main
        paths:
          - dns/tunnels/**
          - .github/workflows/cloudflare-tunnels.yaml
    
    
    jobs:
      terragrunt:
        permissions:
          id-token: write
          contents: read
        env:
          CLOUDFLARE_API_TOKEN: ${{secrets.CLOUDFLARE_API_TOKEN_ZEROTRUST}}
    
        runs-on: ubuntu-latest
        steps:
          - name: Checkout code
            uses: actions/checkout@v3
    
          - id: 'auth'
            name: Authenticate to Google Cloud
            uses: 'google-github-actions/auth@v1'
            with:
              workload_identity_provider: ''
              service_account: ''
    
          - name: Install Terraform
            uses: hashicorp/setup-terraform@v2
            with:
              terraform_version: ${{ env.TF_VERSION }}
    
    
          - name: Setup Terragrunt
            run: |
              mkdir bin
              wget -O bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/$TERRAGRUNT_VERSION/terragrunt_linux_amd64
              chmod +x bin/terragrunt
              echo "$GITHUB_WORKSPACE/bin" >> $GITHUB_PATH
    
          - name: Terragrunt Init
            working-directory: ${{ env.DIR }}
            run: |
              eval `ssh-agent -s`
              ssh-add - <<< '${{ secrets.GH_ACTIONS_SSH_KEY }}'
              terragrunt run-all init -upgrade
    
          - name: Terragrunt Validate
            working-directory: ${{ env.DIR }}
            run: terragrunt run-all validate
    
          - name: Terragrunt Plan
            working-directory: ${{ env.DIR }}
            run: terragrunt run-all plan
    
          - name: Terragrunt Apply
            working-directory: ${{ env.DIR }}
            run: terragrunt run-all apply --terragrunt-non-interactive
    ```