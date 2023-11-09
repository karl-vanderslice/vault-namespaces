// Root namespace specific configuration, mounts, and shared resources.  Should be minimal here. 
// TODO move this into the main vault-namespace module

resource "vault_policy" "root_super_admin" {
  name   = "super-admin"
  policy = data.vault_policy_document.super_admin.hcl
}

resource "vault_auth_backend" "oidc" {
  type = "oidc"
}

// Org Level namespaces

module "org_namespace_wayne" {
  source = "./modules/vault-namespace"

  name = "Wayne Enterprises"

}

resource "vault_policy" "org_namespace_admin" {
  name      = "admin"
  namespace = module.org_namespace_wayne.path_fq
  policy    = data.vault_policy_document.admin.hcl
}

// Sub Orgs
