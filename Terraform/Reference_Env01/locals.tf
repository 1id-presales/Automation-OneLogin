locals {
  ol_users = [
    {
      username   = "James.Smith"
      firstname  = "James"
      lastname   = "Smith"
      email      = "james.smith@Cedarstone.com"
      department = "Sales ops"
      title      = "Manager"
      company    = "Cedarstone"
      phone      = "1234445566"
      state      = 1
      status     = 1
      custom_attributes = {
        staff_id = "123456"
        personal_mail = "james.smith66666666@gmail.com"
      }
    },
   {
      username   = "Jane.smith"
      firstname  = "Jane"
      lastname   = "smith"
      email      = "jane.smith@Cedarstone.com"
      department = "IT ops"
      title      = "Manager"
      company    = "Cedarstone"
      phone      = "4343434434"
      state      = 1
      status     = 1
      custom_attributes = {
        staff_id = "434344"
        personal_mail = "jane.smith66666666@gmail.com"
      }
    }
    # Add more standard users here
  ]
ol_application_object = [
{
        "allow_assumed_signin": false,
        "app_owner": "jane.smith@Cedarstone.com",
        "birthright_app": "",
        "connector_id": 78887,
        "display_name": "AWS IAM Identity Center",
        "name": "AWS_IAM_Identity_Center",
        "visible": true,
        "ldap_access_group": "N/A"
    },
{
        "allow_assumed_signin": false,
        "app_owner": "",
        "birthright_app": "true",
        "connector_id": 68023,
        "display_name": "Zugata",
        "name": "Zugata",
        "visible": true,
        "ldap_access_group": "N/A"
    }
]
ol_application_with_app_policy_object = [
{
        "allow_assumed_signin": false,
        "app_owner": "",
        "policy_id": "${var.ol_medium_risk_app_policy_id}",
        "tab_id": "${var.ol_custom_tab1_id}",
        "birthright_app": "",
        "connector_id": 68332,
        "display_name": "Wrike",
        "name": "Wrike",
        "visible": false,
        "ldap_access_group": "N/A"
    }
]
}
