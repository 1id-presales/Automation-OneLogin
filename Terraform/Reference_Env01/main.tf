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
url= "https://${var.ol_subdomain}.onelogin.com"
}

########## APPS Section ##################
##### Add Company Apps without configuration with baseline app policy id set #####
##### Create a number of Company Apps in your OneLogin environment based on the Applications defined in tfvars file  #####
resource "restapi_object" "company_apps" {
  path = "/api/2/apps"
  for_each = { for inst in var.ol_application_object : inst.notes => inst }
  data = "{ \"connector_id\": \"${each.value.connector_id}\", \"name\":\"${each.value.name}\", \"policy_id\": \"${var.ol_baseline_app_policy_id}\", \"visible\":\"${each.value.visible}\", \"description\":\"${each.value.description}\", \"notes\":\"${each.value.notes}\", \"allow_assumed_signin\":\"${each.value.allow_assumed_signin}\"}"
}
##### Add Company Apps without configuration with specific app policy id set #####
##### Create a number of Company Apps in your OneLogin environment based on the Applications defined in tfvars file  #####
resource "restapi_object" "company_apps2" {
  path = "/api/2/apps"
  for_each = { for inst in var.ol_application_with_app_policy_object : inst.notes => inst }
  data = "{ \"connector_id\": \"${each.value.connector_id}\", \"name\":\"${each.value.name}\", \"policy_id\": \"${each.value.policy_id}\", \"visible\":\"${each.value.visible}\", \"description\":\"${each.value.description}\", \"notes\":\"${each.value.notes}\", \"allow_assumed_signin\":\"${each.value.allow_assumed_signin}\", \"tab_id\":\"${each.value.tab_id}\"}"
}

##### ROLES ######

##### Create a App Access OneLogin Role for each application with baseline app policy created in the above step  #####
resource onelogin_roles app_access {
  name = "AA-${each.value.name}"
  depends_on = [
    restapi_object.company_apps
  ]
  for_each = { for inst in var.ol_application_object : inst.notes => inst }
  apps = [restapi_object.company_apps["${each.value.notes}"].id]
  users = []
}

##### Create a App Access OneLogin Role for each application with specific app policy created in the above step  #####
resource onelogin_roles app_access2 {
  name = "AA-${each.value.name}"
  depends_on = [
    restapi_object.company_apps2
  ]
  for_each = { for inst in var.ol_application_with_app_policy_object : inst.notes => inst }
  apps = [restapi_object.company_apps2["${each.value.notes}"].id]
  users = []
}

##### Create a App Access OneLogin Role for each application with baseline app policy created in the above step  #####
resource onelogin_roles app_entitlements_1 {
  name = "AE-${each.value.name}-L1"
  depends_on = [
    restapi_object.company_apps
  ]
  for_each = { for inst in var.ol_application_object : inst.notes => inst }
  apps = []
  users = []
}

##### Create a App Access OneLogin Role for each application with baseline app policy created in the above step  #####
resource onelogin_roles app_entitlements_2 {
  name = "AE-${each.value.name}-L2"
  depends_on = [
    restapi_object.company_apps
  ]
  for_each = { for inst in var.ol_application_object : inst.notes => inst }
  apps = []
  users = []
}

##### Create a App Access OneLogin Role for each application with baseline app policy created in the above step  #####
resource onelogin_roles app_entitlements_3 {
  name = "AE-${each.value.name}-L3"
  depends_on = [
    restapi_object.company_apps
  ]
  for_each = { for inst in var.ol_application_object : inst.notes => inst }
  apps = []
  users = []
}


##### Create a Delegated Admin OneLogin Role for each application with baseline app policy created in the above step  #####
resource onelogin_roles da_apps1_admin1 {
  name = "DA-APP-${each.value.name} Admin1"
  depends_on = [
    restapi_object.company_apps
  ]
  for_each = { for inst in var.ol_application_object : inst.notes => inst }
  apps = []
  users = []
}

##### Create a Delegated Admin OneLogin Role for each application with baseline app policy created in the above step  #####
resource onelogin_roles da_apps1_admin2 {
  name = "DA-APP-${each.value.name} Admin2"
  depends_on = [
    restapi_object.company_apps
  ]
  for_each = { for inst in var.ol_application_object : inst.notes => inst }
  apps = []
  users = []
}

##### Create Delegated Admin OneLogin Role for each application with specific app policy created in the above step  #####
resource onelogin_roles da_apps2_admin1 {
  name = "DA-APP-${each.value.name} Admin1"
  depends_on = [
    restapi_object.company_apps2
  ]
  for_each = { for inst in var.ol_application_with_app_policy_object : inst.notes => inst }
  apps = []
  users = []
}

##### Create a Delegated Admin OneLogin Role for each application with baseline app policy created in the above step  #####
resource onelogin_roles da_apps2_admin2 {
  name = "DA-APP-${each.value.name} Admin2"
  depends_on = [
    restapi_object.company_apps
  ]
  for_each = { for inst in var.ol_application_with_app_policy_object : inst.notes => inst }
  apps = []
  users = []
}

