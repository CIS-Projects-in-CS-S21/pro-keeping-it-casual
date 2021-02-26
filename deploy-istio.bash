if [ ! -d "../istio-1.9.0" ]
then
  echo "Please install the istio release for your architecture here: https://github.com/istio/istio/releases/tag/1.9.0
and place it at ../istio-1.9.0"
  exit
fi

../istio-1.9.0/bin/istioctl install -f kubernetes/istio/istio-custom-operator.yml

kubectl label namespace kic istio-injection=enabled

kubectl apply -f kubernetes/istio/default-gateway.yml

kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.9/samples/addons/prometheus.yaml

# deploy kiali to see the service mesh
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.9/samples/addons/kiali.yaml

kubectl apply -f kubernetes/istio/kiali-service.yml