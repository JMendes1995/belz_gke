
tfstate_bucket_name="belzgkebucket"
service_account_file="~/sysadmcephcluster-7893cafdba84.json"
project_name="SysAdmCephCluster"
project_id="sysadmcephcluster"
region="europe-west4"
ip_isp_pub=["149.90.112.98/32", "148.63.63.118/32"]
path_local_public_key="../../ssh_keys/idrsa.pub"
username="vm"
image="debian-cloud/debian-11"
scopes=["cloud-platform"]
vm_machine_type="f1-micro"
vm_provisioning_model="SPOT"
vm_tags=["ssh", "vm"]