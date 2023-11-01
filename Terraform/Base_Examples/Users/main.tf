terraform {
  required_providers {
    restapi = {
      source = "Mastercard/restapi"
      version = "1.18.2"
    }
    onelogin = {
      source  = "onelogin/onelogin"
      version = "0.2.0"
    }
  }
}

provider "restapi" {
  # Configuration options
   uri                  = "https://api.us.onelogin.com/"
   write_returns_object = true
   oauth_client_credentials {
      oauth_client_id = var.client_id
      oauth_client_secret = var.client_secret
      oauth_token_endpoint = "https://api.us.onelogin.com/auth/oauth2/v2/token"
  }
}

provider "onelogin" {
  # Configuration options
client_id = var.client_id
client_secret = var.client_secret
}

#### DA Users via OneLogin Provider
# create a new user using the offical OneLogin Terraform Provider
resource onelogin_users username {
  username = var.user1_username
  email    = var.user1_email
  firstname = var.user1_firstname
  lastname = var.user1_lastname
  status = 1
  state = 1
  custom_attributes = {food = "pizza"}
}

#### DA Users via generic REST Provider
## example of how to create a second new user in your OneLogin environment this time using the generic Rest Provider and our V2 users endpoint
resource "restapi_object" "oneloginuser1" {
  path = "/api/2/users"
  data = "{ \"email\": \"${var.user2_email}\", \"username\": \"${var.user2_username}\", \"firstname\": \"${var.user2_firstname}\", \"lastname\": \"${var.user2_lastname}\"}"
}
