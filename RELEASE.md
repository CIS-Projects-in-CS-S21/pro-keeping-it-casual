# Keeping It Casual

Welcome to Keeping It Casual! Our architecture consists of a monolithic frontend application which is build in React Native, and a backend which consists of several 
services. For the build and deployment of our project, you will need a Kubernetes cluster with at least 3 CPUs and 5 GB of RAM, a mongoDB instance, a neo4j instance,
and a MySQL instance. We deployed these databases with the [Bitnami](https://bitnami.com) Helm charts, but that is flexible as long as your cluster secrets are properly configured as our app expects. Finally, we utilized [Istio](https://istio.io) for our ingress gateway and to provide our service mesh. Specifically, we utilized
[Istio-1.9.0](https://github.com/istio/istio/releases/tag/1.9.0). If you would like to configure https, you can utilize install [certmanager](https://cert-manager.io/docs/) with helm as well, and then kubectl apply the resources in pro-keeping-it-casual/kubernetes/certs. The database configuration is manually done, but our Istio set up is done with a bootstrap shell
script found in the pro-keeping-it-casual repo/folder, as we have some custom configuration. Lastly, you will need docker and kubectl installed to build and deploy
our application manually. [Kustomize](https://kustomize.io) is optional but highly recommended for deployment.

## Building

All of our individual projects are deployed on Kubernetes as pods, so all of our builds construct docker containers. In our actual production, we have automatic CI/CD
set up in each repo which builds, tags, and pushes docker images to our Google Cloud Image repository, then finally does a rollout release to deploy new releases to
our kubernetes cluster. To manually build the docker image for each repo is the exact same process, cd into the repo of interest and run "make push". This command
will fail for you most likely if you are not authenticated to use our project resources, so you will have to manually retag the docker images produced to
push them to your own image repository. 

## Deployment

Once you have all images built and pushed, you will be able to use kustomize to deploy each service. 

```
./kustomize edit set image gcr.io/PROJECT_ID/IMAGE:TAG=gcr.io/$PROJECT_ID/$IMAGE:$GITHUB_SHA
./kustomize build . | kubectl apply -f -
```
