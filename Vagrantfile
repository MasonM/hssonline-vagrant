# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "ubuntu/trusty64"

	config.vm.define :hss do |hss_config|
		hss_config.vm.network :private_network, ip: "192.168.3.3"
		#hss_config.vm.network "forwarded_port", guest: 3306, host: 3306
		hss_config.vm.network "forwarded_port", guest: 80, host: 8080
		hss_config.vm.network "forwarded_port", guest: 8000, host: 8001

		hss_config.vm.provider "virtualbox" do |vb|
			vb.customize ["modifyvm", :id, "--memory", "2048"]
		end

		# Patch for https://github.com/mitchellh/vagrant/issues/6793
		hss_config.vm.provision "shell" do |s|
			s.inline = '[[ ! -f $1 ]] || grep -F -q "$2" $1 || sed -i "/__main__/a \\    $2" $1'
			s.args = ['/usr/bin/ansible-galaxy', "if sys.argv == ['/usr/bin/ansible-galaxy', '--help']: sys.argv.insert(1, 'info')"]
		end

		hss_config.vm.provision "ansible_local" do |ansible|
			ansible.install = true
			ansible.playbook = "playbook.yml"
			ansible.verbose = "vv"
			ansible.sudo = true
		end	

		hss_config.vm.synced_folder '/home/masonm/src/hss', '/home/vagrant/hss'
	end
end
