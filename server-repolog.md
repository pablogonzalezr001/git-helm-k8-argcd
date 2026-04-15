Name:             argocd-repo-server-6fd5c47689-fbvz6
Namespace:        argocd
Priority:         0
Service Account:  argocd-repo-server
Node:             minikube/192.168.49.2
Start Time:       Wed, 15 Apr 2026 15:02:38 -0600
Labels:           app.kubernetes.io/name=argocd-repo-server
                  pod-template-hash=6fd5c47689
Annotations:      <none>
Status:           Running
IP:               10.244.0.61
IPs:
  IP:           10.244.0.61
Controlled By:  ReplicaSet/argocd-repo-server-6fd5c47689
Init Containers:
  copyutil:
    Container ID:    docker://21695c88ef6c8504028497d0bd4a064f8e9301feaefc9d1bc19a0efaa040926e
    Image:           quay.io/argoproj/argocd:v3.3.6
    Image ID:        docker-pullable://quay.io/argoproj/argocd@sha256:16b92ba472fbb9287459cc52e0ecff07288dff461209955098edb56ce866fe49
    Port:            <none>
    Host Port:       <none>
    SeccompProfile:  RuntimeDefault
    Command:
      sh
      -c
    Args:
      /bin/cp --update=none /usr/local/bin/argocd /var/run/argocd/argocd && /bin/ln -s /var/run/argocd/argocd /var/run/argocd/argocd-cmp-server
    State:          Waiting
      Reason:       CrashLoopBackOff
    Last State:     Terminated
      Reason:       Error
      Exit Code:    1
      Started:      Wed, 15 Apr 2026 16:14:40 -0600
      Finished:     Wed, 15 Apr 2026 16:14:40 -0600
    Ready:          False
    Restart Count:  5
    Environment:    <none>
    Mounts:
      /var/run/argocd from var-files (rw)
