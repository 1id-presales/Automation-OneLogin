# Solution Description
This solution shows how to manage the process of Application onboarding/offboarding into your OneLogin environment in an automated and structured way using Terraform. This solution can be used by existing OneLogin customers who have traditionally managed the application onboarding process manually in the OneLogin Admin Console and now want to shift to using a IaC/Devops approach or it can be used by new customers setting up OneLogin for the first time and can greatly assist in the process of migrating applications from an existing Access Management solution into OneLogin.<br>

The solution will ensure that each time an application is created in the target OneLogin environment it will be accompanied by related roles, mappings and delegated admin privileges which will control who is granted access to the Application (from an end user perspective) and also who is granted the ability to manage the configuration of that Application from an delegated admin perspective.<br>

The main principle of this solution is that a one to one relationship is defined between an application and a specific custom field in the OneLogin cloud directory. The process of allocating the particular application to an end user is then then simply a case of setting that custom field value to "True" which will then trigger the related Application Access mapping to fire and allocate the relevant Application Access OneLogin Role to the user automatically.<br>
In addition to this applications can also be tagged as "Birthright" applications when added to the application inventory (in the tfvars file) by setting the value of the birthright_app key to be "yes". This will result in the creation of an additional "BIRTHRIGHT-APP-ACCESS" mapping for the application which ensure the related Application Access role will be automatically allocated to all users regardless of whether the related custom field for that application is set to "True" or not.<br>

The solution will also see the creation of 3 Application Entitlements OneLogin Roles for each application. These roles can then be used in the application connector configuration by the app owner (when configuring the connector) to control how and when application rules may or may not be trigger based on the membership status of these Application Entitlements OneLogin roles. For example the Application Entitlements roles could be used in Application Rules to assign different licenses to different users when they are provisioned into the target application. Users can be added automatically to the relevant Application Entitlement role simply by appending a "-L1"/"-L2"/"-L3" to the "True" value already set (which grants the Access to the Application) on the related application specific custom field for the user <br>

The solution does not intend to fully configure every element of an application connector which is added to the application inventory but instead creates dedicated delegated admin privileges associated with that application connector which will then be allocated to the relevant person/people responsible for that application within your organization.<br> 
The delegated admin privileges for an application will be allocated to users via delegated admin roles which are associated with the application and are allocated to users via delegated admin mappings for that application. Users can be allocated the related delegated admin privileges for an application either by being defined as the "app_owner" in the application inventory or by setting the value of the application specific custom field to "True-L3".<br>
Once an application has been created in the target OneLogin environment by this solution the relevant person responsible for the application can then logon to the OneLogin Admin console (with minimized delegated admin rights) and complete the remaining configuration of the application connector. In most cases there is only minimal configuration for the application owner to define on the application connector due to the wide range of available pre-configured connectors in the OneLogin Application catalogue.   

The solution also makes it very easy for organizations to answer the question "who has access to what?" based on the application specific custom fields which are used to control the allocation of Application Access OneLogin roles. Reports can easily be created in the OneLogin Admin console to show which users have access to which applications simply by using the related application custom field in the report "conditions". Additionally Application Access reporting data can be obtained by calling the OneLogin Admin API to the List Users endpoint with the related application custom field defined as a query parameter. <br>

# How To Instructions

This example will create a series of Applications, Roles, Mappings, a Test User and Privileges in your target OneLogin environment. <br>
**Each Application** you define in your Application inventory in the tfvars file will be created along with following <br>

**1 Application Access Role (AA-*****)** <br>
**2 Delegated Admin Roles (DA-APP-*****)** <br>
**3 Application Entitlements Roles (AE-*****)** <br>
**1 Mapping to Allocate the Application Access Role to Users** <br>
**2 Mappings to Allocate the Application Delegated Admin Roles to Users** <br>
**3 Mappings to Allocate the Application Entitlements Roles to Users** <br>
**1 Mappings to Allocate the Application Access Role to Users if the application has been defined a birthright app** <br>
**2 Privileges for each app that hold delegated administration permissions over the applicaion** <br>



Populate the required configuration for your reference environment into the relevant variables in the **target_ol_env.tfvars** file.<br>


Create an API credential for Terraform to use in your target OneLogin environment with **"Manage All" permissions**. For detail see **https://developers.onelogin.com/api-docs/2/getting-started/working-with-api-credentials** 

**Before** running this example it is required to **create some custom fields** in your target OneLogin environment. It is not currently possible to create these custom fields via the OneLogin Admin API and must be done in your OneLogin Admin console manually. <br>
You should also create a app policy to be your baseline app policy in the environment and then some different app policies that can be allocated to different applications that you don't want to have the baseline app policy. Supply these App Policy IDs into the Apps Vars section of the tfvars file as needed.
Please also create an example user policy and supply this user policy into the Smart Hooks Vars section of the tfvars file.

The following custom fields should be created in your target OneLogin environment. <br>

**staff_id** <br>
**personal_mail** <br>
**app_Wrike** <br>
**app_Lever** <br>
pluse add more app_xxxx custom fields for each app you want to add in your tfvars file for your application listing.


**START**
- From a system with Terraform and Git installed create a new folder and run 
<br><pre>`git clone https://github.com/1id-presales/Automation-OneLogin.git`</pre>
- Navigate into the Reference_Env01 folder with 
<br><pre>`cd Automation-OneLogin/Terraform/Reference_Env01`</pre>
- Modify the contents of the file `target_ol_env.tfvars` with your favourite text editor as required.
- Set the ol_client_secret variable in your system level environment variables with `export TF_VAR_ol_client_secret=xxxxxxxxx` replacing `xxxx` with the client secret from the API credential you have already created for running Terraform against your target OneLogin Environement.
<br><pre>`export TF_VAR_ol_client_secret=xxxxx`</pre>
- Initialize your terraform environment by running the command 
<br><pre>`terraform init`</pre>
- Run a terraform plan operation to see what changes will be applied to your environment. Run the command 
<br><pre>`terraform plan -var-file "target_ol_env.tfvars"`</pre>
- If you are happy with the output of the plan from the previous step proceed to apply the planned changes. Apply the planned changes with the below command and enter yes at the prompt.
<br><pre>`terraform apply -var-file "target_ol_env.tfvars"`</pre> 
- Navigate to the Admin console of your target OneLogin environment and go to the events page and validate the expected resources have been created.
- To run a cleanup to remove this reference environment  from your target OneLogin environment run the command 
<br><pre>`terraform destroy -var-file "target_ol_env.tfvars"`</pre>
_Please note you may need to run this command twice to fully clean up the created resources._
- Navigate to the Admin console of your target OneLogin environment and go to the events page and validate the resources have been removed successfully by looking for the events and check the Apps/Roles/Mappings/Privileges/Users have been removed.<br>

**END**
