resource "prismacloud_enterprise_settings" "es" {
    session_timeout                     = 120
    #anomaly_training_model_threshold    = "low"
    #anomaly_alert_disposition           = "low"
    user_attribution_in_notification    = false
    default_policies_enabled            = {
        "high": false,
        "medium": false,
        "low": false,
    }
}