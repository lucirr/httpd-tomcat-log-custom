apiVersion: autoscaling/v2beta1
kind: HorizontalPodAutoscaler
metadata:
  name: hpa-$APPLICATION
  labels:
    app: hpa-$APPLICATION
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: $APPLICATION
  minReplicas: 1
  maxReplicas: 5
  metrics:
    - type: Resource
      resource:
        name: cpu
        targetAverageUtilization: 80
    - type: Resource
      resource:
        name: memory
        targetAverageUtilization: 80
