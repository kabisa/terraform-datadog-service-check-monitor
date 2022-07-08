# terraform-datadog-service-check-monitor

This module is a base module we use for service checks in datadog.
A good example use can be found [here](https://github.com/kabisa/terraform-datadog-system/blob/main/dd-agent-data.tf)

## Getting Started

Pre-commit:
   - Install [pre-commit](http://pre-commit.com/). E.g. `brew install pre-commit`.
   - Run `pre-commit install` in this repo. (Every time you clone a repo with pre-commit enabled you will need to run the pre-commit install command)
   - That’s it! Now every time you commit a code change (`.tf` file), the hooks in the `hooks:` config `.pre-commit-config.yaml` will execute.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | ~> 3.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | 3.12.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.monitor](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tags"></a> [additional\_tags](#input\_additional\_tags) | Additional tags to set on the monitor. Good tagging can be hard but very useful to make cross sections of the environment. Datadog has a few default tags. https://docs.datadoghq.com/getting_started/tagging/ is a good place to start reading about tags | `list(string)` | `[]` | no |
| <a name="input_alert_message"></a> [alert\_message](#input\_alert\_message) | Message to be sent when the alert threshold is hit | `string` | n/a | yes |
| <a name="input_alerting_enabled"></a> [alerting\_enabled](#input\_alerting\_enabled) | If set to false no alerts will be sent based on this monitor | `bool` | `true` | no |
| <a name="input_auto_resolve_time_h"></a> [auto\_resolve\_time\_h](#input\_auto\_resolve\_time\_h) | Time of hours after which a triggered monitor that receives no data is automatically resolved. | `number` | `null` | no |
| <a name="input_by_tags"></a> [by\_tags](#input\_by\_tags) | List of tags for the "by" part of the query. This should only include the keys of key:value type tags. | `list(string)` | `[]` | no |
| <a name="input_critical_threshold"></a> [critical\_threshold](#input\_critical\_threshold) | n/a | `number` | `null` | no |
| <a name="input_custom_message"></a> [custom\_message](#input\_custom\_message) | This field give the option to put in custom text. Both 'note' and 'docs' are prefixed in the template with 'note:' and 'docs:' respectively. 'custom\_message' allows for free format. | `string` | `""` | no |
| <a name="input_docs"></a> [docs](#input\_docs) | Field in the alert message that can be used to document why the alert was sent or what to do. It's best to include links to authoritative resources about what's being monitored. Try to capture why and what the engineer should do with this message | `string` | `""` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | If set to false the monitor resource will not be created | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | This refers to the environment or which stage of deployment this monitor is checking. Good values are prd, acc, tst, dev... | `string` | n/a | yes |
| <a name="input_exclude_tags"></a> [exclude\_tags](#input\_exclude\_tags) | List of tags for the "exclude" part of the query. Can be either key:value tags or boolean tags. | `list(string)` | `[]` | no |
| <a name="input_include_tags"></a> [include\_tags](#input\_include\_tags) | List of tags for the "over" part of the query. Can be either key:value tags or boolean tags. | `list(string)` | `[]` | no |
| <a name="input_locked"></a> [locked](#input\_locked) | Makes sure only the creator or admin can modify the monitor | `bool` | `true` | no |
| <a name="input_metric_name"></a> [metric\_name](#input\_metric\_name) | Name of the status metric being monitored. If this check is not ok for a number of times, as defined by the threshold, an alert is raised. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name that the monitor should get. Will be automatically prefixed with the Service name. Also name\_suffix and name\_prefix have an effect on the eventual name. It's best set this property to a value that best describes the concern you're trying to cover with the monitor. Eg. Connection Available | `string` | n/a | yes |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Can be used to prefix to the Monitor name | `string` | `""` | no |
| <a name="input_name_suffix"></a> [name\_suffix](#input\_name\_suffix) | Can be used to suffix to the Monitor name | `string` | `""` | no |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Time (in seconds) to skip evaluations for new groups. https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor | `number` | `null` | no |
| <a name="input_no_data_message"></a> [no\_data\_message](#input\_no\_data\_message) | Message to be sent when the monitor is no longer receiving data | `string` | `""` | no |
| <a name="input_no_data_timeframe"></a> [no\_data\_timeframe](#input\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_note"></a> [note](#input\_note) | Field in the alert message that can be used to bring something to the attention of the engineer handling the alert | `string` | `""` | no |
| <a name="input_notification_channel"></a> [notification\_channel](#input\_notification\_channel) | Channel to which datadog sends alerts, will be overridden by alerting\_enabled if that's set to false | `string` | `""` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | Do you want an alert when the monitoring stops sending data? | `bool` | `false` | no |
| <a name="input_ok_threshold"></a> [ok\_threshold](#input\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_priority"></a> [priority](#input\_priority) | Number from 1 (high) to 5 (low). | `number` | n/a | yes |
| <a name="input_recovery_message"></a> [recovery\_message](#input\_recovery\_message) | Recovery message to be sent when the alert threshold is no longer hit | `string` | `""` | no |
| <a name="input_require_full_window"></a> [require\_full\_window](#input\_require\_full\_window) | n/a | `bool` | `true` | no |
| <a name="input_service"></a> [service](#input\_service) | Service name of what you're monitoring. This also sets the service:<service> tag on the monitor | `string` | n/a | yes |
| <a name="input_service_display_name"></a> [service\_display\_name](#input\_service\_display\_name) | n/a | `string` | `null` | no |
| <a name="input_track_as_cluster_level_status"></a> [track\_as\_cluster\_level\_status](#input\_track\_as\_cluster\_level\_status) | This allows to check for the status of a cluster instead of individual hosts, warning and critical thresholds are then expressed as percentages | `bool` | `false` | no |
| <a name="input_warning_threshold"></a> [warning\_threshold](#input\_warning\_threshold) | n/a | `number` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alert_id"></a> [alert\_id](#output\_alert\_id) | n/a |
<!-- END_TF_DOCS -->