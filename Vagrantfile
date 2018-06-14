# -*- mode: ruby -*-
# vi: set ft=ruby :

$puppet_ip = "192.168.30.130"

Vagrant.configure("2") do |config|
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"

  config.vm.define "puppetmaster01" do |puppetmaster|

    puppetmaster.vm.hostname = "puppetmaster01"
    puppetmaster.vm.network "private_network", ip: $puppet_ip

    puppetmaster.vm.provider "vmware_fusion" do |v|
      v.vmx["memsize"] = "4096"
      v.vmx["numvcpus"] = "2"
    end

    puppetmaster.vm.provision "shell", inline: "apt-get update"

    puppetmaster.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "puppetmaster01/manifests"
      puppet.module_path    = "puppetmaster01/modules"
      puppet.manifest_file  = "site.pp"
    end
  end
end
