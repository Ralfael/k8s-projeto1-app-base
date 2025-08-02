#!/bin/bash

echo "Criando as imagens....."

docker build -t Ralfael/projeto-backend:1.0 backend/.
docker build -t Ralfael/projeto-database:1.0 database/.

echo " Realizando o push das imagens......"

docker push Ralfael/projeto-backend:1.0
docker push Ralfael/projeto-database:1.0

echo "Criando serviços no cluster kubernetes...."

kubectl apply -f ./service.yml

echo "Criando os deployments......"

kubectl apply -f ./deployment.yml