#!/bin/sh

cd /bertini/files

echo "Downloading input files from S3..."

aws s3 cp $1 /bertini/files --recursive

echo "S3 download complete..."

echo "Running Bertini..."

/bertini/BertiniLinux64_v1.6/bertini /bertini/files/$2

echo "Bertini has completed..."

echo "Uploading results to S3..."

aws s3 cp ./ $1 --recursive
