provider "hcloud" {
	token = "${var.hcloud_token}"
}

resource "hcloud_server" "test" {
	name 				= "test"
	image 			= "ubuntu-24.04"
	server_type = "cx22"

	ssh_keys 		= [var.ssh_key_name]
}

output "server_ip" {
	value = hcloud_server.test.ipv4_address
}

resource "local_file" "ansible_inventory" {
	content = <<EOT
	[servers]
	${hcloud_server.test.ipv4_address} ansible_user=root ansible_ssh_private_key_file=~/.ssh/id_rsa

	EOT
	filename = "../ansible/inventory.ini"
}

resource "null_resource" "provision" {
	depends_on = [ hcloud_server.test, local_file.ansible_inventory ]

	triggers = {
		always_run = timestamp()
	}

	provisioner "local-exec" {
		command = "ansible-playbook -i ../ansible/inventory.ini ../ansible/playbook.yml"
	}
}

# resource "hcloud_volume" "storage" {
# 	name = "test-storage"
# 	size = 10
# 	server_id = "${hcloud_server.test.id}"
# 	automount = true
# 	format = "ext4"
# }