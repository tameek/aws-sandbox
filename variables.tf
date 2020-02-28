#### Global Environment Variables ####

variable "df_region" {
  default = "us-east-2".  ###Change as needed ###
}

variable "df_az" {
  default = "us-east-2" ###Change as needed ###
}

variable "owner" { #this is how your instances will be tagged
}

variable "environment_tag" {
  default = "poc"
}

variable "ssh_key" {
}

#### VPC/Network Variables ####

variable "cidrs" {
  default = "10.0.0.0/16"
}

variable "public_subnet" {
  default = ["10.0.20.0/24"]
}

variable "private_subnet" {
  default = ["10.0.10.0/24"]
}

#### Bastion Variables ####

variable "bastion_instance_type" {
  default = "t2.micro" ###Change as needed ###

variable "bastion_ami" {}

variable "bastion_root_volume_size" {
  default = "100" ###Change as needed ###
}

#### POC Variables ####

variable "poc_instance_type" {
  default = "t2.micro" ###Change as needed ###
}

variable "poc_ami_image" {
  default = "ami-0b1ed640b025a4faa" ##AMI Name: CentOS77-Final-c73a09b5-e4ca-4b52-ae70-d5e34c2913db-ami-09b259ed7fd903a6f.4 Location: us-east-2
}

variable "poc_instance_count" {
}

#### Custom Variables ####

variable "my_source_ip" {
}

   variable "root_disk_size" {
	default = "100"
   }

    variable "root_disk_size" {
	default = "100" {
    }

   variable "data_disk_name" {
	default = "/dev/sdb"
   }
