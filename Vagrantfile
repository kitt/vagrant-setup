# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder ".", "/home/vagrant/refresh"
  config.vm.provision :shell, path: "vagrantBootstrap.sh"
  config.vm.network "forwarded_port", guest: 4000, host: 4000
  config.vm.provider "virtualbox" do |vb|
    vb.name = "refreshpdx-jekyll"
  end
end
