
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: kubernetes-dashboard-admin
  # "namespace" omitted since ClusterRoles are not namespaced
rules:
-  apiGroups: ["*"]
   resources: ["*"]
   verbs: ["get","list","watch"]
EOF

cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: kubernetes-dashboard-admin
subjects:
  - kind: ServiceAccount
    name: kubernetes-dashboard
    namespace: kubernetes-dashboard
    apiGroup: ""
roleRef:
  kind: ClusterRole
  name: kubernetes-dashboard-admin
  #name: system:admin
  apiGroup: rbac.authorization.k8s.io
EOF


  #- apiGroups: ["", "extensions", "apps" ]
  #  resources: ["deployments", "pods", "services", "secrets", "namespaces" ]
  #- apiGroups: ["", "extensions", "apps", "batch", "networking.k8s.io" ]
  #  resources: ["deployments", "pods", "services", "secrets", "namespaces", "cronjobs", "jobs", "events", "replicasets", "daemonsets", "statefulsets", "replicationcontrollers", "ingress", "configmaps", "secrets" ]
  #verbs: ["*"]

