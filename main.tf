##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

locals {
  farm_name = try(var.settings.name, "") != "" ? var.settings.name : format("%s-%s", var.settings.name_prefix, local.system_name)
}

resource "aws_devicefarm_project" "this" {
  count                       = try(var.settings.desktop, false) ? 0 : 1
  name                        = local.farm_name
  default_job_timeout_minutes = try(var.settings.job_timeout_minutes, null)
  tags                        = local.all_tags
}

resource "aws_devicefarm_device_pool" "this" {
  for_each = {
    for key, pool in try(var.settings.device_pools, {}) : key => pool
    if !try(var.settings.desktop, false)
  }
  project_arn = aws_devicefarm_project.this[0].arn
  name        = try(each.value.name, "") != "" ? each.value.name : format("%s-%s-pool", replace(each.key, "_", "-"), local.farm_name)
  description = try(each.value.description, format("Mobile Device Farm Pool for project: %s", local.farm_name))
  max_devices = try(each.value.max_devices, null)
  tags        = merge(local.all_tags, try(each.value.tags, {}))
  dynamic "rule" {
    for_each = try(each.value.rules, [])
    content {
      attribute = rule.value.attribute
      operator  = rule.value.operator
      value     = try(rule.value.value, null)
    }
  }
}

resource "aws_devicefarm_test_grid_project" "this" {
  count       = try(var.settings.desktop, false) ? 1 : 0
  name        = local.farm_name
  description = try(var.settings.description, format("Desktop Test Grid Project", local.farm_name))
  vpc_config {
    vpc_id             = var.vpc.vpc_id
    subnet_ids         = var.vpc.subnet_ids
    security_group_ids = var.vpc.security_group_ids
  }
  tags = local.all_tags
}

resource "aws_devicefarm_network_profile" "this" {
  for_each = {
    for key, profile in try(var.settings.network_profiles, {}) : key => profile
    if !try(var.settings.desktop, false)
  }
  project_arn             = aws_devicefarm_project.this[0].arn
  name                    = try(each.value.name, "") != "" ? each.value.name : format("%s-%s-network-profile", replace(each.key, "_", "-"), local.farm_name)
  description             = try(each.value.description, format("Network Profile for Device Farm Project: %s", local.farm_name))
  type                    = each.value.type
  downlink_bandwidth_bits = try(each.value.downlink.bandwidth_bits, null)
  downlink_delay_ms       = try(each.value.downlink.delay_ms, null)
  downlink_jitter_ms      = try(each.value.downlink.jitter_ms, null)
  downlink_loss_percent   = try(each.value.downlink.loss_percent, null)
  uplink_bandwidth_bits   = try(each.value.uplink.bandwidth_bits, null)
  uplink_delay_ms         = try(each.value.uplink.delay_ms, null)
  uplink_jitter_ms        = try(each.value.uplink.jitter_ms, null)
  uplink_loss_percent     = try(each.value.uplink.loss_percent, null)
  tags                    = merge(local.all_tags, try(each.value.tags, {}))
}

resource "aws_devicefarm_instance_profile" "this" {
  for_each                          = try(var.settings.instance_profiles, {})
  name                              = try(each.value.name, "") != "" ? each.value.name : format("%s-%s-instance-profile", replace(each.key, "_", "-"), local.farm_name)
  description                       = try(each.value.description, format("Instance Profile for Device Farm Project: %s", local.farm_name))
  package_cleanup                   = try(each.value.cleanup.enabled, null)
  exclude_app_packages_from_cleanup = try(each.value.cleanup.excludes, [])
  reboot_after_use                  = try(each.value.reboot_after_use, null)
}