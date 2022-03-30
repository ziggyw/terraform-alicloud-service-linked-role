data "alicloud_ram_roles" "exist_roles" {
   
}


#https://www.alibabacloud.com/help/en/doc-detail/141701.html
resource "alicloud_ram_role" "role" {
  for_each = { for r in var.roles :
  r.role_name => r if !contains(data.alicloud_ram_roles.exist_roles.names, r.role_name) }
  name        = each.value.role_name
  document    = each.value.role_document
  description = each.value.role_description
}

resource "alicloud_ram_role_policy_attachment" "attach" {
  for_each = { for r in var.roles :
  r.role_name => r if !contains(data.alicloud_ram_roles.exist_roles.names, r.role_name) }

  policy_name = each.value.policy_name
  policy_type = "System"
  role_name   = each.value.role_name
  depends_on  = [alicloud_ram_role.role]
}

#https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/resource_manager_service_linked_role
#https://www.alibabacloud.com/help/en/doc-detail/160674.html
resource "alicloud_resource_manager_service_linked_role" "default" {
  for_each     = { for r in var.services : r => r }
  service_name = each.value
}