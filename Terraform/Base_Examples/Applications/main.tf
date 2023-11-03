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

######################################################################################################
###########################          APPS Section  ###############################################

### Generic OIDC Connector APP ###

## example of how to create and configure a new OIDC app in your OneLogin environment using the generic OIDC connector
resource "restapi_object" "oidcapp1" {
  path = "/api/2/apps"
  data = "{ \"connector_id\": \"108419\", \"brand_id\": \"${var.oidc_app1_brand_id}\", \"name\": \"${var.oidc_app1_name}\", \"visible\" : \"false\" , \"notes\" : \"some notes\", \"description\":\"Some App\", \"configuration\":{\"redirect_uri\": \"${var.oidc_app1_redirect_uri}\" , \"post_logout_redirect_uri\": \"${var.oidc_app1_logout_redirect_uri}\", \"login_url\":\"${var.oidc_app1_login_url}\", \"oidc_application_type\":\"0\", \"token_endpoint_auth_method\":\"1\"}}"
}

### Generic SAML Advanced Connector APP ###

