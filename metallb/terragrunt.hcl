include "root" {
  path = find_in_parent_folders()
}

terraform {
    source = "git::https://github.com/Puhhh/terraform-kubernetes-metallb.git?ref=v1.0.5"
}

inputs = {
  helm_custom_values      = true
  helm_custom_values_path = "metallb.yaml"
  create_pool             = true
  ipaddresspool_start     = "172.168.101.101"
  ipaddresspool_end       = "172.168.101.102"
}