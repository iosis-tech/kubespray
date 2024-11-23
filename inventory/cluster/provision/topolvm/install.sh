helm repo add topolvm https://topolvm.github.io/topolvm
helm repo update
kubectl create namespace topolvm-system
kubectl label namespace topolvm-system topolvm.io/webhook=ignore
kubectl label namespace kube-system topolvm.io/webhook=ignore
helm install topolvm topolvm/topolvm --create-namespace --namespace=topolvm-system --set lvmd.deviceClasses[0].volume-group=vg1 --set lvmd.deviceClasses[0].name=ssd --set lvmd.deviceClasses[0].default=true --set lvmd.deviceClasses[0].spare-gb=10
