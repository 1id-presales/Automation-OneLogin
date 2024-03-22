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

########### Roles Vars ###########

variable "ol_app_entitlements_role_names" {
  type        = list(string)
  description = "list of all the OL Application Entitlements Roles that were created"
}

variable "ol_pam_user_list" {
  type = list(object({
    name = string
  }))
}

variable "ol_oneidentity_pam_admins_role_id" {
  type = number
}

variable "ol_oneidentity_pam_users_role_id" {
  type = number
}

variable "ol_oneidentity_pam_auditors_role_id" {
  type = number
}

variable "ol_users" {
  type = list(object({
    username           = string
    firstname          = string
    lastname           = string
    email              = string
    department         = string
    phone              = string
    title              = string
    company            = string
    state              = number
    status             = number
    custom_attributes  = map(string)
  }))
}

########### Groups Vars ###########

variable "ol_adm_users_group_id" {
  type = number
}

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

variable "ol_application_object" {
  type = list(object({
    connector_id = number
    name = string
    visible = bool
    description = string
    notes = string
    allow_assumed_signin = bool
    birthright_app = string
    app_owner = string
  }))
}

variable "ol_application_with_app_policy_object" {
  type = list(object({
    connector_id = number
    policy_id = number
    name = string
    visible = bool
    description = string
    notes = string
    allow_assumed_signin = bool
    tab_id = number
    birthright_app = string
    app_owner = string
  }))
}