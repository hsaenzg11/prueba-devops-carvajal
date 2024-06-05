#!/bin/bash

IMAGE_NAME="hsaenz11/stock_app"
CONTAINER_NAME="stock_app"
PORT=5000

# Construir la imagen Docker
docker build -t $IMAGE_NAME .

# Iniciar sesión en Docker Hub
docker login

# Subir la imagen a Docker Hub
docker push $IMAGE_NAME

# Descargar la imagen desde Docker Hub y desplegar el contenedor
docker pull $IMAGE_NAME
docker run -d -p $PORT:5000 --name $CONTAINER_NAME $IMAGE_NAME

echo "La aplicación está desplegada y accesible en http://localhost:$PORT"
