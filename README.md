# DevOps Final Project  
## Cloud Infrastructure Automation & CI/CD Deployment

This project demonstrates a complete DevOps pipeline using:

- Python Flask Application
- Terraform for AWS Infrastructure
- Ansible for Configuration Management
- GitHub Actions for CI/CD Automation

---

## Project Folder Structure

devops-project1/
¦
+-- application/
¦   +-- app.py
¦   +-- requirements.txt
¦   +-- templates/
¦
+-- terraform/
¦   +-- provider.tf
¦   +-- variables.tf
¦   +-- main.tf
¦   +-- outputs.tf
¦
+-- ansible/
¦   +-- inventory.ini
¦   +-- playbook.yml
¦   +-- roles/
¦       +-- webapp/
¦           +-- tasks/main.yml
¦           +-- templates/app.service.j2
¦
+-- .github/
    +-- workflows/
        +-- ci-cd.yml

---

## How to Use

1. Run Terraform to create AWS resources  
2. Run Ansible to deploy the Flask application  
3. Push to GitHub to trigger CI/CD workflow
