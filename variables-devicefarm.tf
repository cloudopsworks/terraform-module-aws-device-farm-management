##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

# settings:
#   name: "my-device-farm"           # (Optional) The name of the Device Farm project. If not provided, it will be generated from name_prefix and system_name.
#   name_prefix: "df"                # (Optional) The prefix for the name of the Device Farm project. Default is "".
#   desktop: false                   # (Optional) Whether to create a Desktop Test Grid project (true) or a Mobile Device Farm project (false). Default is false.
#   job_timeout_minutes: 150         # (Optional) The maximum number of minutes that a test run can execute before it is stopped.
#   description: "My project"        # (Optional) The description of the project (used for desktop test grid).
#   device_pools:                    # (Optional) A map of device pools to create.
#     my_pool:
#       name: "my-pool"              # (Optional) The name of the device pool.
#       description: "My pool"       # (Optional) The description of the device pool.
#       max_devices: 5               # (Optional) The maximum number of devices to allow in the device pool.
#       rules:                       # (Optional) A list of rules for the device pool.
#         - attribute: "MODEL"       # (Required) The rule's stringified attribute. Valid values: ARN, PLATFORM, FORM_FACTOR, MANUFACTURER, MODEL, AVAILABILITY, REMOTE_ACCESS_ENABLED, APPIUM_VERSION, INSTANCE_ARN, INSTANCE_LABELS, FLEET_TYPE.
#           operator: "EQUALS"       # (Required) The rule's operator. Valid values: EQUALS, LESS_THAN, LESS_THAN_OR_EQUAL, GREATER_THAN, GREATER_THAN_OR_EQUAL, IN, NOT_IN, CONTAINS.
#           value: "iPhone 12"       # (Required) The rule's value.
#       tags: {}                     # (Optional) A map of tags to add to the device pool.
#   network_profiles:                # (Optional) A map of network profiles to create.
#     my_profile:
#       name: "my-profile"           # (Optional) The name of the network profile.
#       description: "My profile"    # (Optional) The description of the network profile.
#       type: "CURATED"              # (Required) The type of network profile. Valid values: CURATED, PRIVATE.
#       downlink:                    # (Optional) The downlink configuration.
#         bandwidth_bits: 1024       # (Optional) The downlink bandwidth in bits per second.
#         delay_ms: 100              # (Optional) The downlink delay in milliseconds.
#         jitter_ms: 10              # (Optional) The downlink jitter in milliseconds.
#         loss_percent: 5            # (Optional) The downlink loss percentage (0-100).
#       uplink:                      # (Optional) The uplink configuration.
#         bandwidth_bits: 1024       # (Optional) The uplink bandwidth in bits per second.
#         delay_ms: 100              # (Optional) The uplink delay in milliseconds.
#         jitter_ms: 10              # (Optional) The uplink jitter in milliseconds.
#         loss_percent: 5            # (Optional) The uplink loss percentage (0-100).
#       tags: {}                     # (Optional) A map of tags to add to the network profile.
#   instance_profiles:               # (Optional) A map of instance profiles to create.
#     my_instance:
#       name: "my-instance"          # (Optional) The name of the instance profile.
#       description: "My instance"   # (Optional) The description of the instance profile.
#       reboot_after_use: true       # (Optional) Whether to reboot the device after a test run.
#       cleanup:                     # (Optional) The cleanup configuration.
#         enabled: true              # (Optional) Whether to perform package cleanup after a test run.
#         excludes: []               # (Optional) A list of app packages to exclude from cleanup.
variable "settings" {
  description = "DeviceFARM Settings"
  type        = any
  default     = {}
}

# vpc:
#   vpc_id: "vpc-12345"              # (Required if desktop is true) The VPC ID for the Desktop Test Grid project.
#   subnet_ids: ["subnet-1", "s-2"]  # (Required if desktop is true) A list of subnet IDs for the Desktop Test Grid project.
#   security_group_ids: ["sg-1"]     # (Required if desktop is true) A list of security group IDs for the Desktop Test Grid project.
variable "vpc" {
  description = "VPC Configuration details"
  type        = any
  default     = {}
}