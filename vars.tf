## TAGS ##

variable "defined_tags" {
  type    = map(string)
  default = []
}

variable "freeform_tags" {
  type    = map(string)
  default = []
}

## MODULES ##

variable "compartment" {
  type = any
}

## RESOURCES ##

variable "knowledge_base" {
  type = list(object({
    id             = number
    compartment_id = any
    defined_tags   = optional(map(string))
    display_name   = optional(string)
    freeform_tags  = optional(map(string))
  }))
  default = []
}

variable "remediation_recipe" {
  type = list(object({
    compartment_id                = any
    is_run_triggered_on_kb_change = bool
    knowledge_base_id             = any
    display_name                  = optional(string)
    defined_tags                  = optional(map(string))
    freeform_tags                 = optional(map(string))
    detect_configuration = list(object({
      exclusions                   = optional(list(string))
      max_permissible_cvss_v2score = optional(number)
      max_permissible_cvss_v3score = optional(number)
      upgrade_policy               = optional(string)
    }))
    network_configuration = list(object({
      subnet_id = any
      nsg_ids   = list(any)
    }))
    scm_configuration = list(object({
      scm_type               = string
      branch                 = string
      is_automerge_enabled   = bool
      build_file_location    = optional(string)
      external_scm_type      = optional(string)
      oci_code_repository_id = optional(any)
      pat_secret_id          = optional(any)
      repository_url         = optional(string)
      username               = optional(string)
    }))
    verify_configuration = list(object({
      build_service_type    = string
      additional_parameters = optional(map(string))
      jenkins_url           = optional(string)
      job_name              = optional(any)
      pat_secret_id         = optional(any)
      pipeline_id           = optional(any)
      repository_url        = optional(string)
      trigger_secret_id     = optional(any)
      username              = optional(string)
      workflow_name         = optional(string)
    }))
  }))
  default = []
}

variable "remediation_run" {
  type = list(object({
    remediation_recipe_id = any
    defined_tags          = optional(map(string))
    display_name          = optional(string)
    freeform_tags         = optional(map(string))
  }))
  default = []
}

variable "vulnerability_audit" {
  type = list(object({
    knowledge_base_id = any
    defined_tags      = optional(map(string))
    display_name      = optional(string)
    freeform_tags     = optional(map(string))
    build_type        = optional(string)
    compartment_id    = optional(string)
    application_dependencies = optional(list(object({
      node_id                         = any
      application_dependency_node_ids = list(string)
      gav                             = optional(string)
      purl                            = optional(string)
    })))
    configuration = optional(list(object({
      exclusions                   = optional(list(string))
      max_permissible_cvss_v2score = optional(number)
      max_permissible_cvss_v3score = optional(number)
      max_permissible_severity     = optional(string)
    })))
    source = optional(list(object({
      type            = string
      description     = optional(string)
      oci_resource_id = optional(any)
    })))
    usage_data = optional(list(object({
      bucket      = string
      namespace   = string
      object      = string
      source_type = string
    })))
  }))
  default = []
}