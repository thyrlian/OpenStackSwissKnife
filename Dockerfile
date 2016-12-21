# ====================================================================== #
# OpenStackSwissKnife Docker Image
# ====================================================================== #


# Base image
# ---------------------------------------------------------------------- #
FROM ubuntu:latest


# Author
# ---------------------------------------------------------------------- #
MAINTAINER Jing Li <thyrlian@gmail.com>


# Essential tools
RUN apt-get update -y && \
    apt-get install -y git wget zip

# Go
ENV GO_VERSION=1.7.4
RUN wget -q https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz && \
    rm /go*.tar.gz && mkdir -p /tools/go
ENV GOPATH /tools/go
ENV PATH ${PATH}:/usr/local/go/bin:${GOPATH}/bin

# Terraform
ENV TERRAFORM_VERSION=0.8.1
ENV TERRAFORM_HOME ${GOPATH}/src/github.com/hashicorp/terraform
WORKDIR ${TERRAFORM_HOME}
RUN git clone https://github.com/hashicorp/terraform.git ${TERRAFORM_HOME} && \
    git checkout v${TERRAFORM_VERSION} && \
    scripts/build.sh

# Nova
RUN apt install -y python-dev python-pip && \
    pip install --upgrade pip && \
    pip install python-openstackclient

WORKDIR /tools
