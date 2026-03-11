# DevOps Project 

## OVERVIEW

This project demonstrates a complete **end-to-end DevOps pipeline** for deploying and monitoring a containerized web application using modern DevOps tools and AWS cloud infrastructure.

The project includes **CI/CD automation, infrastructure provisioning, containerization, monitoring, and alerting**.

---

# ARCHITECTURE


Developer → GitHub → GitHub Actions CI/CD
                 ↓
             Docker Hub
                 ↓
            AWS Infrastructure
                 ↓
        Application Load Balancer
                 ↓
          Auto Scaling Group
                 ↓
            EC2 Instances
                 ↓
       Docker Containers (Flask App)

Monitoring Stack
Prometheus + Node Exporter + cAdvisor
                 ↓
               Grafana
                 ↓
               Alerts


---

## TECH STACK

### Cloud

* AWS EC2
* AWS Application Load Balancer
* AWS Auto Scaling Group

### Infrastructure as Code

* Terraform

### Containerization

* Docker
* Docker Compose

### CI/CD

* GitHub Actions

### Monitoring

* Prometheus
* Grafana
* Node Exporter
* cAdvisor

### Application

* Python Flask

---

# Project Features

* Automated infrastructure deployment using **Terraform**
* Containerized application using **Docker**
* CI/CD pipeline using **GitHub Actions**
* Automatic Docker image build and push to **Docker Hub**
* Application deployment on **AWS EC2 instances**
* **Application Load Balancer** for traffic distribution
* **Auto Scaling Group** for high availability
* **Prometheus monitoring** for system and container metrics
* **Grafana dashboards** for visualization
* **Prometheus alert rules** for system monitoring

---

# CI/CD Pipeline

GitHub Actions workflow automatically:

1. Pulls source code
2. Builds Docker image
3. Pushes image to Docker Hub
4. Triggers deployment on AWS infrastructure

---

# Monitoring

The monitoring stack includes:

### Prometheus

* Collects metrics from:

  * Node Exporter
  * cAdvisor
  * Prometheus itself

### Grafana

Provides dashboards for:

* CPU usage
* Memory usage
* Disk usage
* Network traffic
* Container metrics

---

# Alerts

Prometheus alert rules are configured for:

* High CPU usage
* Instance down
* Container down

Alerts help detect issues quickly in production environments.

---

# Deployment Steps


Project Implementation Steps

### 1. Create the Application

* Developed a simple **Python Flask web application**.
* Added a **health endpoint (`/health`)** for monitoring and load balancer checks.

bash
python3 app.py

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 2. Containerize the Application

* Created a **Dockerfile** to containerize the Flask application.
* Built the Docker image locally.

bash
docker build -t devops-flask-app .

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 3. Push Image to Docker Hub

* Tagged the Docker image.
* Pushed it to **Docker Hub** for remote deployment.

bash
docker tag devops-flask-app <dockerhub-username>/devops-flask-app
docker push <dockerhub-username>/devops-flask-app

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 4. Setup GitHub Repository

* Created a GitHub repository.
* Added project source code and configuration files.

bash
git init
git add .
git commit -m "Initial commit"
git push origin main

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 5. Configure CI/CD with GitHub Actions

* Created a **GitHub Actions workflow** to automate:

  * Source code checkout
  * Docker image build
  * Push image to Docker Hub

Location:

text
.github/workflows/docker-build.yml

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 6. Provision AWS Infrastructure using Terraform

Terraform was used to create AWS resources:

* VPC
* Security Groups
* EC2 Launch Template
* Auto Scaling Group
* Application Load Balancer
* Target Groups

Commands used:

bash
terraform init
terraform plan
terraform apply

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 7. Deploy Application on EC2

* EC2 instances automatically pull the Docker image.
* The container runs the Flask application.

bash
docker run -d -p 5000:5000 <dockerhub-username>/devops-flask-app

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 8. Configure Application Load Balancer

* ALB distributes traffic across EC2 instances.
* Health check endpoint used:

text
/health

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 9. Setup Auto Scaling Group

Auto Scaling ensures:

* High availability
* Automatic instance replacement
* Traffic scaling based on demand

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 10. Implement Monitoring Stack

Monitoring tools deployed using **Docker Compose**:

* Prometheus
* Grafana
* Node Exporter
* cAdvisor

Start monitoring stack:

bash
docker compose up -d

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 11. Configure Grafana Dashboards

* Connected Grafana to Prometheus as a data source.
* Imported dashboards:

  * Node Exporter Dashboard
  * Docker Container Dashboard

Metrics visualized:

* CPU usage
* Memory usage
* Disk usage
* Container metrics

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

### 12. Configure Prometheus Alerts

Created alert rules for:

* High CPU usage
* Instance down
* Container down

Example rule:

yaml
alert: HighCPUUsage
expr: 100 - (avg by(instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100) > 80
for: 1m


Alerts appear in:

Prometheus → Alerts

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

### Result

The project delivers a **complete DevOps workflow** including:

* CI/CD automation
* Infrastructure as Code
* Containerized deployment
* Load balancing and auto scaling
* Monitoring and alerting

