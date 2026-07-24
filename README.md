# VProfile CI/CD Project using Jenkins, Docker, Nexus, SonarQube and AWS ECS

## Project Overview

This project demonstrates a complete CI/CD pipeline for the VProfile application using Jenkins. The pipeline automates source code checkout, code quality analysis, artifact management, Docker image creation, Amazon ECR image publishing, and deployment to Amazon ECS.

---

## Technologies Used

- Java 21
- Maven
- Jenkins
- Docker
- SonarQube
- Nexus Repository
- Amazon ECR
- Amazon ECS (Fargate)
- AWS Application Load Balancer
- GitHub

---

## CI/CD Pipeline

The Jenkins pipeline performs the following stages:

1. Clean Workspace
2. Checkout Docker Branch
3. Verify Java and Maven Installation
4. Compile Application
5. Run Unit Tests
6. Execute Checkstyle Analysis
7. Package WAR File
8. Archive Build Artifact
9. Upload WAR to Nexus Repository
10. Run SonarQube Code Analysis
11. Build Docker Image
12. Push Docker Image to Amazon ECR
13. Trigger Amazon ECS Service Deployment
14. Clean Workspace

---

## AWS Infrastructure

- Amazon ECS (Fargate)
- Amazon ECR
- Application Load Balancer
- Target Group
- Security Groups
- IAM Roles
- CloudWatch Logs

---

## Docker Image

Docker images are pushed to:

210806258649.dkr.ecr.us-east-1.amazonaws.com/vprofile

Tags

- latest
- BUILD_NUMBER

---

## Jenkins Pipeline Features

- Maven Build Automation
- SonarQube Static Code Analysis
- Nexus Artifact Repository
- Docker Multi-stage Build
- Amazon ECR Integration
- Amazon ECS Deployment
- Automatic Workspace Cleanup

---

## Project Workflow

GitHub Repository

↓

Jenkins Pipeline

↓

Compile & Test

↓

SonarQube Analysis

↓

Package WAR

↓

Upload to Nexus

↓

Build Docker Image

↓

Push Image to Amazon ECR

↓

Deploy to Amazon ECS

↓

Application Available through AWS Load Balancer

---

## Repository

https://github.com/Sayanilavanya/vprofile-cicd-project

Branch

docker
