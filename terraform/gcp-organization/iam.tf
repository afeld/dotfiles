# `organizationViewer` is managed in advanced-computing/course-materials/terraform.
#
# Non-authoritative (one resource per role and member) and protected by `prevent_destroy`, so an edit here can't revoke a grant, e.g. by accident remove the only admin from `organizationAdmin` and lock everyone out of the organization. To revoke a grant on purpose, remove it from this map and delete the `prevent_destroy` line for that apply, or revoke it outside Terraform. Grants made outside Terraform aren't reverted.
locals {
  org_iam = {
    "roles/advisorynotifications.viewer"      = [local.aidan_gmail]
    "roles/billing.admin"                     = local.aidan
    "roles/billing.creator"                   = [local.afeld_me]
    "roles/orgpolicy.policyAdmin"             = concat(local.aidan, [local.instructor])
    "roles/resourcemanager.folderAdmin"       = local.aidan
    "roles/resourcemanager.organizationAdmin" = concat(local.aidan, [local.instructor])
    "roles/resourcemanager.projectCreator"    = [local.afeld_me, local.aidan_gmail, local.instructor]
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
