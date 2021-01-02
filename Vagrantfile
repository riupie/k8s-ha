IMAGE_NAME = "generic/ubuntu2004"
MASTER=3
WORKER = 2
LB=2

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

    config.vm.provider "libvirt" do |v|
        v.memory = 4096
        v.cpus = 4
    end

    (1..MASTER).each do |i|
        config.vm.define "master#{i}.k8s.riupie.io" do |node|
            node.vm.box = IMAGE_NAME
            node.vm.network "private_network", ip: "10.54.54.#{i + 10}"
            node.vm.hostname = "master#{i}.k8s.riupie.io"
        end
    end

    (1..WORKER).each do |i|
        config.vm.define "worker#{i}.k8s.riupie.io" do |node|
            node.vm.box = IMAGE_NAME
            node.vm.network "private_network", ip: "10.54.54.#{i + 20}"
            node.vm.hostname = "worker#{i}.k8s.riupie.io"
        end
    end
    (1..LB).each do |i|
        config.vm.define "lb#{i}.k8s.riupie.io" do |node|
            node.vm.box = IMAGE_NAME
            node.vm.network "private_network", ip: "10.54.54.#{i + 30}"
            node.vm.hostname = "lb#{i}.k8s.riupie.io"
           
            if i == LB
               node.vm.provision :ansible do |ansible|
                  ansible.playbook = "deploy.yml"
                  ansible.inventory_path = "hosts"
                  ansible.limit = "all"
              end
          end
        end
    end
end
