# `organizationViewer` is managed in advanced-computing/course-materials/terraform.
#
# Non-authoritative (one resource per role and member) and protected by `prevent_destroy`, so an edit here can't revoke a grant, e.g. by accident remove the only admin from `organizationAdmin` and lock everyone out of the organization. To revoke a grant on purpose, remove it from this map and delete the `prevent_destroy` line for that apply, or revoke it outside Terraform. Grants made outside Terraform aren't reverted.
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

  org_iam_members = merge([
    for role, members in local.org_iam : {
      for member in members : "${role}/${member}" => {
        role   = role
        member = member
      }
    }
  ]...)
}

resource "google_organization_iam_member" "this" {
  for_each = local.org_iam_members

  org_id = local.org_id
  role   = each.value.role
  member = each.value.member

  lifecycle {
    prevent_destroy = true
  }
}

# Replaced by the per-member resources above. Forget the bindings without revoking anything.
removed {
  from = google_organization_iam_binding.this

  lifecycle {
    destroy = false
  }
}
