variable "kubernetes_roles" {
  type = list(object({
    role_name        = string
    role_document    = string
    role_description = string
    policy_name      = string
  }))
  default = [
    {
      role_name        = "AliyunCSManagedLogRole"
      role_document    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      role_description = "容器服务(CS)Kubernetes集群日志组件使用此角色来访问您在其他云产品中的资源"
      policy_name      = "AliyunCSManagedLogRolePolicy"
    },
    {
      role_name        = "AliyunCSManagedCmsRole"
      role_document    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      role_description = "容器服务(CS)集群CMS组件使用此角色来访问您在其他云产品中的资源。"
      policy_name      = "AliyunCSManagedCmsRolePolicy"
    },
    {
      role_name        = "AliyunCSManagedCsiRole"
      role_document    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      role_description = "容器服务(CS)Kubernetes集群存储插件使用此角色来访问您在其他云产品中的资源"
      policy_name      = "AliyunCSManagedCsiRolePolicy"
    },
    {
      role_name        = "AliyunCSManagedVKRole"
      role_document    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      role_description = "容器服务(CS)Serverless集群VK组件使用此角色来访问您在其他云产品中的资源。"
      policy_name      = "AliyunCSManagedVKRolePolicy"
    },
    {
      role_name        = "AliyunCSClusterRole"
      role_document    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      role_description = "容器服务(CS)在应用运行期使用此角色来访问您在其他云产品中的资源"
      policy_name      = "AliyunCSClusterRolePolicy"
    },
    {
      role_name        = "AliyunCSServerlessKubernetesRole"
      role_document    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      role_description = "容器服务(CS)ServerlessKubernetes版默认使用此角色来访问您在其他云产品中的资源"
      policy_name      = "AliyunCSServerlessKubernetesRolePolicy"
    },
    {
      role_name        = "AliyunCSKubernetesAuditRole"
      role_document    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      role_description = "容器服务(CS)Kubernetes审计功能使用此角色来访问您在其他云产品中的资源"
      policy_name      = "AliyunCSKubernetesAuditRolePolicy"
    },
    {
      role_name        = "AliyunCSManagedNetworkRole"
      role_document    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      role_description = "容器服务(CS)集群网络组件使用此角色来访问您在其他云产品中的资源。"
      policy_name      = "AliyunCSManagedNetworkRolePolicy"
    },
    {
      role_name        = "AliyunCSDefaultRole"
      role_document    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      role_description = "容器服务(CS)在集群操作时默认使用此角色来访问您在其他云产品中的资源"
      policy_name      = "AliyunCSDefaultRolePolicy"
    },
    {
      role_name        = "AliyunCSManagedKubernetesRole"
      role_document    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      role_description = "容器服务(CS)ManagedKubernetes版默认使用此角色来访问您在其他云产品中的资源"
      policy_name      = "AliyunCSManagedKubernetesRolePolicy"
    },
    {
      role_name        = "AliyunCSManagedArmsRole"
      role_document    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      role_description = "容器服务(CS) Kubernetes 集群Arms插件使用此角色来访问您在其他云产品中的资源。"
      policy_name      = "AliyunCSManagedArmsRolePolicy"
    }
  ]
}
variable "hbr_services" {
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


module "csk" {
  source = "../../"
  roles  = var.kubernetes_roles
}

module "hbr" {
  source   = "../../"
  services = var.hbr_services
}