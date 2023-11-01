# How To Instructions

This example will create two new users in your target OneLogin environment and set a custom attribute value on one of the users. <br>
Before proceeding with this example ensure you create a new custom field in your target OneLogin environment called **food**. <br>
For more details see **https://onelogin.service-now.com/support?id=kb_article&sys_id=653d60e6973b2150c90c3b0e6253afd2** <br>
Create an API credential for Terraform to use in your target OneLogin environment with **"Manage Users" permissions**. For detail see **https://developers.onelogin.com/api-docs/2/getting-started/working-with-api-credentials** 

- From a system with Terraform and Git installed create a new folder and run **git clone https://github.com/1id-presales/Automation-OneLogin.git**
- Navigate into the Users base example folder with **cd Automation-OneLogin/Terraform/Base_Examples/Users/**
- Modify the contents of the file **target_ol_env.tfvars** with your favourite text editor as required
- Set the ol_client_secret variable in your system level environment variables with **export TF_VAR_ol_client_secret=xxxxxxxxx** replacing xxxx with the client secret from the API credential you have already created for running Terraform against your target OneLogin Environement
- Initialize your terraform environment by running the command **terraform init**
- Run a terraform plan operation to see what changes will be applied to your environment. Run the command **terraform plan -var-file "target_ol_env.tfvars"**
- If you are happy with the output of the plan from the previous step proceed to apply the planned changes. Apply the planned changes with the command **terraform apply -var-file "target_ol_env.tfvars"** and enter yes at the prompt.
- Navigate to the Admin console of your target OneLogin environment and validate that two new users have been created successfully.
- Open the **target_ol_env.tfvars** with your favourite text editor and modify the value to your **user1_username** variable and save the file.
- Run a terraform plan operation to see what changes will be applied to your environment. Run the command **terraform plan -var-file "target_ol_env.tfvars"**. Now there will be one planned change to the existing resource **onelogin_users.username** 
- If you are happy with the output of the plan from the previous step proceed to apply the planned changes. Apply the planned changes with the command **terraform apply -var-file "target_ol_env.tfvars"** and enter yes at the prompt.
- Navigate to the Admin console of your target OneLogin environment and validate that the username for your user has been updated successfully.
- To run a cleanup to remove these two new users from your target OneLogin environment run the command **terraform destroy -var-file "target_ol_env.tfvars"**.
- Navigate to the Admin console of your target OneLogin environment and validate that the two users created previously have been deleted successfully.
- **END**

