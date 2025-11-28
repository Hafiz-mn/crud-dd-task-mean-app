# MEAN Stack CRUD Application - Dockerized with CI/CD Pipeline

## Project Overview

This project is a full-stack CRUD application built using the MEAN stack (MongoDB, Express, Angular 15, Node.js). It is fully containerized using Docker and deployed on an Ubuntu VM with Docker Compose. A CI/CD pipeline automates the building, pushing, and deployment of Docker images.

## Repository Contents

backend/ — Node.js + Express REST API backend

frontend/ — Angular 15 frontend application

Dockerfiles/ — Dockerfiles for backend and frontend

docker-compose.yml — Orchestration for MongoDB, backend, frontend

.github/workflows/ — GitHub Actions CI/CD pipeline config


## 1. Setup & Deployment Instructions

### git clone https://github.com/Hafiz-mn/crud-dd-task-mean-app
### cd crud-dd-task-mean-app

## 2. Build Docker Images Locally (Optional)

### For frontend:

 cd frontend
 docker build -t frontend-app .   

### For Backend:

cd backend
docker build -t backend-app .

## 3. Push Images to Docker Hub

docker tag frontend-app (yourdockerhubusername)/frontend-app:latest
docker tag backend-app (yourdockerhubusername)/backend-app:latest

docker push (yourdockerhubusername)/frontend-app:latest
docker push (yourdockerhubusername)/backend-app:latest

## 4. Set Up Ubuntu VM

* Launch an Ubuntu VM on AWS/Azure/any cloud provider.
* Install Docker & Docker Compose.
* Clone the repository on the VM.

## 5. Configure Docker Compose

* The docker-compose.yml manages:
* MongoDB container (official image)
* Backend API container
* Frontend container
* Network and environment variables

## 6. Deploy Application with Docker Compose
   
  docker compose up -d

## 7. Nginx Reverse Proxy Setup (Optional)

* Configured to forward requests to frontend (port 8081) and backend (port 8080), accessible via port 80.
* Nginx config file location: /etc/nginx/sites-enabled/mean-app
* Restart Nginx:  sudo systemctl restart nginx

## 8. CI/CD Pipeline (GitHub Actions)

* On every push to main branch:
* Build updated Docker images
* Push images to Docker Hub
* SSH into VM to pull images and restart containers

## 9. Infrastructure Details

* Ubuntu Virtual Machine hosted on AWS EC2 (or any cloud provider of your choice)
* Docker and Docker Compose installed on the VM to manage containerized services
* MongoDB runs inside a Docker container as part of the Docker Compose setup
* Backend and Frontend services are containerized and orchestrated via Docker Compose
* Nginx is configured as a reverse proxy on the VM, forwarding HTTP requests from port 80 to the appropriate backend and frontend services.
* Security Group allows only inbound traffic from ssh port(22) and http port (80)

## 10. Screenshots
    
<img width="1860" height="807" alt="Screenshot 2025-11-28 170203" src="https://github.com/user-attachments/assets/d489be08-df9f-4cbf-9909-69ba1f3f9306" />
<img width="1829" height="459" alt="Screenshot 2025-11-28 170210" src="https://github.com/user-attachments/assets/e2a124f1-f951-41e7-96d2-3517aea12eb7" />      
<img width="1913" height="632" alt="Screenshot 2025-11-28 170135" src="https://github.com/user-attachments/assets/a5d36546-0881-448c-9cba-639f507c015a" />


<img width="1885" height="741" alt="docker image build process" src="https://github.com/user-attachments/assets/45151ef8-3507-44c4-bb17-8842cc383f90" />
<img width="1004" height="118" alt="docker images" src="https://github.com/user-attachments/assets/e6219d32-4302-4e2a-b8a8-688b5c6663af" />
<img width="942" height="454" alt="Screenshot 2025-11-28 171449" src="https://github.com/user-attachments/assets/237a76a7-2ee3-4e2a-959e-f068b10988ab" />



<img width="640" height="547" alt="Screenshot 2025-11-28 171951" src="https://github.com/user-attachments/assets/39889799-f47d-4cb0-ac82-dbefd878547a" />

<img width="1853" height="445" alt="Screenshot 2025-11-28 171754" src="https://github.com/user-attachments/assets/d2bbb2cf-7809-4955-9cf1-f01d2ea73612" />


<img width="1919" height="968" alt="Screenshot 2025-11-28 172109" src="https://github.com/user-attachments/assets/c56aa2f7-f7b4-401a-a3f9-47dd2806c674" />
<img width="1906" height="960" alt="Screenshot 2025-11-28 172122" src="https://github.com/user-attachments/assets/9465d4f5-9d7b-4b68-a008-b19f92aa30a8" />



