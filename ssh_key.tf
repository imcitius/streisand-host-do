resource "digitalocean_ssh_key" "streisand" {
  name       = "streisand"
  public_key = tls_private_key.streisand.public_key_openssh
}

resource "tls_private_key" "streisand" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
