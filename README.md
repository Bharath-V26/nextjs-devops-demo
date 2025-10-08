# Next.js DevOps Demo

This project demonstrates containerizing a Next.js application, pushing it to GitHub Container Registry (GHCR) using GitHub Actions, and deploying it to Kubernetes using Minikube.

---

## Setup Instructions

1. Clone the repository:
git clone https://github.com/Bharath-V26/nextjs-devops-demo.git
cd nextjs-devops-demo

2. Install dependencies:
npm install

Run Locally

3. Start the Next.js application:
npm run dev

The application will run on: http://localhost:3000

4.Docker

Build and run the application using Docker:

> Build Docker image:
docker build -t nextjs-devops-demo .
 
> Run Docker container:
docker run -d -p 3000:3000 nextjs-devops-demo

The application will be accessible at http://localhost:3000

--------------------------------------------------------------------------------------------------------------------------------------------------
GitHub Actions

This project uses GitHub Actions to automate Docker image build and push:

Workflow file: .github/workflows/docker-build.yml

On push to the main branch:

Builds the Docker image

Tags the image as latest

Pushes the image to GitHub Container Registry (GHCR)

GHCR image URL:
ghcr.io/bharath-v26/nextjs-devops-demo:latest

--------------------------------------------------------------------------------------------------------------------------------------------------
Kubernetes Deployment (Minikube)

Kubernetes manifests are located in the k8s/ folder.

1. Start Minikube:
minikube start

2. Apply Kubernetes manifests:
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/deployment.yaml

3. Restart deployment (if required):
kubectl rollout restart deployment nextjs-deployment

4. Access the application using the Minikube service:
minikube service nextjs-service

This will open the Next.js application in your default browser.

--------------------------------------------------------------------------------------------------------------------------------------------------
Folder Structure

nextjs-devops-demo/
├─ app/                     # Next.js application
├─ k8s/                     # Kubernetes manifests
│  ├─ deployment.yaml
│  └─ service.yaml
├─ .github/workflows/       # GitHub Actions workflows
│  └─ docker-build.yml
├─ Dockerfile               # Dockerfile for containerization
├─ package.json
└─ README.md

--------------------------------------------------------------------------------------------------------------------------------------------------
Technologies Used

Next.js (React framework)

Docker (Containerization)

GitHub Actions (CI/CD)

GitHub Container Registry (Image storage)

Kubernetes & Minikube (Local deployment)
