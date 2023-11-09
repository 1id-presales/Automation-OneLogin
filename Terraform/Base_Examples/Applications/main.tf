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
  data = "{ \"connector_id\": \"108419\", \"brand_id\": \"${var.oidc_app1_brand_id}\",\"role_ids\": [${var.oidc_app1_roleid}], \"icon_url\": \"${var.oidc_app1_icon_url}\", \"name\": \"${var.oidc_app1_name}\", \"visible\" : \"${var.oidc_app1_visibility}\" , \"notes\" : \"${var.oidc_app1_notes}\", \"description\":\"${var.oidc_app1_description}\", \"configuration\":{\"redirect_uri\": \"${var.oidc_app1_redirect_uri}\" , \"post_logout_redirect_uri\": \"${var.oidc_app1_logout_redirect_uri}\", \"login_url\":\"${var.oidc_app1_login_url}\", \"oidc_application_type\":\"${var.oidc_app1_oidc_application_type}\", \"token_endpoint_auth_method\":\"${var.oidc_app1_token_endpoint_auth_method}\",\"access_token_expiration_minutes\":\"${var.oidc_app1_access_token_exp_mins}\", \"refresh_token_expiration_minutes\":\"${var.oidc_app1_refresh_token_exp_mins}\"}}"
}

### Generic SAML Advanced Connector APP ###

## example of how to create and configure a new SAML app in your OneLogin environment using the generic SAML Advanced connector
resource "restapi_object" "samlapp1" {
  path = "/api/2/apps"
  data = "{ \"connector_id\": \"110016\", \"brand_id\": \"${var.saml_app1_brand_id}\",\"role_ids\": [${var.saml_app1_roleid}], \"name\": \"${var.saml_app1_name}\", \"notes\" : \"${var.saml_app1_notes}\", \"description\":\"${var.saml_app1_description}\", \"configuration\": { \"signature_algorithm\": \"SHA-256\",\"certificate_id\": \"${var.saml_app1_conf_cert_id}\"}}"
}

