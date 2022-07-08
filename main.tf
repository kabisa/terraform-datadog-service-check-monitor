locals {
  notification_channel = var.alerting_enabled ? var.notification_channel : ""
  service_display_name = var.service_display_name != null ? var.service_display_name : var.service
}

resource "datadog_monitor" "monitor" {
  count = var.enabled ? 1 : 0

  name = join(" - ", compact([
    var.name_prefix,
    local.service_display_name,
    var.name,
    var.name_suffix
  ]))

  type  = "service check"
  query = local.query

  message = templatefile("${path.module}/alert.tpl", {
    alert_message    = var.alert_message
    recovery_message = var.recovery_message
    no_data_message  = var.no_data_message

    note           = var.note
    docs           = var.docs
    custom_message = var.custom_message

    notification_channel = local.notification_channel
  })

  tags     = local.normalized_tags
  priority = var.priority

  no_data_timeframe = var.no_data_timeframe
  notify_no_data    = var.notify_no_data
  timeout_h         = var.auto_resolve_time_h

  require_full_window = var.require_full_window
  new_group_delay     = var.new_group_delay

  monitor_thresholds {
    critical = var.critical_threshold
    warning  = var.warning_threshold
    ok       = var.ok_threshold
  }

  locked = var.locked
}
