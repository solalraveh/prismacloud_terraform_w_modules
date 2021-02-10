variable "policy_name" {
  description = "The name of the policy"
  type        = string
}

variable "description" {
  description = "Description for this rule"
  type        = string
}

variable "rql_query" {
  description = "The RQL query for this policy"
  type        = string
}

variable "remediation" {
  description = "How can this rule be remediated"
  type        = string
}

variable "csrs_section_id" {
  description = "The section ID (usually the 'name') of the Prisma Cloud Compliance Standard Requirement Section (NOT the csrs_id!)"
  type        = string
}

variable "csr_id" {
  description = "The ID of the Prisma Cloud Compliance Standard Requirement the mentioned section belongs to"
  type        = string
}

## variables with default

variable "policy_severity" {
  description = "The severity of the policy - low, medium or high"
  type        = string
  default     = "medium"
  validation {
    condition     = var.policy_severity == "low" || var.policy_severity == "medium" || var.policy_severity == "high"
    error_message = "The value can only be: low, medium or high!"
  }
}

variable "policy_type" {
  description = "The type of policy - config audit_event network"
  type        = string
  default     = "config"
  validation {
    condition     = var.policy_type == "config" || var.policy_type == "audit_event" || var.policy_type == "network"
    error_message = "The value can only be: config, audit_event or network!"
  }
}

variable "rule_type" {
  description = "The type of rule - Config AuditEvent Network"
  type        = string
  default     = "Config"
  validation {
    condition     = var.rule_type == "Config" || var.rule_type == "AuditEvent" || var.rule_type == "Network"
    error_message = "The value can only be: Config, AuditEvent or Network!"
  }
}

variable "policy_cloud" {
  description = "The name of the cloud platform this policy applies to"
  type        = string
  default     = "aws"
  validation {
    condition     = var.policy_cloud == "aws" || var.policy_cloud == "azure" || var.policy_cloud == "gcp" || var.policy_cloud == "alibaba_cloud" || var.policy_cloud == "all" 
    error_message = "The value can only be: aws, azure, gcp, alibaba_cloud or all!"
  }
}

variable "search_type" {
  description = "The type of rule - config or event"
  type        = string
  default     = "config"
  validation {
    condition     = var.search_type == "config" || var.search_type == "event" 
    error_message = "The value can only be: config or event!"
  }
}

variable "enabled" {
  description = "Enable the rule or not"
  type        = bool
  default     = true
}

variable "restrict_alert_dismissal" {
  description = "Restrict alert dismissal"
  type        = bool
  default     = false
}

variable "time_range_query_unit" {
  description = "Time range unit of the RQL query"
  type        = string
  default     = "hour"
}

variable "time_range_query_amount" {
  description = "Time range amount of the RQL query"
  type        = number
  default     = 24
}

variable "rql_limit" {
  description = "Limit query results"
  type        = number
  default     = 100
}