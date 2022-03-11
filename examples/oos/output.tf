
output "this_ids" {
  description = "The resource ID of Service Linked Role."
  value = toset([
    for role in module.hbr : role.this_id
  ])
}

output "this_role_names" {
  description = "The resource ID of Service Linked Role."
  value = toset([
    for role in module.hbr : role.this_role_name
  ])
}

output "this_role_ids" {
  description = "The resource ID of Service Linked Role."
  value = toset([
    for role in module.hbr : role.this_role_id
  ])
}