🛠️ 🚀 SOLUCIÓN DEFINITIVA (haz esto exacto)
1️⃣ BORRAR TODO limpio
kubectl delete ns argocd
2️⃣ REINICIAR MINIKUBE (IMPORTANTE)
minikube delete
minikube start --memory=4096 --cpus=2

👉 esto arregla:

DNS interno
recursos
estado corrupto
3️⃣ INSTALAR ARGOCD DE NUEVO
kubectl create ns argocd

kubectl apply -n argocd \
-f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
🧪 4️⃣ VALIDAR (CLAVE)
kubectl get pods -n argocd

👉 TODO debe estar así:

argocd-redis              1/1 Running ✅
argocd-repo-server        1/1 Running ✅
argocd-server             1/1 Running ✅
🔍 Verifica también Redis
kubectl get svc -n argocd


kubectl port-forward svc/argocd-server -n argocd 8080:443

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

################################################################



Install ArgoCD on your Cluster
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
kubectl create namespace argocd
helm install argocd argo/argo-cd --namespace argocd --version 7.7.0
Access ArgoCD UI
kubectl port-forward svc/argocd-server -n argocd 8080:443
Retrieve Credentials
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
API Calls
Here are commands that you can use to add grades to the Grade Submission API. Windows Users should use Git Bash.

curl -X POST http://localhost:<port>/grades \
  -H "Content-Type: application/json" \
  -d '{"name": "Harry", "subject": "Defense Against Dark Arts", "score": 95}'

curl -X POST http://localhost:<port>/grades \
  -H "Content-Type: application/json" \
  -d '{"name": "Ron", "subject": "Charms", "score": 82}'

curl -X POST http://localhost:<port>/grades \
  -H "Content-Type: application/json" \
  -d '{"name": "Hermione", "subject": "Potions", "score": 98}'
To verify, you can get all grades with:

curl http://localhost:<port>/grades
Become a Cloud and DevOps Engineer







#################
Hacer deploy directo en argocd 
kubectl apply -f argocd/app-local.yaml 

