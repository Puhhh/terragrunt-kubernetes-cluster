include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::https://github.com/Puhhh/terraform-kubernetes-cert-manager.git?ref=v1.0.4"
}

inputs = {
  helm_custom_values      = true
  helm_custom_values_path = "cert-manager.yaml"
  helm_chart_version      = "1.15.3"
}