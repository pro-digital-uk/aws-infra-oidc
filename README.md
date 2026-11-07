# AWS Infrastructure OIDC

Terraform configuration for GitHub Actions OIDC integration with AWS.

This repository manages:
- GitHub OIDC Identity Provider
- IAM role for GitHub Actions
- Policies for Terraform operations
- OIDC configuration for secure credential-less CI/CD

## Features

✅ **OIDC Authentication** - No static AWS credentials needed
✅ **Least Privilege** - Specific IAM policies per organization
✅ **Reusable** - Works across multiple repositories
✅ **Secure** - Repository and branch-scoped access

## Usage

### Prerequisites

- Terraform >= 1.5.0
- AWS credentials configured
- GitHub organization name

### Apply

```bash
# Initialize Terraform
terraform init

# Plan changes
terraform plan

# Apply configuration
terraform apply
```

### Outputs

After applying, Terraform will output:
- `oidc_provider_arn` - ARN of the OIDC provider
- `github_actions_role_arn` - ARN of the role for GitHub Actions
- `github_actions_role_name` - Name of the role

### Using in GitHub Actions

In your workflows, configure AWS credentials:

```yaml
- name: Configure AWS Credentials
  uses: aws-actions/configure-aws-credentials@v4
  with:
    role-to-assume: arn:aws:iam::493245399435:role/github-actions-role
    aws-region: eu-west-2
```

## Architecture

```
GitHub Actions Workflow
         ↓
GitHub OIDC Token
         ↓
AWS OIDC Provider (validates token)
         ↓
IAM Role Trust Policy (checks conditions)
         ↓
GitHub Actions Role Assumed
         ↓
Terraform Operations (with restricted permissions)
```

## Security

- Tokens valid only during workflow execution
- Sub claim scoped to specific organizations/repositories
- Audience validated to prevent token reuse
- Temporary credentials with no long-term secrets

## References

- [GitHub OIDC Documentation](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/about-security-hardening-with-openid-connect)
- [AWS IAM OIDC Provider](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_oidc.html)
