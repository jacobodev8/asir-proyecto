terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "0.4.0"
    }
  }
}

provider "kind" {}

resource "kind_cluster" "asir" {
  name           = "asir-cluster"
  wait_for_ready = true

  node_image = "kindest/node:v1.29.0"

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"

      extra_port_mappings {
        container_port = 30000
        host_port      = 30000
      }
    }
  }
}
