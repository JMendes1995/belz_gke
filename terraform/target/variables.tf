variable "tfstate_bucket_name" {}
variable "project_name" {}
variable "project_id" {}
variable "region" {}
variable "ip_isp_pub" {}
variable "path_local_public_key" {
  sensitive = true
}
variable "username"{}
variable "scopes"{}
variable "image"{}
variable "vm_machine_type"{}
variable "vm_provisioning_model"{}
variable "vm_tags"{}

