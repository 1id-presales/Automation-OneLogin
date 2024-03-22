# How To Instructions

This example will create Applications, Roles, Mappings, a Test User and Privileges in your target OneLogin environment. <br>

Populate the required configuration for your reference environment into the relevant variables in the **target_ol_env.tfvars** file.<br>


Create an API credential for Terraform to use in your target OneLogin environment with **"Manage All" permissions**. For detail see **https://developers.onelogin.com/api-docs/2/getting-started/working-with-api-credentials** 

**Before** running this example it is required to **create some custom fields** in your target OneLogin environment to hold all of the attributes from the standard Okta user profile. It is not currently possible to create these custom fields via the OneLogin Admin API and must be done in your OneLogin Admin console manually. <br>

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
