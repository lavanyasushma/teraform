name: Apply
permissions:
    id-token: write # This is required for requesting the JWT
    contents: read

# Triggering the workflow on repository_dispatch and workflow_dispatch events
on:
  push:
    branches: ['ftepoc']

# Jobs to be executed in the workflow
jobs:
   terraform:
    name: "Terraform"
    uses: ./.github/workflows/terraform-apply.yaml
    # Input parameters for the job
    with:
      ref: ${{ github.sha }} # Using the Git reference from the workflow input
      env: fte # Using the environment from the workflow input
    # Secrets needed for the job (GH_INFRA_PAT and GCP_SVC_CREDS)
    secrets:
      GH_INFRA_PAT: ${{ secrets.GH_INFRA_PAT }}
      CLIENT_ID: ${{ secrets.CLIENT_ID }}
      SUBSCRIPTION_ID: ${{ secrets.SUBSCRIPTION_ID }}
      TENANT_ID: ${{ secrets.TENANT_ID }}
      CLIENT_SECRET: ${{ secrets.CLIENT_SECRET }}
      TF_API_TOKEN: ${{ secrets.TF_API_TOKEN }}
      AZURE_CREDS: ${{ secrets.AZURE_CREDS }}
