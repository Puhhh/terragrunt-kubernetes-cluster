include "root" {
  path = find_in_parent_folders()
}

terraform {
    source = "git::https://github.com/Puhhh/terraform-kubernetes-cilium.git?ref=v1.0.5"
}

inputs = {
  helm_custom_values      = true
  helm_custom_values_path = "cilium.yaml"
  helm_chart_version      = "1.16.3"
  create_tls_secret       = true
  tls_secret_name         = "hubble-ui-tls"
  tls_crt                 = "${yamldecode(sops_decrypt_file(find_in_parent_folders("secrets.enc.yaml"))).hubble-ui.tls_crt}"
  tls_key                 = "${yamldecode(sops_decrypt_file(find_in_parent_folders("secrets.enc.yaml"))).hubble-ui.tls_key}"
}