# Background

This repo contains the files necessary to build the Docker container used to run Bertini jobs onthe PRP Nautiful Kubernets cluster.

It's purpose built to use an input file from S3 and move output files back to S3.

The S3 credentials are read from a Kubernets Secret via a volume to avoid passing sensitive as environment variables.

# Building Docker Image

# Creating Kubernets Secrets

Create two files:
1. aws_key.txt
2. aws_secret.txt

Add your your AWS access key and secret access key to the appropriate file.

Using kubectl, create two secrets using the data from the files you just created.

```
 $ kubectl create -n <my_namespace> secret generic awsbertinicreds --from-file=aws_key.txt --from-file=aws_secret.txt
 ```

 Check that the secret was created:

 ```
 $ kubectl get -n my_namespace secrets
 ```


# Running Container

