# All of these were set when the organization was created (2024-11-23), except `iam.allowedPolicyMemberDomains`, which was relaxed shortly after so that accounts outside the organization (e.g. columbia.edu) can be granted access.
#
# Uses the legacy `google_organization_policy` rather than `google_org_policy_policy`, since the latter requires the Organization Policy API to be enabled on a quota project.
locals {
  org_policy_enforced = toset([
    "compute.setNewProjectDefaultToZonalDNSOnly",
    "iam.automaticIamGrantsForDefaultServiceAccounts",
    "iam.disableServiceAccountKeyCreation",
    "iam.disableServiceAccountKeyUpload",
    "storage.uniformBucketLevelAccess",
  ])
}

resource "google_organization_policy" "enforced" {
  for_each = local.org_policy_enforced

  org_id     = local.org_id
  constraint = each.key

  boolean_policy {
    enforced = true
  }
}

resource "google_organization_policy" "restrict_protocol_forwarding_creation_for_types" {
  org_id     = local.org_id
  constraint = "compute.restrictProtocolForwardingCreationForTypes"

  list_policy {
    allow {
      values = ["INTERNAL"]
    }
  }
}

resource "google_organization_policy" "essentialcontacts_allowed_contact_domains" {
  org_id     = local.org_id
  constraint = "essentialcontacts.allowedContactDomains"

  list_policy {
    allow {
      values = ["@afeld.me"]
    }
  }
}

resource "google_organization_policy" "allowed_policy_member_domains" {
  org_id     = local.org_id
  constraint = "iam.allowedPolicyMemberDomains"

  list_policy {
    allow {
      all = true
    }
  }
}
