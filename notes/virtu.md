# les containers, VMs et tout ça

## a tester

* cf LXD: rest API over LXC (aie ... projet canonical ...)
* cloonix? cluster management simple ?
* dokku?


## LXC

    $ ls /usr/share/lxc/templates/*alp*
    lxc-alpine

est un script shell qui sera lancé par pour produire le container

    lxc-create -n alpine-test -t alpine
    ls /var/lib/lxc/alpine-test

    lxc-start -n alpine -d # pour demarrer le container en bg
    lxc-start -n alpine    # pour l'arreter

lxc et dnsmasq sont configurés pour coopérer

    $ brctl show
    bridge name	bridge id		STP enabled	interfaces
    lxcbr0 8000.fee0af5e5285	no		veth0IBE2I

indique que le host est connecté au bridge virtuel lxcbr0 avec la NIC virtuelle
veth0IBE2I. le faut toutefois:

autoriser le fowarding v4 dans /etc/sysctl.conf

    net.ipv4.ip_forward=1
    sysctl -p

    grep -R '^[^#]' /etc/dnsmasq.conf /etc/dnsmasq.d/
    /etc/dnsmasq.conf:dhcp-range=10.0.3.10,10.0.3.100,12h
    /etc/dnsmasq.d/lxc:bind-interfaces
    /etc/dnsmasq.d/lxc:interface=lxcbr0

voir les containers lancés

    sudo lxc-ls -f 

## Docker

on lance un programme contenu dans une image, ca crée un container qui sera
détruit à la mort du processus. c'est tres cool pour le dev (tests rapides,
CI) ... pour ce qui est de la production, je trouve anxiogène de lancer des
images dont je ne sais rien avec des volumes qui peuvent etre réutilisés par
mégarde par des images incompatibles... y'a des alternatives et des gens qui
partagent mes inquiétudes sur docker. cf.

* [docker the right way](http://thenewstack.io/hyper-docker-done-right-way/)
* [Docker in Production: A History of Failure](https://thehftguy.wordpress.com/2016/11/01/docker-in-production-an-history-of-failure/)
* [boycott docker](http://www.boycottdocker.org/)
* [docker in production](http://patrobinson.github.io/2016/11/05/docker-in-production/)


docker    | POO
image     | classe
isa       | FROM (dans le Dockerfile)
container | instance
hub       | cpan server

manip des images

    docker pull  # telecharger une definition d'image
    docker build # build une image (pull si nécessaire)
    docker run   # lancer une instance d'image (build si nécessaire)
    docker images -qa # lister
    docker rmi        # supprimer
    docker save server-name > srv.tgz
    docker load < srv.tgz 
    docker commit ???

manip des containers

    docker run   # lancer une instance d'image (build si nécessaire)
    docker run -it bash # interactive

    docker ps -qa
    docker rm

les containers peuvent etre liés a des volumes et networks virtuels

    docker volume
    docker network

décrire start, run, exec ... 
 
install

    aptitude install docker.io
    # pour sid. en stable: ajouter le depot prometheus et aptitude install docker
    copier le binaire de docker-compose depuis gh:
    https://github.com/docker/compose/releases/tag/1.8.1

Troobleshooting:

* le réseau merde? vous arrivez pas a supprimer des volumes ?

