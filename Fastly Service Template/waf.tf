resource "fastly_service_waf_configuration" "waf" {
  waf_id                          = fastly_service_v1.tfService.waf[0].waf_id
  http_violation_score_threshold  = 100

  rule {
    modsec_rule_id = 1010090
    revision       = 1
    status         = "block"
  }
}