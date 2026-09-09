resource "aws_organizations_account" "ioi_wildfire" {
  name      = "ioi-wildfire"
  email     = "aidan.feldman+ioi-wildfire@gmail.com"
  role_name = "OrganizationAccountAccessRole"
}
