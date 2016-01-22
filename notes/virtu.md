olivier, vendredi prochain 


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


