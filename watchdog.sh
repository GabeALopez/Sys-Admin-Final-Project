#!/bin/bash

# Absolute paths
DOCKER="/usr/bin/docker"
DOCKER_COMPOSE="/usr/bin/docker-compose"
COMPOSE_FILE="/home/ubuntu/Sys-Admin-Final-Project/docker-compose.yml"
PROJECT_DIR="/home/ubuntu/Sys-Admin-Final-Project"  # Directory where docker-compose.yml is

# Define your services
SERVICES=(db wordpress nginx)

# Go to project directory
cd "$PROJECT_DIR" || exit

# Loop through services
for SERVICE in "${SERVICES[@]}"; do
  CONTAINER_ID=$($DOCKER_COMPOSE -f $COMPOSE_FILE ps -q $SERVICE)
  
  if [ -n "$CONTAINER_ID" ]; then
    STATUS=$($DOCKER inspect -f '{{.State.Running}}' "$CONTAINER_ID")
    if [ "$STATUS" != "true" ]; then
      echo "$(date): $SERVICE is down. Restarting..." >> "$PROJECT_DIR/restart.log"
      $DOCKER_COMPOSE -f $COMPOSE_FILE restart "$SERVICE"
    else
      echo "$(date): $SERVICE is running." >> "$PROJECT_DIR/restart.log"
    fi
  else
    echo "$(date): $SERVICE container not found." >> "$PROJECT_DIR/restart.log"
  fi
done
