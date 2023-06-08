# Hetzner Cloud Compute

Terraform module template for Hetzner cloud and instellar.app. Click `Use this template` and set it up on your organization.

This module will setup networking and compute on hetzner cloud and automatically add the cluster to instellar.app. This is a fully automated workflow for managing your infrastructure with instellar.

## Basic Usage via CLI

Once you've cloned this repo, add a `.auto.tfvars` file. This file will automatically be ignored and not checked into your repository.

You can then fill it with the following

```hcl
hcloud_token = <your hcloud token>
instellar_auth_token = <your instellar auth token>
```

You can then replace the `cluster_name` inside the main.tf file and the `ssh_keys` fingerprint with the one from your hetzner cloud dashboard. You can get the ssh key name from the security page of your hcloud account under your project.

The `node_size` parameter and `size` parameter under `cluster_topology` can also be changed depending on how much load you will anticipate.

### Running Terraform

Once you've configured your cluster simply run

```shell
terraform init
terraform plan
terraform apply
```

That's it! Everything should be automatically setup and ready to go!