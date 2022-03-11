
variable "services" {
  type = list(string)
  default = [
    "dr.hbr.aliyuncs.com",
    "ecsbackup.hbr.aliyuncs.com",
    "ossbackup.hbr.aliyuncs.com",
    "nasbackup.hbr.aliyuncs.com",
    "csgbackup.hbr.aliyuncs.com",
    "vaultencryption.hbr.aliyuncs.com",
    "otsbackup.hbr.aliyuncs.com"
  ]
}

module "hbr" {
  for_each     = { for r in var.services : r => r }
  source       = "../../"
  service_name = each.value
}