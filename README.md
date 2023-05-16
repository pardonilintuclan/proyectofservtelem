-  Descargar repositorio de github.
https://github.com/pardonilintuclan/proyectofservtelem.git
- Entramos a la carpeta con el comando cd desde línea de comandos.
-  Ejecutamos powershell
Vagrant init
-  El vagrantfile debe contener lo siguiente.
----------------------------------------------------------------------------------------------------
Vagrant.configure("2") do |config|
config.vm.boot_timeout = 600
 if Vagrant.has_plugin? "vagrant-vbguest"
 config.ssh.username = 'vagrant'
 config.ssh.password = 'vagrant'
 config.ssh.insert_key = 'true'
 config.vbguest.no_install = true
 config.vbguest.auto_update = false
 config.vbguest.no_remote = true
 end

config.vm.define :servidor1 do |servidor1|
config.vm.box = "bento/centos-stream-9"
   servidor1.vm.network :private_network, ip: "192.168.50.5"
   servidor1.vm.hostname = "servidor1"  
   servidor1.vm.provision "shell", path: "./config/server_conf.sh"
   end

config.vm.define :servidor2 do |servidor2|
config.vm.box = "bento/centos-stream-9"
   servidor2.vm.network :private_network, ip: "192.168.50.4"
   servidor2.vm.hostname = "servidor2"
   servidor2.vm.provision "shell", path: "./config/server_conf.sh"
   end

config.vm.define :proxy do |proxy|
config.vm.box = "bento/centos-stream-9"
   proxy.vm.network :private_network, ip: "192.168.50.3"
   proxy.vm.hostname = "proxy"
   proxy.vm.provision "shell", path: "./config/proxy_conf.sh"
   end
end

- Ejecutar comando vagrant up y las máquinas se configurarán automáticamente con los comandos de la carpeta conf que ya viene incluido entre los archivos descargados de github.
