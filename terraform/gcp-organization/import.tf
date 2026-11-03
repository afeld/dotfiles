import {
  # only the bindings that existed before this config; the rest are created
  for_each = { for key, grant in local.org_iam_members : key => grant if grant.role != "roles/owner" }
  to       = google_organization_iam_member.this[each.key]
  id       = "${local.org_id} ${each.value.role} ${each.value.member}"
}

import {
  to = google_folder.sipa_advanced_computing
  id = "461172646280"
}

import {
  # only the bindings that existed before this config; the rest are created
  for_each = toset(["roles/resourcemanager.folderAdmin", "roles/resourcemanager.folderViewer"])
  to       = google_folder_iam_binding.sipa_advanced_computing[each.key]
  id       = "${google_folder.sipa_advanced_computing.name} ${each.key}"
}

import {
  for_each = local.org_policy_enforced
  to       = google_organization_policy.enforced[each.key]
  id       = "${local.org_id}/${each.key}"
}

import {
  to = google_organization_policy.restrict_protocol_forwarding_creation_for_types
  id = "${local.org_id}/compute.restrictProtocolForwardingCreationForTypes"
}

import {
  to = google_organization_policy.essentialcontacts_allowed_contact_domains
  id = "${local.org_id}/essentialcontacts.allowedContactDomains"
}

import {
  to = google_organization_policy.allowed_policy_member_domains
  id = "${local.org_id}/iam.allowedPolicyMemberDomains"
}

import {
  to = google_project.artichoke_hours
  id = "artichoke-hours"
}

import {
  to = google_project.bike_bus_map
  id = "bike-bus-map"
}

import {
  to = google_project.computing_in_context
  id = "computing-in-context"
}

import {
  to = google_project.pleasant_rides
  id = "pleasant-rides"
}

import {
  to = google_project.pose
  id = "pose-374103"
}
