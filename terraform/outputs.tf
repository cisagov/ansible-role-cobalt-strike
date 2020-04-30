output "production_policy" {
  value       = module.production_bucket_access.policy
  description = "The IAM policy that can read the specified objects from the specified S3 production bucket."
}

output "production_role" {
  value       = module.production_bucket_access.role
  description = "The IAM role that can read the specified objects from the specified S3 production bucket."
}

output "staging_policy" {
  value       = module.staging_bucket_access.policy
  description = "The IAM policy that can read the specified objects from the specified S3 staging bucket."
}

output "staging_role" {
  value       = module.staging_bucket_access.role
  description = "The IAM role that can read the specified objects from the specified S3 staging bucket."
}

output "user" {
  value       = aws_iam_user.user
  description = "The IAM user being created to test the cisagov/ansible-cobalt-strike Ansible role."
}

output "user_access_key" {
  value       = aws_iam_access_key.key
  description = "The access key for the IAM user being created to test the cisagov/ansible-cobalt-strike Ansible role."
  sensitive   = true
}
