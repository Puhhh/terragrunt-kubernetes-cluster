include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::https://github.com/Puhhh/terraform-kubernetes-nginx.git?ref=v1.0.2"
}

inputs = {
  deploy_method           = "helm"
  helm_custom_values      = true
  helm_custom_values_path = "ngnix.yaml"
}