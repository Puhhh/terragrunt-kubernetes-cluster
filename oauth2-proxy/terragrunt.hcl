include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::https://github.com/Puhhh/terraform-kubernetes-oauth2-proxy.git?ref=v1.0.1"
}

inputs = {
  deploy_method           = "helm"
  helm_custom_values      = true
  helm_custom_values_path = "oauth2-proxy.yaml"
  client_secret           = "${yamldecode(sops_decrypt_file(find_in_parent_folders("secrets.enc.yaml"))).oauth2-proxy.client_secret}"
  cookie_secret           = "${yamldecode(sops_decrypt_file(find_in_parent_folders("secrets.enc.yaml"))).oauth2-proxy.cookie_secret}"
  create_tls_secret       = true
  tls_secret_name         = "oauth2-proxy-tls"
  tls_crt                 = "${yamldecode(sops_decrypt_file(find_in_parent_folders("secrets.enc.yaml"))).oauth2-proxy.tls_crt}"
  tls_key                 = "${yamldecode(sops_decrypt_file(find_in_parent_folders("secrets.enc.yaml"))).oauth2-proxy.tls_key}"
}