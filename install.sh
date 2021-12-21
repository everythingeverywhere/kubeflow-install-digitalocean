



# Clone manifests repo

git clone https://github.com/kubeflow/manifests.git

# cd into /manifests
cd manifests 

#install cert manager
kustomize build common/cert-manager/cert-manager/base | kubectl apply -f -
kustomize build common/cert-manager/kubeflow-issuer/base | kubectl apply -f -

# install istio
kustomize build common/istio-1-9/istio-crds/base | kubectl apply -f -
kustomize build common/istio-1-9/istio-namespace/base | kubectl apply -f -
kustomize build common/istio-1-9/istio-install/base | kubectl apply -f -

# Install Dex   
kustomize build common/dex/overlays/istio | kubectl apply -f -

# OIDC AuthService
kustomize build common/oidc-authservice/base | kubectl apply -f -


# Install Knative serving
kustomize build common/knative/knative-serving/base | kubectl apply -f -
kustomize build common/istio-1-9/cluster-local-gateway/base | kubectl apply -f -

# Optionally, you can install Knative Eventing which can be used for inference request logging:

kustomize build common/knative/knative-eventing/base | kubectl apply -f -

# Kubeflow Namespace
# Create the namespace where the Kubeflow components will live in. This namespace is named kubeflow.

# Install kubeflow namespace:

kustomize build common/kubeflow-namespace/base | kubectl apply -f -


# Kubeflow Roles
# Create the Kubeflow ClusterRoles, kubeflow-view, kubeflow-edit and kubeflow-admin. Kubeflow components aggregate permissions to these ClusterRoles.

# Install kubeflow roles:
kustomize build common/kubeflow-roles/base | kubectl apply -f -


# Kubeflow Istio Resources
# Create the Istio resources needed by Kubeflow. This kustomization currently creates an Istio Gateway named kubeflow-gateway, in namespace kubeflow. If you want to install with your own Istio, then you need this kustomization as well.

# Install istio resources:
kustomize build common/istio-1-9/kubeflow-istio-resources/base | kubectl apply -f -

# Kubeflow Pipelines
# Install the Multi-User Kubeflow Pipelines official Kubeflow component:

kustomize build apps/pipeline/upstream/env/platform-agnostic-multi-user | kubectl apply -f -


#KFServing
# Install the KFServing official Kubeflow component:
kustomize build apps/kfserving/upstream/overlays/kubeflow | kubectl apply -f -

#  Katib
# Install the Katib official Kubeflow component:
kustomize build apps/katib/upstream/installs/katib-with-kubeflow | kubectl apply -f -

# Central Dashboard
# Install the Central Dashboard official Kubeflow component:
kustomize build apps/centraldashboard/upstream/overlays/istio | kubectl apply -f -


#  Admission Webhook
# Install the Admission Webhook for PodDefaults:

kustomize build apps/admission-webhook/upstream/overlays/cert-manager | kubectl apply -f -

# Notebooks
# Install the Notebook Controller official Kubeflow component:

kustomize build apps/jupyter/notebook-controller/upstream/overlays/kubeflow | kubectl apply -f -

#  Install the Jupyter Web App official Kubeflow component:

kustomize build apps/jupyter/jupyter-web-app/upstream/overlays/istio | kubectl apply -f -

# Profiles + KFAM
# Install the Profile Controller and the Kubeflow Access-Management (KFAM) official Kubeflow components:

kustomize build apps/profiles/upstream/overlays/kubeflow | kubectl apply -f -

# Volumes Web App
# Install the Volumes Web App official Kubeflow component:

kustomize build apps/volumes-web-app/upstream/overlays/istio | kubectl apply -f -

# Tensorboard
# Install the Tensorboards Web App official Kubeflow component:

kustomize build apps/tensorboard/tensorboards-web-app/upstream/overlays/istio | kubectl apply -f -



# Install the Tensorboard Controller official Kubeflow component:

kustomize build apps/tensorboard/tensorboard-controller/upstream/overlays/kubeflow | kubectl apply -f -


# Training Operator
# Install the Training Operator official Kubeflow component:
kustomize build apps/training-operator/upstream/overlays/kubeflow | kubectl apply -f -


# MPI Operator
# Install the MPI Operator official Kubeflow component:

kustomize build apps/mpi-job/upstream/overlays/kubeflow | kubectl apply -f -


# User Namespace
# Finally, create a new namespace for the the default user (named kubeflow-user-example-com)
kustomize build common/user-namespace/base | kubectl apply -f -


