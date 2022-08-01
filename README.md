# azr-tf-module-aks-node-pool

[Terraform](https://www.terraform.io) Module to create additional **AKS Cluster Node Pool** in Azure

<!-- BEGIN_TF_DOCS -->
## Prerequisites

- [Terraform](https://releases.hashicorp.com/terraform/) v0.12+

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=3.15.1 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.14.9 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.15.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster_node_pool.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_node_pools"></a> [node\_pools](#input\_node\_pools) | Cluster Node Pool settings. | <pre>list(object({<br>    name                         = string<br>    kubernetes_cluster_id        = string<br>    vm_size                      = string<br>    mode                         = string<br>    node_labels                  = map(any)<br>    node_taints                  = list(string)<br>    zones                        = list(string)<br>    vnet_subnet_id               = string<br>    enable_auto_scaling          = bool<br>    enable_host_encryption       = bool<br>    enable_node_public_ip        = bool<br>    proximity_placement_group_id = string<br>    orchestrator_version         = string<br>    max_pods                     = number<br>    max_count                    = number<br>    min_count                    = number<br>    node_count                   = number<br>    os_disk_size_gb              = number<br>    os_disk_type                 = string<br>    os_type                      = string<br>    priority                     = string<br>    tags                         = map(any)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ids"></a> [ids](#output\_ids) | Specifies the resource id of the node pool |

## Example

```hcl
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
```


<!-- END_TF_DOCS -->
## Authors

Originally created by [Patrick Hayo](http://github.com/patrickhayo)

## License

[MIT](LICENSE) License - Copyright (c) 2022 by the Author.
