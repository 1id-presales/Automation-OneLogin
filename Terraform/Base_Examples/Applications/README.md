# How To Instructions

This example will create **an OIDC application** in your target OneLogin environment from our **OIDC Custom Connector**. <br>
Populate the required configuration for you OIDC Application into the relevant variables in the **target_ol_env.tfvars** file.<br>
For more details on configuring this connector please see **https://onelogin.service-now.com/support?id=kb_article&sys_id=2fd988e697b72150c90c3b0e6253af7f&kb_category=93e869b0db185340d5505eea4b961934**

Create an API credential for Terraform to use in your target OneLogin environment with **"Manage All" permissions**. For detail see **https://developers.onelogin.com/api-docs/2/getting-started/working-with-api-credentials** 

- **START**
- From a system with Terraform and Git installed create a new folder and run **git clone https://github.com/1id-presales/Automation-OneLogin.git**
- Navigate into the Applications base example folder with **cd Automation-OneLogin/Terraform/Base_Examples/Applications/**
- Modify the contents of the file **target_ol_env.tfvars** with your favourite text editor as required
- Set the ol_client_secret variable in your system level environment variables with **export TF_VAR_ol_client_secret=xxxxxxxxx** replacing xxxx with the client secret from the API credential you have already created for running Terraform against your target OneLogin Environement
- Initialize your terraform environment by running the command **terraform init**
- Run a terraform plan operation to see what changes will be applied to your environment. Run the command **terraform plan -var-file "target_ol_env.tfvars"**
- If you are happy with the output of the plan from the previous step proceed to apply the planned changes. Apply the planned changes with the command **terraform apply -var-file "target_ol_env.tfvars"** and enter yes at the prompt.
- Navigate to the Admin console of your target OneLogin environment and validate that your **OIDC Application** have been created successfully.
- To run a cleanup to remove this **OIDC Application** from your target OneLogin environment run the command **terraform destroy -var-file "target_ol_env.tfvars"**.
- Navigate to the Admin console of your target OneLogin environment and validate that the application created previously have been deleted successfully.
- **END**
