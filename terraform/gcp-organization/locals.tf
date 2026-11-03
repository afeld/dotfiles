locals {
  org_id = "378073203623" # afeld.me

  aidan_gmail    = "user:aidan.feldman@gmail.com"
  aidan_columbia = "user:alf2215@columbia.edu"
  afeld_me       = "domain:afeld.me"
  # both of Aidan's accounts, so that losing access to one doesn't lock them out
  aidan = [local.aidan_gmail, "user:aidan@afeld.me"]
}
