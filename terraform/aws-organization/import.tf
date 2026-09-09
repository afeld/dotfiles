import {
  to = aws_organizations_organization.this
  id = "o-pprh6vjzi6"
}

import {
  to = aws_organizations_policy.deny_leave_and_close_account
  id = "p-wdqaz5g1"
}

import {
  to = aws_organizations_policy_attachment.deny_leave_and_close_account
  id = "r-3pix:p-wdqaz5g1"
}
