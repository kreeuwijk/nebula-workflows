terraform {
  required_version = ">= 0.11.11"
  backend "gcs" {
    bucket = "puppet-kevins-bucket"
    prefix = "puppet-kevins"

  }
}

provider "kubernetes" {
  host = "https://${var.k8s_endpoint}"
  username = "${var.master_username}"
  password = "${var.master_password}"
}

resource "kubernetes_service" "myapp-frontend-svc" {
  metadata {
    name = "myapp-frontend-svc"
    namespace = "default"
    labels = {
      app = "myapp-frontend"
    }
  }
  spec {
    selector = {
      app = "myapp-frontend"
    }
    port {
      port        = 80
      target_port = 80
      protocol    = "TCP"
    }
    type = "LoadBalancer"
  }
}