Weslley-Vagrant-Puppet
======================

####Essa é a configuração que fiz, que melhor atende o que necessito fazer referente a programação no [Vagrant](http://www.vagrantup.com/).

##Pra que serve isso, o que é vagrant, explica ?
###Vagrant
Vagrant é um gerenciador de maquina virtual que usa o [Virtual Box](https://www.virtualbox.org/) da Oracle para rodar suas boxes, é extremamente simples e em poucos minutos você cria uma virtual machine para rodar sua aplicação.

###Pra que serve ?
Desenvolvedores usam ambientes virtuais todo dia com suas aplicações web. Desde o EC2 e Rackspace Cloud até soluções especializadas como o [EngineYard](https://www.engineyard.com/) e o [Heroku](https://www.heroku.com/), a virtualização é a ferramenta preferida para facilitar a implantação e o gerenciamento de infraestrutura. O Vagrant visa usar esses mesmos princípios e colocá-los para trabalhar no coração do ciclo de vida da aplicação. Por meio do fornecimento de máquinas virtuais fáceis de configurar, leves, reproduzíveis e portáteis, direcionadas para ambientes de desenvolvimento, o Vagrant ajuda a maximizar tanto sua produtividade e sua flexibilidade quanto as de sua equipe.

##Como configuro esse negócio?
1. Instale o VirtualBox para seu sistema operacional - https://www.virtualbox.org/wiki/Downloads
2. Instale o Vagrant para seu sistema operacional - http://www.vagrantup.com/downloads.html
3. Instale o Git, caso ainda não tenha - http://www.git-scm.com/downloads
4. Clone este repositório
```bash
$ git clone https://github.com/weslley39/Weslley-Vagrant-Puppet.git
```
5. Com o Terminal, Iterm, PowerShell ou Cmd, execute o seguinte comando dentro da pasta Weslley-Vagrant-Puppet:
```bash
$ vagrant up --provision
```
6. Espere ele baixar a máquina virtual e todos os componentes


##Mas o que vem nessa VM ?
###Serviços
1. NodeJs
2. MongoDB
3. Redis
4. Ruby

###Pacotes
1. Mocha
2. Serve
3. Gulp
4. Forever
5. Bower
6. Supervisor


##Como acessos meus arquivos na minha máquina real ?
O vagrant esta configurado para sincornizar as pastas dumps & app, ou seja, jogando seus arquivos nessas pastas você conseguirá visualiza-los tanto na maquina virtual como na sua máquina "real".

##Como visualizo o que estou desenvolvendo ou conecto no banco de dados?
As seguintes portas estão abertas acessando localhost:PORTA
1. 3000
2. 27017
3. 3001


That's All Folks


