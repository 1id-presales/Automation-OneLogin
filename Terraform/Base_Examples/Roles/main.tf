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
   uri                  = "https://${var.ol_subdomain}.onelogin.com/"
   write_returns_object = true
   oauth_client_credentials {
      oauth_client_id = var.ol_client_id
      oauth_client_secret = var.ol_client_secret
      oauth_token_endpoint = "https://${var.ol_subdomain}.onelogin.com/auth/oauth2/v2/token"
  }
}

provider "onelogin" {
  # Configuration options
client_id = var.ol_client_id
client_secret = var.ol_client_secret
}

#### Roles via OneLogin Provider

## create a birthright role for all workforce
resource onelogin_roles birthright {
  name = var.role1_name
  apps = [var.role1_appid1,var.role1_appid2]
  users = []
}

#### Roles via generic REST provider

## example of how to create a new role in your OneLogin environment
resource "restapi_object" "oneloginrole1" {
  path = "/api/2/roles"
  data = "{ \"name\": \"${var.role2_name}\", \"apps\": [${var.role2_appid}], \"users\":[], \"admins\": [${var.role2_admin_userid}]}"
}


