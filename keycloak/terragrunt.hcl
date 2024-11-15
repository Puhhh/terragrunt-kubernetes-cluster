include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::https://github.com/Puhhh/terraform-kubernetes-keycloak.git?ref=v1.0.6"
}

inputs = {
  deploy_method = "helm"
  # helm
  helm_custom_values      = true
  helm_custom_values_path = "keycloak.yaml"
  helm_chart_version      = "24.2.0"
  # values
  admin_password  = "${yamldecode(sops_decrypt_file(find_in_parent_folders("secrets.enc.yaml"))).keycloak.admin_password}"
  tls_crt         = indent(8, yamldecode(sops_decrypt_file(find_in_parent_folders("secrets.enc.yaml"))).keycloak.tls_crt)
  tls_key         = indent(8, yamldecode(sops_decrypt_file(find_in_parent_folders("secrets.enc.yaml"))).keycloak.tls_key)
  # custom_certificates
  custom_certificates_secret      = true
  custom_certificates_secret_name = "kubernetes-local"
  custom_certificates             = "${yamldecode(sops_decrypt_file(find_in_parent_folders("secrets.enc.yaml"))).pki_bundle}"
  # database
  cloudnativepg_database          = true
  cloudnativepg_storage_size      = "3Gi"
  cloudnativepg_database_password = "${yamldecode(sops_decrypt_file(find_in_parent_folders("secrets.enc.yaml"))).keycloak.cloudnativepg_database_password}"
}
