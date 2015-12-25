# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "ubuntu/trusty64"

	config.vm.define :django do |django_config|
		django_config.vm.network :private_network, ip: "192.168.3.3"
		django_config.vm.network "forwarded_port", guest: 3306, host: 3306
		django_config.vm.network "forwarded_port", guest: 80, host: 8080
		django_config.vm.network "forwarded_port", guest: 8000, host: 8001

		django_config.vm.provider "virtualbox" do |vb|
			vb.customize ["modifyvm", :id, "--memory", "2048"]
		end

		django_config.vm.provision "ansible" do |ansible|
			ansible.playbook = "playbook.yml"
			ansible.verbose = "vv"
			ansible.sudo = true
		end	

		django_config.vm.synced_folder '/home/masonm/src/hss', '/var/www/hss', type: "nfs"
	end
end
