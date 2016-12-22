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
ENV TERRAFORM_VERSION=0.8.2
ENV TERRAFORM_HOME ${GOPATH}/src/github.com/hashicorp/terraform
WORKDIR ${TERRAFORM_HOME}
RUN git clone https://github.com/hashicorp/terraform.git ${TERRAFORM_HOME} && \
    git checkout v${TERRAFORM_VERSION} && \
    scripts/build.sh

# Nova
RUN apt install -y python-dev python-pip && \
    pip install --upgrade pip && \
    pip install python-openstackclient && \
    # the following individual clients are deprecated
    # but you may still need some of them
    # since the openstackclient's coverage is not yet sufficient
    # openstackclient already contains cinder, glance, nova clients
    pip install python-barbicanclient && \
    pip install python-ceilometerclient && \
    pip install python-cinderclient && \
    pip install python-cloudkittyclient && \
    pip install python-designateclient && \
    pip install python-fuelclient && \
    pip install python-glanceclient && \
    pip install python-gnocchiclient && \
    pip install python-heatclient && \
    pip install python-magnumclient && \
    pip install python-manilaclient && \
    pip install python-mistralclient && \
    pip install python-monascaclient && \
    pip install python-muranoclient && \
    pip install python-neutronclient && \
    pip install python-novaclient && \
    pip install python-saharaclient && \
    pip install python-senlinclient && \
    pip install python-swiftclient && \
    pip install python-troveclient

WORKDIR /tools
