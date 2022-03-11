variable "roles" {
  type = list(object({
    name          = string
    role_document = string
    description   = string
    policy_name   = string
  }))
  default = [{
    name          = "AliyunCSManagedLogRole"
    role_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
    description   = "容器服务(CS)Kubernetes集群日志组件使用此角色来访问您在其他云产品中的资源"
    policy_name   = "AliyunCSManagedLogRolePolicy"
    },
    {
      name          = "AliyunCSManagedCmsRole"
      role_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description   = "容器服务(CS)集群CMS组件使用此角色来访问您在其他云产品中的资源。"
      policy_name   = "AliyunCSManagedCmsRolePolicy"
    },
    {
      name          = "AliyunCSManagedCsiRole"
      role_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description   = "容器服务(CS)Kubernetes集群存储插件使用此角色来访问您在其他云产品中的资源"
      policy_name   = "AliyunCSManagedCsiRolePolicy"
    },
    {
      name          = "AliyunCSManagedVKRole"
      role_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description   = "容器服务(CS)Serverless集群VK组件使用此角色来访问您在其他云产品中的资源。"
      policy_name   = "AliyunCSManagedVKRolePolicy"
    },
    {
      name          = "AliyunCSClusterRole"
      role_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description   = "容器服务(CS)在应用运行期使用此角色来访问您在其他云产品中的资源"
      policy_name   = "AliyunCSClusterRolePolicy"
    },
    {
      name          = "AliyunCSServerlessKubernetesRole"
      role_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description   = "容器服务(CS)ServerlessKubernetes版默认使用此角色来访问您在其他云产品中的资源"
      policy_name   = "AliyunCSServerlessKubernetesRolePolicy"
    },
    {
      name          = "AliyunCSKubernetesAuditRole"
      role_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description   = "容器服务(CS)Kubernetes审计功能使用此角色来访问您在其他云产品中的资源"
      policy_name   = "AliyunCSKubernetesAuditRolePolicy"
    },
    {
      name          = "AliyunCSManagedNetworkRole"
      role_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description   = "容器服务(CS)集群网络组件使用此角色来访问您在其他云产品中的资源。"
      policy_name   = "AliyunCSManagedNetworkRolePolicy"
    },
    {
      name          = "AliyunCSDefaultRole"
      role_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description   = "容器服务(CS)在集群操作时默认使用此角色来访问您在其他云产品中的资源"
      policy_name   = "AliyunCSDefaultRolePolicy"
    },
    {
      name          = "AliyunCSManagedKubernetesRole"
      role_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description   = "容器服务(CS)ManagedKubernetes版默认使用此角色来访问您在其他云产品中的资源"
      policy_name   = "AliyunCSManagedKubernetesRolePolicy"
    }
    ,
    {
      name          = "AliyunCSManagedArmsRole"
      role_document = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"cs.aliyuncs.com\"]}}],\"Version\":\"1\"}"
      description   = "容器服务(CS) Kubernetes 集群Arms插件使用此角色来访问您在其他云产品中的资源。"
      policy_name   = "AliyunCSManagedArmsRolePolicy"
  }]
}


module "csk" {
  for_each         = { for r in var.roles : r.name => r }
  source           = "../../modules/service-system-role/"
  role_name        = each.value.name
  role_document    = each.value.role_document
  role_description = each.value.description
  policy_name      = each.value.policy_name
}