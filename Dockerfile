#####################################################################
# SECTION 1: WHAT IS DOCKER? (INTERVIEW Q&A)
#####################################################################

# Q: What is Docker?
# A: Docker is a containerization platform that allows packaging an
#    application with its dependencies into a lightweight container
#    that runs consistently across environments.

# Q: What is a container?
# A: A container is a lightweight, isolated runtime environment
#    that shares the host OS kernel but has its own filesystem,
#    network, and process space.

# Q: Difference between VM and Container?
# A:
#   VM -> Heavy, includes full OS, slower startup
#   Container -> Lightweight, shares OS kernel, fast startup

#####################################################################
# SECTION 2: BASIC DOCKERFILE STRUCTURE
#####################################################################

# FROM       -> Base image
# WORKDIR   -> Set working directory
# COPY      -> Copy files from host to container
# RUN       -> Execute commands at build time
# EXPOSE    -> Inform container port
# CMD       -> Default runtime command
# ENTRYPOINT-> Fixed runtime command

#####################################################################
# SECTION 3: UBUNTU IMAGE RUNNING POWERSHELL
#####################################################################

FROM ubuntu:22.04 AS ubuntu-powershell

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget apt-transport-https software-properties-common

# Install PowerShell
RUN wget -q https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install -y powershell

# Default command
CMD ["pwsh"]

# Interview Q:
# Q: Why use Ubuntu as base image?
# A: Stable, widely supported, good package ecosystem

#####################################################################
# SECTION 4: PYTHON DJANGO APPLICATION
#####################################################################

FROM python:3.11-slim AS python-django

WORKDIR /app

# Copy requirements first (best practice for caching)
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

EXPOSE 8000

# Run Django app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

# Interview Q:
# Q: Why copy requirements.txt first?
# A: To leverage Docker layer caching and speed up builds

#####################################################################
# SECTION 5: GOLANG MULTI-STAGE BUILD (VERY IMPORTANT FOR INTERVIEW)
#####################################################################

# -------- BUILD STAGE --------
FROM golang:1.22-alpine AS builder

WORKDIR /go/src/app
COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app

# -------- RUNTIME STAGE --------
FROM gcr.io/distroless/base-debian12

WORKDIR /app
COPY --from=builder /go/src/app/app .

CMD ["/app/app"]

# Interview Q:
# Q: What is multi-stage build?
# A: It allows separating build and runtime stages to reduce image size
#    and improve security.

#####################################################################
# SECTION 6: DISTROLESS IMAGES (INTERVIEW FAVORITE)
#####################################################################

# Q: What is a distroless image?
# A: Distroless images contain only the application and runtime
#    dependencies. No shell, no package manager.

# Benefits:
# - Smaller image size
# - Reduced attack surface
# - Better security

# Limitation:
# - No shell (cannot exec into container easily)

#####################################################################
# SECTION 7: DOCKER COMMANDS (WITH OPTIONS)
#####################################################################

# docker build -t myimage .
#   -t -> Tag name
#   .  -> Build context

# docker run -d -p 8080:80 --name mycontainer myimage
#   -d -> Detached mode
#   -p -> Port mapping (host:container)
#   --name -> Container name

# docker ps
# docker ps -a
#   -a -> Show all containers

# docker images
# docker rmi image_id
#   rmi -> Remove image

# docker exec -it container_name /bin/bash
#   -it -> Interactive terminal

# docker logs container_name
# docker stop container_name
# docker start container_name
# docker restart container_name

# docker rm container_name
# docker system prune
#   -> Clean unused containers, images, networks

#####################################################################
# SECTION 8: COMMON DOCKER INTERVIEW QUESTIONS
#####################################################################

# Q: What is Docker Compose?
# A: Tool to define and run multi-container applications using YAML

# Q: Difference between CMD and ENTRYPOINT?
# A:
# CMD -> Can be overridden
# ENTRYPOINT -> Fixed command

# Q: What is a Docker layer?
# A: Each instruction in Dockerfile creates a layer; layers are cached

# Q: How do containers communicate?
# A: Via Docker networks (bridge, host, overlay)

# Q: How do you reduce Docker image size?
# A:
# - Use slim or distroless images
# - Use multi-stage builds
# - Minimize layers
# - Clean package cache

#####################################################################
# SECTION 9: DOCKER VS KUBERNETES
#####################################################################

# Docker -> Build and run containers
# Kubernetes -> Orchestrates containers across multiple nodes

############################################################
# DOCKER COMPLETE INTERVIEW Q&A
############################################################

========================
1. DOCKER COMPONENTS
========================

