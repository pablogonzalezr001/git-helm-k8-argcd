.PHONY: build test run docker-build docker-run compose-up compose-down minikube-start minikube-load minikube-deploy-direct minikube-argocd-install minikube-argocd-apply minikube-full-flow deploy

APP_DIR=app/ai-service

build:
	cd $(APP_DIR) && ./gradlew build -x test

test:
	cd $(APP_DIR) && ./gradlew test

run:
	cd $(APP_DIR) && ./gradlew bootRun

docker-build:
	docker build -t ai-service:local -f docker/Dockerfile .

docker-run: docker-build
	docker run -p 8080:8080 ai-service:local

compose-up:
	docker-compose up --build

compose-down:
	docker-compose down

minikube-start:
	minikube start

minikube-load: docker-build
	minikube image load ai-service:local

# ⚡ Vía Directa (Sin Git/ArgoCD): Requiere Helm instalado localmente
minikube-deploy-direct:
	kustomize build k8s/overlays/local --enable-helm | kubectl apply -f -

# ⚙️ Instalar ArgoCD en Minikube (si no existe)
minikube-argocd-install:
	kubectl create namespace argocd || true
	kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# 🔄 Vía GitOps: Aplicar el Application para que ArgoCD lo gestione
minikube-argocd-apply:
	kubectl apply -f argocd/app-local.yaml

# 🚀 FLUJO SECUENCIAL COMPLETO PARA LOCAL: Inicia cluster, carga imagen, instala ArgoCD y despliega app
minikube-full-flow: minikube-start minikube-load minikube-argocd-install
	@echo "⏳ Esperando a que ArgoCD inicie (puede tomar un par de minutos)..."
	kubectl wait --for=condition=Available deployment/argocd-server -n argocd --timeout=300s
	@echo "📦 Aplicando la aplicación de ArgoCD para el entorno local..."
	kubectl apply -f argocd/app-local.yaml
	@echo "✅ ¡Entorno local desplegado exitosamente!"

# 🚀 Despliegue dinámico por ambiente (crea el ambiente si no existe)
deploy:
	@if [ -z "$(ENV)" ]; then echo "Uso: make deploy ENV=<ambiente>"; exit 1; fi
	chmod +x deploy.sh && ./deploy.sh $(ENV)