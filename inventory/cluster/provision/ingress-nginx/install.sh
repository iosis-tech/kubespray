kubectl apply -f https://raw.githubusercontent.com/nginxinc/kubernetes-ingress/v3.5.0/deploy/crds.yaml
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

# loadBalancerIP="0.0.0.0" it automatically set with kube vip network dns server specifies ip
helm install nginx-ingress-prod ingress-nginx/ingress-nginx \
--create-namespace \
--namespace=nginx-ingress-prod  \
--set controller.service.annotations."kube-vip\.io\/loadbalancerIPs"="0.0.0.0" \
--set controller.service.annotations."kube-vip\.io\/hwaddr"="00:00:6C:32:98:70" \
--set controller.service.annotations."kube-vip\.io\/loadbalancerHostname"="nginx-ingress-prod" \
--set controller.ingressClassResource.name=nginx-ingress-prod \
--set controller.ingressClassResource.enabled=true \
--set controller.ingressClassResource.default=true \
--set controller.ingressClassResource.controllerValue=k8s.io/nginx-ingress-prod \
--version 4.7.5

# loadBalancerIP="0.0.0.0" it automatically set with kube vip network dns server specifies ip
helm install nginx-ingress-dev ingress-nginx/ingress-nginx \
--create-namespace \
--namespace=nginx-ingress-dev \
--set controller.service.annotations."kube-vip\.io\/loadbalancerIPs"="0.0.0.0" \
--set controller.service.annotations."kube-vip\.io\/hwaddr"="00:00:6C:32:98:71" \
--set controller.service.annotations."kube-vip\.io\/loadbalancerHostname"="nginx-ingress-dev" \
--set controller.ingressClassResource.name=nginx-ingress-dev \
--set controller.ingressClassResource.enabled=true \
--set controller.ingressClassResource.default=false \
--set controller.ingressClassResource.controllerValue=k8s.io/nginx-ingress-dev \
--version 4.7.5

# loadBalancerIP="0.0.0.0" it automatically set with kube vip network dns server specifies ip
helm install nginx-ingress-internal ingress-nginx/ingress-nginx \
--create-namespace \
--namespace=nginx-ingress-internal \
--set controller.service.annotations."kube-vip\.io\/loadbalancerIPs"="0.0.0.0" \
--set controller.service.annotations."kube-vip\.io\/hwaddr"="00:00:6C:32:98:72" \
--set controller.service.annotations."kube-vip\.io\/loadbalancerHostname"="nginx-ingress-internal" \
--set controller.ingressClassResource.name=nginx-ingress-internal \
--set controller.ingressClassResource.enabled=true \
--set controller.ingressClassResource.default=false \
--set controller.ingressClassResource.controllerValue=k8s.io/nginx-ingress-internal \
--version 4.7.5