Q1. What are the core components of Docker?
A1.
- Docker Client: CLI tool (`docker` command) used by users
- Docker Daemon (dockerd): Runs on host, builds and manages containers
- Docker Images: Read-only templates to create containers
- Docker Containers: Running instances of images
- Docker Registry: Stores images (Docker Hub, ECR, ACR)
- Docker Engine: Client + Daemon + REST API

Flow:
Docker CLI → Docker Daemon → Image → Container

========================
2. CONTAINER vs VIRTUAL MACHINE
========================

Q2. Difference between Container and Virtual Machine?
A2.

Container:
- Shares host OS kernel
- Lightweight (MBs)
- Fast startup (seconds)
- Better resource utilization
- Ideal for microservices

Virtual Machine:
- Includes full OS
- Heavy (GBs)
- Slow startup (minutes)
- More isolation
- Ideal for legacy workloads

Interview One-liner:
"Containers virtualize the OS, VMs virtualize the hardware."

========================
3. DOCKER IMAGE vs CONTAINER
========================

Q3. Difference between Docker Image and Container?
A3.
- Image: Blueprint / template (read-only)
- Container: Running instance of an image (read-write)

Example:
Image = Class  
Container = Object

========================
4. DOCKER LIFECYCLE
========================

Q4. Explain Docker container lifecycle
A4.
1. docker pull → Download image
2. docker create → Create container
3. docker start → Start container
4. docker run → Create + start
5. docker stop → Graceful stop
6. docker kill → Force stop
7. docker rm → Remove container

========================
5. CMD vs ENTRYPOINT (VERY IMPORTANT)
========================

Q5. Difference between CMD and ENTRYPOINT?
A5.

CMD:
- Provides default arguments
- Can be overridden at runtime

ENTRYPOINT:
- Fixed command
- Cannot be overridden easily

Best Practice:
Use ENTRYPOINT for executable
Use CMD for default parameters

Example:
ENTRYPOINT ["python"]
CMD ["app.py"]

========================
6. DOCKER VOLUMES & MOUNTS
========================

Q6. What is Docker Volume?
A6.
A volume is a Docker-managed storage mechanism used to persist data
outside the container lifecycle.

Benefits:
- Data persists after container removal
- Can be shared between containers
- Managed by Docker

Command:
docker volume create myvol

Q7. What is Bind Mount?
A7.
Maps a host directory to a container directory.

Example:
docker run -v /host/data:/container/data image
docker run --mount type=volume source=mydata,target=/app/data image sleep 3600

docker volume create mydata
docker run -d --name mycontainer --mount source=mydata,target=/app/data ubuntu

Difference:
Volume → Managed by Docker  
Bind Mount → Managed by user

Interview Tip:
Volumes are preferred in production.

========================
7. DOCKER NETWORKING
========================

Q8. What are Docker network types?
A8.

1. bridge (default)
- Containers communicate on same host
- Most commonly used

2. host
- Container uses host network directly
- High performance, less isolation

3. none
- No network access

4. overlay
- Multi-host networking
- Used with Docker Swarm

Q9. How do containers communicate?
A9.
- Via Docker networks
- Using container names as DNS
- Docker provides internal DNS

========================
8. PORT MAPPING
========================

Q10. What is port mapping?
A10.
Maps container port to host port.

Example:
docker run -p 8080:80 nginx

Meaning:
Host 8080 → Container 80

========================
9. DOCKER COMPOSE
========================

Q11. What is Docker Compose?
A11.
Docker Compose is a tool to define and run multi-container applications
using a `docker-compose.yml` file.

Used for:
- Local development
- Microservices
- Multi-container apps

Key Commands:
docker-compose up
docker-compose down
docker-compose logs

Difference from Kubernetes:
Compose → Single host  
Kubernetes → Cluster orchestration

========================
10. MULTI-STAGE BUILDS
========================

Q12. What is multi-stage build?
A12.
A technique to use multiple FROM statements to:
- Build application in one stage
- Run in minimal runtime image

Benefits:
- Smaller image size
- Better security
- Cleaner images

========================
11. DISTROLESS IMAGES
========================

Q13. What is a distroless image?
A13.
Images without shell, package manager, or OS utilities.

Benefits:
- Very small size
- Reduced attack surface
- Better security

Drawback:
- No shell access for debugging

========================
12. DOCKER SECURITY
========================

Q14. How do you secure Docker containers?
A14.
- Use minimal/distroless images
- Run containers as non-root
- Scan images for vulnerabilities
- Avoid secrets in images
- Use read-only filesystem

