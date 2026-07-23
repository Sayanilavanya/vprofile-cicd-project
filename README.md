# VProfile CI/CD Pipeline Automation

## Project Overview
Implemented CI/CD pipeline using Jenkins, SonarQube, Nexus, and Slack.

## DevOps Tools Used
- GitHub
- Jenkins
- Maven
- SonarQube
- Nexus Repository
- Slack

## CI/CD Pipeline Flow
GitHub
 ↓
Jenkins
 ↓
Maven Build
 ↓
SonarQube Analysis
 ↓
Nexus Artifact Upload
 ↓
Slack Notification


## Application Details

### Prerequisites
JDK 17 or 21
Maven 3.9
MySQL 8

### Technologies
Spring MVC
Spring Security
Spring Data JPA
Maven
JSP
Tomcat
MySQL
Memcached
Rabbitmq
ElasticSearch

### Database Setup

Here, we used MySQL DB SQL dump file:

/src/main/resources/db_backup.sql

Import database:

mysql -u <user_name> -p accounts < db_backup.sql
