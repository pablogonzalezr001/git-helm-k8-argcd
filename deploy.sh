#!/usr/bin/env bash

set -e

if [ "$#" -ne 1 ]; then
    echo "Uso: ./deploy.sh <ambiente>"
    echo "Ejemplo: ./deploy.sh qa"
    exit 1
fi

ENV=$1

if [ "$ENV" == "local" ]; then
    echo "⚠️  Para el entorno 'local' (Minikube), es mejor usar el flujo secuencial automatizado."
    echo "👉 Ejecuta: make minikube-full-flow"
    exit 0
fi

OVERLAY_DIR="k8s/overlays/$ENV"
ARGOCD_FILE="argocd/app-$ENV.yaml"

echo "=========================================================="
echo "🌍 Preparando despliegue para el ambiente: $ENV"
echo "=========================================================="

# 1. Crear Overlay si no existe
if [ ! -d "$OVERLAY_DIR" ]; then
    echo "✨ El ambiente '$ENV' no existe. Creando overlay de Kustomize..."
    mkdir -p "$OVERLAY_DIR"
    
    # Generamos el kustomization.yaml con la Integración Helm+Kustomize
    cat <<EOF > "$OVERLAY_DIR/kustomization.yaml"
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

namespace: ai-$ENV

helmCharts:
- name: ai-service
  includeCRDs: false
  repo: file://../../../helm/ai-service
  releaseName: ai-service
  namespace: ai-$ENV
  valuesInline:
    image:
      repository: pablogonzalezr001/ai-service
      tag: latest
      pullPolicy: Always
EOF
    echo "✅ Overlay creado en $OVERLAY_DIR"
else
    echo "✅ Overlay de Kustomize ya existe para '$ENV'."
fi

# 2. Crear ArgoCD App si no existe
if [ ! -f "$ARGOCD_FILE" ]; then
    echo "✨ Creando manifiesto de ArgoCD para '$ENV'..."
    cat <<EOF > "$ARGOCD_FILE"
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: ai-service-$ENV
  namespace: argocd
spec:
  project: default
  source:
    repoURL: 'https://github.com/tu-usuario/git-helm-k8-argcd.git'
    targetRevision: HEAD
    path: $OVERLAY_DIR
  destination:
    server: 'https://kubernetes.default.svc'
    namespace: ai-$ENV
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=true
EOF
    echo "✅ Manifiesto de ArgoCD creado en $ARGOCD_FILE"
else
    echo "✅ Manifiesto de ArgoCD ya existe para '$ENV'."
fi

# 3. Aplicar vía Kustomize Directo
echo "🚀 Aplicando manifiestos en el clúster actual vía Kustomize..."
kustomize build "$OVERLAY_DIR" --enable-helm | kubectl apply -f -

echo "=========================================================="
echo "🎉 Entorno '$ENV' procesado exitosamente."
echo "👉 Si usas GitOps, recuerda hacer commit y pushear estos archivos:"
echo "   git add . && git commit -m 'Add $ENV environment' && git push"
echo "   Y aplicar tu app de ArgoCD en el cluster: kubectl apply -f $ARGOCD_FILE"
echo "=========================================================="