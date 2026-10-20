# Created in the management account, so it tracks consolidated spend across
# every account in the organization. Matches the "Zero spend budget" template
# in the AWS Budgets console: email as soon as actual spend exceeds $0.01.
resource "aws_budgets_budget" "zero_spend" {
  name         = "zero-spend"
  budget_type  = "COST"
  limit_amount = "0.01"
  limit_unit   = "USD"
  time_unit    = "MONTHLY"

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["aidan.feldman+aws@gmail.com"]
  }
}
