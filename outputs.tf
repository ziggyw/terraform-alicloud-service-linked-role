output "service_linked_role_names" {
  description = " The name of the role"
  value = toset([
    for role in alicloud_resource_manager_service_linked_role.default : role.role_name
  ])
}


output "ram_role_names" {
  description = "The name of the role"
  value = toset([
    for role in alicloud_ram_role.role : role.name
  ])
}
