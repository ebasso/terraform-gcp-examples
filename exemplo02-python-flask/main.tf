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

resource "google_compute_instance" "vm_instance" {
  name         = "${var.computer_name}"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "${google_compute_network.vpc_network.self_link}"
    access_config = {
    }
  }

  metadata {
    sshKeys = "${var.ssh_username}:${file("~/.ssh/id_rsa.pub")}"
  }

  // Make sure flask is installed on all new instances for later steps
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"
}

