# Authenticates with Application Default Credentials: run `gcloud auth application-default login` as aidan.feldman@gmail.com.
provider "google" {}

# The Billing Budget API needs a quota project, which application-default credentials don't send by default. Its calls are billed to pleasant-rides, which has the API enabled (in that repository's Terraform).
provider "google" {
  alias                 = "billing_budgets"
  billing_project       = google_project.pleasant_rides.project_id
  user_project_override = true
}
