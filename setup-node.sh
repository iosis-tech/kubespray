sudo dnf install python3-libdnf5

# Kubernetes API Server
sudo firewall-cmd --permanent --add-port=6443/tcp

# etcd (Cluster Store)
sudo firewall-cmd --permanent --add-port=2379-2380/tcp

# Kubelet API
sudo firewall-cmd --permanent --add-port=10250/tcp

# Kube Controller Manager
sudo firewall-cmd --permanent --add-port=10257/tcp

# Kube Scheduler
sudo firewall-cmd --permanent --add-port=10259/tcp

# Kube Proxy
sudo firewall-cmd --permanent --add-port=10249/tcp
sudo firewall-cmd --permanent --add-port=10256/tcp

# DNS (CoreDNS)
sudo firewall-cmd --permanent --add-port=53/tcp
sudo firewall-cmd --permanent --add-port=53/udp

# NodePort Services (For external access to services)
sudo firewall-cmd --permanent --add-port=30000-32767/tcp

# Cluster Networking (Flannel VXLAN)
sudo firewall-cmd --permanent --add-port=4789/udp

# Cluster Networking (Calico BGP - optional)
sudo firewall-cmd --permanent --add-port=179/tcp

sudo firewall-cmd --reload
