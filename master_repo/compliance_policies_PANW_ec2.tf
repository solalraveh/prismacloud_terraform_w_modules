/*

This file contains all policies for the compliance framework requirement section "AWS EC2" of the requirement "Standard Building Block".

*/

module "EXAMPLE_ec2_keypair" {
  source            = "./policy/"

  policy_name       = "EXAMPLE EC2 Keypair usage is not allowed"
  remediation       = "The creation is globally forbidden. Please use Systems Manager - Session Manager as an alternative."
  description       = "The usage of EC2 keypairs is not allowed to prevent the usage of SSH. Please use AWS Systems Manager - Session Manager to access EC2 instances."
  rql_query         = "config from cloud.resource where api.name = 'aws-ec2-key-pair' AND json.rule = keyName exists"
  csrs_section_id   = prismacloud_compliance_standard_requirement_section.CSRS_EXAMPLE_EC2.section_id
  csr_id            = prismacloud_compliance_standard_requirement.CSR_EXAMPLE.csr_id
}
