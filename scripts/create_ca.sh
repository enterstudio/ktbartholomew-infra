#!/bin/bash

rootpath="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/.. && pwd )"

openssl genrsa -out ${rootpath}/certs/ca/ca-key.pem 2048

openssl \
req \
-x509 \
-new \
-nodes \
-key ${rootpath}/certs/ca/ca-key.pem \
-days 10000 \
-out ${rootpath}/certs/ca/ca.pem \
-subj "/CN=kubernetes-ca"
