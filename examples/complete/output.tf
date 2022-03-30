output "hbr_role_names" {
  description = "The name of the role"
  value       = module.hbr.service_linked_role_names
}
output "csk_role_names" {
  description = "The name of the role"
  value       = module.csk.ram_role_names
}
