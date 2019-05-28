kubectl create clusterrolebinding kubernetes-dashboard -n kube-system --clusterrole=cluster-admin --serviceaccount=kube-system:kubernetes-dashboard
kubectl apply -f ./commonsetup/preproxy.yaml
kubectl create configmap traefik-internal --from-file=./commonsetup/traefik-internal.toml
kubectl apply -f ./commonsetup/proxy-internal.yaml