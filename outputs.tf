output "alert_id" {
  value = var.enabled ? datadog_monitor.monitor[0].id : null
}
