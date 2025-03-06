output "production_policy" {
  value       = module.production_bucket_access.policy
  description = "The IAM policy that can read the specified objects from the specified S3 production bucket."
}

output "staging_policy" {
  value       = module.staging_bucket_access.policy
  description = "The IAM policy that can read the specified objects from the specified S3 staging bucket."
}

output "role" {
  value       = module.user.role
  description = "The IAM role that the CI user can assume to read SSM parameters in the Images account."
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
