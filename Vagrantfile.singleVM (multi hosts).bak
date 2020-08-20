# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    # Set Vagrant Box
        config.vm.box = "centos/7"
    # auto port forwarding
    config.vm.network :forwarded_port, guest: 22, host: 2222, id: 'ssh', auto_correct: true

    # Set IP on virtual machine
        config.vm.hostname = "dev.contactform"
        config.vm.network "private_network", ip: "192.168.33.10"

        config.vm.hostname = "dev.messageboard"
        config.vm.network "private_network", ip: "192.168.33.20"

    # Call provisioner # Install .etc
        config.vm.provision :shell, :path => "provision.sh"

    # Call provisioner # settings for vi(vim)
        config.vm.provision :shell, :path => "vimrc.sh"

    # Set Shared Folder
        config.vm.synced_folder "./", "/vagrant", :mount_options => ["dmode=777", "fmode=777"]

    # Set updating
        config.vm.box_check_update = false
    
    config.vm.provider "virtualbox" do |vb|
        # Display the VirtualBox GUI when booting the machine
            vb.gui = false
        # Customize the amount of memory on the VM:
            vb.memory = "1024"
    end

    config.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--cableconnected1", "on"]
    end

end
