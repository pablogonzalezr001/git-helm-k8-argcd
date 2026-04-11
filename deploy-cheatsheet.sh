#!/bin/bash
# -----------------------------------------------------------------------------
# Script de Referencia: Comandos desde inicio hasta EKS
# -----------------------------------------------------------------------------
# Este script no está pensado para ejecutarse automáticamente de inicio a fin 
# sin modificar variables, sino como una hoja de trucos (cheat sheet) 
# de los comandos principales que deberías dominar en cada etapa.
# -----------------------------------------------------------------------------

set -e

echo "==============================================="
echo " FASE 1: DESARROLLO Y COMPILACIÓN (Spring Boot)"
echo "==============================================="
cd app/ai-service

# 1. Ejecutar las pruebas unitarias y compilar el archivo .jar
./gradlew clean build

# 2. (Opcional) Ejecutar la app localmente para pruebas rápidas
# ./gradlew bootRun

cd ../..


echo "==============================================="
echo " FASE 2: EMPAQUETADO (Docker)"
echo "==============================================="
AWS_ACCOUNT_ID="123456789012"
AWS_REGION="us-east-1"
IMAGE_REPO="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/ai-service"
TAG=$(git rev-parse --short HEAD)

# 1. Construir la imagen Docker usando tu Dockerfile Multistage
docker build -t $IMAGE_REPO:$TAG -f docker/Dockerfile .

# 2. Etiquetar también como 'latest'
docker tag $IMAGE_REPO:$TAG $IMAGE_REPO:latest


echo "==============================================="
echo " FASE 3: PUBLICACIÓN EN EKS REGISTRY (AWS ECR)"
echo "==============================================="
# 1. Autenticar Docker contra AWS ECR
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

# 2. Empujar la imagen creada a tu repositorio en ECR
docker push $IMAGE_REPO:$TAG
docker push $IMAGE_REPO:latest


echo "==============================================="
echo " FASE 4: DESPLIEGUE MANUAL (Opciones Helm o Kustomize)"
echo "==============================================="
# PRE-REQUISITO: Estar autenticado en el clúster EKS
# aws eks update-kubeconfig --region $AWS_REGION --name nombre-de-tu-cluster-eks

# ---> OPCIÓN A: USANDO HELM (Directo al cluster EKS)
# Para instalar o actualizar la aplicación usando el Chart
# helm upgrade --install ai-service ./helm/ai-service \
#   --namespace ai-staging \
#   --create-namespace \
#   --set image.repository=$IMAGE_REPO \
#   --set image.tag=$TAG

# ---> OPCIÓN B: USANDO KUSTOMIZE (Directo al cluster EKS)
# Para actualizar localmente el tag dentro de Kustomize
cd k8s/overlays/staging
# kustomize edit set image mydockerregistry/ai-service=$IMAGE_REPO:$TAG
cd ../../..

# Aplicar los manifiestos renderizados de kustomize al cluster
# kustomize build k8s/overlays/staging | kubectl apply -f -


echo "==============================================="
echo " FASE 5: DESPLIEGUE GITOPS (ArgoCD en EKS)"
echo "==============================================="
# ---> Prerrequisito: Instalar ArgoCD en el cluster EKS (si no existe)
# kubectl create namespace argocd
# kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# 1. A este punto, el pipeline (CI) hace un 'git commit' modificando el YAML en el repositorio 
# con el nuevo image tag.

# 2. Le indicamos a ArgoCD que sincronice este repositorio con el Cluster.
# Aplicamos nuestra definición de "Application" una única vez manualmente:
kubectl apply -f argocd/app-staging.yaml

# 3. Y para validar, forzamos manualmente a ArgoCD a que lea los cambios de Github 
# (aunque ArgoCD lo hace solo cada 3 minutos)
# argocd app sync ai-service-staging

echo "¡Comandos de referencia generados!"
