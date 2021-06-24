variable "alerting_enabled" {
  type    = bool
  default = true
}

variable "enabled" {
  type    = bool
  default = true
}

variable "notification_channel" {
  type    = string
  default = ""
}

variable "name" {
  type = string
}

variable "service" {
  type = string
}

variable "check_name" {
  description = <<-DOC
    Name of the check monitored. If this check is not ok for a number of times,
    as defined by the threshold, an alert is raised.
  DOC

  type = string
}

variable "include_tags" {
  description = <<-DOC
    List of tags for the "over" part of the query. Can be either key:value tags
    or boolean tags.
  DOC

  type    = list(string)
  default = []
}

variable "exclude_tags" {
  description = <<-DOC
    List of tags for the "exclude" part of the query. Can be either key:value
    tags or boolean tags.
  DOC

  type    = list(string)
  default = []
}

variable "by_tags" {
  description = <<-DOC
    List of tags for the "by" part of the query. This should only include the
    keys of key:value type tags.
  DOC

  type    = list(string)
  default = []
}

variable "alert_message" {
  type = string
}

variable "recovery_message" {
  type    = string
  default = ""
}

variable "note" {
  type    = string
  default = ""
}

variable "docs" {
  type    = string
  default = ""
}

variable "env" {
  type = string
}

variable "severity" {
  type    = string
  default = "major"
}

variable "additional_tags" {
  type    = list(string)
  default = []
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
  type    = bool
  default = false
}

variable "locked" {
  type    = bool
  default = true
}

variable "name_prefix" {
  type    = string
  default = ""
}

variable "name_suffix" {
  type    = string
  default = ""
}

variable "priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = null
}

variable "auto_resolve_time_h" {
  description = "Time of hours after which a triggered monitor that receives no data is automatically resolved."

  type    = number
  default = null
}

variable "custom_message" {
  description = "This field give the option to put in custom text. Both 'note' and 'docs' are prefixed in the template with 'note:' and 'docs:' respectively. 'custom_message' allows for free format"
  type        = string
  default     = ""
}
