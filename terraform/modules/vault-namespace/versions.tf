terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "3.22.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}
