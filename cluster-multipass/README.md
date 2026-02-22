# Multipass

## Install multipass
```bash
brew install --cask multipass
```

### Launch k8s
```bash
curl https://raw.githubusercontent.com/tigera/ccol1/main/control-init.yaml | multipass launch -n control -m 2048M 20.04 --cloud-init -
curl https://raw.githubusercontent.com/tigera/ccol1/main/node1-init.yaml | multipass launch -n node1 20.04 --cloud-init -
curl https://raw.githubusercontent.com/tigera/ccol1/main/node2-init.yaml | multipass launch -n node2 20.04 --cloud-init -
curl https://raw.githubusercontent.com/tigera/ccol1/main/host1-init.yaml | multipass launch -n host1 20.04 --cloud-init -
multipass start --all
multipass list
```

### Calico
```bash
multipass shell host1

# Install operator
kubectl create -f https://docs.projectcalico.org/archive/v3.21/manifests/tigera-operator.yaml
kubectl get pods -n tigera-operator

# Calico installation kind
cat <<EOF | kubectl apply -f -
apiVersion: operator.tigera.io/v1
kind: Installation
metadata:
  name: default
spec:
  calicoNetwork:
    containerIPForwarding: Enabled
    ipPools:
    - cidr: 198.19.16.0/21
      natOutgoing: Enabled
      encapsulation: None
EOF

kubectl get tigerastatus/calico

kubectl get pods -A

NAMESPACE         NAME                                      READY   STATUS      RESTARTS   AGE
tigera-operator   tigera-operator-84c5c5d6df-zb49b          1/1     Running     0          5m48s
calico-system     calico-typha-868bb997ff-l22n7             1/1     Running     0          4m6s
calico-system     calico-typha-868bb997ff-fvmws             1/1     Running     0          3m24s
calico-system     calico-typha-868bb997ff-8qt45             1/1     Running     0          3m24s
calico-system     calico-node-r94mp                         1/1     Running     0          4m6s
calico-system     calico-node-w5ptt                         1/1     Running     0          4m6s
calico-system     calico-node-zgrvb                         1/1     Running     0          4m6s
kube-system       helm-install-traefik-t68vd                0/1     Completed   0          35m
kube-system       metrics-server-7566d596c8-pccvz           1/1     Running     2          35m
kube-system       local-path-provisioner-6d59f47c7-gh97b    1/1     Running     2          35m
calico-system     calico-kube-controllers-89cf65556-c7gz7   1/1     Running     3          4m6s
kube-system       coredns-7944c66d8d-f4q6g                  1/1     Running     0          35m
kube-system       svclb-traefik-9bxg2                       2/2     Running     0          32s
kube-system       svclb-traefik-pb72f                       2/2     Running     0          32s
kube-system       svclb-traefik-l6mzn                       2/2     Running     0          32s
kube-system       traefik-758cd5fc85-8hcdx                  1/1     Running     0          32s

kubectl get pods -n calico-system

NAME                                       READY   STATUS    RESTARTS   AGE
calico-typha-5d788c654b-56wp9              1/1     Running   0          4h28m
calico-node-2bkv5                          1/1     Running   0          4h28m
calico-kube-controllers-5dcfdbc5f4-vpgx5   1/1     Running   0          4h28m
calico-node-8465h                          1/1     Running   0          4h26m
calico-typha-5d788c654b-wn7gf              1/1     Running   0          4h24m
calico-node-qmq5j                          1/1     Running   0          3h57m
calico-typha-5d788c654b-rd8kl              1/1     Running   0          3h56m

kubectl get nodes -A

NAME      STATUS   ROLES    AGE   VERSION
control   Ready    master   37m   v1.18.10+k3s1
node2     Ready    <none>   16m   v1.18.10+k3s1
node1     Ready    <none>   31m   v1.18.10+k3s1
```
