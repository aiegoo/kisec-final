# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.hostname = "siem-ubuntu-gui"
  config.vm.network "private_network", ip: "192.168.56.100"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "siem-ubuntu-gui"
    vb.gui = true
    vb.memory = 4096
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--vram", "128"] # Ensure enough video RAM
  end

  config.vm.provision "shell", inline: <<-SHELL
    echo "Updating system..."
    apt-get update
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -yq

    echo "Installing Desktop Environment..."
    # Minimal desktop instead of full ubuntu-desktop to avoid bloating
    DEBIAN_FRONTEND=noninteractive apt-get install -yq ubuntu-desktop gdm3

    echo "Enabling display manager..."
    systemctl enable gdm3
    systemctl set-default graphical.target

    echo "Rebooting to apply GUI..."
    reboot
  SHELL
end

