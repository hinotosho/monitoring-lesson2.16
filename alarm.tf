# Create the SNS Topic for notifications
resource "aws_sns_topic" "alert-topic" {
  name = "daisy-alert-topic" # Replace <alias> with your chosen identifier 
}

#Subscribes your email address to the SNS topic so you can receive alarm notifications.
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.alert-topic.arn
  protocol = "email"
  endpoint = "hitori.no.hasu@gmail.com"
}

# Create the CloudWatch Alarm
resource "aws_cloudwatch_metric_alarm" "info_count_alarm" {
  alarm_name = "daisy-info-count-breach"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods = 1
  metric_name = "info-count"
  namespace = "/moviedb-api/daisy"
  period = 60 # Metric evaluation period (1 minute)
  statistic = "Sum"
  threshold = 10
  alarm_description = "Alarm triggered when the info-count metric exceeds 10 in a 1-minute interval."
  alarm_actions = [aws_sns_topic.alert-topic.arn]
  ok_actions = [aws_sns_topic.alert-topic.arn]
  unit = "None" 
}