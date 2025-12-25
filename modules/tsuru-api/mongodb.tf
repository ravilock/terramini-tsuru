resource "kubernetes_stateful_set" "mongodb" {
  count = var.create_mongodb ? 1 : 0

  metadata {
    name      = "tsuru-mongodb"
    namespace = "tsuru-system"
    labels = {
      app = "tsuru-mongodb"
    }
  }

  spec {
    service_name = "tsuru-mongodb"
    replicas     = 1

    selector {
      match_labels = {
        app = "tsuru-mongodb"
      }
    }

    template {
      metadata {
        labels = {
          app = "tsuru-mongodb"
        }
      }

      spec {
        container {
          name  = "mongodb"
          image = "mongo:7.0"

          port {
            container_port = 27017
            name           = "mongodb"
          }

          env {
            name  = "MONGO_INITDB_DATABASE"
            value = "tsuru"
          }

          volume_mount {
            name       = "mongodb-data"
            mount_path = "/data/db"
          }

          resources {
            requests = {
              memory = "256Mi"
              cpu    = "250m"
            }
            limits = {
              memory = "512Mi"
              cpu    = "500m"
            }
          }
        }
      }
    }

    volume_claim_template {
      metadata {
        name = "mongodb-data"
      }

      spec {
        access_modes = ["ReadWriteOnce"]
        resources {
          requests = {
            storage = "2Gi"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "mongodb" {
  count = var.create_mongodb ? 1 : 0

  metadata {
    name      = "tsuru-mongodb"
    namespace = "tsuru-system"
    labels = {
      app = "tsuru-mongodb"
    }
  }

  spec {
    selector = {
      app = "tsuru-mongodb"
    }

    port {
      port        = 27017
      target_port = 27017
      name        = "mongodb"
    }

    type = "NodePort"
  }
}
