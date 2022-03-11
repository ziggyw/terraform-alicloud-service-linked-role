#https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/resource_manager_service_linked_role
#https://www.alibabacloud.com/help/zh/doc-detail/160674.html

resource "alicloud_resource_manager_service_linked_role" "default" {
  service_name  = var.service_name
  custom_suffix = var.custom_suffix
  description   = var.description
}