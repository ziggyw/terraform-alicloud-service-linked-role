output "this_role_names" {
  description = "The name of the role"
  value = toset([
    for role in module.csk : role.this_role_name
  ])
}

output "this_role_ids" {
  description = "The ID of the role"
  value = toset([
    for role in module.csk : role.this_role_id
  ])
}