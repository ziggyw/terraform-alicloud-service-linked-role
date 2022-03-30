variable "roles" {
  description = "The ram roles. "
  type = list(object({
    role_name        = string
    role_document    = string
    role_description = string
    policy_name      = string
  }))
  default = []
}


variable "services" {
  description = "The service linked role service. "
  type        = list(string)
  default = [

  ]
}
