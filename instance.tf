resource "digitalocean_droplet" "streisand" {
  image  = "ubuntu-16-04-x64"
  name   = "streisand"
  region = "fra1"
  size   = "s-1vcpu-1gb"
  ssh_keys = [digitalocean_ssh_key.streisand.fingerprint]

  provisioner "local-exec" {
    command = "echo '${tls_private_key.streisand.private_key_pem}' > ssh_private_key.pem"
  }

  provisioner "local-exec" {
    command = "echo '${tls_private_key.streisand.public_key_openssh}' > ssh_private_key.pem.pub"
  }

  provisioner "local-exec" {
    command = "chmod 0600 ssh_private_key.pem*"
  }

  provisioner "local-exec" {
    command = "echo '${self.ipv4_address}' > private_ip.txt"
  }

  provisioner "local-exec" {
    command = "./provision.sh"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "rm -f private_ip.txt"
  }
}