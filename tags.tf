locals {
  tag_specials_regex = "/[^a-z0-9\\-_:.\\/]/"

  tags = concat(
    [
      "terraform:true",
      "env:${var.env}",
      "service:${var.service}",
    ],
    var.additional_tags
  )

  # Normalize all the tags according to best practices defined by Datadog. The
  # following changes are made:
  #
  # * Make all characters lowercase.
  # * Replace special characters with an underscore.
  # * Remove duplicate underscores.
  # * Remove any non-letter leading characters.
  # * Remove any trailing underscores.
  #
  # See: https://docs.datadoghq.com/developers/guide/what-best-practices-are-recommended-for-naming-metrics-and-tags
  normalized_tags = [
    for tag
    in local.tags :
    replace(
      replace(
        replace(
          replace(lower(tag), local.tag_specials_regex, "_")
          ,
          "/_+/",
          "_"
        ),
        "/^[^a-z]+/",
        ""
      ),
      "/_+$/",
      ""
    )
  ]
}

