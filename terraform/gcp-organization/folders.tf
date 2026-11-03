# The Spring 2025 and Spring 2026 sub-folders are managed in advanced-computing/course-materials/terraform.
resource "google_folder" "sipa_advanced_computing" {
  display_name = "SIPA Advanced Computing"
  parent       = "organizations/${local.org_id}"
}

# IAM on a folder is inherited by its sub-folders and projects, so these also apply to Spring 2025 and Spring 2026. `folderAdmin` is redundant with the organization-level grant, but exists, so it's imported.
locals {
  sipa_advanced_computing_iam = {
    "roles/resourcemanager.folderAdmin"  = ["user:alf2215@columbia.edu"]
    "roles/resourcemanager.folderEditor" = ["user:alf2215@columbia.edu"]
    "roles/resourcemanager.folderViewer" = ["group:advanced-computing-for-policy-all@columbia.edu"]
  }
}

resource "google_folder_iam_binding" "sipa_advanced_computing" {
  for_each = local.sipa_advanced_computing_iam

  folder  = google_folder.sipa_advanced_computing.name
  role    = each.key
  members = each.value
}