##### MAPPINGS #######

##### Mapping to automatically allocate the relevant App Access OneLogin Role (for App with baseline app policy set) to a user when the related custom field for the Application is set to TRUE ######
resource onelogin_user_mappings app_access_mapping {
  name = "APP-ACCESS-${each.value.name}"
  enabled = true
  match = "any"
  for_each = { for inst in var.ol_application_object : inst.notes => inst }
  actions  {
    value = [onelogin_roles.app_access["${each.value.notes}"].id]
    action = "add_role"
  }
  conditions  {
    operator = "~"
    source = "${each.value.notes}"
    value = "TRUE"
  }
  conditions  {
    operator = "="
    source = "email"
    value = "${each.value.app_owner}"
  }
}


##### Mapping to automatically allocate the relevant App Access OneLogin Role (for App with specific app policy set) to a user when the related custom field for the Application is set to TRUE ######
resource onelogin_user_mappings app_access_mapping2 {
  name = "APP-ACCESS-${each.value.name}"
  enabled = true
  match = "any"
  for_each = { for inst in var.ol_application_with_app_policy_object : inst.notes => inst }
  actions  {
    value = [onelogin_roles.app_access2["${each.value.notes}"].id]
    action = "add_role"
  }
  conditions  {
    operator = "~"
    source = "${each.value.notes}"
    value = "TRUE"
  }
  conditions  {
    operator = "="
    source = "email"
    value = "${each.value.app_owner}"
  }
}

#### Mapping to set delegated admin for app_owner user for each app
resource onelogin_user_mappings app_access_mappingdoh_app_owner {
  name = "DA-App-Owner-${each.value.name}"
  enabled = true
  match = "all"
  for_each = { for inst in var.ol_application_object : inst.notes => inst }
  actions  {
    value = [onelogin_roles.da_apps1_admin1["${each.value.notes}"].id]
    action = "add_role"
  }
  conditions  {
    operator = "="
    source = "email"
    value = "${each.value.app_owner}"
  }
}

#### Mapping to set delegated admin 1 role for each app

resource onelogin_user_mappings app_access_mappingdoh {
  name = "DA-Admin1-${each.value.name}"
  enabled = true
  match = "all"
  for_each = { for inst in var.ol_application_object : inst.notes => inst }
  actions  {
    value = [onelogin_roles.da_apps1_admin1["${each.value.notes}"].id]
    action = "add_role"
  }
  conditions  {
    operator = "="
    source = "${each.value.notes}"
    value = "TRUE-L3"
  }
  conditions  {
    operator = "~"
    source = "email"
    value = "ADM_"
  }
}

##### Mapping to automatically allocate the relevant App Access OneLogin Role (for App with specific app policy set) to a user when the related custom field for the Application is set to TRUE ######
resource onelogin_user_mappings app_access_birthright {
  name = "BIRTHRIGHT-APP-ACCESS-${each.value.name}"
  enabled = true
  match = "all"
  for_each = { for key, val in var.ol_application_object :
  	key => val if val.birthright_app == "yes" }
  actions  {
    value = [onelogin_roles.app_access["${each.value.notes}"].id]
    action = "add_role"
  }
  conditions  {
    operator = "~"
    source = "email"
    value = "@"
  }
  conditions  {
    operator = "!~"
    source = "email"
    value = "adm_"
  }
}

##### Mapping to automatically allocate the relevant App Access OneLogin Role (for App with specific app policy set) to a user when the related custom field for the Application is set to TRUE ######
resource onelogin_user_mappings app_access_birthright2 {
  name = "BIRTHRIGHT-APP-ACCESS-${each.value.name}"
  enabled = true
  match = "all"
  for_each = { for key, val in var.ol_application_with_app_policy_object :
  	key => val if val.birthright_app == "true" }
  actions  {
    value = [onelogin_roles.app_access2["${each.value.notes}"].id]
    action = "add_role"
  }
  conditions  {
    operator = "~"
    source = "email"
    value = "@"
  }
  conditions  {
    operator = "!~"
    source = "email"
    value = "adm_"
  }
}

#### Mapping to set delegated admin for app_owner user for each app
resource onelogin_user_mappings app_entitlements_1_mapping {
  name = "Allocate AE Role-${each.value.name}-L1"
  enabled = true
  match = "all"
  for_each = { for inst in var.ol_application_object : inst.notes => inst }
  actions  {
    value = [onelogin_roles.app_entitlements_1["${each.value.notes}"].id]
    action = "add_role"
  }
 conditions  {
    operator = "="
    source = "${each.value.notes}"
    value = "TRUE-L1"
  }
}

#### Mapping to set delegated admin for app_owner user for each app
resource onelogin_user_mappings app_entitlements_2_mapping {
  name = "Allocate AE Role-${each.value.name}-L2"
  enabled = true
  match = "all"
  for_each = { for inst in var.ol_application_object : inst.notes => inst }
  actions  {
    value = [onelogin_roles.app_entitlements_2["${each.value.notes}"].id]
    action = "add_role"
  }
 conditions  {
    operator = "="
    source = "${each.value.notes}"
    value = "TRUE-L2"
  }
}

