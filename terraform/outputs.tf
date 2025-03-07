output "bucket_access_policy" {
  description = "The IAM policy that can read the specified objects from the specified S3 bucket."
  value       = module.bucket_access.policy
}

output "bucket_access_role" {
  description = "The IAM role that can read the specified objects from the specified S3 bucket."
  value       = module.bucket_access.role
}

output "user" {
  description = "The IAM user being created to test the cisagov/ansible-cobalt-strike Ansible role."
  value       = module.user.user
}

output "user_access_key" {
  description = "The access key for the IAM user being created to test the cisagov/ansible-cobalt-strike Ansible role."
  sensitive   = true
  value       = module.user.access_key
}
