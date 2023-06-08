variable "hcloud_token" {}

locals {
  cluster_name = "<replace with your cluster name>"
  provider_name = "hcloud"
}

module "compute" {
  source = "upmaru/instellar/hcloud"
  version = "~> 0.4"

  hcloud_token = var.hcloud_token
  cluster_name = local.cluster_name
  node_size = "cpx11"
  cluster_topology = [
    {id = 1, name = "01", size = "cpx11"},
    {id = 2, name = "02", size = "cpx11"},
  ]
  storage_size = 30
  ssh_keys = [
    "<key name>"
  ]
}

variable "instellar_auth_token" {}

module "instellar" {
  source  = "upmaru/bootstrap/instellar"
  version = "~> 0.3"

  auth_token      = var.instellar_auth_token
  cluster_name    = local.cluster_name
  region          = module.compute.region
  provider_name   = locals.provider_name
  cluster_address = module.compute.cluster_address
  password_token  = module.compute.trust_token

  bootstrap_node = module.compute.bootstrap_node
  nodes          = module.compute.nodes
}