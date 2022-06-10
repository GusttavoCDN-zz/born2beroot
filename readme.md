<h1 align="center"><strong>Born2BeRoot - @42SP</strong></h1>
    
<p align="center">Esse projeto é sobre configurar um servidor e utilização de máquinas virtuais.</p>
     
<p align="center"><a href="https://www.42sp.org.br/" target="_blank"><img src="https://img.shields.io/static/v1?label=&message=SP& color=000&style=for-the-badge&logo=42"></a></p>

<p align="center"><img src="https://game.42sp.org.br/static/assets/achievements/ft_printfe.png"> </p>

<p align="center">Nota: <strong>100/100</strong> ✔️ </p>
       
<h2 align="center"><strong>Oque é o Born2BeRoot?</strong></h2>
      
> Esse é o quarto projeto do curriculo da [42SP](https://www.42sp.org.br/). Consiste em configurar um servidor utilizando conceitos básicos de segurança.


<h2 align="center"><strong>Instalação do Sistema</strong></h2>

O sistema escolhido para configuração foi o Debian v11.3.0. Ele pode ser baixo por [aqui](https://www.debian.org/distrib/).

É exigido no subject do projeto que ao final da instalação inicial o formato do sistema seja como o da imagem abaixo:

<img align="center" src="https://i.imgur.com/thusm6D.png">

O ponto principal aqui é que o sistema utilize **LVM** como formato de disco. Para fazer essa verificação basta utilizar o comando: ```lsblk```.

## **Oque é LVM?**

O LVM é um gerenciador de volumes lógicos. É um programa que já vem instalado no Debian, e que por sinal durante a instalação do Debian ele já entra em ação para criar as partições mínimas do seu HD.

O LVM permite que seja feito gerenciamento de disco sem que seja necessario reinstalar o sistema. Você pode com ele definir a sua vontade a quantidade de memoria que sera utilizada por cada LV.

### **Camadas do LVM**

<img src="https://i.imgur.com/XXpljvX.png">

Como visto na figura acima, para se configurar discos com o LVM é preciso entender algumas camadas.

- Physical Drivers: Esses são os discos fisicos que você tem instalado na sua maquina.

- Partitions: Essas são as partições dos seus discos no sistema.

- Physical Volumes: Os physical volumes marcam todas as partições aptas a utilizar o LVM.

- Volume Group: Aqui podemos juntar todos os volumes fisicos em uma grande storage pull. Dessa forma conseguimos unir o tamanho dos discos para utilizar da melhor forma.

- Logical Volumes: Aqui nós podemos criar nossos lv até estourar o tamanho da storage pull.

- File System: Com o logical volume definido podemos formatar com o sistema de arquivo que precisarmos.

### **Material para Estudar**

- [Entenda a estrutura do LVM em 5min](https://www.youtube.com/watch?v=k5ZrQzwHW88)
- [LVM na prática](https://www.youtube.com/watch?v=zXN3yxjfnog)

<h2 align="center"><strong>Configurações do  Sistema</strong></h2>

## **Instalando o Sudo**

Sudo é um programa de controle. Ele dá poderes de root ao usuario logado, permitindo que quando necessario esse usuario possa executar comandos restritos ao root.

É um programa importante pois, por regra geral não queremos estar quase nunca logados como root na máquina. Por ter poderes ilimitados é possivel gerar problemas como excluir algum arquivo do sistema estando logando como root.

No entanto as vezes mesmo usuario comum precisamos executar programas e acessar pastas restritas ao root. O comando Sudo permite que isso seja feito de maneira facil e segura.

Para instalar o sudo basta executar o comando:

```shell
    sudo apt-get install sudo
```

Basicamente ao ser instalado é criado um grupo sudo no seu sistema. Todos os usuarios que estivem nesse grupo podem executar os comandos como sudo.

Para poder especificar regras para o comando sudo é preciso modificar o arquivo ```/etc/sudoers```. Para modifica-lo de forma segura é necessario usar o comando:

```shell
    visudo
```

Nesse projeto as regras aplicadas ao Sudo foram:

- **Defaults** passwd_tries=3
- **Defaults** badpass_message="Mensagem escolhida"
- **Defaults** logfile="/var/log/sudo.log"
- **Defaults** requiretty
### **Material para Estudar**

- [Documentação do Sudo](https://www.sudo.ws/docs/man/1.8.15/sudoers.man/)

- [Como editar o arquivo Sudoers](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file-pt)

- [Regras para o arquivo Sudoers](http://www.bosontreinamentos.com.br/linux/usando-o-comando-sudo-e-arquivo-sudoers-no-linux/)

## **Configurando Firewall com UFW**

De forma geral um firewall controla o trafego de dados na rede do seu computador. Ele impede que dados provenientes de outras redes seja da internet ou outros computadores danifiquem o seu sistema.

Um firewal pode existir na forma de software ou hardware. Firewals em forma de software geralmente já vem instalado em sistemas para apalhos de uso pessoa.

Nesse projeto foi utilizado o UFW para gerenciar o firewall. No Debian ele precisa ser instalado com o comando:

```
    sudo apt-get install ufw
```

Alguns comandos basicos e uteis do UFW para configurar algumas politicas de segurança basicas são:

```
    sudo ufw status #Verifica se o UFW esta ativo
    sudo ufw enable #Ativa o UFW
    sudo ufw disable #Desativa o UFW
    sudo ufw allow <porta ou serviço para permitir>
    sudo ufw deny <porta ou serviço para negar>
```

### **Material para Estudar**

- [Como configurar um firewall com UFW](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu-18-04)
- [Oque é um firewall](https://www.youtube.com/watch?v=Qg7mhOXH7QY)

## **Configurando SSH**

SSH (Secure Shell) é um protocolo de comunicação que permite conexão remote entre computadores.

Para poder utilizar o SSH você pode instalar os pacotes openssh-server e openssh-client.

```
    sudo apt-get install openssh-server openssh-client
```

Para configurar as regras de conexão via SSH é preciso editar o arquivo ```/etc/ssh/sshd_config```.

Nesse projeto adicionamos duas regras para o SSH:

- Permitir conexões apenas pela porta 4242
- Bloquear acesso pelo usuario Root.

Para se conectar a um computador pode ser utilizado o comando:

```
    ssh [usuario]@[ip] -p [porta]
```

### **Material para Estudar**

 - [How to install and enable ssh server on debian](https://devconnected.com/how-to-install-and-enable-ssh-server-on-debian-10/#Changing_SSH_default_port)
 - [Transferencia de arquivos com SSH](https://www.hostinger.com.br/tutoriais/usar-comando-scp-linux-para-transferir-arquivos)
 - [Beginners Guide To SSH](https://www.youtube.com/watch?v=qWKK_PNHnnA)
 - [SSH Crash Course](https://www.youtube.com/watch?v=hQWRp-FdTpc)

## **Configurando Politica de Senhas**

Nesse projeto tambem foi necessario implementar uma politica de senhas para garantir a segurança do sistema. Essa politica foi aplicada em duas partes.

Primeiro foi configurando as exigencians de expiração de senhas. Isso foi feito configurando o arquivo ```/etc/login.defs```. Foram aplicadas as seguintes regras:

- **PASS_MAX_DAYS**: Máximo de dias para senha expirar = 30
- **PASS_MIN_DAYS**: Mínimo de dias necessarios para poder realizar outra alteração de senha  = 2
- **PASS_WARN_AGE**: Dias para aviso de expiração de senha = 7

O segundo passo é definir as regraças de senha para os usuarios do sistema. Isso foi feito com a ajuda do pacote  ```pwquality```.

```
    sudo apt install libpam-pwquality
```

Com o pacote instalado as configurações devem ser feitas no arquivo ```/etc/pam.d/common-password```.

- **retry=3**: Número de tentativas para a senha ser alterada
- **minlen**: Mínimo de caracteres para senha = 10
- **dcredit** Mínimo de um digito númerico = -1
- **ucredit** Mínimo de uma letra maiuscula = -1
- **lcredit** Mínimo de uma letra minuscula = -1
- **maxrepeat** Máximo de caracteres repetidos = 3
- **reject_username** Não permitir senhas com o nome do usuario
- **difok** Senha deve ter pelo menos 7 caracteres que não fazem parte da antiga.
- **enforce_for_root** Aplica as restrições mesmo quando o root estiver configurando a senha.

Para aplicar as regras de expiração a usuarios já existens podem ser usados os comandos abaixo:

- **sudo chage -M 30 [usuario]**: Altera a data de expiração da senha para 30 dias
- **sudo chage -m 2 [usuario]**: Altera o numero minimo de dias para alterar a senha
- **sudo chage -W 7 [usuario]**: Altera o numero de dias para aviso de expiração da senha
- **sudo chage -l [usuario]**: Mostra as configurações de senha do usuario

### **Material para Estudar**

- [Como aplicar politicas de Senha no Linux](https://tiparaleigo.wordpress.com/2020/08/13/como-aplicar-politicas-de-senha-no-linux-ubuntu-centos/)
- [How  to force users to use secure passwords](https://www.cyberciti.biz/faq/securing-passwords-libpam-cracklib-on-debian-ubuntu-linux/)

## **Configurações de Hostname, Usuarios e Grupos**

