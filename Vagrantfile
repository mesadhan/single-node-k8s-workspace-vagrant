# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure(2) do |config|

  NodeCount = 1
  NodeName = "-workspace-"

  (1..NodeCount).each do |i|
    config.vm.define "ubuntu#{NodeName}0#{i}" do |node|

      node.vm.box = "ubuntu/bionic64"
      node.vm.hostname = "k8s#{NodeName}0#{i}.example.com"

      node.vm.network "private_network", ip: "172.16.0.20#{i}"
      node.ssh.forward_agent = true

      node.vm.network "forwarded_port", guest: 30000, host: 13000   # application external access port
      node.vm.network "forwarded_port", guest: 8080, host: 18080    # application external access port
      node.vm.network "forwarded_port", guest: 16443, host: 16443   # k8s api [hit command: microk8s.kubectl get config view]
      node.vm.network "forwarded_port", guest: 8001, host: 8001     # k8s ui

      node.vm.synced_folder "data-vagrant", "/home/data-vagrant"    # share local directory into the VM
      node.vm.provider "virtualbox" do |v|
        v.name = "k8s#{NodeName}0#{i}"
        v.memory = 2048
        v.cpus = 1
        v.gui = false
      end
    end
  end


  # Run a script when vm initialize
  config.vm.provision :shell, :path => "setup-k8s.sh"
end
