<<<<<<< HEAD
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
=======
output "access_key" {
  description = "The IAM access key associated with the CI IAM user created by this module."
  sensitive   = true
  value       = module.user.access_key
}

output "role" {
  description = "The IAM role that the CI user can assume to read SSM parameters in the Images account."
  value       = module.user.role
}

output "user" {
  description = "The CI IAM user created by this module."
  value       = module.user.user
>>>>>>> 26819a903c52b39dce7b3673f54402d3d281fba3
}
