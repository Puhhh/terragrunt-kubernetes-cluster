include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::https://github.com/Puhhh/terraform-kubernetes-trust-manager.git?ref=v1.0.4"
}

inputs = {
  helm_custom_values      = true
  helm_custom_values_path = "trust-manager.yaml"
  create_bundle           = true
  bundle_name             = "kubernetes-local"
  pem_certificate         = "${yamldecode(sops_decrypt_file(find_in_parent_folders("secrets.enc.yaml"))).pki_bundle}"

}