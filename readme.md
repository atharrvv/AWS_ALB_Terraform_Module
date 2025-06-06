# AWS ALB Terraform Module

This Terraform module provides a flexible way to deploy and manage an AWS Application Load Balancer (ALB), along with its associated Target Group, Listener, and Listener Rule. It's designed to help you quickly set up load balancing for your applications.

---

## Features

* **Application Load Balancer (ALB):** Creates an AWS Application Load Balancer to distribute incoming application traffic across multiple targets.
* **Target Group:** Configures a target group where your EC2 instances or other registered targets will receive traffic.
* **HTTP/HTTPS Listener:** Sets up a listener on the ALB to check for connection requests using specified ports and protocols (HTTP by default).
* **Path-Based Listener Rule:** Includes a listener rule to route requests based on URL paths, allowing for more granular traffic management to your target group.
* **Instance Attachment:** Automatically attaches specified EC2 instances to the created target group.
* **Configurable:** Offers various input variables to customize the ALB, Target Group, and Listener Rule to fit your specific needs.

---

## Usage

To use this module, include it in your Terraform configuration and provide the necessary input variables.

### Example

Here's a basic example of how to use this module:

```terraform
module "load_balancer" {
  source = "./module" # Adjust this path if your module is in a different location

  alb-name                 = "my-web-app-alb"
  alb-internal             = false
  subnet                   = ["subnet-xxxxxxxxxxxxxxxxx", "subnet-yyyyyyyyyyyyyyyyy"] # Replace with your actual subnet IDs
  vpc-id                   = "vpc-zzzzzzzzzzzzzzzzz"       # Replace with your actual VPC ID
  tg-name                  = "my-web-app-tg"
  port                     = 80
  protocol                 = "HTTP"
  alb-security-groups-id   = ["sg-aaaaaaaaaaaaaaaaa"]      # Replace with your actual security group ID
  instance-ids             = ["i-bbbbbbbbbbbbbbbbb", "i-ccccccccccccccccc"] # Replace with your actual instance IDs
  listner-rule-path        = "/api/*"
  listner-priority         = 100
  aws_region               = "us-east-1" # Specify your AWS region

  # Uncomment and configure if you need HTTPS with a certificate
  # certificate_arn        = "arn:aws:acm:us-east-1:123456789012:certificate/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}

# Example of how to output values from the module
output "alb_dns_name" {
  description = "The DNS name of the Load Balancer"
  value       = module.load_balancer.alb_dns_name
}

output "target_group_arn" {
  description = "The ARN of the Target Group"
  value       = module.load_balancer.target_group_arn
}
