apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: $APPLICATION-upload-pvc
spec:
  accessModes:
  - ReadWriteMany
  volumeMode: Filesystem
  resources:
    requests:
      storage: 5Gi
  storageClassName: manual
  volumeName: $APPLICATION-upload-pv