Containers:
  argocd-repo-server:
    Container ID:    docker://ebcf5ecf532cd600409dc4b21372a0d7c68fb845ccb81b6b743bc19910b80ea8
    Image:           quay.io/argoproj/argocd:v3.3.6
    Image ID:        docker-pullable://quay.io/argoproj/argocd@sha256:16b92ba472fbb9287459cc52e0ecff07288dff461209955098edb56ce866fe49
    Ports:           8081/TCP, 8084/TCP
    Host Ports:      0/TCP, 0/TCP
    SeccompProfile:  RuntimeDefault
    Args:
      /usr/local/bin/argocd-repo-server
    State:          Terminated
      Reason:       Error
      Exit Code:    255
      Started:      Wed, 15 Apr 2026 15:03:43 -0600
      Finished:     Wed, 15 Apr 2026 16:11:31 -0600
    Ready:          False
    Restart Count:  0
    Liveness:       http-get http://:8084/healthz%3Ffull=true delay=30s timeout=5s period=30s #success=1 #failure=3
    Readiness:      http-get http://:8084/healthz delay=5s timeout=1s period=10s #success=1 #failure=3
    Environment:
      REDIS_PASSWORD:                                               <set to the key 'auth' in secret 'argocd-redis'>                                                             Optional: false
      ARGOCD_RECONCILIATION_TIMEOUT:                                <set to the key 'timeout.reconciliation' of config map 'argocd-cm'>                                          Optional: true
      ARGOCD_REPO_SERVER_LOGFORMAT:                                 <set to the key 'reposerver.log.format' of config map 'argocd-cmd-params-cm'>                                Optional: true
      ARGOCD_REPO_SERVER_LOGLEVEL:                                  <set to the key 'reposerver.log.level' of config map 'argocd-cmd-params-cm'>                                 Optional: true
      ARGOCD_LOG_FORMAT_TIMESTAMP:                                  <set to the key 'log.format.timestamp' of config map 'argocd-cmd-params-cm'>                                 Optional: true
      ARGOCD_REPO_SERVER_PARALLELISM_LIMIT:                         <set to the key 'reposerver.parallelism.limit' of config map 'argocd-cmd-params-cm'>                         Optional: true
      ARGOCD_REPO_SERVER_LISTEN_ADDRESS:                            <set to the key 'reposerver.listen.address' of config map 'argocd-cmd-params-cm'>                            Optional: true
      ARGOCD_REPO_SERVER_LISTEN_METRICS_ADDRESS:                    <set to the key 'reposerver.metrics.listen.address' of config map 'argocd-cmd-params-cm'>                    Optional: true
      ARGOCD_REPO_SERVER_DISABLE_TLS:                               <set to the key 'reposerver.disable.tls' of config map 'argocd-cmd-params-cm'>                               Optional: true
      ARGOCD_TLS_MIN_VERSION:                                       <set to the key 'reposerver.tls.minversion' of config map 'argocd-cmd-params-cm'>                            Optional: true
      ARGOCD_TLS_MAX_VERSION:                                       <set to the key 'reposerver.tls.maxversion' of config map 'argocd-cmd-params-cm'>                            Optional: true
      ARGOCD_TLS_CIPHERS:                                           <set to the key 'reposerver.tls.ciphers' of config map 'argocd-cmd-params-cm'>                               Optional: true
      ARGOCD_REPO_CACHE_EXPIRATION:                                 <set to the key 'reposerver.repo.cache.expiration' of config map 'argocd-cmd-params-cm'>                     Optional: true
      REDIS_SERVER:                                                 <set to the key 'redis.server' of config map 'argocd-cmd-params-cm'>                                         Optional: true
      REDIS_COMPRESSION:                                            <set to the key 'redis.compression' of config map 'argocd-cmd-params-cm'>                                    Optional: true
      REDISDB:                                                      <set to the key 'redis.db' of config map 'argocd-cmd-params-cm'>                                             Optional: true
      ARGOCD_DEFAULT_CACHE_EXPIRATION:                              <set to the key 'reposerver.default.cache.expiration' of config map 'argocd-cmd-params-cm'>                  Optional: true
      ARGOCD_REPO_SERVER_OTLP_ADDRESS:                              <set to the key 'otlp.address' of config map 'argocd-cmd-params-cm'>                                         Optional: true
      ARGOCD_REPO_SERVER_OTLP_INSECURE:                             <set to the key 'otlp.insecure' of config map 'argocd-cmd-params-cm'>                                        Optional: true
      ARGOCD_REPO_SERVER_OTLP_HEADERS:                              <set to the key 'otlp.headers' of config map 'argocd-cmd-params-cm'>                                         Optional: true
      ARGOCD_REPO_SERVER_OTLP_ATTRS:                                <set to the key 'otlp.attrs' of config map 'argocd-cmd-params-cm'>                                           Optional: true
      ARGOCD_REPO_SERVER_MAX_COMBINED_DIRECTORY_MANIFESTS_SIZE:     <set to the key 'reposerver.max.combined.directory.manifests.size' of config map 'argocd-cmd-params-cm'>     Optional: true
      ARGOCD_REPO_SERVER_PLUGIN_TAR_EXCLUSIONS:                     <set to the key 'reposerver.plugin.tar.exclusions' of config map 'argocd-cmd-params-cm'>                     Optional: true
      ARGOCD_REPO_SERVER_PLUGIN_USE_MANIFEST_GENERATE_PATHS:        <set to the key 'reposerver.plugin.use.manifest.generate.paths' of config map 'argocd-cmd-params-cm'>        Optional: true
      ARGOCD_REPO_SERVER_ALLOW_OUT_OF_BOUNDS_SYMLINKS:              <set to the key 'reposerver.allow.oob.symlinks' of config map 'argocd-cmd-params-cm'>                        Optional: true
      ARGOCD_REPO_SERVER_STREAMED_MANIFEST_MAX_TAR_SIZE:            <set to the key 'reposerver.streamed.manifest.max.tar.size' of config map 'argocd-cmd-params-cm'>            Optional: true
      ARGOCD_REPO_SERVER_STREAMED_MANIFEST_MAX_EXTRACTED_SIZE:      <set to the key 'reposerver.streamed.manifest.max.extracted.size' of config map 'argocd-cmd-params-cm'>      Optional: true
      ARGOCD_REPO_SERVER_HELM_MANIFEST_MAX_EXTRACTED_SIZE:          <set to the key 'reposerver.helm.manifest.max.extracted.size' of config map 'argocd-cmd-params-cm'>          Optional: true
      ARGOCD_REPO_SERVER_DISABLE_HELM_MANIFEST_MAX_EXTRACTED_SIZE:  <set to the key 'reposerver.disable.helm.manifest.max.extracted.size' of config map 'argocd-cmd-params-cm'>  Optional: true
      ARGOCD_REPO_SERVER_OCI_MANIFEST_MAX_EXTRACTED_SIZE:           <set to the key 'reposerver.oci.manifest.max.extracted.size' of config map 'argocd-cmd-params-cm'>           Optional: true
      ARGOCD_REPO_SERVER_DISABLE_OCI_MANIFEST_MAX_EXTRACTED_SIZE:   <set to the key 'reposerver.disable.oci.manifest.max.extracted.size' of config map 'argocd-cmd-params-cm'>   Optional: true
      ARGOCD_REPO_SERVER_OCI_LAYER_MEDIA_TYPES:                     <set to the key 'reposerver.oci.layer.media.types' of config map 'argocd-cmd-params-cm'>                     Optional: true
      ARGOCD_REVISION_CACHE_LOCK_TIMEOUT:                           <set to the key 'reposerver.revision.cache.lock.timeout' of config map 'argocd-cmd-params-cm'>               Optional: true
      ARGOCD_GIT_MODULES_ENABLED:                                   <set to the key 'reposerver.enable.git.submodule' of config map 'argocd-cmd-params-cm'>                      Optional: true
      ARGOCD_GIT_LS_REMOTE_PARALLELISM_LIMIT:                       <set to the key 'reposerver.git.lsremote.parallelism.limit' of config map 'argocd-cmd-params-cm'>            Optional: true
      ARGOCD_GIT_REQUEST_TIMEOUT:                                   <set to the key 'reposerver.git.request.timeout' of config map 'argocd-cmd-params-cm'>                       Optional: true
      ARGOCD_REPO_SERVER_ENABLE_BUILTIN_GIT_CONFIG:                 <set to the key 'reposerver.enable.builtin.git.config' of config map 'argocd-cmd-params-cm'>                 Optional: true
      ARGOCD_GRPC_MAX_SIZE_MB:                                      <set to the key 'reposerver.grpc.max.size' of config map 'argocd-cmd-params-cm'>                             Optional: true
      ARGOCD_REPO_SERVER_INCLUDE_HIDDEN_DIRECTORIES:                <set to the key 'reposerver.include.hidden.directories' of config map 'argocd-cmd-params-cm'>                Optional: true
      HELM_CACHE_HOME:                                              /helm-working-dir
      HELM_CONFIG_HOME:                                             /helm-working-dir
      HELM_DATA_HOME:                                               /helm-working-dir
    Mounts:
      /app/config/gpg/keys from gpg-keyring (rw)
      /app/config/gpg/source from gpg-keys (rw)
      /app/config/reposerver/tls from argocd-repo-server-tls (rw)
      /app/config/ssh from ssh-known-hosts (rw)
      /app/config/tls from tls-certs (rw)
      /helm-working-dir from helm-working-dir (rw)
      /home/argocd/cmp-server/plugins from plugins (rw)
      /tmp from tmp (rw)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  ssh-known-hosts:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      argocd-ssh-known-hosts-cm
    Optional:  false
  tls-certs:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      argocd-tls-certs-cm
    Optional:  false
  gpg-keys:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      argocd-gpg-keys-cm
    Optional:  false
  gpg-keyring:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
  tmp:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
  helm-working-dir:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
  argocd-repo-server-tls:
    Type:        Secret (a volume populated by a Secret)
    SecretName:  argocd-repo-server-tls
    Optional:    true
  var-files:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
  plugins:
    Type:        EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:      
    SizeLimit:   <unset>
