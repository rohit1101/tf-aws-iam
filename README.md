# tf-aws-iam

This repository contains a Terraform automation script to manage AWS IAM resources. It simplifies the process of creating, managing, and updating AWS IAM groups, policies, roles and users using Terraform.

## Files Overview

- **main.tf**: Main configuration file defining IAM resources.
- **provider.tf**: AWS provider configuration for Terraform.
- **variables.tf**: Contains variables used within the configuration.
- **outputs.tf**: Outputs the necessary values after Terraform execution.
- **.gitignore**: Standard Git ignore file for Terraform-related files.
- **terraform.lock.hcl**: Lock file for Terraform provider versions.

## Getting Started

### Prerequisites

- Terraform v1 or above
- AWS credentials configured in your environment

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/rohit1101/tf-aws-iam.git
   cd tf-aws-iam
   ```
2. Export AWS credentials
   ```bash
   export AWS_ACCESS_KEY_ID="your_access_key_id"
   export AWS_SECRET_ACCESS_KEY="your_secret_access_key"
   ```  
3. Initialize Terraform:
   ```bash
   terraform init
   ```
4. Apply the Terraform configuration:
   ```bash
   terraform apply
   ```
