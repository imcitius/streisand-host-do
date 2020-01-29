terraform {
  required_version = ">= 0.12"
}

provider "digitalocean" {
  token = var.do_token
}

terraform {
  backend "remote" {
    organization = "citius"

    workspaces {
      name = "streisand-host-do"
    }
  }
}
