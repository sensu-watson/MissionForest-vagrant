# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|

  config.vm.box = "bento/ubuntu-18.04"

  # config.vm.network "forwarded_port", guest: 8890, host: 8890
  # config.vm.network "forwarded_port", guest: 8080, host: 8080
  
  config.vm.network "private_network", ip: "192.168.33.10"

    config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.synced_folder './provision-script', '/home/vagrant/provisioner', type:'virtualbox', create: true, owner: 'vagrant', group: 'vagrant', disabled: false
  config.vm.synced_folder './MissionForest', '/home/vagrant/MissionForest', type:'virtualbox', create: true, owner: 'vagrant', group: 'vagrant', disabled: false

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024", "--cpus", "2", "--ioapic", "on"]
  end
  
  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
  config.vm.provision :shell, :path => "./provision-script/init.sh",:privileged => false
end
