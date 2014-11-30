# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Vagrant box details. Will download from the below location if it's not cached locally
  config.vm.box = "ferventcoder/win2008r2-x64-nocm"
  config.vm.box_url = "https://vagrantcloud.com/ferventcoder/boxes/win2008r2-x64-nocm/versions/1/providers/virtualbox.box"
  

  # Needed to let vagrant know to use winrm instead of ssh for communication
  config.vm.communicator = "winrm"
  
  # Port forwarding to be able to rdp into the box
  config.vm.network "forwarded_port", host: 33390, guest: 3389
  
  # Run powershell script to download and install puppet agent. Vagrant oscar fails to install the agent for some reason
  config.vm.provision "shell", 
  	path: "scripts/Puppet-Install.ps1" 
  
  # Reboot the box after installing puppet
  config.vm.provision :reload
 
  # Puppet provisioner to test puppet modules
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "provisioning/puppet"
    puppet.manifest_file = "default.pp"
    puppet.module_path = "provisioning/puppet/modules"
    puppet.options = "--verbose --debug"
  end


end
