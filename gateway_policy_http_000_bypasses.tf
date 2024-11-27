resource "cloudflare_zero_trust_gateway_policy" "http_bypass_app_devtooling" {
  account_id  = var.cloudflare_account_id
  action      = "off"
  description = "BUG REPORT - Do not inspect"
  enabled     = true
  filters     = ["http"]
  name        = "BUG REPORT - Development Tooling"
  precedence  = 999991
  traffic     = "any(app.ids[*] in {536 687 1238})"
  rule_settings {
    block_page_enabled                 = false
    insecure_disable_dnssec_validation = false
    ip_categories                      = false
    notification_settings {
      enabled = false
    }
  }
}

resource "cloudflare_zero_trust_gateway_policy" "http_bypass_app_list" {
  account_id  = var.cloudflare_account_id
  action      = "off"
  description = "Applications that byPass HTTPS inspections"
  enabled     = true
  filters     = ["http"]
  name        = "BUG REPORT - Bypass HTTPS Inspection"
  precedence  = 999992
  traffic     = "any(app.ids[*] in {683 707 657 658 571 712 720 729 787})"
  rule_settings {
    block_page_enabled                 = false
    insecure_disable_dnssec_validation = false
    ip_categories                      = false
    notification_settings {
      enabled = false
    }
  }
}

resource "cloudflare_zero_trust_gateway_policy" "http_do_not_inspect_m365" {
  account_id  = var.cloudflare_account_id
  action      = "off"
  description = "BUG REPORT - Bypass HTTPS decryption of Microsoft 365 traffic"
  enabled     = true
  filters     = ["http"]
  name        = "BUG REPORT - Microsoft 365 Auto Generated"
  precedence  = 999993
  traffic     = "any(app.ids[*] in {626 594 635 514 601 596 597 680})"
  rule_settings {
    block_page_enabled                 = false
    insecure_disable_dnssec_validation = false
    ip_categories                      = false
    notification_settings {
      enabled = false
    }
  }
}

resource "cloudflare_zero_trust_gateway_policy" "http_block_sec_risks" {
  account_id  = var.cloudflare_account_id
  action      = "block"
  description = "default"
  enabled     = true
  filters     = ["http"]
  name        = "BUG REPORT - Block Security Risks"
  precedence  = 999994
  traffic     = "any(http.request.uri.security_category[*] in {80 117 131 151 153})"
  rule_settings {
    block_page_enabled                 = true
    block_page_reason                  = "BUG REPORT - Security Category Block"
    insecure_disable_dnssec_validation = false
    ip_categories                      = false
  }
}
