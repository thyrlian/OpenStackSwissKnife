#!/bin/bash

# Download the OpenStack RC file
# OpenStack -> Project -> COMPUTE -> Access & Security -> API Access -> Download OpenStack RC File
# source PROJECT-openrc.sh
# Enter your OpenStack Password (will be saved to $OS_PASSWORD)
# You can also use password argument instead of saving it to environmental variable
# e.g.: openstack --os-password PASSWORD server list

# To get FLAVOR_ID
# openstack flavor list

# To get IMAGE_ID or SNAPSHOT_ID
# openstack image list

# To get KEY_PAIR_NAME
# openstack keypair list

# To get AVAILABILITY_ZONE
# openstack availability zone list

# To get SECURITY_GROUPS
# openstack security group list

# To get NETWORK_ID
# openstack network list

# To get IP_ADDRESS inside HOST_RANGE
# neutron net-list
# subnetcalc <NETWORK>

nova boot --flavor <FLAVOR_ID> --image <IMAGE_ID> --snapshot <SNAPSHOT_ID> --key-name <KEY_PAIR_NAME> --availability-zone <AVAILABILITY_ZONE> --security-groups <SECURITY_GROUP_1, SECURITY_GROUP_2, ...> --nic net-id=<NETWORK_ID>[,v4-fixed-ip=<IP_ADDRESS>] --poll <INSTANCE_NAME>
