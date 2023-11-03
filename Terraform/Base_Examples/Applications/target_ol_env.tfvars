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
oidc_app1_visibility =  true     # required - True so app is visible to users as a tile in the app portal. False to hide it in app portal
