# OpenStackSwissKnife
A Swiss knife tool set Docker image for managing OpenStack

[![Docker Hub](https://img.shields.io/badge/Docker%20Hub-info-blue.svg)](https://hub.docker.com/r/thyrlian/openstack-swissknife/)
[![Build Status](https://travis-ci.org/thyrlian/OpenStackSwissKnife.svg?branch=master)](https://travis-ci.org/thyrlian/OpenStackSwissKnife)

## What is included
* [Terraform](https://github.com/hashicorp/terraform)
* [OpenStackClient](https://github.com/openstack/python-openstackclient)
* [deprecated individual project clients](https://wiki.openstack.org/wiki/OpenStackClients) to cover the shortage of OpenStackClient

## Getting Started
```console
# build the docker image
docker build -t openstack-swissknife .

# run the docker container
docker run -it openstack-swissknife /bin/bash

# quit the container
exit

# stop and remove the container
docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
```

In order to use the OpenStackClient, you must [set the environment variables using the OpenStack RC file](http://docs.openstack.org/user-guide/common/cli-set-environment-variables-using-openstack-rc.html) first.  The OpenStack RC file can be downloaded from the OpenStack Dashboard by:

**OpenStack** -> **Project** -> **COMPUTE** -> **Access & Security** -> **API Access** -> **Download OpenStack RC File**

## Useful Links
* [Terraform Commands](https://www.terraform.io/docs/commands/)
* [Terraform for OpenStack](https://www.terraform.io/docs/providers/openstack/)
* [OpenStackClient Command List](http://docs.openstack.org/developer/python-openstackclient/command-list.html)
* [OpenStack CLI cheat sheet](http://docs.openstack.org/user-guide/cli-cheat-sheet.html)

## License

Copyright (c) 2016 Jing Li. It is released under the [MIT License](http://opensource.org/licenses/MIT). See the [LICENSE](https://github.com/thyrlian/OpenStackSwissKnife/blob/master/LICENSE) file for details.
