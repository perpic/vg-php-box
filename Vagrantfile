# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "box-cutter/centos64"

  # Use the shell provisioner to setup the machine
  config.vm.provision :shell, path: "bootstrap.sh"

  # Networking (port forwarding)
  config.vm.network :forwarded_port, host: 8080, guest: 80

  # Synced folders
  config.vm.synced_folder "../../Sites/giffgaff-fe", "/vagrant/www"
  config.vm.synced_folder "../../Sites/giffgaff-copy", "/vagrant/copy"

end