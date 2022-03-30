
variable "oos_services" {
  type = list(string)
  default = [
    "bandwidthscheduler.oos.aliyuncs.com",
    "instancescheduler.oos.aliyuncs.com",
    "executiondelivery.oos.aliyuncs.com"
  ]
}

module "oos" {
  source   = "../../"
  services = var.oos_services
}