// Policies - these could be a todo to make it a module

// Super admin does everything

data "vault_policy_document" "super_admin" {
  rule {
    path         = "*"
    capabilities = ["create", "read", "update", "delete", "list"]
    description  = "Super admin policy."
  }
}

// Organizational Admin

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
    path         = "kv/*"
    capabilities = ["create", "read", "update", "delete", "list"]
    description  = "Enable and manage the key/value secrets engine at `kv/` path"
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
    path         = "sys/config/ui"
    capabilities = ["read", "update", "delete", "list"]
    description  = "Configure Vault UI"
  }
}

// Sub org admin - very limited

data "vault_policy_document" "sub_org_admin" {
  rule {
    path         = "sys/auth"
    capabilities = ["list", "read"]
    description  = "Read and list allowed auth methods"
  }
  rule {
    path         = "/sys/auth/*"
    capabilities = ["sudo", "create", "update", "delete"]
    allowed_parameter {
      key   = "type"
      value = ["oidc"]
    }
    description = "Create allowed auth methods"
  }
  rule {
    path         = "sys/mounts"
    capabilities = ["list", "read"]
    description  = "List allowed secrets engines"
  }
  rule {
    path         = "sys/mounts/*"
    capabilities = ["sudo", "create", "update", "delete", "list", "read"]
    allowed_parameter {
      key   = "type"
      value = ["kv", "transit", "transform"]
    }
    allowed_parameter {
      key   = "*"
      value = []
    }
    description = "Manage allowed mount types"
  }
  rule {
    path         = "kv/*"
    capabilities = ["list", "read", "create", "update", "delete"]
    description  = "Read and manage secrets under key/value"
  }
  rule {
    path         = "transit/*"
    capabilities = ["list", "read", "create", "update", "delete"]
    description  = "Read and manage the transit secrets engine"
  }
  rule {
    path         = "transform/*"
    capabilities = ["list", "read", "create", "update", "delete"]
  }
}
