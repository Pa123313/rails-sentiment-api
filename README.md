Rails Sentiment API

A RESTful API built with Ruby on Rails that performs sentiment analysis on input text. The project is Dockerized and deployed on Kubernetes using Helm, demonstrating modern DevOps practices and cloud-native application deployment.

Table of Contents

Project Overview

Features

Technology Stack

Architecture Diagram

Getting Started

Prerequisites

Running Locally

Docker Build & Run

Kubernetes Deployment

API Usage

Project Status

Contact

Project Overview

This project demonstrates the full lifecycle of a modern web API:

Rails API-only application

Containerized using Docker

Deployed on Kubernetes using Helm

Tested locally using curl and JSON formatting with jq

Logs and request handling monitored via Kubernetes

It serves as a portfolio project for DevOps and Cloud engineering roles.

Features

/sentiment endpoint that returns JSON response:

{
  "sentiment": "positive",
  "score": 2
}


Handles positive, negative, and neutral sentiments

Fully containerized for portability

Easy deployment to Kubernetes clusters via Helm

Real-time logging and monitoring through kubectl logs

Technology Stack
Layer	Technology
Backend	Ruby on Rails 8.0
Language	Ruby 3.2
Containerization	Docker
Container Orchestration	Kubernetes (Minikube)
CI/CD	Optional: GitHub Actions / Jenkins
Package Management	Bundler, Gems
Architecture Diagram
          +----------------+
          |  Client / CURL |
          +--------+-------+
                   |
                   v
          +----------------+
          | Rails API Pod  |
          | /sentiment     |
          +--------+-------+
                   |
                   v
          +----------------+
          |  Kubernetes    |
          |  Deployment &  |
          |  Service       |
          +----------------+
                   |
                   v
           +---------------+
           | Docker Image  |
           | pavithra809/  |
           | rails-sentiment|
           +---------------+

Getting Started
Prerequisites

Docker

Minikube

Helm

jq
 (optional, for JSON formatting)

Running Locally

Clone the repo:

git clone https://github.com/<your-username>/rails-sentiment-api.git
cd rails-sentiment-api


Install dependencies:

bundle install


Start Rails server:

rails s -b 0.0.0.0 -p 3000


Test API:

curl -X POST http://127.0.0.1:3000/sentiment \
  -H "Content-Type: application/json" \
  -d '{"text":"I love awesome coffee"}' | jq


<img width="1114" height="583" alt="Test Output 2" src="https://github.com/user-attachments/assets/5c44ba61-9a64-4cb6-ade9-7b84e2afa455" />
<img width="1103" height="611" alt="Test Output 1" src="https://github.com/user-attachments/assets/bc1b2407-836a-49cc-b323-a8b9f74caf97" />

Docker Build & Run

Build Docker image:

docker build -t <username>/rails-sentiment:0.1 .
docker push <username>/rails-sentiment:0.1


Run container locally:

docker run -p 3000:80 <username>/rails-sentiment:0.1

Kubernetes Deployment

Start Minikube:

minikube start
eval $(minikube -p minikube docker-env)


Install the Helm chart:

helm upgrade --install sentiment-api ./sentiment-api


Check pods:

kubectl get pods
kubectl logs -l app=sentiment-api -f

<img width="1106" height="629" alt="Kubectl pods" src="https://github.com/user-attachments/assets/c0ccbb77-d679-4aed-b364-5e1d201b0219" />

Access service:

kubectl port-forward svc/sentiment-api 3000:80

<img width="1107" height="616" alt="Kubectl port- forward and logs" src="https://github.com/user-attachments/assets/7077f07f-3526-460c-8481-c6ab9bc77dd0" />

Test API through port-forward:

curl -X POST http://127.0.0.1:3000/sentiment \
  -H "Content-Type: application/json" \
  -d '{"text":"I love awesome coffee"}' | jq

API Usage

Endpoint: POST /sentiment
Headers: Content-Type: application/json
Body:

{
  "text": "I love awesome coffee"
}


Response:

{
  "sentiment": "positive",
  "score": 2
}

Project Status

✅ Completed: Rails API + Docker + Helm + Kubernetes deployment
⚡ Optional: CI/CD pipelines, production-ready secrets management, TLS
