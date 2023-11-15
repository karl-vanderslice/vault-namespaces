// Note that this could all be cleaned up a bit better, reusable, etc.

// Root namespace specific configuration, mounts, and shared resources.  Should be minimal here. 
// TODO move this into the main vault-namespace module

resource "vault_policy" "root_super_admin" {
  name   = "super-admin"
  policy = data.vault_policy_document.super_admin.hcl
}

// Org Level namespaces

module "org_namespace_wayne" {
  source = "./modules/vault-namespace"

  name = "Wayne Enterprises"

}

resource "vault_policy" "org_namespace_admin" {
  name      = "admin" // Note that this the same name as sub orgs, with a different policy
  namespace = module.org_namespace_wayne.path_fq
  policy    = data.vault_policy_document.admin.hcl
}

// Sub Orgs

module "wayne_sub_orgs_acme" {
  source = "./modules/vault-namespace"

  name = "ACME"

  parent_namespace = module.org_namespace_wayne.path_fq

}

resource "vault_policy" "sub_org_acme_admin" {
  name      = "admin" // Note that this is the same name as the parent org, with a different policy
  namespace = module.wayne_sub_orgs_acme.path_fq
  policy    = data.vault_policy_document.sub_org_admin.hcl
}

// As a service namespaces with secrets engines, etc. 

module "acme_self_service_namespaces" {

  source = "./modules/vault-namespace"

  // Real world, make this more scalable

  for_each = toset(["Widgets", "Retail", "Billing"])

  name             = lower(each.key)
  parent_namespace = module.wayne_sub_orgs_acme.path_fq

  namespace_type = "selfService"

}

// Vault as a service

module "omni_consumer_products_namespace" {

  source = "./modules/vault-namespace"

  for_each = toset(["OCP", "OSC"])

  name = lower(each.key)
  parent_namespace = module.org_namespace_wayne.path_fq

  namespace_type = "managed"

}
