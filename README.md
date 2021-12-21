# Manual Install Kubeflow on DigitalOcean Kubernetes 


## Overview
---
> This repo is part of the [DigitalOcean Kubernetes Challenge](https://www.digitalocean.com/community/pages/kubernetes-challenge#anchor--success-criteria)

I have been wanting to play with Kubeflow out of curiosity and for fun more than anything. Installing it locally sounds like it could torture my machine. Even if it ended up working doing any kind of machine learning could take up a lot out of my processors. Instead, taking advantage of DigitalOcean Kubernetes is a good choice when you can pay $10/month to get started with real Kubernetes. Since it's Kubernetes, once you pick a cluster it's easy to add or remove nodes pools to manage performance and costs. You can get started right away and don't need to manyally configure and maintain your Kubernetes cluster. Workloads aren’t dependent on your internet connection and machine/lab setup if you need more power its easy to add with DOKS

Why install Kubeflow?

Kubeflow is a very fascinating project that originally started as a simple way to run Tensorflow on Kubernetes, but has since expanded. Now, Kubeflow has many common tools and frameworks used for Machine Learning to make it possible to run end-to-end ML workflows on Kubernetes. The Kubeflow project has a lot of the major machine learning and data science tools out there. Using it is also fun because it's so customizable and easy to get Jupyter notebook or terminal running.

* [For more information about Kubeflow](https://www.kubeflow.org/docs/started/architecture/) 

### Upside to installing Kubeflow manually

Ultimately, the manual and packaged Kubeflow installations will deliver the same results, but there are some upsides to installing manually.

**Customizability:** Choose the Kubeflow components to include, maybe you want to just install KubeFlow Pipelines. Give your developers have access only to what they need. Or install everything if you want to have it available. You can also customize your Kubeflow deployment with your Kubernetes cluster to have the exact amount of performance you need. Manual installations can potentially live anywhere with Kubernetes.

**Control:** A manual Kubeflow installation can be more robust than the "official" cloud versions in some ways. The UI can be different than cloud installations and you might prefer one over ther other. You can control the underlying Kubernetes and have it live in the same cluster as other things you might have running like a CI/CD tool to kick off workflows.


For my purposes I installed all the tools because I wanted to see what a full installation looks like.
---

### Prerequisites

* Kubernetes (tested with version 1.19) with a default StorageClass
    * DigitalOcean version recommended: 1.19.15-do.0
    * Most likely your strage class has been set up with DigitalOcean you can check with `kubectl get pv` if not you can apply a simiple manifest [Setting up a Storage Class with DigitalOcean](https://docs.digitalocean.com/products/kubernetes/how-to/add-volumes/)
* kustomize (version 3.2.0) (download link)
    * https://stackoverflow.com/questions/66836979/how-to-install-a-specific-kustomize-version3.2.3
    * ⚠️ Kubeflow 1.4.0 is not compatible with the latest versions of of kustomize 4.x. This is due to changes in the order resources are sorted and printed. Please see kubernetes-sigs/kustomize#3794 and kubeflow/manifests#1797.
* [kubectl])(https://kubectl.docs.kubernetes.io/installation/kubectl/)

