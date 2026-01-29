# 🌐 Vishal Sharma Portfolio Web App Deployment

[![Terraform Version](https://img.shields.io/badge/Terraform-%3E%3D%201.5.0-blue?logo=terraform)](https://www.terraform.io/)

This project demonstrates how to use **Terraform modules** to deploy a simple, real-world web application on AWS. It provisions a VPC, an EC2 instance running an Apache/nginx web server, and a security group to serve a custom portfolio webpage for **Vishal Sharma**, a DevOps Engineer . The setup is beginner-friendly, modular, and mirrors how teams deploy public-facing personal or professional webpages in production.


## 📂 Project Overview

- **Goal**: Deploy a web server hosting Vishal Sharma's portfolio webpage (`index.html`) on AWS, showcasing achievements and expertise in DevOps and cloud computing.
- **Components**:
  - **VPC Module**: Creates a VPC with a public subnet, internet gateway, and route table for internet access.
  - **EC2 Module**: Launches an EC2 instance with Apache, serving the `index.html` file.
  - **Security Group Module**: Allows HTTP traffic to the EC2 instance.
- **Real-World Relevance**: Mimics deploying a personal portfolio or professional webpage (e.g., for freelancers, engineers, or open-source contributors) with modular, reusable code.

## 🛠️ Requirements

- **Terraform**: Version ≥ 1.5.0 ([Download](https://www.terraform.io/downloads))
- **AWS CLI**: Version ≥ 2.0 ([Install Guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html))
- **AWS Account**: Configured with IAM credentials (`aws configure`).
- **Git**: For cloning the repo ([Download](https://git-scm.com/downloads)).
- **index.html**: Provided in the project folder (contains Vishal Sharma's portfolio webpage).

**Note**: Use AWS Free Tier to minimize costs (e.g., `t3.micro` instance).

## 📂 Project Structure

```
.
└── terra-modules
    ├── main.tf
    ├── modules
    │   ├── ec2
    │   │   ├── index.html
    │   │   ├── main.tf
    │   │   ├── output.tf
    │   │   └── varibales.tf
    │   ├── security-grp
    │   │   ├── main.tf
    │   │   ├── output.tf
    │   │   └── variables.tf
    │   └── vpc
    │       ├── main.tf
    │       ├── output.tf
    │       └── variables.tf
    ├── output.tf
    ├── provider.tf
    ├── README.md
    ├── terraform.tfstate
    ├── terraform.tfstate.backup
    └── variables.tf
```

## 📚 Learning Goals

- **Terraform Modules**: Understand how to organize infrastructure into reusable modules (VPC, EC2, security group).
- **Real-World Deployment**: Deploy a personal portfolio webpage, mimicking professional or freelance site launches.
- **Networking Basics**: Learn about public subnets, internet gateways, and route tables for internet access.
- **Automation**: Use `user_data` to automate web server setup.
- **Troubleshooting**: Debug common issues like AMI mismatches or security group errors.

## 💡 Real-World Relevance
This setup reflects how professionals deploy portfolio or personal webpages in production:
- **Modular Design**: Reusable modules (e.g., VPC) mirror industry practices for scalable IaC.
- **Public Access**: Public subnets, internet gateways, and route tables are standard for web apps.
- **Portfolio Webpage**: The Vishal Sharma's page mimics real-world use cases like showcasing skills for job applications, freelance gigs, or open-source branding.
- **Extensibility**: Easily extend to add load balancers, domains (Route 53), or static file storage (S3).

## 🛠️ Troubleshooting

- **Webpage Not Loading**:
  - Verify the EC2 instance has a public IP (check `map_public_ip_on_launch` in VPC module).
  - Ensure the security group allows HTTP (port 80) from `0.0.0.0/0`.
  - Confirm the AMI ID is valid for your region (update `variables.tf`).
- **Terraform Errors**:
  - Run `terraform validate` to check syntax.
  - Ensure AWS credentials have permissions (e.g., EC2, VPC, IAM).
- **Wrong AMI**
  - Had issue with the AMI instance, so changed it to another one, was using minimal one.