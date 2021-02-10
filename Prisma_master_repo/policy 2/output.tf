output "prismacloud_rql_search_search_id" {
  description = "ID of the Prisma Cloud RQL Search"
  value       = prismacloud_rql_search.this.search_id
}

output "prismacloud_policy_policy_id" {
  description = "ID of the Prisma Cloud Policy"
  value       = prismacloud_policy.this.policy_id
} 