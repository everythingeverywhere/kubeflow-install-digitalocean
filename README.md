# Manual Install Kubeflow on DigitalOcean Kubernetes 


## Overview
---
> This repo is part of the [DigitalOcean Kubernetes Challenge](https://www.digitalocean.com/community/pages/kubernetes-challenge#anchor--success-criteria)

I have been wanting to play with Kubeflow for a while out of curiosity and for fun more than anything. A long time ago I tried it on Microk8s locally on a laptop and on a raspberrypi cluster and I couldn't make it function. Even if it worked locally I feel it would overwhelm the processors. Instead, its better to take advantage of DigitalOcean Kubernetes that is cheaper than raspberrypi's and already set up.

Like with any Kubernetes, once you pick a cluster it's easy to add or remove nodes to manage performance and costs. You can get started right away and don't need to manually configure and maintain your Kubernetes cluster. Workloads aren’t dependent on your internet connection and machine/lab setup if you need more power its easy to add with DigitalOcean Kubernetes

### Advantages to a manual Kubeflow installation

Kubeflow is a very fascinating project that originally started as a simple way to run Tensorflow on Kubernetes, but has since expanded. Now, Kubeflow has many common tools and frameworks used for Machine Learning to make it possible to run end-to-end ML workflows on Kubernetes. The Kubeflow project has a lot of the major machine learning and data science tools out there like Jupyter notebook, PyTorch, TensorFlow,. Using it is also fun because it's so customizable and easy to get a Jupyter notebook or terminal running.

* [Kubeflow's Architecture](https://www.kubeflow.org/docs/started/architecture/) 

Ultimately, the manual and packaged Kubeflow installations will deliver the same results, but there are some upsides to installing manually.

**Customizability:** Choose the Kubeflow components to include, maybe you want to just install KubeFlow Pipelines. Give your developers access only to what they need. Or install everything if you want to have it available. You can also customize your Kubeflow deployment with your Kubernetes cluster to have the exact amount of performance you need. Manual installations can potentially live anywhere with Kubernetes.

**Control:** A manual Kubeflow installation can be more robust than the "official" cloud versions in some ways. The UI can be different than cloud installations and you might prefer one over ther other. You can control the underlying Kubernetes and have it live in the same cluster alongside otherworkloads like running like a CI/CD tool to kick off workflows.


For my purposes I installed all the tools because I wanted to see what a full installation looks like.

---

### Prerequisites

* Kubernetes (recommend version 1.19) with a default StorageClass
    * DigitalOcean version recommended: 1.19.15-do.0
    * Most likely your strage class has been set up with DigitalOcean. You can check with `kubectl get pv`, if not you can apply a simiple manifest [Setting up a Storage Class with DigitalOcean](https://docs.digitalocean.com/products/kubernetes/how-to/add-volumes/)
* [kustomize](https://github.com/kubernetes-sigs/kustomize/releases/tag/v3.2.0)(version 3.2.0)
    * Click the [link](https://github.com/kubernetes-sigs/kustomize/releases/tag/v3.2.0)(version 3.2.0) above to download the correct binary for your machine
    * Scroll to the bottom of the page and select the correct version for your machine like the following image ![](assets/kustomize3.2.png)
        * Make the file executible with chmod +x and add it to your path
    * ⚠️ Kubeflow 1.4.0 is not compatible with the latest versions of of kustomize 4.x. This is due to changes in the order resources are sorted and printed. Please see kubernetes-sigs/kustomize#3794 and kubeflow/manifests#1797.
* [kubectl](https://kubectl.docs.kubernetes.io/installation/kubectl/)

## Installation

**Before installing:** Make sure to execute the install commands twice and verify everything was installed before proceeding to the next command. This is due to

[Installing Kubeflow](https://github.com/kubeflow/manifests#installation)

```
test text
```

