## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 6.4 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tags"></a> [tags](#module\_tags) | cloudopsworks/tags/local | 1.0.9 |

## Resources

| Name | Type |
|------|------|
| [aws_devicefarm_device_pool.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/devicefarm_device_pool) | resource |
| [aws_devicefarm_instance_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/devicefarm_instance_profile) | resource |
| [aws_devicefarm_network_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/devicefarm_network_profile) | resource |
| [aws_devicefarm_project.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/devicefarm_project) | resource |
| [aws_devicefarm_test_grid_project.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/devicefarm_test_grid_project) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Extra tags to add to the resources | `map(string)` | `{}` | no |
| <a name="input_is_hub"></a> [is\_hub](#input\_is\_hub) | Is this a hub or spoke configuration? | `bool` | `false` | no |
| <a name="input_org"></a> [org](#input\_org) | Organization details | <pre>object({<br/>    organization_name = string<br/>    organization_unit = string<br/>    environment_type  = string<br/>    environment_name  = string<br/>  })</pre> | n/a | yes |
| <a name="input_settings"></a> [settings](#input\_settings) | DeviceFARM Settings | `any` | `{}` | no |
| <a name="input_spoke_def"></a> [spoke\_def](#input\_spoke\_def) | Spoke ID Number, must be a 3 digit number | `string` | `"001"` | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | VPC Configuration details | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_device_farm_desktop_project_arn"></a> [device\_farm\_desktop\_project\_arn](#output\_device\_farm\_desktop\_project\_arn) | n/a |
| <a name="output_device_farm_desktop_project_name"></a> [device\_farm\_desktop\_project\_name](#output\_device\_farm\_desktop\_project\_name) | n/a |
| <a name="output_device_farm_device_pools"></a> [device\_farm\_device\_pools](#output\_device\_farm\_device\_pools) | n/a |
| <a name="output_device_farm_project_arn"></a> [device\_farm\_project\_arn](#output\_device\_farm\_project\_arn) | n/a |
| <a name="output_device_farm_project_name"></a> [device\_farm\_project\_name](#output\_device\_farm\_project\_name) | n/a |
