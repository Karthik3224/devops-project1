# DevOps Full Deployment Script

# --- Variables ---
\ = ".\terraform"
\ = ".\ansible"
\ = "\\inventory.ini"
\ = "C:\path\to\your\private-key.pem"  # Change this
\ = "ec2-user"

# --- Step 1: Terraform Init, Plan, Apply ---
Write-Host "?? Running Terraform..." -ForegroundColor Green
cd \
terraform init
terraform validate
terraform plan -out=tfplan
terraform apply -auto-approve tfplan

# --- Step 2: Get EC2 Public IP ---
\ = terraform output -raw ec2_public_ip
Write-Host "EC2 Public IP: \" -ForegroundColor Cyan

# --- Step 3: Update Ansible Inventory ---
\ = "[web]
ec2 ansible_host=\ ansible_user=\ ansible_ssh_private_key_file=\"
Set-Content -Path \ -Value \
Write-Host "? Ansible inventory updated."

# --- Step 4: Run Ansible Playbook ---
Write-Host "?? Running Ansible..." -ForegroundColor Green
cd ..
ansible-playbook -i \ \\playbook.yml

# --- Step 5: Test Flask App ---
\ = "http://\/"
Write-Host "?? Deployment complete! Testing Flask app at \"

try {
    \ = Invoke-WebRequest -Uri \ -UseBasicParsing -TimeoutSec 10
    if (\.StatusCode -eq 200) {
        Write-Host "? Flask app is running successfully!" -ForegroundColor Green
    }
} catch {
    Write-Host "? Flask app is not reachable. Check EC2 instance or security group." -ForegroundColor Red
}
