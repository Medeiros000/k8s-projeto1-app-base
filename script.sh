#!/bin/bash

echo "Criando as imagens....."

docker build -t jrmedeirosdev/projeto-backend:1.0 backend/.
docker build -t jrmedeirosdev/projeto-database:1.0 database/.

echo "Realizando o push das imagens..."

docker push jrmedeirosdev/projeto-backend:1.0
docker push jrmedeirosdev/projeto-database:1.0

echo "Imagens criadas e enviadas com sucesso!"
echo "Criando os pods e serviços no Kubernetes..."

kubectl apply -f ./services.yml

echo "Pods e serviços criados com sucesso!"
echo "Aguardando os pods estarem prontos..."
echo "Criando os deployments..."

kubectl apply -f ./deployments.yml
