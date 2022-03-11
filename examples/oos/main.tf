
variable "services" {
  type = list(string)
  default = [
    "bandwidthscheduler.oos.aliyuncs.com",
    "instancescheduler.oos.aliyuncs.com",
    "executiondelivery.oos.aliyuncs.com"
  ]
}

module "hbr" {
  for_each     = { for r in var.services : r => r }
  source       = "../../"
  service_name = each.value
}