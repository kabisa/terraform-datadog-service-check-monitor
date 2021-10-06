locals {
  include_tags = join(",", [for tag in var.include_tags : "\"${tag}\""])
  exclude_tags = join(",", [for tag in var.exclude_tags : "\"${tag}\""])

  modifier_over    = length(local.include_tags) > 0 ? ".over(${local.include_tags})" : ""
  modifier_exclude = length(local.exclude_tags) > 0 ? ".exclude(${local.exclude_tags})" : ""

  by_tags     = join(",", [for tag in var.by_tags : "\"${tag}\""])
  modifier_by = length(local.by_tags) > 0 ? ".by(${local.by_tags})" : ""

  thresholds    = [var.ok_threshold, var.warning_threshold, var.critical_threshold]
  check_count   = max(compact(local.thresholds)...) + 1
  modifier_last = ".last(${local.check_count})"

  modifiers = compact([
    local.modifier_over,
    local.modifier_exclude,
    local.modifier_by,
    local.modifier_last,
    var.track_as_cluster_level_status ? "pct_by_status()" : ".count_by_status()"
  ])

  query = "\"${var.check_name}\"${join("", local.modifiers)}"
}
