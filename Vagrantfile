# -*- mode: ruby -*# vi: set ft=ruby :
require 'yaml'
vagrantConfig = YAML.load_file 'Vagrantfile.config.yml'
Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-14.04"
  config.vm.network "private_network", ip: vagrantConfig['ip']

  config.vm.synced_folder "src/", "/home/vagrant/src", owner:"vagrant", group: "vagrant"
  config.vm.synced_folder "spec/", "/home/vagrant/spec", owner:"vagrant", group: "vagrant"
  config.vm.synced_folder "rockspecs/", "/home/vagrant/rockspecs", owner:"vagrant", group: "vagrant"

  # VirtualBox specific settings
  config.vm.provider "virtualbox" do |vb|
  vb.gui = false
  vb.memory = "1024"
  vb.cpus = 1
  end

  # provisioning os
  config.vm.provision "shell", inline: "sudo apt-get install python-pip -y"
  config.vm.provision "shell", inline: "sudo apt-get install libncurses5-dev -y"
  config.vm.provision "shell", inline: "sudo apt-get install zip -y"
  config.vm.provision "shell", inline: "sudo apt-get install unzip -y"
  config.vm.provision "shell", inline: "sudo apt-get install wget"
  config.vm.provision "shell", inline: "sudo pip install hererocks"
  config.vm.provision "shell", inline: "hererocks lua_install -r^ --lua=5.3"
  config.vm.provision "shell", inline: "echo 'PATH=$PATH:/home/vagrant/lua_install/bin' >> .bashrc"
  config.vm.provision "shell", inline: "source .bashrc"
  config.vm.provision "shell", inline: "lua_install/bin/luarocks install luacheck"
  config.vm.provision "shell", inline: "lua_install/bin/luarocks install busted"
  config.vm.provision "shell", inline: "lua_install/bin/luarocks install luacov"
  config.vm.provision "shell", inline: "lua_install/bin/luarocks install lua-path"
  config.vm.provision "shell", inline: "lua_install/bin/luarocks install luacov-coveralls"
end
