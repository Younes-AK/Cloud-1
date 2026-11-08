Vagrant.configure("2") do |config|


  # Managed Node
  config.vm.define "managed-node" do |managed|
    managed.vm.box = "bento/ubuntu-24.04"
    managed.vm.hostname = "managed-node"

    managed.vm.network "private_network", ip: "192.168.56.10"
    managed.vm.network "forwarded_port", guest: 80, host: 9090

    managed.vm.provider "virtualbox" do |vb|
      vb.name = "managed-node"
      vb.memory = 2048
      vb.cpus = 2
    end

    # Install Python (required by Ansible)
    managed.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get install -y python3
    SHELL

  end

end