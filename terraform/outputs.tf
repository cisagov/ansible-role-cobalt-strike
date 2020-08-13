output "access_key" {
  value       = module.user.access_key
  description = "The IAM access key associated with the CI IAM user created by this module."
  sensitive   = true
}

output "production_role" {
  value       = module.user.production_role
  description = "The IAM role that the CI user can assume to read SSM parameters in the production account."
}

output "staging_role" {
  value       = module.user.staging_role
  description = "The IAM role that the CI user can assume to read SSM parameters in the staging account."
}

output "user" {
  value       = module.user.user
  description = "The CI IAM user created by this module."
}
