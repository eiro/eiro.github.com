# debian

## my own dwm package

    mkdir /tmp/dwm
    cd /tmp/dwm
    apt-get source dwm
    vim d*/config.def.h # the modifier for the windows key is 4
    dpkg-source --commit # create a patch file
    dch -i # edit the changelog: your debian version (-mc1 for me)
    dpkg-buildpackage -us -uc
    sudo dpkg -i ../*deb