========================
13. DOCKER COMMANDS (INTERVIEW FAVORITES)
========================

docker build -t image .
docker run -d -p 8080:80 image
docker ps / docker ps -a
docker exec -it container bash
docker logs container
docker inspect container
docker stop / kill container
docker rm container
docker rmi image
docker system prune

========================
14. DOCKER vs KUBERNETES
========================

Q15. Docker vs Kubernetes?
A15.
Docker:
- Builds and runs containers

Kubernetes:
- Orchestrates containers
- Handles scaling, self-healing, load balancing

Interview One-liner:
"Docker creates containers, Kubernetes manages them at scale."

========================
15. REAL INTERVIEW CLOSING ANSWER
========================

Q16. How would you explain Docker to a non-technical person?
A16.
"Docker packages an application with everything it needs so it can run
anywhere the same way, without worrying about system differences."

# =============================================
# Dockerfile: Real-time Scenario Demonstration + Container Security Tips
# Scenarios Covered:
# 1. Docker daemon crash (single point of failure)
# 2. Docker daemon running as root (security risk)
# 3. Resource constraints (CPU/Memory limits)
# 4. Container Security Best Practices
# =============================================

# ---------------------------------------------
# Base Image: Ubuntu for demonstration
# ---------------------------------------------
FROM ubuntu:22.04

# ---------------------------------------------
# Maintainer Info
# ---------------------------------------------
LABEL maintainer="youremail@example.com"

# ---------------------------------------------
# Scenario 1: Docker Daemon Crash (Disk/Memory)
# ---------------------------------------------
# Explanation:
# - The Docker daemon can crash if the disk fills up or system resources are exhausted.
# - Existing containers keep running, but new deployments fail.
# Solution:
# 1. Monitor disk usage using docker logs or host monitoring.
# 2. Implement log rotation to avoid disk exhaustion.
# 3. Use centralized logging to prevent disk fill-up.
RUN echo "# Scenario 1 Solution:" >> /scenario_notes.txt \
    && echo "Monitor disk usage, rotate logs, use centralized logging." >> /scenario_notes.txt

# ---------------------------------------------
# Scenario 2: Docker Daemon Running as Root
# ---------------------------------------------
# Explanation:
# - Running dockerd as root can be a security risk.
# - If a container is compromised, it may gain host root privileges.
# Solution:
# 1. Use Docker rootless mode (`dockerd-rootless.sh`).
# 2. Apply user namespaces for container isolation.
# 3. Use Kubernetes with security policies to avoid root containers.
RUN echo "# Scenario 2 Solution:" >> /scenario_notes.txt \
    && echo "Use rootless mode, user namespaces, and Kubernetes SecurityContext." >> /scenario_notes.txt

# ---------------------------------------------
# Scenario 3: Resource Constraints
# ---------------------------------------------
# Explanation:
# - Containers without CPU/memory limits can starve other containers or crash the host.
# - Real-life example: A memory-leaking container caused OOMKills on other containers.
# Solution:
# 1. Set CPU and memory limits using --cpus and -m flags.
# 2. Monitor container usage with 'docker stats' or Prometheus/Grafana.
# 3. Use orchestration tools (Docker Compose / Kubernetes) to define limits.
RUN echo "# Scenario 3 Solution:" >> /scenario_notes.txt \
    && echo "Set CPU/memory limits, monitor usage, and use orchestration for scaling." >> /scenario_notes.txt

# ---------------------------------------------
# Scenario 4: Container Security Best Practices
# ---------------------------------------------
# Steps to secure containers:
# 1. Use Distroless or minimal images with fewer packages in multi-stage builds
#    to reduce attack surface and CVE risks.
# 2. Configure container networking properly; use custom bridge networks to isolate containers.
# 3. Use security scanning tools like 'Sync' to scan container images regularly.
RUN echo "# Scenario 4 Solution:" >> /scenario_notes.txt \
    && echo "1. Use minimal/distroless images with multi-stage builds." >> /scenario_notes.txt \
    && echo "2. Configure custom bridge networks for isolation." >> /scenario_notes.txt \
    && echo "3. Scan images with tools like 'Sync' for vulnerabilities." >> /scenario_notes.txt

# ---------------------------------------------
# Example of Resource-Limited Container (Scenario 3)
# ---------------------------------------------
# This RUN command is just for demonstration; in production, limits are set at 'docker run' or compose/k8s.
RUN echo "echo 'Demo container running with resource constraints'" > /demo_script.sh \
    && chmod +x /demo_script.sh

CMD ["/demo_script.sh"]

