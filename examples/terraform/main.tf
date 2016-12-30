resource "openstack_compute_instance_v2" "<INSTANCE_NAME>" {
    name = "<INSTANCE_NAME>"
    image_name = "${var.image}"
    flavor_name = "${var.flavor}"
    key_pair = "${var.key_pair}"
    security_groups = "${var.security_groups}"

    network {
        name = "${var.network}"
    }
}