# Terraform Project - DevOps Work Environment with AWS
![Untitled Diagram drawio-2](https://github.com/M03HE/terraform-proj/assets/130283957/cfe5fd34-0ecd-41cd-96c9-c98b89e345df)


This project focuses on creating a DevOps work environment on AWS by integrating various tools using Terraform. The environment includes networking components, an EC2 instance, and automated provisioning of Ansible to install Jenkins and Docker Engine. Additionally, an EventBridge module is utilized to schedule instance power states and send notifications. 

## Table of Contents

- [Introduction](#introduction)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Customization](#customization)
- [Repository](#repository)

## Introduction

The goal of this project is to set up a comprehensive DevOps work environment on AWS using Terraform. The environment consists of the following components:

1. Network Module: Creates essential networking resources, including VPC, subnet, security group, route table, key pair, and internet gateway.

2. EC2 Instance: Deploys an EC2 instance and uses Ansible to provision Jenkins and Docker Engine on the instance.

3. EventBridge Integration: Implements scheduled events to start and stop the EC2 instance, along with email notifications for state changes.

## Getting Started

To get started with the project, follow these steps:

1. Clone the repository:

   ```bash
   git clone https://github.com/M03HE/terraform-proj-network.git
   ```

2. Configure AWS credentials:

   Ensure that you have valid AWS credentials configured on your local machine. This can be done by setting environment variables or using the AWS CLI. Refer to the AWS documentation for detailed instructions.

3. Install Terraform:

   Make sure Terraform is installed on your local machine. You can download the latest version from the official Terraform website: [https://www.terraform.io/downloads.html](https://www.terraform.io/downloads.html)

4. Install Ansible:

   Ensure that Ansible is installed on your local machine. Refer to the Ansible documentation for installation instructions: [https://docs.ansible.com/ansible/latest/installation_guide/index.html](https://docs.ansible.com/ansible/latest/installation_guide/index.html)

## Usage

Follow the steps below to use the project:

1. Navigate to the root directory of the cloned repository:

   ```bash
   cd terraform-proj-network
   ```

2. Initialize Terraform:

   ```bash
   terraform init
   ```

3. Modify the `variables.tf` file to customize the configuration based on your requirements.

4. Apply the Terraform configuration:

   ```bash
   terraform apply
   ```

5. Confirm the changes by typing `yes` when prompted.

6. Wait for Terraform to deploy the infrastructure.

7. Access the EC2 instance by using the provided details, such as the public IP address and SSH key pair.

8. Explore the deployed tools and services, including Jenkins and Docker Engine.

## Customization

To customize the project according to your needs, make changes to the `variables.tf` file. You can modify variables such as VPC CIDR block, subnet CIDR block, region, availability zone, etc. Review the comments in the file for guidance on each variable.

## Repository

The repository for the Network module can be found at [https://github.com/M03HE/terraform-proj-network](https://github.com/M03HE/terraform-proj-network). Feel free to check the repository for additional information, updates, and contributions.

Note: Remember to update the documentation or any references with specific instructions on how to execute the project, including required credentials, AWS region, and any other necessary configuration details.
