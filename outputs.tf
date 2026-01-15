##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

output "device_farm_project_name" {
  value = aws_devicefarm_project.this.name
}

output "device_farm_project_arn" {
  value = aws_devicefarm_project.this.arn
}

output "device_farm_device_pools" {
  value = {
    for key, pool in aws_devicefarm_device_pool.this : key => {
      name = pool.name
      arn  = pool.arn
    }
  }
}