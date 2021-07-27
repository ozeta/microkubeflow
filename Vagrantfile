# -*- mode: ruby -*-
# vi: set ft=ruby :
#vagrant 2.2.10

require 'yaml'
boxes = YAML.load_file('./boxes.yml')

Vagrant.configure("2") do |config|
  boxes.each do |box|
    config.vm.define box['hostname'] do |host|
      host.vm.box = box['box']
      host.vm.box_version = box['box_version']
      host.vm.hostname = box['hostname']

      host.vm.provider "virtualbox" do |vb|
        vb.memory = box['memory']
        vb.cpus = box['cpus']
      end

      host.vm.network "private_network", ip: box['ip']

      box['shares'].each do |share|
        host.vm.synced_folder share['host'], share['guest'], type: 'virtualbox' , create: true
      end

      host.vm.provision "shell", path: box['provision'], :args => [box['ip']]

    end
  end
end
