provider "aws" {
  region = "us-east-1"

  # The `default` profile uses a custom login_session credential mechanism the
  # AWS provider can't read directly, so this uses a `terraform` profile
  # (configured in ~/.aws/config) that wraps it via credential_process:
  #   [profile terraform]
  #   credential_process = aws configure export-credentials --profile default --format process
  profile = "terraform"
}
