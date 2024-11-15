include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::https://github.com/Puhhh/terraform-kubernetes-cloudnativepg.git?ref=v1.0.3"
}

inputs = {
  deploy_method = "helm"
}