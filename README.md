# DevOps Intern Final Assessment
Name:jaideep
Date:27-3-26

![CI Pipeline](https://github.com/Thelegendofkira/devops-intern-final-2/actions/workflows/ci.yml/badge.svg)

Project Description
This repository contains a fully integrated DevOps workflow simulating a real-world pipeline. 
1. GitHub Actions tests the code and builds/pushes the Docker image to the GitHub Container Registry (GHCR).
2. Nomad pulls the live image from GHCR and orchestrates the container.
3. Loki captures the logs directly from the Docker container via the Loki logging driver.

How to Run the Project
1. Docker Local Test: `docker build -t devops-hello .` then `docker run devops-hello`
2. Start Loki: `docker run -d --name loki -p 3100:3100 grafana/loki:3.0.0`
3. Run Nomad Job: `nomad job run nomad/hello.nomad`