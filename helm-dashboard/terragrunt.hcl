include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::https://github.com/Puhhh/terraform-kubernetes-helm-dashboard.git?ref=v1.0.3"
}

inputs = {
  deploy_method           = "helm"
  helm_custom_values      = true
  helm_custom_values_path = "helm-dashboard.yaml"
  create_tls_secret       = true
  tls_secret_name         = "helm-dashboard-tls"
  tls_crt                 = "${yamldecode(sops_decrypt_file(find_in_parent_folders("secrets.enc.yaml"))).helm-dashboard.tls_crt}"
  tls_key                 = "${yamldecode(sops_decrypt_file(find_in_parent_folders("secrets.enc.yaml"))).helm-dashboard.tls_key}"
}