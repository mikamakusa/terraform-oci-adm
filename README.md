## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | >= 6.7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | 6.8.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_identity"></a> [identity](#module\_identity) | ./modules/terraform-oci-identity | n/a |

## Resources

| Name | Type |
|------|------|
| [oci_adm_knowledge_base.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/adm_knowledge_base) | resource |
| [oci_adm_remediation_recipe.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/adm_remediation_recipe) | resource |
| [oci_adm_remediation_run.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/adm_remediation_run) | resource |
| [oci_adm_vulnerability_audit.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/adm_vulnerability_audit) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compartment"></a> [compartment](#input\_compartment) | n/a | `any` | n/a | yes |
| <a name="input_defined_tags"></a> [defined\_tags](#input\_defined\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_freeform_tags"></a> [freeform\_tags](#input\_freeform\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_knowledge_base"></a> [knowledge\_base](#input\_knowledge\_base) | n/a | <pre>list(object({<br>    id             = number<br>    compartment_id = any<br>    defined_tags   = optional(map(string))<br>    display_name   = optional(string)<br>    freeform_tags  = optional(map(string))<br>  }))</pre> | `[]` | no |
| <a name="input_remediation_recipe"></a> [remediation\_recipe](#input\_remediation\_recipe) | n/a | <pre>list(object({<br>    compartment_id                = any<br>    is_run_triggered_on_kb_change = bool<br>    knowledge_base_id             = any<br>    display_name                  = optional(string)<br>    defined_tags                  = optional(map(string))<br>    freeform_tags                 = optional(map(string))<br>    detect_configuration = list(object({<br>      exclusions                   = optional(list(string))<br>      max_permissible_cvss_v2score = optional(number)<br>      max_permissible_cvss_v3score = optional(number)<br>      upgrade_policy               = optional(string)<br>    }))<br>    network_configuration = list(object({<br>      subnet_id = any<br>      nsg_ids   = list(any)<br>    }))<br>    scm_configuration = list(object({<br>      scm_type               = string<br>      branch                 = string<br>      is_automerge_enabled   = bool<br>      build_file_location    = optional(string)<br>      external_scm_type      = optional(string)<br>      oci_code_repository_id = optional(any)<br>      pat_secret_id          = optional(any)<br>      repository_url         = optional(string)<br>      username               = optional(string)<br>    }))<br>    verify_configuration = list(object({<br>      build_service_type    = string<br>      additional_parameters = optional(map(string))<br>      jenkins_url           = optional(string)<br>      job_name              = optional(any)<br>      pat_secret_id         = optional(any)<br>      pipeline_id           = optional(any)<br>      repository_url        = optional(string)<br>      trigger_secret_id     = optional(any)<br>      username              = optional(string)<br>      workflow_name         = optional(string)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_remediation_run"></a> [remediation\_run](#input\_remediation\_run) | n/a | <pre>list(object({<br>    remediation_recipe_id = any<br>    defined_tags          = optional(map(string))<br>    display_name          = optional(string)<br>    freeform_tags         = optional(map(string))<br>  }))</pre> | `[]` | no |
| <a name="input_vulnerability_audit"></a> [vulnerability\_audit](#input\_vulnerability\_audit) | n/a | <pre>list(object({<br>    knowledge_base_id = any<br>    defined_tags      = optional(map(string))<br>    display_name      = optional(string)<br>    freeform_tags     = optional(map(string))<br>    build_type        = optional(string)<br>    compartment_id    = optional(string)<br>    application_dependencies = optional(list(object({<br>      node_id                         = any<br>      application_dependency_node_ids = list(string)<br>      gav                             = optional(string)<br>      purl                            = optional(string)<br>    })))<br>    configuration = optional(list(object({<br>      exclusions                   = optional(list(string))<br>      max_permissible_cvss_v2score = optional(number)<br>      max_permissible_cvss_v3score = optional(number)<br>      max_permissible_severity     = optional(string)<br>    })))<br>    source = optional(list(object({<br>      type            = string<br>      description     = optional(string)<br>      oci_resource_id = optional(any)<br>    })))<br>    usage_data = optional(list(object({<br>      bucket      = string<br>      namespace   = string<br>      object      = string<br>      source_type = string<br>    })))<br>  }))</pre> | `[]` | no |

## Outputs

No outputs.
