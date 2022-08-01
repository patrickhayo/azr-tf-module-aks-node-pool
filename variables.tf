## Find an overview about all possible values and detailed explainations at
## https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool
variable "node_pools" {
  description = "Cluster Node Pool settings."
  type = list(object({
    name                         = string
    kubernetes_cluster_id        = string
    vm_size                      = string
    mode                         = string
    node_labels                  = map(any)
    node_taints                  = list(string)
    zones                        = list(string)
    vnet_subnet_id               = string
    enable_auto_scaling          = bool
    enable_host_encryption       = bool
    enable_node_public_ip        = bool
    proximity_placement_group_id = string
    orchestrator_version         = string
    max_pods                     = number
    max_count                    = number
    min_count                    = number
    node_count                   = number
    os_disk_size_gb              = number
    os_disk_type                 = string
    os_type                      = string
    priority                     = string
    tags                         = map(any)
  }))
  default = [{
    enable_auto_scaling    = true
    enable_host_encryption = true
    enable_node_public_ip  = false
    kubernetes_cluster_id  = null
    max_count              = 1
    max_pods               = 30
    min_count              = 1
    mode                   = "User"
    name                   = null
    node_count             = 1
    node_labels = {
      "type" = "worker"
    }
    node_taints                  = []
    orchestrator_version         = "1.21.1"
    os_disk_size_gb              = 128
    os_disk_type                 = "Ephemeral"
    os_type                      = "Linux"
    priority                     = "Regular"
    proximity_placement_group_id = null
    tags = {
      "deployed by" = "Terraform"
    }
    vm_size        = "Standard_F8s_v2"
    vnet_subnet_id = null
    zones          = ["1", "2", "3"]
  }]
}
