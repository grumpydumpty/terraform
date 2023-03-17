# Container Image for HashiCorp Terraform

## Overview

Provides a container image for running HashiCorp Terraform.

This image includes the following components:

| Component           | Version | Description                                                                                                                                        |
|---------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------|
| VMware Photon OS    | 4.0     | A Linux container host optimized for vSphere and cloud-computing platforms.                                                                        |
| HashiCorp Terraform | 1.2.7   | Terraform is an open-source infrastructure-as-code software that enables you to safely and predictably create, change, and improve infrastructure. |

## Get Started

Run the following to download the latest container from Docker Hub:

```bash
docker pull harbor.sydeng.vmware.com/rcroft/terraform:latest
```

Run the following to download a specific version from Docker Hub:

```bash
docker pull harbor.sydeng.vmware.com/rcroft/terraform:x.y.z
```

Open an interactive terminal:

```bash
docker run --rm -it harbor.sydeng.vmware.com/rcroft/terraform console
```

Run a local plan:

```bash
 cd /path/to/tf/files
docker run --rm -it --name terraform -v $(pwd):/tmp -w /tmp harbor.sydeng.vmware.com/rcroft/terraform init
docker run --rm -it --name terraform -v $(pwd):/tmp -w /tmp harbor.sydeng.vmware.com/rcroft/terraform validate
docker run --rm -it --name terraform -v $(pwd):/tmp -w /tmp harbor.sydeng.vmware.com/rcroft/terraform fmt
docker run --rm -it --name terraform -v $(pwd):/tmp -w /tmp harbor.sydeng.vmware.com/rcroft/terraform plan
docker run --rm -it --name terraform -v $(pwd):/tmp -w /tmp harbor.sydeng.vmware.com/rcroft/terraform apply
```

Where `/path/to/tf/files` is the local path for your Terraform scripts.

## Credits

_Originally taken from here: [tenthirtyam/container-terraform](https://github.com/tenthirtyam/container-terraform/)_