#### Mapping to set delegated admin for app_owner user for each app
resource onelogin_user_mappings app_entitlements_3_mapping {
  name = "Allocate AE Role-${each.value.name}-L3"
  enabled = true
  match = "all"
  for_each = { for inst in var.ol_application_object : inst.notes => inst }
  actions  {
    value = [onelogin_roles.app_entitlements_3["${each.value.notes}"].id]
    action = "add_role"
  }
 conditions  {
    operator = "="
    source = "${each.value.notes}"
    value = "TRUE-L3"
  }
}

#### Privileges section ####
#create the delegated admin for each app
resource onelogin_privileges apps1_admin1 {
    name = "APP-${each.value.name}-Admin1"
    description = "App Admin1 role for App-${each.value.name}"
    for_each = { for inst in var.ol_application_object : inst.notes => inst }
    role_ids = [onelogin_roles.da_apps1_admin1["${each.value.notes}"].id]
    privilege {
        statement {
            effect = "Allow"
            action = ["apps:List","apps:Get", "apps:Update"]
            scope = ["apps/${restapi_object.company_apps["${each.value.notes}"].id}"]
        }
    }
}

#create the delegated admin for each app
resource onelogin_privileges apps1_admin2 {
    name = "APP-${each.value.name}-Admin2"
    description = "App Admin2 role for App-${each.value.name}"
    for_each = { for inst in var.ol_application_object : inst.notes => inst }
    role_ids = [onelogin_roles.da_apps1_admin2["${each.value.notes}"].id]
    privilege {
        statement {
            effect = "Allow"
            action = ["apps:List","apps:Get"]
            scope = ["apps/${restapi_object.company_apps["${each.value.notes}"].id}"]
        }
    }
}

#create the delegated admin for each app
resource onelogin_privileges apps2_admin1 {
    name = "APP-${each.value.name}-Admin1"
    description = "App Admin1 role for App-${each.value.name}"
    for_each = { for inst in var.ol_application_with_app_policy_object : inst.notes => inst }
    role_ids = []
    privilege {
        statement {
            effect = "Allow"
            action = ["policies:List"]
            scope = ["*"]
        }
    }
}

#create the delegated admin for each app
resource onelogin_privileges apps2_admin2 {
    name = "APP-${each.value.name}-Admin2"
    description = "App Admin2 role for App-${each.value.name}"
    for_each = { for inst in var.ol_application_with_app_policy_object : inst.notes => inst }
    role_ids = []
    privilege {
        statement {
            effect = "Allow"
            action = ["policies:List"]
            scope = ["*"]
        }
    }
}

######################################################################################################
###########################          SMARTHOOKS Section  ###############################################
#### Generic Rest Provider 
## example of how to create some env vars for Smart Hooks to use
############ Var for Smart Hook function ################

variable "ol_smart_hook_function" {
  type = string
  description = "function for the pre-auth smart hook"
  default = <<EOF
    exports.handler = async (context) => {
const NewUserPol_ID = process.env.NewUserPol;
console.log("Context: ", context);

  return {
    success: true,
    user: {
      policy_id: context.user.policy_id
    }
  }
}
    EOF
}

############ Smart Hook env vars ################
## example of how to create some env vars for Smart Hooks to use
resource "restapi_object" "oneloginsmarthook_vars" {
  path = "/api/2/hooks/envs"
  data = "{ \"name\": \"${var.ol_smart_hook_env_var1}\", \"value\": \"${var.ol_policy_id_new_user}\"}"
}

############ Smart Hook ################

## example of how to create a new pre auth smarthook in your OneLogin environment
resource "restapi_object" "oneloginsmarthook_pa" {
  path = "/api/2/hooks"
  depends_on = [restapi_object.oneloginsmarthook_vars]
  data = "{ \"type\": \"pre-authentication\", \"disabled\":false, \"runtime\":\"nodejs18.x\", \"context_version\":\"1.1.0\", \"retries\":0, \"timeout\":1, \"options\":{\"location_enabled\":true, \"risk_enabled\":true, \"mfa_device_info_enabled\":true}, \"env_vars\":[\"${var.ol_smart_hook_env_var1}\"], \"packages\": {\"axios\": \"0.21.1\"} , \"function\":\"${base64encode(var.ol_smart_hook_function)}\"}"
}

#### USERS #####

resource onelogin_users "users" {
  count = length(var.ol_users)
  username  = var.ol_users[count.index].username
  firstname = var.ol_users[count.index].firstname
  lastname  = var.ol_users[count.index].lastname
  email     = var.ol_users[count.index].email
  department     = var.ol_users[count.index].department
  title     = var.ol_users[count.index].title
  phone     = var.ol_users[count.index].phone
  company     = var.ol_users[count.index].company
  state     = var.ol_users[count.index].state
  status     = var.ol_users[count.index].status
  custom_attributes = var.ol_users[count.index].custom_attributes
}
