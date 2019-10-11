output "myapp-frontend-ip" {
  value = "${kubernetes_service.myapp-frontend-svc.load_balancer_ingress.0.ip}"
}