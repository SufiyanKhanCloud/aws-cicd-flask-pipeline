# aws-cicd-flask-pipeline

A small Flask API deployed through a fully automated AWS pipeline.

## Flow
GitHub -> CodePipeline -> CodeBuild (tests, Docker build, push to Docker Hub) -> CodeDeploy -> EC2 (runs the container on port 80)

## Endpoints
- `/` returns version, hostname and UTC time
- `/health` returns `{"status": "ok"}`

## Run locally
    pip install -r requirements.txt -r requirements-dev.txt
    python -m pytest -q
    docker build -t karachi-status-api . && docker run -p 5000:5000 karachi-status-api

## Secrets
Docker Hub credentials live in SSM Parameter Store and are read by CodeBuild. Nothing sensitive is stored in this repo.
