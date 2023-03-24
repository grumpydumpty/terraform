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

## Variables

These can be set at any level but we generally set them at the group or project level.

| Variable        | Value                                                                           |
|-----------------|---------------------------------------------------------------------------------|
| HARBOR_HOST     | hostname of harbor instance, no `http://` or `https://`                         |
| HARBOR_CERT     | PEM format certificate with each `\n` (actual char) replaced with `"\n"` string |
|                 | Run the following command:                                                      |
|                 | `cat harbor.crt | sed -E '$!s/$/\\n/' | tr -d '\n'`                             |
|                 | where `harbor.crt`                                                              |
| HARBOR_USER     | Username of harbor user with permissions to push images                         |
| HARBOR_EMAIL    | Email  of harbor user with permissions to push images                           |
| HARBOR_PASSWORD | Password of harbor user with permissions to push images                         |

## Credits

_Originally taken from here: [tenthirtyam/container-terraform](https://github.com/tenthirtyam/container-terraform/)_
