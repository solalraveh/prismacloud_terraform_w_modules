resource "prismacloud_saved_search" "this" {
    name        = var.policy_name
    description = var.description
    search_id   = prismacloud_rql_search.this.search_id
    query       = prismacloud_rql_search.this.query
    time_range {
        relative {
            unit    = prismacloud_rql_search.this.time_range.0.relative.0.unit
            amount  = prismacloud_rql_search.this.time_range.0.relative.0.amount
        }
    }
}

resource "prismacloud_rql_search" "this" {
    search_type = var.search_type
    query       = var.rql_query
    limit       = var.rql_limit
    time_range {
        relative {
            unit    = var.time_range_query_unit
            amount  = var.time_range_query_amount
        }
    }
}

data "prismacloud_compliance_standard_requirement_section" "this" {
    csr_id      = var.csr_id
    section_id  = var.csrs_section_id
}

data "prismacloud_compliance_standard" "this" {
    name = data.prismacloud_compliance_standard_requirement_section.this.standard_name
}

data "prismacloud_compliance_standard_requirement" "this" {
    cs_id   = data.prismacloud_compliance_standard.this.cs_id
    name    = data.prismacloud_compliance_standard_requirement_section.this.requirement_name
}

resource "prismacloud_policy" "this" {
    name                        = var.policy_name
    policy_type                 = var.policy_type
    description                 = var.description
    recommendation              = var.remediation
    restrict_alert_dismissal    = var.restrict_alert_dismissal
    enabled                     = var.enabled
    severity                    = var.policy_severity
    cloud_type                  = var.policy_cloud

    rule {
        name        = var.policy_name
        criteria    = prismacloud_rql_search.this.search_id
        rule_type   = var.rule_type
        parameters  = {
            "savedSearch": true,
            "withIac": false,
        }
    }

    compliance_metadata {
        standard_name           = data.prismacloud_compliance_standard.this.name
        standard_description    = data.prismacloud_compliance_standard.this.description
        requirement_name        = data.prismacloud_compliance_standard_requirement.this.name
        requirement_id          = data.prismacloud_compliance_standard_requirement.this.requirement_id
        #requirement_description = data.prismacloud_compliance_standard_requirement.this.description
        section_id              = data.prismacloud_compliance_standard_requirement_section.this.section_id
        section_description     = data.prismacloud_compliance_standard_requirement_section.this.description
        compliance_id           = data.prismacloud_compliance_standard_requirement_section.this.csrs_id
        #policy_id               = prismacloud_policy.this.policy_id #error message 'Configuration for prismacloud_policy.this may not refer to itself.'
        custom_assigned         = true 
    }
}