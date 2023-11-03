/* set ol_client_secret via your environment variables with the command export TF_VAR_ol_client_secret="xxxxxxx". 
Do not store in text files. If your target OneLogin environment is example.onelogin.com then populate ol_subdomain like 
below */

ol_subdomain = "example"
ol_client_id = ""

## App Vars ##
oidc_app1_brand_id = ""        # optionial - leave blank for this app to use master brand. Or configure brand id if using app level branding
oidc_app1_login_url = ""       # optionial - OneLogin mimics an IdP-initiated SSO experience and directs the user to the app's login page, where the SP-initiated authorization flow begins.
oidc_app1_name = ""            # required
oidc_app1_redirect_uri = ""    # required
oidc_app1_logout_redirect_uri = ""    # optionial - If you want to establish redirects for after the user is logged out by OIDC
oidc_app1_notes = ""           # optionial - Notes to be displayed within the app
oidc_app1_description = ""     # optionial - Description to be displayed for the app
oidc_app1_visibility =  true     # required - true so app is visible to users as a tile in the app portal. false to hide it in app portal
oidc_app1_oidc_application_type = "0" # required - 0 for a web app , 1 for native app, defaults to 0
oidc_app1_token_endpoint_auth_method = "1" # required - token endpoint authentication type. 0 for BASIC,  1 for POST  , 2 for PKCE, defaults to 1
