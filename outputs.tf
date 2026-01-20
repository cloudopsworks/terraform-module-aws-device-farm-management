##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

output "device_farm_project_name" {
  value = try(var.settings.desktop, false) ? null : aws_devicefarm_project.this[0].name
}

output "device_farm_project_arn" {
  value = try(var.settings.desktop, false) ? null : aws_devicefarm_project.this[0].arn
}

output "device_farm_device_pools" {
  value = {
    for key, pool in aws_devicefarm_device_pool.this : key => {
      name = pool.name
      arn  = pool.arn
    }
  }
}

output "device_farm_desktop_project_name" {
  value = try(var.settings.desktop, false) ? aws_devicefarm_test_grid_project.this[0].name : null
}

output "device_farm_desktop_project_arn" {
  value = try(var.settings.desktop, false) ? aws_devicefarm_test_grid_project.this[0].arn : null
}