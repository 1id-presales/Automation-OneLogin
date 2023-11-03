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

########### Apps Vars ###############

variable "oidc_app1_name" {
  type = string
  default = ""
}

variable "oidc_app1_brand_id" {
  type = string
  default = ""
}

variable "oidc_app1_logout_redirect_uri" {
  type = string
  default = ""
}

variable "oidc_app1_redirect_uri" {
  type = string
  default = ""
}

variable "oidc_app1_login_url" {
  type = string
  default = ""
}

variable "oidc_app1_notes" {
  type = string
  default = ""
}

variable "oidc_app1_description" {
  type = string
  default = ""
}

variable "oidc_app1_visibility" {
  type = bool
  default = true
}
