// Policies - these could be a module if needed

data "vault_policy_document" "super_admin" {
  rule {
    path         = "*"
    capabilities = ["create", "read", "update", "delete", "list"]
    description  = "Super admin policy."
  }
}

// Namespace Admin

data "vault_policy_document" "admin" {
  rule {
    path         = "sys/policies/acl"
    capabilities = ["list"]
    description  = "List existing policies"
  }
  rule {
    path         = "sys/policies/acl/*"
    capabilities = ["create", "read", "update", "delete", "list"]
    description  = "Create and manage ACL policies"
  }
  rule {
    path         = "auth/*"
    capabilities = ["create", "read", "update", "delete", "list", "sudo"]
    description  = "Manage auth methods broadly across Vault"
  }
  rule {
    path         = "sys/auth/*"
    capabilities = ["create", "update", "delete", "sudo"]
    description  = "Create, update, and delete auth methods"
  }
  rule {
    path         = "sys/auth"
    capabilities = ["read"]
    description  = "List auth methods"
  }
  rule {
    path         = "identity/*"
    capabilities = ["create", "read", "update", "delete", "list"]
    description  = "Manage identity"
  }
  rule {
    path         = "secret/*"
    capabilities = ["create", "read", "update", "delete", "list"]
    description  = "Enable and manage the key/value secrets engine at `secret/` path"
  }
  rule {
    path         = "sys/leases/*"
    capabilities = ["read", "update", "list"]
    description  = "Allow managing leases"
  }
  rule {
    path         = "sys/namespaces/*"
    capabilities = ["create", "read", "update", "delete", "list"]
    description  = "Manage namespaces"
  }
  rule {
    path         = "sys/mounts/*"
    capabilities = ["create", "read", "update", "delete", "list"]
    description  = "Manage secrets engines"
  }
  rule {
    path         = "sys/mounts"
    capabilities = ["read"]
    description  = "List existing secrets engines."
  }
  rule {
    path         = "sys/license"
    capabilities = ["create", "read", "update", "delete", "list"]
    description  = "Configure license"
  }
  rule {
    path         = "sys/config/ui"
    capabilities = ["read", "update", "delete", "list"]
    description  = "Configure Vault UI"
  }
}