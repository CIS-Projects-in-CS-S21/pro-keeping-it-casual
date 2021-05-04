# Keeping It Casual

Welcome to Keeping It Casual! Our architecture consists of a monolithic frontend application which is build in React Native, and a backend which consists of several 
services. For the build and deployment of our project, you will need a Kubernetes cluster with at least 3 CPUs and 5 GB of RAM. You will need docker and kubectl installed to build and deploy
our application manually. [Kustomize](https://kustomize.io) is optional but highly recommended for deployment. You will need a mongoDB instance, a neo4j instance,
and a MySQL instance. We deployed these databases with the [Bitnami](https://bitnami.com) Helm charts, but that is flexible as long as your cluster secrets are properly configured as our app expects (our resource definitions use bitnami defaults). Finally, we utilized [Istio](https://istio.io) for our ingress gateway and to provide our service mesh. Specifically, we utilized
[Istio-1.9.0](https://github.com/istio/istio/releases/tag/1.9.0). If you would like to configure https, you can utilize install [certmanager](https://cert-manager.io/docs/) with helm as well, and then kubectl apply the resources in pro-keeping-it-casual/kubernetes/certs, which will automatically request a master cert key from Let's Encrypt. You will need to change the host names in the resource definitions to be the domain that you own. The database configuration is manually done, but our Istio set up is done with a bootstrap shell
script found in the pro-keeping-it-casual repo/folder, as we have some custom configuration.

## Building

All of our individual projects are deployed on Kubernetes as pods, so all of our builds construct docker containers. In our actual production, we have automatic CI/CD
set up in each repo which builds, tags, and pushes docker images to our Google Cloud Image repository, then finally does a rollout release to deploy new releases to
our kubernetes cluster. To manually build the docker image for each repo is the exact same process, cd into the repo of interest and run "make push". This command
will fail for you most likely if you are not authenticated to use our project resources, so you will have to manually retag the docker images produced to
push them to your own image repository. 

## Deployment

NOTE: our Istio resources are configured to use the domain name that we own, namely keeping-it-casual.com. If you actually want the networking to work properly you will need to change all mentions of hostnames in istio-config.yaml files to be your owned domain name.

Once you have all images built and pushed, you will be able to use kustomize to deploy each service. From within each service directory, the below code block will
configure the resource definitions to use your docker image names. In the place of where you see $ variable substitution, you will need to put the name and tags
that you utilized when you built and pushed each docker image. 

```
./kustomize edit set image gcr.io/PROJECT_ID/IMAGE:TAG=gcr.io/$PROJECT_ID/$IMAGE:$GITHUB_SHA
./kustomize build . | kubectl apply -f -
```

Should you not wish to use kustomize, you will need to manually edit each resource definition in deployment/deployment.yaml to be the name of your image for each service, and the use 

```
kubectl apply -f deployment
```

to deploy. 

## Compiling the frontend directory
The frontend application can be compiled by navigating to the kic-frontend repo using the cd command and entering the following command:

```
expo start --no-dev --minify
```

This command will set the application to run in production mode. It will automatically open Metro Bundler in your default browser, which is a Javascript bundler responsible for compiling the frontend files. On the left menu bar of Metro Bundler, you will see a list of devices running the application, followed by several run options.

## Running the application locally
To run locally in a web browser, select “Run in web browser.” The web application will open in a new tab.

To run locally on a mobile device, first make sure you have the “Expo Go” app downloaded on your mobile device (available in the Google Play Store and Apple Store). Use your camera to scan the QR code on the Metro Bundler page to open the application through Expo Go. If you experience difficulties loading the project, switch the connection to “Tunnel” and wait for the “Tunnel ready” notification to appear. Make sure the device running Metro Bundler and the mobile device you are loading the app on are connected to the same Wi-Fi network. When the tunnel is ready, scan the QR code again for the project to automatically rebuild. If it does not automatically rebuild, close the Expo Go app and re-scan the QR code.

## Accessing the web application live
The live web application can be accessed at the following URL: [https://keeping-it-casual.com](https://keeping-it-casual.com).

## Accessing the mobile application live
The live mobile application can be accessed by downloading the Expo Go app.

For Android users: the application can be accessed by scanning the QR code on the project's Expo page: https://expo.io/@keepingitcasual/projects/KeepingItCasual. If you encounter an error loading the project, follow the steps for iOS users.

For iOS users: open the Expo Go app and select the "Profile" tab. When prompted, log in using the following credentials:

- Username: keepingitcasual
- Password: keepingitcasual

After logging in, you can select "KeepingItCasual" project under "Published Projects" to open the app or scan the QR code from https://expo.io/@keepingitcasual/projects/KeepingItCasual.
