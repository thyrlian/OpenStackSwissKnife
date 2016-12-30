variable "image" {
    default = "<IMAGE_NAME>"
}

variable "flavor" {
    default = "<FLAVOR_NAME>"
}

variable "key_pair" {
    default = "<KEY_PAIR_NAME>"
}

variable "security_groups" {
    default = ["<SECURITY_GROUP_NAME_1>", "<SECURITY_GROUP_NAME_2>", ...]
}

variable "network" {
    default = "<NETWORK_NAME>"
}