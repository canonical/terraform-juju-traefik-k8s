variable "model_name" {
  description = "Name of Juju model to deploy application to."
  type        = string
  default     = "test"
}

variable "channel" {
  description = "The channel to use when deploying a charm."
  type        = string
  default     = "latest/stable"
}

variable "external_hostname" {
  description = "The DNS name to be used by Traefik ingress."
  type        = string
  default     = ""
}