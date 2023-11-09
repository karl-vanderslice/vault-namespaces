variable "name" {
    type = string
    description = "Name to provision for the created namespace"
    default = null
    validation {
        condition = var.name != null ? length(var.name) > 0 : true
        error_message = "Namespace Name variable should not be empty if provided."
    }
}

variable "namespace" {
    type = string 
    description = "Name of the parent namespace to create.  If unset, will be created in the root namespace."
    default = null
    validation {
        condition = var.namespace != null ? length(var.namespace) > 0 : true
        error_message = "Namespace Name variable should not be empty if provided."
    }
}
