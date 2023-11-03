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

variable "role1_name" {
  type = string
  description = "Name for the OneLogin role"
}

variable "role1_appid1" {
  type = string
  default = null
  description = "Appid of the App to associate to the OneLogin role"
}

variable "role2_name" {
  type = string
  description = "Name for the OneLogin role"
}

variable "role2_appid" {
  type = string
  default = null
  description = "Appid of the App to associate to the OneLogin role"
}

variable "role2_admin_userid" {
  type = string
  default = null
  description = "Userid for the user who will be the admin for the OneLogin role"
}
