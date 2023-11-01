variable "client_id" {
  type = string
  default = ""
}

variable "client_secret" {
  type = string
  default = ""
}

variable "ol_subdomain" {
  type = string
  description = "Subdomain name for target OneLogin env"
}

########### Users Vars ###########

variable "user1_username" {
  type = string
  default = ""
}

variable "user1_email" {
  type = string
  default = ""
}

variable "user1_firstname" {
  type = string
  default = ""
}

variable "user1_lastname" {
  type = string
  default = ""
}

variable "user2_username" {
  type = string
  default = ""
}

variable "user2_email" {
  type = string
  default = ""
}

variable "user2_firstname" {
  type = string
  default = ""
}

variable "user2_lastname" {
  type = string
  default = ""
}
