####################################################
###################### VPC #########################
####################################################
module "Network"{
    source = "../modules/gcp/network/vpc"

    project_name                    = var.project_id
    vpc_name                        =  "ceph-cluster-vpc"
    auto_create_subnetworks         = false
    delete_default_routes_on_create = true
    routing_mode                    = "REGIONAL"
    route_name                      = "ceph-cluster-default-igw"
    next_hop_gateway                = "default-internet-gateway"
    route_priority                  = 1000
    dest_ip_range                   = "0.0.0.0/0"
}

module "PublicAccessSubnet"{
    source = "../modules/gcp/network/subnet"

    vpc_id          = module.Network.vpc_id
    subnet_name     = "pub-subnet"
    ip_cidr         = "192.168.0.0/24"
    subnet_purpose  = "PRIVATE"
    region          = var.region
    
    depends_on = [module.Network]
}

module "FirewallRulePublic" {
    source = "../modules/gcp/firewall_rules"
    
    rule_name           = "public-network-rules"
    vpc_id              = module.Network.vpc_id
    protocol            = "tcp"
    ports               = ["22"]
    source_ranges       = var.ip_isp_pub
    desitnation_ranges  = ["0.0.0.0/0"]
    project_id          = var.project_id

    depends_on = [module.Network]
}

# module "vm" {
#     source = "../modules/gcp/compute/vm"
    
#     num_instances       = 1

#     vm_name             = "vm"
#     machine_type        = var.vm_machine_type
#     vpc_id              = module.Network.vpc_id
#     subnet              = "pub-subnet"
#     image               = var.image
#     provisioning_model  = var.vm_provisioning_model
#     tags                = var.vm_tags
#     scopes              = var.scopes
#     public_instance     = true
#     ssh_pub             = file(var.path_local_public_key)
#     username            = var.username

#     defaul_sa_name      = data.google_compute_default_service_account.default_sa.email
#     available_zones     = data.google_compute_zones.available_zones.names.*
    
#     depends_on = [module.Network, 
#                   module.PublicAccessSubnet]
# }
