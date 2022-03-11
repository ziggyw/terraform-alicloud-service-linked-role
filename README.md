# terraform-alicloud-service-linked-role
Terraform Module used to create several service linked roles automatically Alibaba Cloud.

These types of resources are supported:

* [alicloud_resource_manager_service_linked_role](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/resource_manager_service_linked_role)

## Terraform versions

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.159.0

## Usage

```hcl
variable "services" {
  type = list(string)  
  default = [ 
  "bandwidthscheduler.oos.aliyuncs.com",   
  "instancescheduler.oos.aliyuncs.com",
  "executiondelivery.oos.aliyuncs.com"
  ]
}

module "hbr" {
  for_each   = {for r in var.services: r => r}
  source  = "terraform-alicloud-modules/service-linked-role/alicloud"
  service_name = each.value
}
```

## Examples

* [Hybrid Backup Recovery example](https://github.com/terraform-alicloud-modules/terraform-alicloud-service-linked-role/tree/master/examples/hbr)
* [Operation Orchestration Service example](https://github.com/terraform-alicloud-modules/terraform-alicloud-service-linked-role/tree/master/examples/oos)
* [Event Bridge example](https://github.com/terraform-alicloud-modules/terraform-alicloud-service-linked-role/tree/master/examples/eventbridge)
* [Container Service for Kubernetes example](https://github.com/terraform-alicloud-modules/terraform-alicloud-service-linked-role/tree/master/examples/container-service-kubernetes)

## Notes
 For more information, see [Service-linked roles](https://www.alibabacloud.com/help/en/doc-detail/160674.html)

Authors
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)