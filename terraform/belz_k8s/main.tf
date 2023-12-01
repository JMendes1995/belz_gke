data "google_container_engine_versions" "gke_version" {
  location = var.region
  version_prefix = "1.27."
}
resource "google_container_cluster" "primary" {
  name     = "belz-gke"
  location = var.region

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count  = 1
  deletion_protection = false
  
  network    = data.terraform_remote_state.base_tfstate.outputs.vpc_id
  subnetwork = data.terraform_remote_state.base_tfstate.outputs.pub_subnet_name

}


resource "google_container_node_pool" "primary_nodes" {
  name       = google_container_cluster.primary.name
  location   = var.region
  cluster    = google_container_cluster.primary.name
  
  version = data.google_container_engine_versions.gke_version.release_channel_latest_version["STABLE"]
  node_count = 1
  autoscaling {
    min_node_count = "1"
    max_node_count = "1"
  }
  node_config {
    disk_size_gb = "10"
    disk_type    = "pd-standard"

    image_type = "COS_CONTAINERD"

    # labels = "${var.node_labels}" # Forces new resource due to computing count :/
    local_ssd_count = "0"
    machine_type    = "n1-standard-1"
    spot = true
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = var.project_id
    }

    tags         = ["gke-node", "belz-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}