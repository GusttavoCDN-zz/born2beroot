<h1 align="center"><strong>Born2BeRoot - @42SP</strong></h1>
    
<p align="center">Esse projeto é sobre configurar um servidor e utilização de máquinas virtuais.</p>
     
<p align="center"><a href="https://www.42sp.org.br/" target="_blank"><img src="https://img.shields.io/static/v1?label=&message=SP& color=000&style=for-the-badge&logo=42"></a></p>

<p align="center"><img src="https://game.42sp.org.br/static/assets/achievements/ft_printfe.png"> </p>

<p align="center">Nota: <strong>100/100</strong> ✔️ </p>
       
<h2 align="center"><strong>Oque é o Born2BeRoot?</strong></h2>
      
> Esse é o quarto projeto do curriculo da [42SP](https://www.42sp.org.br/). Consiste em configurar um servidor utilizando conceitos básicos de segurança.



<h2 align="center"><strong>Projeto Guidelines</strong></h2>

## **Instalação do Sistema**

O sistema escolhido para configuração foi o Debian v11.3.0. Ele pode ser baixo por [aqui](https://www.debian.org/distrib/).

É exigido no subject do projeto que ao final da instalação inicial o formato do sistema seja como o da imagem abaixo:

<img align="center" src="https://i.imgur.com/thusm6D.png">

O ponto principal aqui é que o sistema utilize **LVM** como formato de disco. Para fazer essa verificação basta utilizar o comando: ```lsblk```.

### **Oque é LVM?**

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

## **Configuração do Sistema**

### **Instalando o Sudo**

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

### **Material para Estudar**

- [Documentação do Sudo](https://www.sudo.ws/docs/man/1.8.15/sudoers.man/)

- [Como editar o arquivo Sudoers](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file-pt)

- [Regras para o arquivo Sudoers](http://www.bosontreinamentos.com.br/linux/usando-o-comando-sudo-e-arquivo-sudoers-no-linux/)