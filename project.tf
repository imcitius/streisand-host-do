resource "digitalocean_project" "streisand" {
  name        = "streisand vpn"
  purpose     = "VPN server"
  resources   = [digitalocean_droplet.streisand.urn]
}