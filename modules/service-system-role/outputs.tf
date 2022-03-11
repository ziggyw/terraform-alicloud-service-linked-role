output "this_role_name" {
  description = "The name of the role"
  value       = concat(alicloud_ram_role.role.*.name, [""])[0]
}

output "this_role_id" {
  description = "The ID of the role"
  value       = concat(alicloud_ram_role.role.*.role_id, [""])[0]
}