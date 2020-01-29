// output "ssh_private_key" {
//   description = "Generated private key"
//   value       = tls_private_key.streisand.private_key_pem
// }

output "server_public_ip" {
  description = "Generated private key"
  value       = digitalocean_droplet.streisand.ipv4_address
}

output "server_urn" {
  description = "Generated private key"
  value       = digitalocean_droplet.streisand.urn
}
