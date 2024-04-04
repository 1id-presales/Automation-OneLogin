/* set ol_client_secret via your environment variables with the command export TF_VAR_ol_client_secret="xxxxxxx". 
Do not store in text files. If your target OneLogin environment is example.onelogin.com then populate ol_subdomain like 
below */

ol_subdomain = "example"  # required 
ol_client_id = ""         # required

##### Smart Hooks Vars #######
ol_smart_hook_env_var1 = "NewUserPol"
ol_policy_id_new_user = ""     # required

##### Apps Vars #######

ol_baseline_app_policy_id = ""    # required
ol_medium_risk_app_policy_id = ""    # required
ol_high_risk_app_policy_id = ""    # required
ol_custom_tab1_id = ""    # required
