# terraform-ansible-aws-webserver
This project aims to automate infrastructure setup on AWS using Terraform and Ansible. It launches AWS EC2 instances, configures them with Apache web servers, and secures them with SSL certificates using Certbot. By defining infrastructure as code, this project aims to provide a repeatable, scalable, and securely deployable architecture.

# Infrastructure as Code (IaC) Project

## Introduction

This project automates the setup of infrastructure components using Terraform and Ansible. It provisions an AWS EC2 instance, configures it with an Apache web server, and secures it with an SSL certificate using Certbot.

## Prerequisites

Before getting started, ensure you have the following prerequisites:

- Terraform installed.
- Ansible installed.
- AWS account credentials configured.
- Amazon AWS key pair (.pem file) located in the project directory.

## Setup

1. Clone this repository.
2. Install and configure the prerequisites.
3. Customize variables in `variables.tf`.
4. Run `terraform init` and `terraform apply`.
5. After provisioning, Ansible will configure the EC2 instance.

## Usage

To deploy infrastructure and configure the EC2 instance, run:

```bash
terraform apply
```
## Variables

- `region`: AWS region.
- `vpc`: ID of VPC.
- `ami`: AMI ID.
- `itype`: Instance type.
- `subnet`: Subnet ID.
- `publicip`: Assign a public IP.
- `keyname`: SSH key name.
- `secgroupname`: Security group name.
- `private_key_path`: Path to the private key file.
- `zone_id`: Route53 Zone ID.
- `domain_name`: Domain name.

## Directory Structure

- `main.tf`: Terraform configuration.
- `variables.tf`: Variable definitions.
- `main.yml`: Ansible playbook.
- `README.md`: Project documentation.

## Notes

- Ensure the AWS key pair (.pem file) is present.
- Customize variables in `variables.tf` before running Terraform.
- Assumes familiarity with Terraform, Ansible, and AWS services.
- The project, in its current state, starts serving the c3ngo.github.io repository as a web service by cloning it through the main.yml file.
