variable "hcloud_token" {}

provider "hcloud" {
	token = "${var.hcloud_token}"
}

resource "hcloud_server" "test" {
	name 				= "terraform-test"
	image 			= "ubuntu-24.04"
	server_type = "cx22"

	ssh_keys 		= [hcloud_ssh_key.test.id]
}

resource "hcloud_ssh_key" "test" {
  name       = "terraform-test"
  public_key = file("C:/Users/jongr/.ssh/id_rsa.pub")
}

# resource "hcloud_volume" "storage" {
# 	name = "test-storage"
# 	size = 10
# 	server_id = "${hcloud_server.test.id}"
# 	automount = true
# 	format = "ext4"
# }