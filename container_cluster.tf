resource "google_container_cluster" "tfer--cluster" {
  addons_config {
    horizontal_pod_autoscaling {
      disabled = "false"
    }

    http_load_balancing {
      disabled = "false"
    }

    network_policy_config {
      disabled = "true"
    }
  }

  cluster_autoscaling {
    enabled = "false"
  }

  remove_default_node_pool = true

  database_encryption {
    state = "DECRYPTED"
  }

  logging_service           = "none"

  maintenance_policy {

    recurring_window {
        end_time   = "2022-05-25T01:00:00Z" 
        recurrence = "FREQ=WEEKLY;BYDAY=SA,SU"
        start_time = "2022-05-24T23:00:00Z"
      }
  }

  datapath_provider         = "LEGACY_DATAPATH"
  default_max_pods_per_node = "110"

  default_snat_status {
    disabled = "false"
  }

  enable_binary_authorization = "false"
  enable_intranode_visibility = "false"
  enable_kubernetes_alpha     = "false"
  enable_legacy_abac          = "false"
  enable_shielded_nodes       = "true"
  enable_tpu                  = "false"
  initial_node_count          = "3"

  
  ip_allocation_policy {
    cluster_secondary_range_name = "pod-ip-range"
    services_secondary_range_name = "service-ip-range"
  }

  location = "us-central1-a"

  master_auth {
    client_certificate_config {
      issue_client_certificate = "false"
    }
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "*.*.*.0/*"
      display_name = "central"
    }
  }

  name               = "my-cluster"
  network            = "projects/your-project/global/networks/your-project-vpc"

  network_policy {
    enabled  = "false"
    provider = "PROVIDER_UNSPECIFIED"
  }

  networking_mode = "VPC_NATIVE"

  min_master_version = "1.21.9-gke.1002"


  private_cluster_config {
    enable_private_endpoint = "true"
    enable_private_nodes    = "true"

    master_global_access_config {
      enabled = "true"
    }

    master_ipv4_cidr_block = "*.*.*.0/*"
  }

  project = "your-project"

  release_channel {
    channel = "REGULAR"
  }

  subnetwork = "projects/your-project/regions/us-central1/subnetworks/your-project-subnetwork"
}
