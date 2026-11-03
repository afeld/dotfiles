locals {
  org_id = "378073203623" # afeld.me

  aidan_gmail    = "user:aidan.feldman@gmail.com"
  aidan_afeld    = "user:aidan@afeld.me"
  aidan_columbia = "user:alf2215@columbia.edu"
  afeld_me       = "domain:afeld.me"
  course_group   = "group:advanced-computing-for-policy-all@columbia.edu"
  # both of Aidan's accounts, so that losing access to one doesn't lock them out
  aidan = [local.aidan_gmail, local.aidan_afeld]
}
