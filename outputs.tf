output "this_id" {
  description = "The resource ID of Service Linked Role."
  value       = concat(alicloud_resource_manager_service_linked_role.default.*.id, [""])[0]
}
output "this_role_name" {
  description = " The name of the role"
  value       = concat(alicloud_resource_manager_service_linked_role.default.*.role_name, [""])[0]
}

output "this_role_id" {
  description = "The ID of the role"
  value       = concat(alicloud_resource_manager_service_linked_role.default.*.role_id, [""])[0]
}