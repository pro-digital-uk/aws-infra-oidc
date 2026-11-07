variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}

variable "github_org" {
  description = "GitHub organization name"
  type        = string
  default     = "pro-digital-uk"
}

variable "sub_claim_patterns" {
  description = "GitHub OIDC sub claim patterns to allow"
  type        = list(string)
  default = [
    "repo:pro-digital-uk@*:ref:refs/heads/*",
    "repo:pro-digital-uk@*:pull_request",
    "repo:pro-digital-uk@*:environment:*"
  ]
}
