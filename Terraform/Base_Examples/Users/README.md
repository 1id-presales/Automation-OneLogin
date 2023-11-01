# How To Instructions

Create an API credential for Terraform to use in your target OneLogin environment with **"Manage Users" permissions**. For detail see **https://developers.onelogin.com/api-docs/2/getting-started/working-with-api-credentials** 

- From a system with Terraform and Git installed create a new folder and run **git clone https://github.com/1id-presales/Automation-OneLogin.git**
- Navigate into the Users base example folder with **cd Automation-OneLogin/Terraform/Base_Examples/Users/**
- Modify the contents of the file **target_ol_env.tfvars** with your favourite text editor as required
- Set the ol_client_secret variable in your system level environment variables with **export TF_VAR_ol_client_secret=xxxxxxxxx** replacing xxxx with the client secret from the API credential you have already created for running Terraform against your target OneLogin Environement
- Initialize your terraform environment by running the command **terraform init**

