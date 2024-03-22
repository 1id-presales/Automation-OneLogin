/* set ol_client_secret via your environment variables with the command export TF_VAR_ol_client_secret="xxxxxxx". 
Do not store in text files. If your target OneLogin environment is example.onelogin.com then populate ol_subdomain like 
below */

ol_subdomain = ""  # required 
ol_client_id = ""         # required

##### Smart Hooks Vars #######
ol_smart_hook_env_var1 = "NewUserPol"
ol_policy_id_new_user = ""     # required

#### Users Vars ####

ol_users = [
    {
      username   = "user1"
      firstname  = "John"
      lastname   = "Doe"
      email      = "john.doooe@Cedarstone.com"
      department = "Sales"
      title      = "Manager"
      company    = "Cedarstone"
      phone      = "1234445566"
      state      = 1
      status     = 1
      custom_attributes = {
        staff_id = "12345"
        personal_mail = "TBC"
      }
    },
    # Add more standard users here
  ]

##### Apps Vars #######

ol_baseline_app_policy_id = ""    # required

### Here define your list of applicatons which should be protected by the baseline app policy id defined above ####
ol_application_object = [
  {
            connector_id : 68332,
            name : "Wrike"
    description = "BU: Sales operations"
    notes = "custom_attribute_app_Wrike"
    visible = true
    allow_assumed_signin = false
    birthright_app = "yes"
    app_owner = ""      # required -  email address of admin user responsible for configuring up the app connector
        },
# Add more Apps here
]

### Here define your list of applicatons which should be protected by the specific app policy ids you define in each app object ####
ol_application_with_app_policy_object = [
{
            connector_id : 68251,
            name : "Lever"
            policy_id = TBC
    tab_id = TBC
    description = "BU: Sales operations"
    notes = "custom_attribute_app_Lever"
    visible = true
    allow_assumed_signin = false
    birthright_app = ""
    app_owner = ""      # required -  email address of admin user responsible for configuring up the app connector
        },
# Add more Apps here
]
