variable "name" {
  description = "Name of the instance"
  type = string
}

variable "description" {
  description = "Description of the instance"
  type = string
}
variable "ami_id" {
  description = "AMI image ID from which the instance will be created"
  type = string
}

variable "private_ip" {
  description = "Optional static private IP address to allocate to the instance. If not specified it will be given by DHCP"
  type = string
  default = null
}

variable "user_data" {
  description = "Optional commands to be added to the userdata script. These will be executed on every startup"
  type = string
  default = ""
}

variable "volume_size" {
  description = "Volume size"
  type = number
  default = 8
}

variable "volume_type" {
  description = "Volume type"
  type = string
  default = "gp2"
}

variable "subnet_id" {
  description = "The AWS subnet ID into which the instance will be launched"
  type = string
}

variable "security_group_ids" {
  description = "Set of AWS security group IDs that will be attached to the instance"
  type = set(string)
}

variable "authorized_keys" {
  description = "Optional authorized SSH keys file which will be injected into the bastion on startup"
  type = string
  default = null
}

variable "authorized_keys_home" {
  description = "Home folder in which SSH keys will be added"
  type = string
  default = "/home/ubuntu"
}

variable "instance_type" {
  description = "EC2 instance type to launch. Defaults to t3a.nano"
  type = string
  default = "t3a.nano"
}

variable "key_name" {
  description = "Optional EC2 key pair to associate with the instance"
  type = string
  default = null
}

variable "elastic_ip" {
  description = "Boolean flag, if true an Elastic IP will be allocated to the instance"
  type = bool
  default = false
}

variable "iam_instance_profile" {
  description = "Optional IAM instance profile name"
  type = string
  default = null
}

variable "monitoring" {
  description = "Enable detailed instance monitoring"
  type = bool
  default = true
}

variable "get_password_data" {
  description = "Boolean flag, if true when provisioning the instance the initial password will be retrieved from the instance. This cannot be changes to true after initial deployment as the password is no longer retrievable"
  type = bool
  default = false
}

variable "termination_protection" {
  description = "Boolean flag, if true will enable EC2 instance termination protection"
  type = bool
  default = false
}