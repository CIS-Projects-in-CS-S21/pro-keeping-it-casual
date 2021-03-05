kubectl delete -f kubernetes/istio/default-gateway.yml
kubectl delete -f https://raw.githubusercontent.com/istio/istio/release-1.9/samples/addons/prometheus.yaml
kubectl delete -f https://raw.githubusercontent.com/istio/istio/release-1.9/samples/addons/kiali.yaml
kubectl delete -f kubernetes/istio/kiali-service.yml
kubectl delete -f kubernetes/istio/prometheus-service.yml

if [ ! -d "../istio-1.9.0" ]
then
  echo "Please install the istio release for your architecture here: https://github.com/istio/istio/releases/tag/1.9.0
and place it at ../istio-1.9.0"
  exit
fi

../istio-1.9.0/bin/istioctl manifest generate -f kubernetes/istio/istio-custom-operator.yml | kubectl delete -f -

