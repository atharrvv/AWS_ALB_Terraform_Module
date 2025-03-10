variable "alb-internal" {
    type = bool
    description = "value for internal load balancer"
    default = false
}

variable "subnet" {
    type = list(string)
    description = "list of subnet ids"
    default = [ "subnet-0ae0f1176f35afeb6", "subnet-006090b15a50d5569" ]
}

variable "alb-name" {
    type = string
    description = "naming prefix for resources"
    default = "new-alb"
}
variable "tg-name" {
    type = string
    description = "naming prefix for resources"
    default = "new-tg"
}

variable "vpc-id" {
    type = string
    description = "vpc id"
    default = "vpc-0804bbcfc8b2c6f8b"
}

variable "port" {
    type = number
    description = "port number"
    default = 80
}

variable "protocol" {
    type = string
    description = "protocol"
    default = "HTTP"
}

variable "alb-security-groups-id" {
    type = list(string)
    description = "list of security group ids"
    default = [ "sg-03af1a1831c67a63e" ]
}

variable "aws_region" {
    type = string
    description = "Aws region for deployment"
    default = "us-east-1"
}

variable "instance-ids" {
    type = list(string)
    description = "list of instance ids"
    default = [ "i-06e7ed0aed38a64f9", "i-091d1514c8f59bf73" ]
}

variable "listner-rule-path" {
    type = string
    description = "path pattern for listener rule"
    default = "/rule/*"
}




variable "certificate_arn" {
    type = string
    description = "certificate arn"
    default = "arn:aws:acm:us-east-1:368775253257:certificate/c0981906-8240-41af-bdd1-a2dcfa688e0a"
  
}


variable "listner-name" {
    type = string
    description = "name for listener"
    default = "alb-listener"
  
}

variable "listner-priority" {
    type = number
    description = "priority for listener rule"
    default = 100
}

