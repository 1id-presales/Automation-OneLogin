/* set ol_client_secret via your environment variables with the command export TF_VAR_ol_client_secret="xxxxxxx". 
Do not store in text files. If your target OneLogin environment is example.onelogin.com then populate ol_subdomain like 
below. Ensure to populate the value of the ol_policy_id_new_user variable with a policy id from your target OneLogin environment. */

ol_subdomain = "example"
ol_client_id = ""
ol_smart_hook_env_var1 = "NewUserPol"
ol_policy_id_new_user = ""
