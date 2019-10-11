output "k8s_endpoint" {
  value = "https://${google_container_cluster.demo.endpoint}"
}

output "k8s_master_version" {
  value = "${google_container_cluster.demo.master_version}"
}

output "k8s_instance_group_urls" {
  value = "${google_container_cluster.demo.instance_group_urls.0}"
}

output "k8s_master_auth_client_certificate" {
  value = "${google_container_cluster.demo.master_auth.0.client_certificate}"
  sensitive = true
}

output "k8s_master_auth_client_key" {
  value = "${google_container_cluster.demo.master_auth.0.client_key}"
  sensitive = true
}

output "k8s_master_access_token" {
  value = "${data.google_client_config.current.access_token}"
  sensitive = true
}

output "k8s_master_auth_cluster_ca_certificate" {
  value = "${google_container_cluster.demo.master_auth.0.cluster_ca_certificate}"
  sensitive = true
}

output "slack-notification" {
  value = "'Your App is deployed! Access it at http://${kubernetes_service.myapp-frontend-svc.load_balancer_ingress.0.ip}'"
}