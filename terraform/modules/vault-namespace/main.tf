// Random pet

resource "random_pet" "this" {
    count = var.name == null ? 1 : 0
}

// Locals

locals {
    // Clean up name
    name = lower(try(length(var.name), 0) > 0 ? var.name : random_pet.this[0].id)
    namespace_name = replace(local.name, " ", "-")
}

// Namespace

resource "vault_namespace" "this" {
    path = local.namespace_name

    namespace = var.parent_namespace

}