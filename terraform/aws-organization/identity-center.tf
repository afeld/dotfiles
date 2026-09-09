# IAM Identity Center gives a single sign-in portal with one tile per account,
# so switching accounts in the console is a click instead of a role-switch.
#
# The organization instance itself must be enabled once by hand in the
# management account console (IAM Identity Center > Enable > Organization
# instance). Everything below is managed here afterwards.

data "aws_ssoadmin_instances" "this" {}

locals {
  sso_instance_arn  = tolist(data.aws_ssoadmin_instances.this.arns)[0]
  identity_store_id = tolist(data.aws_ssoadmin_instances.this.identity_store_ids)[0]
}

resource "aws_ssoadmin_permission_set" "admin" {
  name             = "AdministratorAccess"
  description      = "Full access to the account"
  instance_arn     = local.sso_instance_arn
  session_duration = "PT12H"
}

resource "aws_ssoadmin_managed_policy_attachment" "admin" {
  instance_arn       = local.sso_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.admin.arn
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_identitystore_user" "aidan" {
  identity_store_id = local.identity_store_id

  user_name    = "aidan"
  display_name = "Aidan Feldman"

  name {
    given_name  = "Aidan"
    family_name = "Feldman"
  }

  emails {
    value   = "aidan.feldman+idc@gmail.com"
    primary = true
  }
}

# Grant Aidan AdministratorAccess to every account in the org, including the
# management account. New accounts are picked up on the next `terraform apply`.
resource "aws_ssoadmin_account_assignment" "aidan_admin" {
  for_each = toset(aws_organizations_organization.this.accounts[*].id)

  instance_arn       = local.sso_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.admin.arn

  principal_type = "USER"
  principal_id   = aws_identitystore_user.aidan.user_id

  target_type = "AWS_ACCOUNT"
  target_id   = each.value
}
