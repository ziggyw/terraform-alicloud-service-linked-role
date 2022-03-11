
variable "services" {
  type = list(string)
  default = [
    "sendevent-fc.eventbridge.aliyuncs.com",
    "sendevent-mns.eventbridge.aliyuncs.com",
    "sendevent-sms.eventbridge.aliyuncs.com",
    "sendevent-directmail.eventbridge.aliyuncs.com",
    "source-rocketmq.eventbridge.aliyuncs.com",
    "sendevent-rocketmq.eventbridge.aliyuncs.com",
    "connect-vpc.eventbridge.aliyuncs.com",
    "source-actiontrail.eventbridge.aliyuncs.com",
    "source-rabbitmq.eventbridge.aliyuncs.com",
    "sendevent-rabbitmq.eventbridge.aliyuncs.com",
    "source-kafka.eventbridge.aliyuncs.com",
    "sendevent-kafka.eventbridge.aliyuncs.com",
  ]
}

module "hbr" {
  for_each     = { for r in var.services : r => r }
  source       = "../../"
  service_name = each.value
}