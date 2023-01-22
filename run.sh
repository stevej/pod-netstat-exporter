kubectl run pod-netstat-exporter \
  --image="docker.io/stevej/pod-netstat-exporter:latest" \
  --image-pull-policy=IfNotPresent \
  --port=9657 \
  --namespace="netstat" \
  --restart=Never \
  --env="LOG_LEVEL=trace" \
--overrides='
{
  "spec": {
    "template": {
      "spec": {
        "containers": [
          {
            "name": "alpine",
            "image": "alpine:3.11",
            "args": [
              "bash"
            ],
            "stdin": true,
            "stdinOnce": true,
            "tty": true,
            "volumeMounts": [{
              "mountPath": "/host",
              "name": "host"
            }]
          }
        ],
        "volumes": [{
          "name":"host",
          "hostPath": [{"path": "/"}]
        }]
      }
    }
  }
}'
