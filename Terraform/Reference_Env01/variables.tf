variable "ol_subdomain" {
  type = string
  description = "Subdomain name for target OneLogin env"
}

variable "ol_client_id" {
  type = string
  description = "Client ID for API Credential created in target OneLogin env"
}

variable "ol_client_secret" {
  type = string
  description = "Client Secret for API Credential created in target OneLogin env"
}

########### User Vars ########


########### Smart Hooks Vars ###########

variable "ol_smart_hook_env_var1" {
  type = string
  description = "Name of the Smart Hooks Env Var for the New user first time login policy- used in pre-auth smart hook"
  default = "test"
}

variable "ol_policy_id_new_user" {
  type = string
  description = "User Security Policy ID for New user first time login- used in pre-auth smart hook"
  default = "1234"
}

########### Apps Vars ########

variable "ol_baseline_app_policy_id" {
  type = number
}

variable "ol_medium_risk_app_policy_id" {
  type = number
}

variable "ol_high_risk_app_policy_id" {
  type = number
}

variable "ol_custom_tab1_id" {
  type = number
}
