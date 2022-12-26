resource "google_container_node_pool" "tfer--cluster_nodes-bar" {
  cluster            = "${google_container_cluster.tfer--cluster.name}"
  location           = "us-central1-a"

  management {
    auto_repair  = "true"
    auto_upgrade = "true"
  }

  max_pods_per_node = "110"
  name              = "nodes-bar"

  node_config {
    disk_size_gb = "100"
    disk_type    = "pd-ssd"
    image_type   = "COS_CONTAINERD"

    labels = {
      bar = true
      createdby="mustafa.guler"
    }
    local_ssd_count = "0"
    machine_type    = "n1-standard-1"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    preemptible     = "false"
    service_account = "default"

    shielded_instance_config {
      enable_integrity_monitoring = "true"
      enable_secure_boot          = "false"
    }

  }
  
  autoscaling {
    min_node_count = "1"
    max_node_count = "50"
  }

  node_count     = "2"
  node_locations = ["us-central1-a"]
  project        = "your-project"

  upgrade_settings {
    max_surge       = "1"
    max_unavailable = "0"
  }

}