QoS Class:       BestEffort
Node-Selectors:  kubernetes.io/os=linux
Tolerations:     node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                 node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason          Age                  From               Message
  ----     ------          ----                 ----               -------
  Normal   Scheduled       72m                  default-scheduler  Successfully assigned argocd/argocd-repo-server-6fd5c47689-fbvz6 to minikube
  Normal   Pulling         72m                  kubelet            spec.initContainers{copyutil}: Pulling image "quay.io/argoproj/argocd:v3.3.6"
  Normal   Pulled          71m                  kubelet            spec.initContainers{copyutil}: Successfully pulled image "quay.io/argoproj/argocd:v3.3.6" in 772ms (45.58s including waiting). Image size: 555964354 bytes.
  Normal   Created         71m                  kubelet            spec.initContainers{copyutil}: Created container: copyutil
  Normal   Started         71m                  kubelet            spec.initContainers{copyutil}: Started container copyutil
  Normal   Pulling         71m                  kubelet            spec.containers{argocd-repo-server}: Pulling image "quay.io/argoproj/argocd:v3.3.6"
  Normal   Pulled          71m                  kubelet            spec.containers{argocd-repo-server}: Successfully pulled image "quay.io/argoproj/argocd:v3.3.6" in 1.013s (1.588s including waiting). Image size: 555964354 bytes.
  Normal   Created         71m                  kubelet            spec.containers{argocd-repo-server}: Created container: argocd-repo-server
  Normal   Started         71m                  kubelet            spec.containers{argocd-repo-server}: Started container argocd-repo-server
  Warning  Unhealthy       42m                  kubelet            spec.containers{argocd-repo-server}: Readiness probe failed: Get "http://10.244.0.55:8084/healthz": context deadline exceeded (Client.Timeout exceeded while awaiting headers)
  Warning  Unhealthy       42m                  kubelet            spec.containers{argocd-repo-server}: Liveness probe failed: Get "http://10.244.0.55:8084/healthz?full=true": context deadline exceeded (Client.Timeout exceeded while awaiting headers)
  Normal   SandboxChanged  3m31s                kubelet            Pod sandbox changed, it will be killed and re-created.
  Normal   Pulled          34s (x5 over 3m30s)  kubelet            spec.initContainers{copyutil}: Container image "quay.io/argoproj/argocd:v3.3.6" already present on machine
  Normal   Created         34s (x5 over 3m30s)  kubelet            spec.initContainers{copyutil}: Created container: copyutil
  Normal   Started         34s (x5 over 3m30s)  kubelet            spec.initContainers{copyutil}: Started container copyutil
  Warning  BackOff         7s (x19 over 3m29s)  kubelet            spec.initContainers{copyutil}: Back-off restarting failed container copyutil in pod argocd-repo-server-6fd5c47689-fbvz6_argocd(c4ff05ac-f12e-4e4c-9751-63751779a847)
