#https://www.alibabacloud.com/help/en/doc-detail/141701.html
//创建角色
resource "alicloud_ram_role" "role" {
  name        = var.role_name
  document    = var.role_document
  description = var.role_description
  force       = var.role_force
}

//角色关联系统权限
resource "alicloud_ram_role_policy_attachment" "attach" {
  policy_name = var.policy_name
  policy_type = "System"
  role_name   = var.role_name
  depends_on  = [alicloud_ram_role.role]
}


