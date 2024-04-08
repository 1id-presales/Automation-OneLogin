locals {
  ol_users = [
    {
      username   = "James.smith"
      firstname  = "James"
      lastname   = "smith"
      email      = "james.smith@Cedarstone.com"
      department = "Sales ops"
      title      = "Manager"
      company    = "Cedarstone"
      phone      = "1234445566"
      state      = 1
      status     = 1
      custom_attributes = {
        staff_id = "12345"
        personal_mail = "james.smith66666666@gmail.com"
      }
    },
    # Add more standard users here
  ]
ol_application_object = [
  {
            connector_id : 68332,
            name : "Wrike"
    notes = "custom_attribute_app_Wrike"
    visible = true
    allow_assumed_signin = false
    birthright_app = ""
    app_owner = "james.smith@Cedarstone.com"      # required -  email address of admin user responsible for configuring up the app connector
        }
# Add more Apps here
]

ol_application_with_app_policy_object = [
{
            connector_id : 68251,
            name : "Lever"
            policy_id = var.ol_high_risk_app_policy_id
    tab_id = var.ol_custom_tab1_id
    notes = "custom_attribute_app_Lever"
    visible = true
    allow_assumed_signin = false
    birthright_app = ""
    app_owner = ""      # required -  email address of admin user responsible for configuring up the app connector
        },
# Add more Apps here
]
}
