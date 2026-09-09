resource "aws_organizations_organization" "this" {
  feature_set          = "ALL"
  enabled_policy_types = ["SERVICE_CONTROL_POLICY"]
}

resource "aws_organizations_policy" "deny_leave_and_close_account" {
  name        = "DenyLeaveAndCloseAccount"
  description = "Prevents member accounts from leaving the organization and self closure"
  type        = "SERVICE_CONTROL_POLICY"
  content     = file("${path.module}/policies/deny-leave-and-close-account.json")
}

resource "aws_organizations_policy_attachment" "deny_leave_and_close_account" {
  policy_id = aws_organizations_policy.deny_leave_and_close_account.id
  target_id = aws_organizations_organization.this.roots[0].id
}
