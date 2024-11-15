include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::https://github.com/Puhhh/terraform-kubernetes-local-path-provisioner.git?ref=v1.0.5"
}

inputs = {
  helm_custom_values      = true
  helm_custom_values_path = "local-path-provisioner.yaml"
}