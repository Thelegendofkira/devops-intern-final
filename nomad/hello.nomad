job "hello-devops" {
  datacenters = ["dc1"]
  type = "service"

  group "hello-group" {
    count = 1

    task "hello-task" {
      driver = "docker"

      config {
        image = "ghcr.io/thelegendofkira/devops-hello:latest"
        force_pull = true

        # Integrated Logging to Loki
        logging {
          type = "loki"
          config {
            loki-url = "http://host.docker.internal:3100/loki/api/v1/push"
            loki-external-labels = "job=nomad-hello-app"
          }
        }
      }

      resources {
        cpu    = 100
        memory = 128
      }
    }
  }
}