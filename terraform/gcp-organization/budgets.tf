# Covers every Project on the personal billing account. It only sends alerts, so a Project that needs a hard cap sets its own quotas, e.g. pleasant-rides's Routes API quota in its own repository.
resource "google_billing_budget" "personal" {
  provider        = google.billing_budgets
  billing_account = local.billing_account_personal
  display_name    = "Personal"

  # every Project on the billing account; leaving this out would keep the imported budget's filter
  budget_filter {
    projects = []
  }

  amount {
    specified_amount {
      currency_code = "USD"
      units         = "20"
    }
  }

  # emails the billing account's admins as each is crossed
  dynamic "threshold_rules" {
    for_each = [0.5, 0.9, 1.0]
    content {
      threshold_percent = threshold_rules.value
    }
  }
}

# created in pleasant-rides's Terraform
import {
  to = google_billing_budget.personal
  id = "billingAccounts/${local.billing_account_personal}/budgets/ee256d89-6faf-4e42-a2ea-9bf1db46785d"
}
