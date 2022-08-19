apiVersion: v1
kind: PersistentVolume 
metadata:
  name: $APPLICATION-upload-pv 
spec:
  capacity: 
    storage: 5Gi
  volumeMode: Filesystem 
  accessModes:
    - ReadWriteMany 
  persistentVolumeReclaimPolicy: Recycle 
  storageClassName: manual
  nfs:
    path: /nas
    server: 192.168.0.50
