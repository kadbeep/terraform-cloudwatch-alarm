# EC2 State Monitoring with CloudWatch Alarm

Terraform code that deploys an EC2 instance in its own VPC, a CloudWatch alarm
on CPUUtilization (> 70% for 2 minutes), an SNS email notification, and a
user-data script that generates CPU load to trigger the alarm.

## Usage
    echo 'alert_email = "you@example.com"' > terraform.tfvars
    terraform init
    terraform apply
    terraform destroy

