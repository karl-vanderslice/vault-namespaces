// Random pet

resource "random_pet" "this" {
    count = var.name != "" ? 1 : 0
}

// Locals

locals {
    // Clean up name
    name = lower(try(length(var.name), 0) > 0 ? var.name : random_pet.this[0].id)
    namespace_name = replace(local.name, " ", "-")
}

// Actual namespace

resource "vault_namespace" "this" {
    path = local.namespace_name
}