kubectl apply -f preproxy.yaml

// Must be done in this order

// Public
kubectl create secret generic traefik-tls-io --from-file=certs/elkjopnordic/tls.crt --from-file=certs/elkjopnordic/tls.key
kubectl create configmap traefik --from-file=traefik.toml
kubectl apply -f proxy.yaml

// Internal
// Wait for the first one here
kubectl create secret generic traefik-internal-tls-io --from-file=certs/elkjopnordic-internal/tls.crt --from-file=certs/elkjopnordic-internal/tls.key

kubectl create configmap traefik-internal --from-file=traefik-internal.toml
kubectl apply -f proxy-internal.yaml