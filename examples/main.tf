## Find an overview about all possible values and detailed explainations at
## https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool

module "node_pool_central" {
  source = "./module"

  node_pools = [

    {
      enable_auto_scaling    = true
      enable_host_encryption = true
      enable_node_public_ip  = false
      kubernetes_cluster_id  = "MyAksClusterId"
      max_count              = 1
      max_pods               = 30
      min_count              = 1
      mode                   = "User"
      name                   = "MyNodePool_worker_1"
      node_count             = 1
      node_labels = {
        "node" = "worker"
      }
      node_taints                  = []
      orchestrator_version         = "TakeTheSameThanTheAksCluster"
      os_disk_size_gb              = 128
      os_disk_type                 = "Ephemeral"
      os_type                      = "Linux"
      priority                     = "Regular"
      proximity_placement_group_id = null
      tags = {
        "deployed by" = "Terraform"
      }
      vm_size        = "Standard_F8s_v2"
      vnet_subnet_id = "MyPoolSubnetId"
      zones          = ["1", "2", "3"]
    }
  ]
}
