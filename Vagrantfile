#парочка переменных для конфига.
HOME_DISK="/media/mid/storage4/VirtualBox/disk1.vdi"
IP_VM="192.168.88.24" 

Vagrant.configure("2") do |config|
	config.vm.box = "debian/buster64"
#	config.vm.box = "debian/stretch64"
#	config.vm.box_version = "9.9.0"
        config.vm.hostname = "debian"
	config.vm.box_check_update = false
#ip из бриджа, для проверки что натворит ансибл.
	config.vm.network "public_network", bridge:"enp0s31f6", ip: IP_VM 
config.vm.provider "virtualbox" do |vb|
	vb.gui = false
	vb.memory = "2048"
	vb.cpus = 2
#создаем доп диск, проверить можно на гостевой машине командой fdisk -l#
#появилась эта часть из-за требований в задании сделать диск на 10Гб для ВМ, но не понадобилась, т.к. если мы выкатываемся в вагранте
#с какого-либо образа - все равно будет использоваться диск который был в этом снимке. Так и не удалось победить. 
#выше закомментирована версия 9 дебиана, которая выкатывается в диск размером 10 гб, далее с v9.9.1 этот момент исправили на 20gb
#ссылка на источник https://app.vagrantup.com/debian/boxes/stretch64	
			vb.customize ['createhd',
			                    '--filename', HOME_DISK,
					    '--format', 'vdi',
					    '--size', 10240]

				vb.customize ['storageattach', :id,
			                    '--storagectl', 'SATA Controller',
			                    '--port', 1,
			                    '--device', 0,
			                    '--type', 'hdd',
			                    '--medium', HOME_DISK]

 end
 
 config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"


################################################################################################
###Для обновления php до версии 7.2 расскоментировать и применить командой vagrant provision####
#                                                                                              #
#ansible.playbook = "update/playbook.yml"                                                      
################################################################################################   
 end
end




