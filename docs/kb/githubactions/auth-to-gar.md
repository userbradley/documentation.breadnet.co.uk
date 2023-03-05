from: https://github.com/google-github-actions/auth
```text
jobs:
  job_id:
    steps:
    - uses: 'actions/checkout@v3'

    - id: 'auth'
      name: 'Authenticate to Google Cloud'
      uses: 'google-github-actions/auth@v1'
      with:
        token_format: 'access_token'
        # Either user Workload Identity Federation or Service Account Keys. See
        # above more more examples

    # This example uses the docker login action
    - uses: 'docker/login-action@v1'
      with:
        registry: 'gcr.io' # or REGION-docker.pkg.dev
        username: 'oauth2accesstoken'
        password: '${{ steps.auth.outputs.access_token }}'

    # This example runs "docker login" directly to Artifact Registry.
    - run: |-
        echo '${{ steps.auth.outputs.access_token }}' | docker login -u oauth2accesstoken --password-stdin https://REGION-docker.pkg.dev

    # This example runs "docker login" directly to Container Registry.
    - run: |-
        echo '${{ steps.auth.outputs.access_token }}' | docker login -u oauth2accesstoken --password-stdin https://gcr.io
```