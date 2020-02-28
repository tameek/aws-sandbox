# Push-button AWS Sandbox

This project builds a 1, or multi-serve server environment for POC testing in AWS.  The environment includes all necessary network routes, and Security Group Fules
## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites
- aws cli installed on your local machine
- IAM user with adminstrative permissions
- terraform 11.0 or higher

Follow AWS recommendations for your API credenrtials and configure them in $HOME/.aws/credentials or by using the export command

Once the prerequisits are met, run 'terraform init' to download all necessary plugins (it's not too many)

```
$ terraform init

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "aws" (hashicorp/aws) 2.48.0...

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
$
```

Next, run 'terraform plan' this will show you what's about to be created. Note you will be asked for your source IP, which will be added to the bastion security group, owner tag, and number of servers in the poc


```
$ terraform init

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "aws" (hashicorp/aws) 2.48.0...

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
$ terraform plan
var.my_source_ip
  Enter a value: 1.1.1.1/32

var.owner
  Enter a value:

var.poc_instance_count
  Enter a value:

var.ssh_key
  Enter a value:

```

## Authors

* **Tameek Henderson** - *Initial work* - [aws-sandbox](https://github.com/tameek/aws-sandbox)
