# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # Configure the VM options.
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.hostname = "TP-clustering"

  config.vm.synced_folder "./scripts/consul", "/TP-clustering/scripts/consul"
  config.vm.synced_folder "./scripts/docker", "/TP-clustering/scripts/docker"
  config.vm.synced_folder "./scripts/nomad", "/TP-clustering/scripts/nomad"
  config.vm.synced_folder "./scripts/vault", "/TP-clustering/scripts/vault"

  config.vm.provision "shell", run: "always" do |s|
    s.inline = "rm -f /TP-clustering/.env && touch /TP-clustering/.env"
  end

  config.vm.provision "shell", run: "always" do |s|
    s.inline = "echo CONSUL_HTTP_TOKEN=#{ENV['CONSUL_HTTP_TOKEN']} | tee -a /TP-clustering/.env"
  end

  config.vm.provision "shell", run: "always" do |s|
    s.inline = "echo VAULT_TOKEN=#{ENV['VAULT_TOKEN']} | tee -a /TP-clustering/.env"
  end

  config.vm.provision "shell", run: "always" do |s|
    s.inline = "echo NOMAD_TOKEN=#{ENV['NOMAD_TOKEN']} | tee -a /TP-clustering/.env"
  end


  config.vm.define "node-server" do |node|
    node.vm.hostname = "node-server"
    node.vm.network "private_network", ip: "172.20.0.10"

    node.vm.synced_folder "./server/scripts", "/TP-clustering/scripts"
    node.vm.synced_folder "./server/config", "/TP-clustering/config"
    node.vm.synced_folder "./server/services", "/TP-clustering/services"

    node.vm.provision "shell" do |s|
      s.inline = "bash /TP-clustering/scripts/install.sh"
    end

    node.vm.provision "shell", run: "always" do |s|
      s.inline = "systemctl daemon-reload && systemctl start consul vault nomad"
    end
  end

  config.vm.define "node-client" do |node|
    node.vm.hostname = "node-client"
    node.vm.network "private_network", ip: "172.20.1.10"

    node.vm.synced_folder "./client/scripts", "/TP-clustering/scripts"
    node.vm.synced_folder "./client/config", "/TP-clustering/config"
    node.vm.synced_folder "./client/services", "/TP-clustering/services"

    node.vm.provision "shell" do |s|
      s.inline = "bash /TP-clustering/scripts/install.sh"
    end

    node.vm.provision "shell", run: "always" do |s|
      s.inline = "service docker restart"
    end

    node.vm.provision "shell", run: "always" do |s|
      s.inline = "systemctl daemon-reload && systemctl start consul vault nomad"
    end
  end

  # Set memory for Parallels Desktop.
  config.vm.provider "parallels" do |p, o|
    p.memory = "1024"
  end

  # Set memory for Virtualbox.
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  # Set memory for VMware.
  ["vmware_fusion", "vmware_workstation"].each do |p|
    config.vm.provider p do |v|
      v.vmx["memsize"] = "1024"
    end
  end

end
