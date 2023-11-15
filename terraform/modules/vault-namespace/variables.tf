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
    description = "Name of the namespace to create.  If unset, will be created in the root namespace."
    default = null
    validation {
        condition = var.namespace != null ? length(var.namespace) > 0 : true
        error_message = "Namespace Name variable should not be empty if provided."
    }
}

variable "parent_namespace" {
    type = string 
    description = "Fully qualified path of the parent namespace to provision this namespace in."
    default = null
    validation {
        condition = var.parent_namespace != null ? length(var.parent_namespace) > 0 : true
        error_message = "Parent Namespace variable should not be empty if provided."
    }
}

variable "namespace_type" {
    type = string
    description = "Type of namespace to configure.  Options are `selfService` or `managed`"
    default = null
    validation {
        condition = (var.namespace_type != null ? (length(var.namespace_type) > 0) && contains(["selfService", "managed"], var.namespace_type) : true)
        error_message = "Variable is invalid, options: \"selfService\", \"managed\"."
    }
}