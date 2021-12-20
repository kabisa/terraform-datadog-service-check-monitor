variable "alerting_enabled" {
  description = "If set to false no alerts will be sent based on this monitor"
  type        = bool
  default     = true
}

variable "enabled" {
  description = "If set to false the monitor resource will not be created"
  type        = bool
  default     = true
}

variable "notification_channel" {
  description = "Channel to which datadog sends alerts, will be overridden by alerting_enabled if that's set to false"
  type        = string
  default     = ""
}

variable "name" {
  description = "Name that the monitor should get. Will be automatically prefixed with the Service name. Also name_suffix and name_prefix have an effect on the eventual name. It's best set this property to a value that best describes the concern you're trying to cover with the monitor. Eg. Connection Available"
  type        = string
}

variable "service" {
  description = "Service name of what you're monitoring. This also sets the service:<service> tag on the monitor"
  type        = string
}

variable "service_display_name" {
  type    = string
  default = null
}

variable "metric_name" {
  description = "Name of the status metric being monitored. If this check is not ok for a number of times, as defined by the threshold, an alert is raised."
  type        = string
}

variable "include_tags" {
  description = "List of tags for the \"over\" part of the query. Can be either key:value tags or boolean tags."
  type        = list(string)
  default     = []
}

variable "exclude_tags" {
  description = "List of tags for the \"exclude\" part of the query. Can be either key:value tags or boolean tags."
  type        = list(string)
  default     = []
}

variable "by_tags" {
  description = "List of tags for the \"by\" part of the query. This should only include the keys of key:value type tags."
  type        = list(string)
  default     = []
}

variable "alert_message" {
  description = "Message to be sent when the alert threshold is hit"
  type        = string
}

variable "recovery_message" {
  description = "Recovery message to be sent when the alert threshold is no longer hit"
  type        = string
  default     = ""
}

variable "note" {
  description = "Field in the alert message that can be used to bring something to the attention of the engineer handling the alert"
  type        = string
  default     = ""
}

variable "docs" {
  description = "Field in the alert message that can be used to document why the alert was sent or what to do. It's best to include links to authoritative resources about what's being monitored. Try to capture why and what the engineer should do with this message"
  type        = string
  default     = ""
}

variable "env" {
  description = "This refers to the environment or which stage of deployment this monitor is checking. Good values are prd, acc, tst, dev..."
  type        = string
}

variable "additional_tags" {
  description = "Additional tags to set on the monitor. Good tagging can be hard but very useful to make cross sections of the environment. Datadog has a few default tags. https://docs.datadoghq.com/getting_started/tagging/ is a good place to start reading about tags"
  type        = list(string)
  default     = []
}

variable "require_full_window" {
  type    = bool
  default = true
}

variable "critical_threshold" {
  type    = number
  default = null
}

variable "warning_threshold" {
  type    = number
  default = null
}

variable "ok_threshold" {
  type    = number
  default = null
}

variable "no_data_timeframe" {
  type    = number
  default = null
}

variable "notify_no_data" {
  description = "Do you want an alert when the monitoring stops sending data?"
  type        = bool
  default     = false
}

variable "locked" {
  description = "Makes sure only the creator or admin can modify the monitor"
  type        = bool
  default     = true
}

variable "name_prefix" {
  description = "Can be used to prefix to the Monitor name"
  type        = string
  default     = ""
}

variable "name_suffix" {
  description = "Can be used to suffix to the Monitor name"
  type        = string
  default     = ""
}

variable "priority" {
  description = "Number from 1 (high) to 5 (low)."
  type        = number
}

variable "auto_resolve_time_h" {
  description = "Time of hours after which a triggered monitor that receives no data is automatically resolved."
  type        = number
  default     = null
}

variable "custom_message" {
  description = "This field give the option to put in custom text. Both 'note' and 'docs' are prefixed in the template with 'note:' and 'docs:' respectively. 'custom_message' allows for free format."
  type        = string
  default     = ""
}
