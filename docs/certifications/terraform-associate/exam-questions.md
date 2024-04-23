---
title: Terraform Exam questions review
---

## Versions

When using constraint expressions to signify a version of a provider, which of the following are valid provider versions that satisfy the expression found in the following code snippet: (select two)

```hcl
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version ~> "5.36.0"
    }
  }
}
```

- [x] AWS provider version: `5.36.9`
- [ ] AWS provider version: `5.37.0`
- [x] AWS provider version: `5.36.3`
- [ ] AWS provider version: `5.3.1`

In Terraform, `required_providers` act as traffic controllers for your infrastructure tools. They ensure all modules use the right versions of providers like AWS or Azure, avoiding compatibility issues and guaranteeing everyone plays by the same rules. Think of them as a clear roadmap for your infrastructure setup, leading to consistent, predictable, and secure deployments.

A version constraint is a string literal containing one or more conditions, which are separated by commas.

Each condition consists of an operator and a version number.

Version numbers should be a series of numbers separated by periods (like 1.2.0), optionally with a suffix to indicate a beta release:

~>: Allows only the rightmost version component to increment. This format is referred to as the pessimistic constraint operator. For example, to allow new patch releases within a specific minor release, use the full version number:

~> 1.0.4: Allows Terraform to install 1.0.5 and 1.0.10 but not 1.1.0.

~> 1.1: Allows Terraform to install 1.2 and 1.10 but not 2.0.

https://developer.hashicorp.com/terraform/language/modules/syntax#version

https://developer.hashicorp.com/terraform/language/expressions/version-constraints#version-constraint-syntax

## Migration to terraform cloud version

After many years of using Terraform Community (Free), you decide to migrate to Terraform Cloud. After the initial configuration, you create a workspace and migrate your existing state and configuration. What Terraform version would the new workspace be configured to use after the migration?

- [ ] the latest major release of Terraform
- [ ] the most recent version of Terraform available
- [x] the same Terraform version that was used to perform the migration
- [ ] whatever version is defined in the `terraform` block

When you create a new workspace, Terraform Cloud automatically selects the most recent version of Terraform available. If you migrate an existing project from the CLI to Terraform Cloud, Terraform Cloud configures the workspace to use the same version as the Terraform binary you used when migrating. Terraform Cloud lets you change the version a workspace uses on the workspace's settings page to control how and when your projects use newer versions of Terraform.

It's worth noting that Terraform Cloud also provides the ability to upgrade your Terraform version in a controlled manner. This allows you to upgrade your Terraform version in a safe and predictable way, without affecting your existing infrastructure or state.

https://developer.hashicorp.com/terraform/tutorials/cloud/cloud-versions

## Publishing on the terraform registry

Anyone can publish and share modules on the `Terraform Public Registry`, and meeting the requirements for publishing a module is extremely easy.

What are some of the requirements that must be met in order to publish a module on the Terraform Public Registry? (select three)

- [x] The module must be on GitHub and must be a public repo.
- [ ] The module must be PCI/HIPPA compliant.
- [x] Module repositories must use this three-part name format, `terraform-<PROVIDER>-<NAME>`.
- [x] The registry uses tags to identify module versions. Release tag names must be for the format x.y.z, and can optionally be prefixed with a v .


The list below contains all the requirements for publishing a module. Meeting the requirements for publishing a module is extremely easy. The list may appear long only to ensure we're detailed, but adhering to the requirements should happen naturally.

