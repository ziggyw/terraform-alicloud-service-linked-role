output "role_names" {
  description = "The name of the role"
  value       = module.eventbridge.service_linked_role_names
}
