resource "local_file" "ansible_inventory" {
    content = templatefile("ansible_inv.tpl",
      { vm_ip_address = "192.168.0.3", 
        private_ssh_key = "/home/vagrant/.ssh/id_rsa" })
    filename = "inventory"
}

# resource "null_resource" "run_ansible" {
#   provisioner "local-exec" {
#     command = "ansible-playbook -i inventory playbook.yml"
#   }
# }

resource "null_resource" "docker_build" {
  provisioner "local-exec" {
    command = <<-EOF
      echo ${var.tf_token} | docker login -u fenikks ghcr.io --password-stdin
      docker build -t ghcr.io/fenikks/google_small:tf -f Dockerfile.multi .
      docker push ghcr.io/fenikks/google_small:tf
    EOF
  }

  triggers = {
    docker_file = md5(file("Dockerfile.multi"))
  }
}