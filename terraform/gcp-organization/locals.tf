data "google_organization" "this" {
  domain = local.domain
}

locals {
  org_id = data.google_organization.this.org_id
  domain = "afeld.me"

  aidan_gmail    = "user:aidan.feldman@gmail.com"
  aidan_columbia = "user:alf2215@columbia.edu"
  afeld_me       = "domain:${local.domain}"
  # both of Aidan's accounts, so that losing access to one doesn't lock them out
  aidan = [local.aidan_gmail, "user:aidan@afeld.me"]
}
