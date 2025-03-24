resource "aws_cloudwatch_log_metric_filter" "info_count_filter" {
  name = "info-count"
  log_group_name = "/aws/lambda/daisy_ce9-topmovies-api"  # Replace with your actual log group name

  pattern = "[INFO]"  # Filters for logs containing "INFO"

  metric_transformation {
    name = "info-count"
    namespace = "/moviedb-api/daisy" # Replace <alias> with a meaningful identifier, e.g., "prod"
    value = "1"
    unit = "None" #Specifies the unit of the metric. In this case, it's None, as no specific unit is required.
  }
}