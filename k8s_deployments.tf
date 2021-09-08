resource "kubernetes_deployment" "kuard" {
  metadata {
    name = "kuard"
    labels = {
      test = "kuard"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        test = "kuard"
      }
    }
    template {
      metadata {
        labels = {
          test = "kuard"
        }
      }
      spec {
        container {
          image = var.deploy_image
          name  = "kuard"
          port {
            container_port = "8080"
            name           = "http"
            protocol       = "TCP"
          }
          resources {
            requests =  {
              cpu = "500"
              memory = "128Mi"
            }
          }
          liveness_probe {
            http_get {
              path = "/healthy"
              port = "8080"
            }
            timeout_seconds = 1
            initial_delay_seconds = 5
            period_seconds = 10
            failure_threshold = 3
          }
        }    
      }
    }
  }
  depends_on = [aws_eks_node_group.k8s]
}