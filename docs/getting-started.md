# Getting Started

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
