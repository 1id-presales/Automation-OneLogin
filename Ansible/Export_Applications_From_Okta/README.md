# Solution Description
This solution shows how to export applications out of an Okta environment and convert into a JSON file which is compatible to use as an Application inventory file to provide as an input to a Terrform based solution (https://github.com/1id-presales/Automation-OneLogin/tree/main/Terraform/Reference_Env01) which will automatically create applications in a target OneLogin environment.<br>
The solution will extract applications from Okta and try to match them to a relevant connector id in OneLogin.<br>
If a relevant connector id has not been mapped then the connector_id attribute in the output will contain the original name of the pre-configured application in Okta and can be manually amended by finding the appropriate connector id in OneLogin and updating the application inventory file before using it as an input into the Terraform process.<br>

The solution contains a short sample of an Okta to OneLogin Application connector mapping file in group_vars/all_vars.yml. To obtain a more Comprehensive mapping file please contact the One Identity Support team via our Support Portal.

# How To Instructions



**START**
- From a system with Ansible and Git installed create a new folder and run 
<br><pre>`git clone https://github.com/1id-presales/Automation-OneLogin.git`</pre>
- Navigate into the Reference_Env01 folder with 
<br><pre>`cd Automation-OneLogin/Ansible/Export_Applications_From_Okta`</pre>
- Modify the contents of the file `export_apps.yml` file with your favourite text editor and set the relevant variable for okta_domain and save the file.
- Start the application export process by running the command 
<br><pre>`ansible-playbook export_apps.yml`</pre>
- You will be prompted to enter an api key for your target okta environment
- Once this has been entered correctly the playbook will run and create a applications_filtered_with_ids.json file in the current working directory.
- Review the file for content and update connector_ids manually where required before using as an input for the Terraform Application onboarding process.

**END**
