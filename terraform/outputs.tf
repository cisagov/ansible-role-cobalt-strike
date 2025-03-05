output "bucket_access_policy" {
  value       = module.bucket_access.policy
  description = "The IAM policy that can read the specified objects from the specified S3 bucket."
}

output "bucket_access_role" {
  value       = module.bucket_access.role
  description = "The IAM role that can read the specified objects from the specified S3 bucket."
}

output "user" {
  value       = module.user.user
  description = "The IAM user being created to test the cisagov/ansible-cobalt-strike Ansible role."
}

output "user_access_key" {
  value       = module.user.access_key
  description = "The access key for the IAM user being created to test the cisagov/ansible-cobalt-strike Ansible role."
  sensitive   = true
}
