# Only projects directly under the organization. Projects under the class folders (SIPA Advanced Computing/*) are short-lived and left out.
locals {
  billing_account_personal = "008587-FF94E1-5C3FFB"
}

resource "google_project" "artichoke_hours" {
  project_id = "artichoke-hours"
  name       = "artichoke-hours"
  org_id     = local.org_id
}

resource "google_project" "bike_bus_map" {
  project_id      = "bike-bus-map"
  name            = "bike-bus-map"
  org_id          = local.org_id
  billing_account = local.billing_account_personal
}

resource "google_project" "computing_in_context" {
  project_id      = "computing-in-context"
  name            = "computing-in-context"
  org_id          = local.org_id
  billing_account = "01CCEB-43417F-68533F"
}

resource "google_project" "pleasant_rides" {
  project_id      = "pleasant-rides"
  name            = "Pleasant Rides"
  org_id          = local.org_id
  billing_account = local.billing_account_personal
}

resource "google_project" "pose" {
  project_id = "pose-374103"
  name       = "pose"
  org_id     = local.org_id
}
