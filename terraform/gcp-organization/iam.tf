# `organizationViewer` is managed in advanced-computing/course-materials/terraform.
#
# Authoritative per role, so a grant made outside Terraform is shown as drift for any role listed here.
locals {
  org_iam = {
    "roles/advisorynotifications.viewer"      = ["user:aidan.feldman@gmail.com"]
    "roles/billing.admin"                     = ["user:aidan.feldman@gmail.com", "user:aidan@afeld.me"]
    "roles/billing.creator"                   = ["domain:afeld.me"]
    "roles/orgpolicy.policyAdmin"             = ["user:aidan.feldman@gmail.com", "user:aidan@afeld.me", "user:alf2215@columbia.edu"]
    "roles/resourcemanager.folderAdmin"       = ["user:aidan.feldman@gmail.com", "user:aidan@afeld.me"]
    "roles/resourcemanager.organizationAdmin" = ["user:aidan.feldman@gmail.com", "user:aidan@afeld.me", "user:alf2215@columbia.edu"]
    "roles/resourcemanager.projectCreator"    = ["domain:afeld.me", "user:aidan.feldman@gmail.com", "user:alf2215@columbia.edu"]
  }
}

resource "google_organization_iam_binding" "this" {
  for_each = local.org_iam

  org_id  = local.org_id
  role    = each.key
  members = each.value
}
