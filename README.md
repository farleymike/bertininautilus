# Background

This repo contains the files necessary to build a Docker container used to run [Bertini](https://bertini.nd.edu/) jobs on the [PRP Nautilus](https://pacificresearchplatform.org/nautilus/) Kubernetes cluster.

It's purpose built to use an input file from S3 and move output back to the same S3 bucket/folder.

The S3 credentials are read from a Kubernetes Secret that must be created prior to creating the Kubernetes Job.

# Building Docker Image

# Creating Kubernets Secrets

Using kubectl, create one secret that will hold to values that corospond to your S3 access and secret keys.

```
 $ kubectl create -n <your namespace> secret generic awsbertinicreds --from-literal=AWS_ACCESS_KEY_ID=xxx --from-literal=AWS_SECRET_ACCESS_KEY='xxx'
 ```

 Check that the secret was created:

 ```
 $ kubectl get -n <your namespace> secrets
 ```

# Running Container

A sample Kubernetes job definition file is provide in the repot named bertinijob.yaml. This file will create a Kubernets Job that will run Bertini on the specified input. There are two things that need to be changed in this file:

Update the AWS region environment variable to match that of your S3 bucket location:

```
value: "us-west-2"
```

Update the command specifying your S3 bucket and Bertini input file name.

```
command: ["/bertini/runbertini.sh", "s3://bertini-nautilus/test2", "input"]
```