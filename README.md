# SD-Core Traefik K8s Terraform Module

This SD-Core Traefik K8s Terraform module aims to deploy the [traefik-k8s charm](https://charmhub.io/traefik-k8s) via Terraform.

## Getting Started

### Install requirements

The following software and tools needs to be installed and should be running in the local environment.

- `microk8s`
- `juju 3.x`
- `terrafom`

Install Microk8s:

```console
sudo snap install microk8s --channel=1.27-strict/stable
sudo usermod -a -G snap_microk8s $USER
newgrp snap_microk8s
sudo microk8s enable hostpath-storage
```

Enable `dns`, `storage` and `metallb` plugin.

```console
sudo microk8s enable storage dns
sudo microk8s enable metallb:10.0.0.2-10.0.0.100
```


Install Juju:

```console
sudo snap install juju --channel=3.1/stable
```

Install Terraform:

```console
sudo snap install --classic terraform
```

### Bootstrap the Juju using Microk8s and create a model to deploy Terraform module

Bootstrap Juju Controller:

```console
juju bootstrap microk8s
```

### Deploy Mongodb-k8s using Terraform

Initialise the provider:

```console
terraform init
```

Customize the configuration inputs under `terraform.tfvars` file according to requirement.

Sample contents of `terraform.tfvars` file:

```yaml
model_name ="test"
channel ="latest/stable"
```

Run Terraform plan by providing var-file:

```console
terraform plan -var-file="terraform.tfvars" 
```

Deploy the resources, skip the approval.

```console
terraform apply -auto-approve 
```

```{note}
After running above command, if you get the error below, run the `terraform apply -auto-approve` again.
`Unable to create application, got error: model "<model_name>" not found`
```

### Check the Output

Run `juju switch <juju model>` to switch to the target Juju model and observe the status of the application.

```console
juju status --relations
```

The output should be similar to the following:

```console 
```

### Clean up 

Remove the application:

```console
terraform destroy -auto-approve
```

