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
        - containerPort: 8080
          name: http
          protocol: TCP
        livenessProbe:
          tcpSocket:
            port: 8080
          # httpGet:
          #   path: /homepage
          #   port: 8080
          #   scheme: HTTP
          initialDelaySeconds: 30
          failureThreshold: 3
          periodSeconds: 10
          successThreshold: 1
          timeoutSeconds: 5           
        readinessProbe:
          tcpSocket:
            port: 8080        
          # httpGet:
          #   path: /homepage
          #   port: 8080
          #   scheme: HTTP
          initialDelaySeconds: 30
          failureThreshold: 3
          periodSeconds: 10
          successThreshold: 1
          timeoutSeconds: 5  
        # lifecycle:
        #   preStop:
        #     httpGet:
        #       path: /homepage
        #       port: http                    
        resources:
          limits:
            cpu: 500m
            memory: 1024Mi
          requests:
            cpu: 500m
            memory: 1024M        
        volumeMounts:
        - mountPath: /storage
          name: $APPLICATION-upload
        - mountPath: /usr/local/tomcat/logs
          name: tomcat-logs          
      imagePullSecrets:
        - name: regcred
      volumes:
      - name: $APPLICATION-upload
        persistentVolumeClaim:
          claimName: $APPLICATION-upload-pvc
      - hostPath:
          path: /log/kbstar/$APPLICATION
        name: tomcat-logs               

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
    targetPort: 8080
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
       
