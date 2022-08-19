# docker build -t tomcat-custom .
 
kubectl --kubeconfig was_kubeconfig.yaml apply -f pv.yml
kubectl --kubeconfig was_kubeconfig.yaml apply -f pvc.yml
kubectl --kubeconfig was_kubeconfig.yaml apply -f deployment.yml
kubectl --kubeconfig was_kubeconfig.yaml apply -f hpa.yml
kubectl --kubeconfig was_kubeconfig.yaml create secret tls kbstarplatform --key kbstar.key --cert kbstar.cert