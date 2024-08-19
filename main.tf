resource "oci_adm_knowledge_base" "this" {
  count          = length(var.compartment) == 0 ? 0 : length(var.knowledge_base)
  compartment_id = lookup(var.knowledge_base[count.index], "compartment_id")
  defined_tags   = merge(var.defined_tags, lookup(var.knowledge_base[count.index], "defined_tags"))
  display_name   = lookup(var.knowledge_base[count.index], "display_name")
  freeform_tags  = merge(var.freeform_tags, lookup(var.knowledge_base[count.index], "freeform_tags"))
}

resource "oci_adm_remediation_recipe" "this" {
  count                         = (length(var.compartment) && length(var.knowledge_base)) == 0 ? 0 : length(var.remediation_recipe)
  compartment_id                = ""
  is_run_triggered_on_kb_change = false
  knowledge_base_id             = ""
  display_name                  = ""
  defined_tags                  = {}
  freeform_tags                 = {}

  dynamic "detect_configuration" {
    for_each = ""
    content {
      exclusions                   = []
      max_permissible_cvss_v2score = 0
      max_permissible_cvss_v3score = 0
      upgrade_policy               = ""
    }
  }

  dynamic "network_configuration" {
    for_each = ""
    content {
      subnet_id = ""
      nsg_ids   = []
    }
  }

  dynamic "scm_configuration" {
    for_each = ""
    content {
      scm_type               = ""
      branch                 = ""
      is_automerge_enabled   = true
      build_file_location    = ""
      external_scm_type      = ""
      oci_code_repository_id = ""
      pat_secret_id          = ""
      repository_url         = ""
      username               = ""
    }
  }

  dynamic "verify_configuration" {
    for_each = ""
    content {
      build_service_type    = ""
      additional_parameters = {}
      jenkins_url           = ""
      job_name              = ""
      pat_secret_id         = ""
      pipeline_id           = ""
      repository_url        = ""
      trigger_secret_id     = ""
      username              = ""
      workflow_name         = ""
    }
  }
}

resource "oci_adm_remediation_run" "this" {
  count                 = length(var.remediation_recipe) == 0 ? 0 : length(var.remediation_run)
  remediation_recipe_id = ""
  defined_tags          = {}
  display_name          = ""
  freeform_tags         = {}
}

resource "oci_adm_vulnerability_audit" "this" {
  count             = length(var.knowledge_base) == 0 ? 0 : length(var.knowledge_base)
  knowledge_base_id = ""
  defined_tags      = {}
  display_name      = ""
  freeform_tags     = {}
  build_type        = ""
  compartment_id    = ""

  dynamic "application_dependencies" {
    for_each = ""
    content {
      node_id                         = ""
      application_dependency_node_ids = []
      gav                             = ""
      purl                            = ""
    }
  }

  dynamic "configuration" {
    for_each = ""
    content {
      exclusions = []
      max_permissible_cvss_v2score = 0
      max_permissible_cvss_v3score = 0
      max_permissible_severity = ""
    }
  }

  dynamic "source" {
    for_each = ""
    content {
      type = ""
      description = ""
      oci_resource_id = ""
    }
  }

  dynamic "usage_data" {
    for_each = ""
    content {
      bucket      = ""
      namespace   = ""
      object      = ""
      source_type = ""
    }
  }
}