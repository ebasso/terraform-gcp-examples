provider "google" {
  credentials = "${file("../CREDENTIALS_FILE.json")}"
  region  = "${var.region}"
  zone    = "${var.zone}"
  project = "${var.project}"
}

resource "google_compute_network" "vpc_network" {
  name                    = "${var.project}-vpc-network"
  auto_create_subnetworks = "true"
}

// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 8
}

resource "google_compute_instance" "vm_instance" {
  name         = "${var.computer_name}-${random_id.instance_id.hex}"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    #network       = "${google_compute_network.vpc_network.self_link}"
    access_config = {
    // Include this section to give the VM an external ip address
    }
  }
}

resource "google_compute_firewall" "default" {
 name    = "flask-app-firewall"
 network = "default"

 allow {
   protocol = "tcp"
   ports    = ["5000"]
 }
}
