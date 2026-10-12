# Terraform AWS Infrastructure Project

## 📌 Project Overview

This project demonstrates how to provision AWS infrastructure using Terraform. It uses separate Terraform configuration files to manage AWS resources and automate the deployment of an Apache web server.

## 🛠️ Technologies Used

* AWS
* Terraform
* Linux (Ubuntu)
* Apache Web Server
* Bash Scripting
* SSH

## 📂 Project Structure

| File Name          | Description                                                                         |
| ------------------ | ----------------------------------------------------------------------------------- |
| `instance.tf`      | Creates an AWS EC2 instance.                                                        |
| `securitygroup.tf` | Configures the security group and network access rules.                             |
| `keypair.tf`       | Creates an AWS key pair using a public SSH key.                                     |
| `var.tf`           | Defines input variables used in the Terraform configuration.                        |
| `provisioner.tf`   | Configures provisioning tasks to install and set up the Apache web server.          |
| `outputs.tf`       | Defines output values, if configured.                                               |
| `.gitignore`       | Prevents Terraform working files and sensitive files from being uploaded to GitHub. |

> **Note:** The file descriptions above assume these are the filenames and responsibilities used in your project. Update them if your actual configuration differs.

## 🔑 SSH Key Pair

The project uses an SSH key pair to connect to the EC2 instance.

* `my-key.pem` is the private key file used for SSH authentication.
* The corresponding public key is configured in AWS through the Terraform key pair resource.

**Security:** Never upload `my-key.pem` or any other private key to GitHub. Keep it securely stored on your local machine.

## ⚙️ How to Deploy

### 1. Install Terraform

Install Terraform on your local machine and configure AWS credentials.

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Validate the Configuration

```bash
terraform validate
```

### 4. Review the Execution Plan

```bash
terraform plan
```

### 5. Create AWS Resources

```bash
terraform apply
```

Type `yes` when prompted.

### 6. Clean Up Resources

When you no longer need the infrastructure, run:

```bash
terraform destroy
```

Review the proposed changes before confirming.

## 🌐 Access the Web Server

After the EC2 instance is created and Apache is installed, open the instance's public IP address in your browser:

```text
http://<EC2-PUBLIC-IP>
```

Ensure the EC2 security group allows inbound HTTP traffic on port 80.

## 🎯 What I Learned

* Provisioning AWS infrastructure using Terraform.
* Organizing Terraform configurations into separate files.
* Configuring AWS security groups and SSH key pairs.
* Using variables in Terraform.
* Automating Apache web server installation using provisioning.
* Managing infrastructure through Terraform commands.

## 🔒 Security Best Practices

* Never commit AWS access keys or secret credentials.
* Never upload private SSH keys such as `my-key.pem`.
* Exclude `.terraform/` and Terraform state files from Git.
* Avoid exposing sensitive information in Terraform variables or outputs.
* Restrict SSH access to trusted IP addresses.

## 👩‍💻 Author

**Sayani Lavanya**

Learning and building hands-on projects in AWS, Terraform, and DevOps.
