# Project Name

## Description
This project aims to automate the deployment of a website using Terraform for infrastructure provisioning and Ansible for configuration management. The infrastructure includes an EC2 instance, security group configurations, Route 53 hosted zone setup, and Apache web server with SSL/TLS certificate configuration using Let's Encrypt.

## Prerequisites
Before running this project, ensure the following prerequisites are met:
- AWS account with appropriate permissions
- Terraform installed on your local machine
- Ansible installed on your local machine
- Domain name registered with a registrar that supports Route 53

## Setup
1. **Domain Name Configuration**: 
    - Register a domain name with a registrar that supports Route 53.
    - Create a Route 53 hosted zone for the domain.
    - Set the Amazon NS values provided by Route 53 as the nameservers for your domain through your domain registrar's management panel.

2. **Configuration**:
    - Clone this repository to your local machine.
    - Modify the `variables.tf` file to set your configurations
      Modify the `main.yml` file.
    - Run `terraform init` to initialize the Terraform configuration.
    - Run `terraform apply` to provision the infrastructure on AWS.

## Usage
Once the setup is complete, the website will be accessible at your configured domain name. You can visit instance's public IP address for testing purposes. However, please note that DNS resolution may take some time.

## Components
- **Terraform**: Used for provisioning AWS infrastructure including EC2 instance and security group configurations.
- **Ansible**: Used for configuring the EC2 instance with Apache web server, Let's Encrypt SSL/TLS certificate, and deploying the website.
- **Route 53**: Used for domain name management and DNS resolution.
- **Let's Encrypt**: Used for SSL/TLS certificate issuance.

## License
This project is licensed under the [MIT License](LICENSE).
