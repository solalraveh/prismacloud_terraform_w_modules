/*

This file contains all policies for the compliance framework requirement section "AWS ECR" of the requirement "Standard Building Block".

*/

module "EXAMPLE_ecr_tag_immutable" {
  source            = "./policy/"

  policy_name       = "EXAMPLE ECR Tag Immutability"
  remediation       = "Details can be found here: https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-tag-mutability.html"
  description       = "Please do not use 'latest' tag, instead use immutable tags. This helps to identify on which code base to container is based on"
  rql_query         = "config where cloud.type = 'aws' AND api.name = 'aws-ecr-get-repository-policy' AND json.rule = imageTagMutability equals 'IMMUTABLE'"
  csrs_section_id   = prismacloud_compliance_standard_requirement_section.CSRS_EXAMPLE_ECR.section_id
  csr_id    = prismacloud_compliance_standard_requirement.CSR_EXAMPLE.requirement_id
  #compliance_id     = prismacloud_compliance_standard_requirement_section.CSRS_EXAMPLE_ECR.csrs_id
  #custom_assigned = true
  #requirement_id = prismacloud_compliance_standard_requirement.CSR_EXAMPLE.requirement_id
  #requirement_name = prismacloud_compliance_standard_requirement.CSR_EXAMPLE.name
  #section_id = prismacloud_compliance_standard_requirement_section.CSRS_EXAMPLE_ECR.section_id
  #standard_name = prismacloud_compliance_standard.CS_PANW.name
  #section_description = prismacloud_compliance_standard_requirement_section.CSRS_EXAMPLE_ECR.description
  #standard_description = prismacloud_compliance_standard.CS_PANW.description
}

module "EXAMPLE_ecr_scan" {
  source            = "./policy/"

  policy_name       = "EXAMPLE ECR Scan On Push"
  remediation       = "Details can be found here: https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-scanning.html"
  description       = "Container must be scanned for vulnerabilities. AWS ECR provides this feature via 'scan on push'"
  rql_query         = "config where cloud.type = 'aws' AND api.name = 'aws-ecr-get-repository-policy' AND json.rule = imageScanningConfiguration.scanOnPush is false"
  csrs_section_id   = prismacloud_compliance_standard_requirement_section.CSRS_EXAMPLE_ECR.section_id
  csr_id    = prismacloud_compliance_standard_requirement.CSR_EXAMPLE.requirement_id
  #compliance_id     = prismacloud_compliance_standard_requirement_section.CSRS_EXAMPLE_ECR.csrs_id
  #custom_assigned = true
  #requirement_id = prismacloud_compliance_standard_requirement.CSR_EXAMPLE.requirement_id
  #requirement_name = prismacloud_compliance_standard_requirement.CSR_EXAMPLE.name
  #section_id = prismacloud_compliance_standard_requirement_section.CSRS_EXAMPLE_ECR.section_id
  #standard_name = prismacloud_compliance_standard.CS_PANW.name
  #section_description = prismacloud_compliance_standard_requirement_section.CSRS_EXAMPLE_ECR.description
  #standard_description = prismacloud_compliance_standard.CS_PANW.description  
}

module "EXAMPLE_ecr_remove_vulnerabilities" {
  source            = "./policy/"

  policy_name       = "EXAMPLE ECR Remove Vulnerabilities"
  remediation       = "Please update dependencies in your container to address the findings"
  description       = "The container should be free on known vulnerabilities to reduce attack surface"
  rql_query         = "config from cloud.resource where api.name = 'aws-ecr-image' AND json.rule = imageScanFindingsSummary exists"
  csrs_section_id   = prismacloud_compliance_standard_requirement_section.CSRS_EXAMPLE_ECR.section_id
  csr_id    = prismacloud_compliance_standard_requirement.CSR_EXAMPLE.requirement_id
  #compliance_id     = prismacloud_compliance_standard_requirement_section.CSRS_EXAMPLE_ECR.csrs_id
  #custom_assigned = true
  #requirement_id = prismacloud_compliance_standard_requirement.CSR_EXAMPLE.requirement_id
  #requirement_name = prismacloud_compliance_standard_requirement.CSR_EXAMPLE.name
  #section_id = prismacloud_compliance_standard_requirement_section.CSRS_EXAMPLE_ECR.section_id
  #standard_name = prismacloud_compliance_standard.CS_PANW.name
  #section_description = prismacloud_compliance_standard_requirement_section.CSRS_EXAMPLE_ECR.description
  #standard_description = prismacloud_compliance_standard.CS_PANW.description  
}