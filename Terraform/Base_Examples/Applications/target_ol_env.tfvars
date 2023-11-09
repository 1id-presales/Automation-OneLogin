/* set ol_client_secret via your environment variables with the command export TF_VAR_ol_client_secret="xxxxxxx". 
Do not store in text files. If your target OneLogin environment is example.onelogin.com then populate ol_subdomain like 
below */

ol_subdomain = "example"      # required
ol_client_id = ""             # required

## OIDC App Vars ##
oidc_app1_brand_id = ""        # optional - leave blank for this app to use master brand. Or configure brand id if using app level branding
oidc_app1_login_url = ""       # optional - OneLogin mimics an IdP-initiated SSO experience and directs the user to the app's login page, where the SP-initiated authorization flow begins.
oidc_app1_name = ""            # required
oidc_app1_roleid = ""         # optional - Role ID to be allocated directly to the application
oidc_app1_icon_url = "/images/missing_connector_icon/square/original2.png"   # optional url for the icon for this app to be displayed in App Portal
oidc_app1_redirect_uri = ""    # required
oidc_app1_logout_redirect_uri = ""    # optional - If you want to establish redirects for after the user is logged out by OIDC
oidc_app1_notes = ""           # optional - Notes to be displayed within the app
oidc_app1_description = ""     # optional - Description to be displayed for the app
oidc_app1_visibility =  true     # required - true so app is visible to users as a tile in the app portal. false to hide it in app portal
oidc_app1_oidc_application_type = "0" # required - 0 for a web app , 1 for native app, defaults to 0
oidc_app1_token_endpoint_auth_method = "0" # required - token endpoint authentication type. 0 for BASIC,  1 for POST  , 2 for PKCE, defaults to 0
oidc_app1_access_token_exp_mins = "60"  # optional - Access token timeout settings. defaults is 60 mins
oidc_app1_refresh_token_exp_mins = "43200"  # optional -  Refresh token timeout settings. defaults is 30 days/43,200 mins


## SAML App Vars ##
saml_app1_brand_id = ""        # optionial - leave blank for this app to use master brand. Or configure brand id if using app level branding
saml_app1_name = ""            # required
saml_app1_roleid = ""         # optionial - Role ID to be allocated directly to the application
saml_app1_policyid = ""            # optionial - App Policy ID to be allocated directly to the application
saml_app1_icon_url = "/images/missing_connector_icon/square/original2.png"   # optional url for the icon for this app to be displayed in App Portal
saml_app1_notes = ""           # optionial - Notes to be displayed within the app
saml_app1_description = ""     # optionial - Description to be displayed for the app
saml_app1_visibility =  true     # required - true so app is visible to users as a tile in the app portal. false to hide it in app portal
saml_app1_conf_cert_id = ""    # optionial - certificate id to be allocated to the SAML app for token signing
saml_app1_conf_audience = ""    # optionial - Saml audience
saml_app1_conf_consumer_url = ""    # optionial - ACS/Consumer URL 
saml_app1_conf_encrypt_assertion = ""    # optionial - Encrypt issued assertions yes / no
saml_app1_conf_generate_attribute_value_tags = ""    # optionial - 
saml_app1_conf_login = ""    # optionial - Login URL - Only required if you select Service Provider as the SAML Initiater.
saml_app1_conf_logout_url = ""    # optionial - Single Logout URL - 
saml_app1_conf_recipient = ""    # optionial - SAML Recipient  -
saml_app1_conf_relaystate = ""    # optionial - SAML Relaystate - 
saml_app1_conf_saml_encryption_method_id = ""    # optionial -   -
saml_app1_conf_saml_initiater_id = ""    # optionial - SAML Initiater - OneLogin or SP
saml_app1_conf_saml_issuer_type = ""    # optionial -   -
saml_app1_conf_saml_nameid_format_id = ""    # optionial -
saml_app1_conf_saml_nameid_format_id_slo = ""    # optionial -   -
saml_app1_conf_saml_notbefore = ""    # optionial -
saml_app1_conf_saml_notonorafter = ""    # optionial -
saml_app1_conf_saml_sessionnotonorafter = ""    # optionial -   -
saml_app1_conf_saml_sign_element = ""    # optionial -
saml_app1_conf_sign_slo_request = ""    # optionial -
saml_app1_conf_sign_slo_response = ""    # optionial -   -
saml_app1_conf_signature_algorithm = ""    # optionial -
saml_app1_conf_validator = ""    # optionial -

