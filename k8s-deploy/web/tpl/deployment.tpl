apiVersion: apps/v1
kind: Deployment
metadata:
  name: $APPLICATION
  labels:
    app: $APPLICATION
spec:
  replicas: 1
  selector:
    matchLabels:
      app: $APPLICATION
  template:
    metadata:
      labels:
        app: $APPLICATION
    spec:
      containers:
      - name: $APPLICATION
        image: $DOCKER_IMAGE
        imagePullPolicy: IfNotPresent
        ports:
        - containerPort: 80
          name: http
          protocol: TCP         
        resources: {}
        volumeMounts:
        - mountPath: /usr/local/apache2/logs
          name: httpd-logs          
      imagePullSecrets:
        - name: regcred
      volumes:
      - hostPath:
          path: /log/kbstar/$APPLICATION
        name: httpd-logs               

---
apiVersion: v1
kind: Service
metadata:
  name: $APPLICATION
  labels:
      app: $APPLICATION
spec:
  ports:
  - port: 8080
    protocol: TCP
    targetPort: 80
  selector:
    app: $APPLICATION

---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: $APPLICATION
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
  - host: $DOMAIN_NAME
    http:
     paths:
     - pathType: Prefix
       path: "/"
       backend:
         service:
           name: $APPLICATION
           port:
             number: 8080  
  tls:
  - hosts:
    - $DOMAIN_NAME
    secretName: kbstarplatform       
