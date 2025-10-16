# Terraform + Ansible + AWS Demo

A DevOps automation project demonstrating how to **provision cloud infrastructure** with **Terraform**, configure and deploy a **Flask web app** with **Ansible**, and run the application inside **Docker containers** on an AWS EC2 instance.

---

## 🚀 Project Overview

This project automates the entire lifecycle of a simple web application deployment:

1. **Terraform** provisions AWS infrastructure (EC2 instance, networking, and security groups).
2. **Ansible** connects to the EC2 instance via SSH and:
   - Installs Docker & Docker Compose
   - Uploads a sample Flask app
   - Builds and runs the app container
3. The Flask app is exposed via a public IP address provided by Terraform.

---

## 🏗️ Technologies Used

| Tool | Purpose |
|------|----------|
| **Terraform** | Infrastructure as Code (IaC) for provisioning AWS resources |
| **Ansible** | Configuration management and app deployment |
| **AWS EC2** | Cloud host for running the app |
| **Docker / Docker Compose** | Containerization and app orchestration |
| **Python (Flask)** | Web framework for the sample app |
| **Linux (Kali / Ubuntu)** | Development and runtime environment |

---

## ⚙️ Setup Instructions

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/CrustLorde/terraform-ansible-aws-demo.git
cd terraform-ansible-aws-demo