* GitHub. The module must be on GitHub and must be a public repo. This is only a requirement for the [public registry](https://registry.terraform.io/). If you're using a private registry, you may ignore this requirement
* Named `terraform-<PROVIDER>-<NAME>`. Module repositories must use this three-part name format, where `<NAME>` reflects the type of infrastructure the module manages and `<PROVIDER>` is the main provider where it creates that infrastructure. The `<NAME>` segment can contain additional hyphens. Examples: `terraform-google-vault` or `terraform-aws-ec2-instance`.
* Repository description. The GitHub repository description is used to populate the short description of the module. This should be a simple one-sentence description of the module.
* Standard module structure. The module must adhere to the [standard module structure](https://developer.hashicorp.com/terraform/language/modules/develop#standard-module-structure). This allows the registry to inspect your module and generate documentation, track resource usage, parse submodules and examples, and more.
* `x.y.z` tags for releases. The registry uses tags to identify module versions. Release tag names must be a semantic version, which can optionally be prefixed with a v. For example, v1.0.4 and 0.9.2. To publish a module initially, at least one release tag must be present. Tags that don't look like version numbers are ignored.

## Implicit dependency

From the code below, identify the implicit dependency:

```hcl
resource "aws_eip" "public_ip" {
    vpc      = true
    instance = aws_instance.web_server.id
}

resource "aws_instance" "web_server" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  depends_on    = [aws_s3_bucket.company_data]
}
```

- [x] The EC2 instance labeled web_server
- [ ] The EIP with an id of ami-2757f631
- [ ] The AMI used for the EC2 instance
- [ ] The S3 bucket labeled company_data

The implicit dependency in the code is the EC2 instance labeled "web_server" because the aws_eip resource depends on the aws_instance.web_server.id for its instance attribute.

Implicit dependencies are **not** explicitly declared in the configuration but are automatically detected by Terraform based on the relationships between resources. Implicit dependencies allow Terraform to automatically determine the correct order in which resources should be created, updated, or deleted, ensuring that resources are created in the right order, and dependencies are satisfied.

For example, if you have a resource that depends on another resource, Terraform will automatically detect this relationship and create the dependent resource after the resource it depends on has been created. This allows Terraform to manage complex infrastructure deployments in an efficient and predictable way.

The EC2 instance labeled `web_server` is the implicit dependency as the `aws_eip` cannot be created until the `aws_instance` labeled web_server has been provisioned and the id is available.


Note that `aws_s3_bucket.company_data` is an **explicit** dependency for the `aws_instance.web_server`

## Init file locations

A user runs `terraform init` on their RHEL-based server, and per the output, two provider plugins are downloaded:

```shell
$ terraform init

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "aws" (hashicorp/aws) 2.44.0...
- Downloading plugin for provider "random" (hashicorp/random) 2.2.1...

Terraform has been successfully initialized!
```

Where are these plugins downloaded and stored on the server?

- [ ] The `.terraform.plugins` directory in the current working directory
- [ ] The `.terraform.d` directory in the current working directory
- [ ] `/etc/terraform/plugins`
- [x] The `.terraform/providers` directory in the current working directory


By default, terraform init downloads plugins into a subdirectory of the working directory, .terraform/providers so that each working directory is self-contained.

See the example below, where I ran a terraform init and you can see the resulting directory (highlighted in the red box) and then the actual provider that was downloaded (highlighted by the green arrow)

![Terraform init dir](https://img-c.udemycdn.com/redactor/raw/practice_test_question_explanation/2023-02-11_15-21-21-d3ef65b58d9dcdf6393d3f8fc0e52d4e.png)

## Invalid naming of Variables

Which of the following is a valid variable name in Terraform?

- [ ] `lifecycle`
- [ ] `count`
- [ ] `version`
- [x] `invalid`


In Terraform, variable names must follow a set of naming conventions to be considered valid. Here are some examples of invalid variable names:

Names that start with a number: `1_invalid_variable_name`

Names that contain spaces or special characters (other than underscores): `invalid variable name`

Names that contain only numbers: `12345`

Names that are the same as Terraform reserved words, such as `source`, `version`, `providers`, `count`, `for_each`, `lifecycle`, `depends_on`, `locals`.

## State location for Workspaces in free

Where does Terraform Community (Free) store the local state for workspaces?

- [x] directory called `terraform.tfstate.d/<workspace name>`
- [ ] a file called terraform.tfstate.backup
- [ ] a file called terraform.tfstate
- [ ] directory called terraform.workspaces.tfstate


Terraform Community (Free) stores the local state for workspaces in a file on disk. For local state, Terraform stores the workspace states in a directory called `terraform.tfstate.d/<workspace_name>`. Here's a screenshot of a Terraform run that was created using a workspace called training. You can see that Terraform created the `terraform.tfstate.d` directory, and then a directory with the namespace name underneath it.

Under each directory, you'll find the state file, which is name `terraform.tfstate`

![](https://img-c.udemycdn.com/redactor/raw/practice_test_question_explanation/2022-11-18_12-53-25-c8020271c9df1f7cd01ac8daf5ae9911.png)

https://developer.hashicorp.com/terraform/cli/workspaces#workspace-internals

## Terraform refresh

True or False? The `terraform plan -refresh-only` command is used to create a plan whose goal is only to update the Terraform state to match any changes made to remote objects outside of Terraform.

- [ ] False
- [x] True


The `terraform plan -refresh-only` command is used in Terraform to update the state of your infrastructure in memory without making any actual changes to the infrastructure. The -refresh-only flag tells Terraform to only update its understanding of the current state of the infrastructure and not to make any changes.

When you run `terraform plan -refresh-only`, Terraform will query the current state of your infrastructure and update its internal state to reflect what it finds. This can be useful if you want to ensure that Terraform has the most up-to-date information about your infrastructure before generating a plan, without actually making any changes.

It is important to note that while the `terraform plan -refresh-only` command updates Terraform's internal state, it does not modify the Terraform state file on disk. The Terraform state file is only updated when Terraform actually makes changes to the infrastructure.

Note that this command replaced the deprecated command terraform refresh

https://developer.hashicorp.com/terraform/cli/commands/plan#planning-modes

https://developer.hashicorp.com/terraform/cli/commands/refresh


## Unlocking state

What Terraform command can be used to remove the lock on the state for the current configuration?

- [ ] `terraform state-unlock`
Removing the lock on a state file is not possible
- [x] `terraform force-unlock`
- [ ] `terraform unlock`


The `terraform force-unlock` command can be used to remove the lock on the Terraform state for the current configuration. Another option is to use the "terraform state rm" command followed by the "terraform state push" command to forcibly overwrite the state on the remote backend, effectively removing the lock. It's important to note that these commands should be used with caution, as they can potentially cause conflicts and data loss if not used properly.

Be very careful forcing an unlock, as it could cause data corruption and problems with your state file.
