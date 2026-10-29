# Taipakov Yeldos — Student API

**DevOps Midterm Project**

- **Student:** Taipakov Yeldos
- **Group:** IT2-2310
- **Student ID:** 38321
- **GitHub:** https://github.com/yeldss2164/taipakov-yeldos-student-api

## Project Overview

A Spring Boot REST API for managing student records. The project demonstrates Linux administration, Git workflows, Docker containerization, PostgreSQL persistence, and Jenkins CI automation.

## Technology Stack

- Java 17 and Spring Boot
- Gradle Wrapper
- PostgreSQL 16
- Docker and Docker Compose
- Jenkins Pipeline
- Bash, Linux, Git and GitHub

## Project Structure

```text
scripts/               Linux system report script
logs/                  System reports and process analysis
backups/               README backup
src/                   Spring Boot source code and tests
Dockerfile             Multi-stage Docker build
docker-compose.yml     Application and PostgreSQL services
Jenkinsfile            Jenkins CI Pipeline
build.gradle           Gradle configuration
README.md              Project documentation
```

## Running the Application

Ensure Docker Desktop is running.

Create a local `.env` file with the database environment variables required by `docker-compose.yml`. Do not commit passwords or secrets.

Start the application:

```bash
docker compose up -d --build
```

Check containers:

```bash
docker compose ps
```

The API is available at:

`http://localhost:8081/api/students`

## REST API Endpoints

| Method | Endpoint | Description |
|---|---|---|
| POST | `/api/students` | Create a student |
| GET | `/api/students` | List all students |
| GET | `/api/students/{id}` | Get a student by ID |
| PUT | `/api/students/{id}` | Update a student |
| DELETE | `/api/students/{id}` | Delete a student |

Example request:

```bash
curl -i http://localhost:8081/api/students
```

Example response:

```json
[
  {
    "id": 2,
    "name": "Yeldos",
    "surname": "Taipakov",
    "groupName": "IT2-2310-Updated"
  }
]
```

Successful requests return appropriate HTTP status codes, including `200`, `201`, and `204`. Missing student records return `404`.

## Linux Administration

The project includes a personalized system report script:

```bash
chmod 744 scripts/Taipakov_Yeldos_system_report.sh
./scripts/Taipakov_Yeldos_system_report.sh
```

The script records student information, date, username, OS/kernel, CPU, memory, disk usage, and running processes.

Generated reports and process analysis are stored in `logs/`. A README backup is stored in `backups/`.

## Git Workflow

The project uses Git branches, meaningful commits, merging, and manual merge-conflict resolution.

Branches include:

- `main`
- `feature/taipakov-yeldos-crud`
- `feature/taipakov-yeldos-documentation`
- `test/taipakov-yeldos-failure`

Release tag: `v1.0-38321`.

## Docker and PostgreSQL

The Dockerfile uses a multi-stage build with a Java 17 build environment and a Java 17 runtime environment.

Docker Compose runs the Spring Boot application and PostgreSQL database with a persistent named volume, network configuration, environment variables, and a PostgreSQL health check.

## Jenkins CI Pipeline

**Main Jenkins Job:** `Taipakov_Yeldos_Student_API`

The Pipeline contains five stages:

1. Checkout
2. Build
3. Test
4. Docker Build
5. Verify

The Pipeline builds and tests the application, creates a personalized Docker image, and verifies the resulting image.

A separate test job, `Taipakov_Yeldos_Student_API_Test`, was used to demonstrate an intentionally failed build followed by a successful build after fixing the source code.

SCM Polling is configured to automatically trigger builds when changes are detected in the GitHub repository.

## Verification

The following functionality was tested:

- Student CRUD operations
- HTTP `404` for missing students
- PostgreSQL data persistence after container restart
- Successful Gradle tests
- Successful Jenkins Pipeline
- Jenkins failure and recovery
- Automatic Jenkins build triggered by an SCM change

## Author

**Taipakov Yeldos**  
Group: IT2-2310  
Student ID: 38321

Automatic Jenkins CI verification - Taipakov Yeldos 38321
