#docker build -t httpd-custom .
 
kubectl --kubeconfig web_kubeconfig.yaml apply -f deployment.yml
kubectl --kubeconfig web_kubeconfig.yaml apply -f hpa.yml
kubectl --kubeconfig web_kubeconfig.yaml create secret tls kbstarplatform --key kbstar.key --cert kbstar.cert