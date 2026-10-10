variable "default_route_tables" {
  description = <<EOT
Map of default_route_tables, attributes below
Required:
    - default_route_table_id
Optional:
    - propagating_vgws
    - region
    - tags
    - tags_all
    - route (block):
        - cidr_block (optional)
        - core_network_arn (optional)
        - destination_prefix_list_id (optional)
        - egress_only_gateway_id (optional)
        - gateway_id (optional)
        - instance_id (optional)
        - ipv6_cidr_block (optional)
        - nat_gateway_id (optional)
        - network_interface_id (optional)
        - transit_gateway_id (optional)
        - vpc_endpoint_id (optional)
        - vpc_peering_connection_id (optional)
EOT

  type = map(object({
    default_route_table_id = string
    propagating_vgws       = optional(set(string))
    region                 = optional(string)
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
    route = optional(list(object({
      cidr_block                 = optional(string)
      core_network_arn           = optional(string)
      destination_prefix_list_id = optional(string)
      egress_only_gateway_id     = optional(string)
      gateway_id                 = optional(string)
      instance_id                = optional(string)
      ipv6_cidr_block            = optional(string)
      nat_gateway_id             = optional(string)
      network_interface_id       = optional(string)
      transit_gateway_id         = optional(string)
      vpc_endpoint_id            = optional(string)
      vpc_peering_connection_id  = optional(string)
    })))
  }))
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

