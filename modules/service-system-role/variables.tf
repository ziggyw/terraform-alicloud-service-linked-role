
variable "role_name" {
  description = "The role name."
  default     = ""
}

variable "role_document" {
  description = "Authorization strategy of the RAM role."
  default     = ""
}

variable "role_description" {
  description = "Description of the RAM role. "
  default     = ""
}

variable "role_force" {
  description = "This parameter is used for resource destroy."
  type        = bool
  default     = false
}

variable "policy_name" {
  description = "Name of the RAM policy. "
  default     = ""
}





variable "roles" {
  type = list(object({
    name          = string
    role_document = string
    description   = string
    policy_name   = string
  }))

  default = [
  ]
}